### Gitをvimと統合

#### インストール
~~~
Plug 'tpope/vim-fugitive'
~~~

#### コマンド

#### Gstatus
- git statusに対応
  - -: ふぁいるをステージング移動 or 削除
  - cc or :Gcommit : コミット
  - dd(D) or :GDiff : git diff
  - g? : ヘルプ表示

#### Glog
- git log

#### Gblame
- git blame
  - C: コミットIDが出るまでリサイズ
  - A: 作者名
  - D: タイムスタンプ
  - o: 選択コミットの差分を分割ウィンドウで開く

#### Ggrep
- git grep

#### Gmove destination/path
- git move

#### Gdelete
- git removeのラッパー

#### Grebase
- git rebase 


### vimdiff
| キー | 説明 |
| ---- | ---- |
| ]c | 前方の差分 |
| [c | 後方の差分 |
| do, :diffget | カーソル行に別ファイルの差分を移動 |
| dp, :diffpush | カーソル行の差分を別ファイルにpush |

- 3ファイル以上の場合 :diffget file_name で実行可能

### git mergetool
- 左上: ローカルな変更 (LOCAL)
- 中上: 枝分かれする直前 (BASE)
- 右上: merge先の変更 (REMOTE)
- 下: 変更結果 (MERGED)

- 以下をMERGEDで行う
| キー | 説明 |
| ---- | ---- |
| :diffget REMOTE | REMOTEの変更保持 |
| :diffget BASE | BASEの変更保持 |
| :diffget LOCAL | LOCALの変更保持 |
