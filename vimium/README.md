## vimiumとは

[vimium](http://vimum.github.io/)

vimキーバインドでChromeを使えるようにできるプラグイン

- ページ操作
    − ページのスクロール
    - リンクのクリック
    - ページを戻る/進む
    - 文字検索
- タブ操作
    - 新規タブ追加
    - タブの削除
    - タブの移動
- その他の操作
    - ブックマーク検索

## vimiumの設定
デフォルトのキーマッピングを変えて使いやすくする

1. 右上のvimiumプラグインのアイコン -> options
2. Show advanced optionsを選択
    ```:コピペ用
    map h goBack
    map l goForward
    map H previousTab
    map L nextTab
    map i LinkHints.activateMode
    map I LinkHints.activateModeToOpenInNewTab
    ```
3. Save Optionsを選択

## vimiumを使う

| キー | 操作 |
| ---- | ---- |
| ページのスクロール (上) | k |
| ページのスクロール (下) | j |
| 一番上へスクロール | gg |
| 一番下へスクロール | G |
| 半ページ下へスクロール | d |
| 半ページ上へスクロール | u |
| 現在のタブでリンクを開く | f |
| 新しいタブでリンクを開く | F |
| 更新 | r |
| view sourceを表示 | gs
| URLをヤンク | yy |
| URLをクリップボードにコピー | yf |
| ページを戻る | h |
| ページを進む | l |
| リンクの検索/クリック | i |
| リンクの検索/クリック(新規タブ) | l, F |
| 新規タブ追加 | t |
| タブ名検索 | T |
| タブ削除 | x |
| タブの復元 | X |
| n個のタブの復元 | nX |
| タブの移動 (左) | H |
| タブの移動 (右) | L |
| ブックマーク検索 | b |
| 文字列検索 | / |
| コピーしたURL先に飛ぶ | p |
| 今見えている中で、一番上の入力欄にフォーカス | gi |

## Custom search engines
| キー | サイト |
| ---- | ---- |
| g | google |
| y | youtube |
| a | amazon |

