# Zone coach Store提出テンプレ

## 1) 固定する提出構成
対象アプリ: `Zone coach`（Data Field）

スクショ取得用ビルド:
1. `Monkey C: Build+Run Screenshot` を使用する
2. 30秒ごとに `warn -> praise -> dist_10k` を自動ループする

固定3機種:
1. `fr255`（MIP系）
2. `venu3`（AMOLED系）
3. `vivoactive5`（Vivoactive系）

固定シーン:
1. `warn` : WARNカテゴリ表示
2. `praise` : PRAISEカテゴリ表示
3. `dist_10k` : 10km節目メッセージ表示

固定言語ポリシー（jpn + eng）:
1. 各機種で `praise` は `jpn` と `eng` の2枚を用意する
2. `warn` は `eng` で統一する
3. `dist_10k` は `jpn` で統一する

提出枚数:
1. 合計 `12枚`（3機種 x 4カット）

## 2) ファイル名ルール
命名規則:
`store_zonecoach_{yyyymmdd}_{build}_{device}_{scene}_{lang}.png`

値のルール:
1. `{yyyymmdd}`: 撮影日（例: `20260302`）
2. `{build}`: `training` or `race`
3. `{device}`: `fr255` / `venu3` / `vivoactive5`
4. `{scene}`: `warn` / `praise` / `dist_10k`
5. `{lang}`: `jpn` / `eng`

命名例:
1. `store_zonecoach_20260302_training_fr255_praise_jpn.png`
2. `store_zonecoach_20260302_training_venu3_warn_eng.png`
3. `store_zonecoach_20260302_training_vivoactive5_dist_10k_jpn.png`

## 3) 提出ファイル一覧テンプレ
下記12ファイルを埋めれば提出セット完成。

1. `store_zonecoach_{date}_{build}_fr255_praise_jpn.png`
2. `store_zonecoach_{date}_{build}_fr255_praise_eng.png`
3. `store_zonecoach_{date}_{build}_fr255_warn_eng.png`
4. `store_zonecoach_{date}_{build}_fr255_dist_10k_jpn.png`
5. `store_zonecoach_{date}_{build}_venu3_praise_jpn.png`
6. `store_zonecoach_{date}_{build}_venu3_praise_eng.png`
7. `store_zonecoach_{date}_{build}_venu3_warn_eng.png`
8. `store_zonecoach_{date}_{build}_venu3_dist_10k_jpn.png`
9. `store_zonecoach_{date}_{build}_vivoactive5_praise_jpn.png`
10. `store_zonecoach_{date}_{build}_vivoactive5_praise_eng.png`
11. `store_zonecoach_{date}_{build}_vivoactive5_warn_eng.png`
12. `store_zonecoach_{date}_{build}_vivoactive5_dist_10k_jpn.png`

## 4) 撮影時の固定条件
1. 撮影時は `screenshot` ビルドを使う。
2. 0-29秒で `warn`、30-59秒で `praise`、60-89秒で `dist_10k` を撮る。
3. 提出対象ビルド（`training` / `race`）はファイル名の `{build}` で区別する。
4. 言語は `jpn` と `eng` を混在させる（上の固定ルールどおり）。
5. Data Field配置位置は全ショットで同じにする。
6. 時計表示時刻は極端にばらけさせない（見た目の統一）。
7. 文字切れや省略記号(`...`)が主表示に出るショットは避ける。

## 5) 提出前チェック
1. 12ファイルすべて存在する。
2. ファイル名が命名規則と完全一致する。
3. 3機種 x 4カット（`praise_jpn/praise_eng/warn_eng/dist_10k_jpn`）が欠けなく揃っている。
4. すべて `Zone coach` の最新ビルド画面である。
