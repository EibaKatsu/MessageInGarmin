#!/bin/zsh
set -euo pipefail

if [[ "$#" -ne 2 ]]; then
  echo "Usage: $0 <prg_path> <device_id>" >&2
  exit 2
fi

prg_path="$1"
device_id="$2"
max_retries="${CIQ_RUN_RETRIES:-30}"
retry_interval_sec="${CIQ_RUN_RETRY_INTERVAL_SEC:-1}"
kill_before_run="${CIQ_KILL_BEFORE_RUN:-0}"
attempt_timeout_sec="${CIQ_RUN_ATTEMPT_TIMEOUT_SEC:-8}"

if [[ -z "${CONNECTIQ_HOME:-}" ]]; then
  echo "CONNECTIQ_HOME is not set." >&2
  exit 2
fi

connectiq_app="${CONNECTIQ_HOME}/bin/ConnectIQ.app"
monkeydo_bin="${CONNECTIQ_HOME}/bin/monkeydo"

if [[ ! -d "${connectiq_app}" ]]; then
  echo "ConnectIQ.app not found: ${connectiq_app}" >&2
  exit 2
fi

if [[ ! -x "${monkeydo_bin}" ]]; then
  echo "monkeydo not found: ${monkeydo_bin}" >&2
  exit 2
fi

if [[ ! -f "${prg_path}" ]]; then
  echo "PRG not found: ${prg_path}" >&2
  exit 2
fi

if [[ "${kill_before_run}" != "0" ]]; then
  pkill -x simulator >/dev/null 2>&1 || true
  sleep 1
fi

# Start simulator as macOS app bundle.
open -a "${connectiq_app}" >/dev/null 2>&1 || open "${connectiq_app}" >/dev/null 2>&1 || true
sleep 2

runtime_device_id="${device_id%_sim}"
if [[ -z "${runtime_device_id}" ]]; then
  runtime_device_id="${device_id}"
fi

if [[ "${runtime_device_id}" != "${device_id}" ]]; then
  echo "normalized device id: ${device_id} -> ${runtime_device_id}"
fi

attempt=1
while [[ "${attempt}" -le "${max_retries}" ]]; do
  echo "run attempt ${attempt}/${max_retries}: ${runtime_device_id}"

  : > /tmp/ciq-monkeydo.log
  "${monkeydo_bin}" "${prg_path}" "${runtime_device_id}" > /tmp/ciq-monkeydo.log 2>&1 &
  monkeydo_pid=$!

  wait_sec=0
  monkeydo_status=124
  while true; do
    if ! kill -0 "${monkeydo_pid}" >/dev/null 2>&1; then
      wait "${monkeydo_pid}" || monkeydo_status=$?
      if [[ "${monkeydo_status}" == "124" ]]; then
        monkeydo_status=0
      fi
      break
    fi

    if [[ "${wait_sec}" -ge "${attempt_timeout_sec}" ]]; then
      kill -TERM "${monkeydo_pid}" >/dev/null 2>&1 || true
      sleep 1
      kill -KILL "${monkeydo_pid}" >/dev/null 2>&1 || true
      monkeydo_status=124
      break
    fi

    sleep 1
    wait_sec=$((wait_sec + 1))
  done

  monkeydo_output="$(cat /tmp/ciq-monkeydo.log)"

  if [[ "${monkeydo_status}" -eq 0 ]]; then
    echo "monkeydo succeeded on attempt ${attempt}/${max_retries} with ${runtime_device_id}"
    exit 0
  fi

  if [[ "${monkeydo_status}" -eq 124 ]]; then
    echo "monkeydo: timeout after ${attempt_timeout_sec}s"
  elif [[ -n "${monkeydo_output}" ]]; then
    echo "monkeydo: ${monkeydo_output}"
  fi

  if [[ "${attempt}" -lt "${max_retries}" ]]; then
    sleep "${retry_interval_sec}"
  fi
  attempt=$((attempt + 1))
done

if [[ -f /tmp/ciq-monkeydo.log ]]; then
  echo "--- monkeydo last output ---" >&2
  cat /tmp/ciq-monkeydo.log >&2
fi
echo "Failed to push PRG after ${max_retries} attempts." >&2
exit 2
