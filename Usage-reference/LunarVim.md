# Lunarvim
[官网](https://www.lunarvim.org/)  
[按键参考](https://devhints.io/vim)  
更新 `:LvimUpdate`  
更新插件 `:LvimSyncCorePlugins`  

## 配色：  
白背景：tokyonight-day  
黑背景：tokyonight-storm  
黑白：quiet

## LSP
`K` hover information  
`gd` 前往定义  
`gD` 前往申明  
`gr` 前往references  
`gI` 前往implementation  
`gs` 展示signaturehelp  
`gl` 显示报错  
## 使用
查看快捷键：`空格+sk`  
nvimtree：`空格+e`  
查找文件：`空格+f`  
dashboard：`空格+；`  
打开终端：`Ctrl+\`  
注释/反注释 `空格+/`  
可视模式下注释：`gb`  
`option+k` move lines up  
`option+j` move lines down  
编辑config.lua `空格+Lc`  
关闭高亮 `空格+h`  
打开最近文件 `空格+sr`  
展示安装过的插件 `空格+pS`  
保存并推出 `:ZZ/wq/S`  
保存 `:w`  
删除当前光标字符并进入写入模式 `s`   
往上半页：`Ctrl+U`  
往下半页：`Ctrl+D`  
往上一页：`Ctrl+B`  
往下一页：`Ctrl+F`  
前一个词：`b`  
下一个词：`w`  
行头：`0`  
行末：`$`  
首行：`gg`  
尾行：`G`  
前往第n行 `nG`  
进入visual模式：`v`  
进入行visual模式：`V`  
进入块visual模式：`Ctrl+V`  
删除光标所在字符：`d/x`  
快速移到：`HJKL`  
搜索：`=-`进行移动    
撤消：`u`  
重做：`Ctrl+R`  
从系统剪切板粘贴：`"*p / "+p`  
复制到系统剪切板：`"*y / "+y`  
删除一行：`1dd`  
删除一个词：`dw/db`   
选择一个段落`vip（ipip）`  
复制一个段落：`yip（不包括换行）yap（包括换行）`  
删除一个段落：`dip`  
下一个查找：`n/=`  
上一个查找：`N/-`  
回到上一次insert位置：`^

回到上一次编辑的位置：`.

回到上一次退出时的位置：`"

回到跳转之前的位置： ``

+书签 `mx`  
跳转到书签x `x或'x

展示所有书签 `:marks`  
删除书签 `:delm a`

更改配色 `:Telescope colorscheme `
## snippets：
[参考](https://github.com/sambergo/lunarvim-snippet-examples)  
1. 在`~/config/lvim/snippets`下`git clone https://github.com/dsznajder/vscode-es7-javascript-react-snippets`
2. 在`config.lua`中`require("luasnip/loaders/from_vscode").load { paths = { "~/.config/lvim/snippets/vscode-es7-javascript-react-snippets" } }`
3. `mkdir ~/.config/lvim/snippets/my-snippets`
4. 在`my-snippets`下创建`package.json`
5. 在`my-snippets`下创建`javascript.json `
6. 在`my-snippets`下创建`js-react.json `
7. 在`config.lua`中`require("luasnip/loaders/from_vscode").load { paths = { "~/.config/lvim/snippets/my-snippets" } }`
8. 在`snippets`中创建`package.json`

