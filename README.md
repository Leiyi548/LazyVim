# 💤 LazyVim

**Less is More**

这是我的配置，用起来一般般啊，你也能用很mbbb。

## 安装之前需要的东西

### windows

**tressiter 需要**

```powershell
scoop install gcc
scoop install zig
```

**lazygit** 虽然我不用，但不能没有吧。

```powershell
scoop install lazygit
```

**nodejs**

```powershell
scoop install nodejs nvm
```

**python**

nvim 中很多都需要 python3 这个环境。

```powershell
scoop install python
```

**ripgrep** `Telescope live_grep` 需要

```powershell
scoop install ripgrep
```

**go**

```powershell
scoop install go
# 使用国内镜像
go env -w GOPROXY=https://goproxy.cn,direct
```

**rust**

```powershell
scoop install rust
scoop install rustup
```

**btop**

```powershell
scoop install btop
```

## 安装

### windows

- 确保你原本的配置文件被备份

```powershell
# required
Move-Item $env:LOCALAPPDATA\nvim $env:LOCALAPPDATA\nvim.bak

# optional but recommended
Move-Item $env:LOCALAPPDATA\nvim-data $env:LOCALAPPDATA\nvim-data.bak
```

- 克隆我的配置

```powershell
git clone https://github.com/Leiyi548/Lazyvim $env:LOCALAPPDATA\nvim

```

- 删除 .git 文件夹，你可以添加到自己的仓库

```powershell
Remove-Item $env:LOCALAPPDATA\nvim\.git -Recurse -Force
```

- 启动 nvim，享受它

```powershell
nvim
```

## screenkey 的平替 [keyviz](https://github.com/mulaRahul/keyviz)

```powershell
scoop install keyviz
```

## cmp-im-zhh.nvim

可以用这个来输入中文，码表的虎码输入法的，用起来非常的爽，配合 neovide 的丝滑的光标，让人感觉那叫一个爽!

当然你想爽的话，还是要打单，再说一句，打单爽的!

## flash-zhh.nvim

folke 写的 flash 只能跳转英文，而我这个能够跳转中文，当然现在还有很多问题就是只能跳转一个中文为对象。
写东西看东西也是非常好的哦！ 

## neovide

超级好用，虽然用了这个就不能用 tmux 了，可是我在 windows 也不能用 tmux，所以这个也不是什么问题，后面看看能不能实现像 utools 上的 vscode 插件的效果，输入 vim 然后选择下自己的 project，然后直接就用 neovide 打开，想一想都觉得很爽!

## fugitive

这是我在 neovim 上用过最好的 git 管理插件，最主要的是你用了它，你还能用 cmp-im-zhh，就能直接打中文，想一想就觉的非常美妙。

### fugitive 设置指定的分屏方向

正常情况下，fugitive 都是横向分屏。

那么你想要坚着分屏就用 `:vert[ical] Git`  就行了。具体可以看这个 [issue](https://github.com/tpope/vim-fugitive/issues/1237)

## 批量替换操作

### Telescope live_grep 结合 cdo

先用 `Telescope live_grep` 搜索自己想要的关键字,然后用 `ctrl-q` 发送到 quickfix。

在 quickfix buffer 里执行这个命令，`cdo s/pattern/replacement/g`，然后就能进行全部替换。
`cdo s/pattern/replacement/gc`，一个个询问替换。

使用 `cdo undo` 就能撤销修改 

### 使用 quickfix-reflector （推荐）

这个插件能让 quickfix 跟 buffer 一样操作。

想要改什么直接改就是，然后保存就可以直接修改。

## fzf 结合 neovim

使用命令 `nvim $(fzf)`  可以通过 fzf 搜索文件，然后立马用 nvim 打开。

### 设置 alias

`nvim $HOME\Documents\PowerShell\Profile.ps1` → 打开 powershell 配置

```powershell
function fzn {nvim $(fzf)}
```

## TODO

- [x] fugitive 窗口用 q 来进行退出
- [x] 添加 autocommand
- [x] 使用回车来给 task 打勾
- [x] 使用 Alt+UpArrow/DownArrow 来进行上下行进行互换
- [x] lualine 添加 cmp-im 启动标识可以参考 cmp-coplit
- [x] cmp-zhh 在 telescope 中使用
- [x] 把 LazyVim 的 markdown 配置给删除掉
- [x] 文件保存时，会有 notify 消息提示，什么时候保存（参考我以前的配置）
- [x] 更改 gitsign 配置
- [x] 更改 cmp_im_zhh.nvim 的 README
- [x] 更改 Telescope 配置（参考我以前的配置）
- [x] flash-zhh.nvim 添加 remote 操作
- [x] 使用 telescope-project 插件
  - [x] dashboard。nvim 添加 Telescope Project 按钮P
- [x] Telescope 添加 scroll left right 命令
- [x] nvim 添加向左向右移动 zh zl
- [x] 选中一块区域可以用把英文的标点符号改成中文的
- [x] 更新 flash-zhh 的词库
- [x] 写一个 markdown 格式化插件，类似 obsidianlint （不需要，obsidianlint 可以 lintfolder 直接就格式化，我把这个放到 obsidian 去格式化就行了，自己写 nvim 插件还麻烦啊！（可以用 obsidian-advancedurl 来实现）
- [x] 搞清楚如何设置 notify 的 level
- [x] 改变 telescope 主题（让分屏的时候用起来也很爽）
- [x] Telescope ignore folder 添加 .obsidian 文件夹
- [x] cmp_im_zhh 添加回车不上屏中文，就是原来的英文。
- [ ] lualine 添加中文字符和英文字符数量屏示
- [ ] cmp_im_zhh 添加重复上次输入 `''` （好像因为 cmp 的原因无法实现）
- [>] obsidian.nvim 使用 （放弃使用这个插件，给我一种可有可无的感觉）
  - [>] 让 obsidian.nvim 的库在 windows 在正确的位置

