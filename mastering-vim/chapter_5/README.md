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
