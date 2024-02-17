# 💤 LazyVim

这是我的配置,用起来一般般啊,你也能用很mbbb。

## cmp-im-zhh.nvim

可以用这个来输入中文,码表的虎码输入法的,用起来非常的爽,配合 neovide 的丝滑的光标,让人感觉那叫一个爽!

当然你想爽的话,还是要打单,再说一句,打单爽的!

## flash-zhh.nvim

folke 写的 flash 只能跳转英文,而我这个能够跳转中文,当然现在还有很多问题就是只能跳转一个中文为对象.

## neovide

超级好用,虽然用了这个就不能用 tmux 了,可是我在 windows 也不能用 tmux,所以这个也不是什么问题,后面看看能不能实现像 utools 上的 vscode 插件的效果,输入 vim 然后选择下自己的 project,然后直接就用 neovide 打开,想一想都觉得很爽!

## fugitive

这是我在 neovim 上用过最好的 git 管理插件,最主要的是你用了它,你还能用 cmp-im-zhh,就能直接打中文,想一想就觉的非常美妙.

## TODO

- [x] fugitive 窗口用 q 来进行退出
- [x] 添加 autocommand
- [x] 使用回车来给 task 打勾
- [x] 使用 Alt+UpArrow/DownArrow 来进行上下行进行互换
- [x] lualine 添加 cmp-im 启动标识可以参考 cmp-coplit
- [x] cmp-zhh 在 telescope 中使用
- [x] 把 LazyVim 的 markdown 配置给删除掉
- [x] 文件保存时,会有 notify 消息提示,什么时候保存（参考我以前的配置）
- [x] 更改 gitsign 配置
- [ ] fugitive diffview 窗口按 q 退出
- [ ] 更改 Telescope 配置（参考我以前的配置）
- [ ] 更改 cmp_im_zhh.nvim 的 README
- [ ] flash-zhh.nvim 添加 remote 操作
- [ ] tokynight 的 comment 不要斜体
- [ ] obsidian.nvim 使用
  - [ ] 让 obsidian.nvim 的库在 windows 在正确的位置
