# Zone coach Store入力内容（Training版）

最終更新日: 2026-03-02

## 基本情報
1. App Name: `Zone coach`
2. App Type: `Data Field`
3. Category: `Health & Fitness`
4. Price: `Free`（Training版）

## アプリ説明（日本語）
しんどい局面で、ふっと笑えて、でもペースは崩さない。  
`Zone coach` は、走りながら読める短文コーチを出すランナー向け Data Field です。  
心拍ゾーン（Z1-Z5）と坂の傾向（上り/平坦/下り）、距離イベント（1kmごと + 主要マーカー）をもとに、テンポよくメッセージを表示。  
「今は落とす」「そのまま行ける」を一瞬で判断できるように、短く・見やすく・実戦向けに調整しています。

主な機能:
1. 心拍ゾーン別メッセージ（Z1-Z5）
2. 坂状態の判定（UP/FL/DN）
3. 距離イベント通知（1kmごと + 10km等）
4. 多言語対応（JPN/ENG/SPA/FRE/DEU）

## App Description (English)
When the run gets hard, `Zone coach` keeps your head clear.  
It is a running Data Field that delivers short, punchy coaching lines you can read in a split second.  
Using heart-rate zones (Z1-Z5), slope trend (uphill/flat/downhill), and distance events (every 1 km + key markers), it gives timely cues without breaking your rhythm.  
The goal is simple: less overthinking, better pacing, stronger finish.

Key features:
1. Heart-rate-zone guidance (Z1-Z5)
2. Slope-aware feedback (UP/FL/DN)
3. Distance event messages (every 1 km + major markers)
4. Multi-language support (JPN/ENG/SPA/FRE/DEU)

## サポートURL
`https://github.com/EibaKatsu/MessageInGarmin/issues`

## プライバシーポリシーURL
`https://github.com/EibaKatsu/MessageInGarmin/blob/main/docs/privacy-policy.md`

注記:
1. 上記URLは GitHub 側に最新内容が push 済みであることが前提です。
2. 未pushの場合は先にリポジトリへ反映してください。

## アイコン確認
現在の設定:
1. Launcher Icon Resource: `grow/resources/drawables/launcher_icon.svg`
2. Manifest 参照: `launcherIcon="@Drawables.LauncherIcon"`
3. Drawable 定義: `@Drawables.LauncherIcon -> launcher_icon.svg`

確認結果:
1. 参照設定は正常（manifest と drawables の対応あり）
2. 40x40 ベースのため、一部デバイスでスケーリング警告は出るがビルドは成功
3. Store提出可。必要なら将来 `54/56/60/65/70` 向け最適化アイコンを追加
