### vim-plug
| コマンド | 説明 |
| --- | --- |
| :PlugClean | .vimrcから削除したプラグインを削除。このコマンドをしないとコメントアウトしてもだめ |

### コマンドラインモードとexモード
| コマンド | 説明 |
| --- | --- |
| Ctrl+f | コマンド履歴の編集が行えて、そのあと実行ができる |

### コマンドを再マッピングする
| コマンド | 説明 |
| --- | --- |
| :map | 再起的なマッピング (プラグインの提供するカスタムマッピング) |
| :noremap | 非再起的なマッピング (組み込みのマッピング) |

#### 例
~~~
noremap ; : " セミコロンでコマンドモードに入れるようにする
~~~

:が別のものにマッピングされていても、コマンドラインに入れるようにするために、noremapを使用

| 特殊文字 | 説明 |
| ---- | ---- |
| <space> | Space |
| <esc> | ESC |
| <cr>, <enter> | Enter |
| <tab> | Tab |
| <bs> | BackSpace |
| <up>, <down>, <left>, <right> | 矢印 |
| <pageup>, <pagedown> | Page Up, Page Down |
| <f1> ~ <f12> | Fn |
| <home>, <insert>, <del>, <end> | Home, Insert, Delete, End |
| <nop> | No Operation |

### モード特化の再マッピング
| キー | 説明 |
| ---- | ---- |
| :nmap, nnoremap | ノーマルモード |
| :vmap, :vnoremap | ビジュアルモードとセレクトモード |
| :xmap, :xnoremap | ビジュアルモード |
| :smap, :snoremap | セレクトモード |
| :omap, :onoremap | オペレータ待ちモード |
| :map!, :noremap! | インサートモードとコマンドラインモード |
| :imap, :inoremap | インサートモード |
| :cmap, :cnoremap | コマンドラインモード |

