# dotconfig-nvim

It's a bootstrap configuration for [neovim](https://neovim.io/)

![image](https://user-images.githubusercontent.com/893768/216389210-0b091084-0015-4d38-b774-f4a0d22207be.png)
![image](https://user-images.githubusercontent.com/893768/216389704-64fbc07a-8181-4e7c-99ab-4e2b89728fc6.png)


## Pre-requisites

The distribution is designed to work with [neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim) >= 0.8.

### Linux

* Ubuntu\Debian

```bash
sudo apt-get install git curl ripgrep ruby-dev golang php-cli php-dev php-curl php-mbstring python3-pip xclip bat
```

* Arch Linux via *pacman*

```bash
sudo pacman -S git curl ripgrep ruby-dev golang php-cli php-dev php-curl php-mbstring python3-pip xclip bat
```

> If you are using the WSL of Windows, the Copy/Past will not be work, because the `x-server` (`xclip`) is not installed, so you need to install `win32yank` following the next steps:
> ```shell
> curl -sLo /tmp/win32yank.zip https://github.com/equalsraf/win32yank/releases/download/v0.0.4/win32yank-x64.zip
> unzip -p /tmp/win32yank.zip win32yank.exe > /tmp/win32yank.exe
> chmod +x /tmp/win32yank.exe
> sudo mv /tmp/win32yank.exe /usr/local/bin/
> ```

### Python bundle

* neovim (neovim only)

```bash
pip3 install --user --upgrade pynvim
```

### node packages

* neovim
* tree-sitter-cli

```bash
npm i -g neovim tree-sitter-cli
```

## Installation

### Download and move tp config folder

```bash
git clone git://github.com/afranioce/dotconfig-nvim.git ~/.config/nvim
```

### Install neovim packages

```bash
nvim --headless \
    -c 'autocmd User PackerComplete quitall' \
    -c 'PackerSync'
```

### Install LSP services

```bash
nvim --headless \
    -c 'LspInstall --sync bashls jsonls yamlls vimls sumneko_lua phpactor tsserver cmake sqls gopls eslint angularls psalm zk dockerls pylsp' \
    -c quitall
```

<details>
<summary>:black_small_square: Basic hotkeys</summary>

#### Generics

Commands       | Descriptions
-------------- | -------
`,,`           | List all keymaps
`,ff`           | Find files
`,fg`           | Search grep
`,fo`           | Old files opened (History)
`Ctrl + /`      | Toggle terminal
`,lg`      | Open [Lazygit](https://github.com/jesseduffield/lazygit)
`,lg`      | Open [lazydocker](https://github.com/jesseduffield/lazydocker)
`gcc`      | Toggle comment line under the cursor
`gc`      | Toggle comment multiple lines for selected text
    
#### DAP (Debug Adapter Protocol)

Commands       | Descriptions
------------- | -------
`F5`          | Start debug or continue
`F6`          | Terminate
`F9`          | Toggle breakpoint
`F10`         | Step over
`Ctrl + F10`  | Run to cursor
`F11`         | Step into
`Shift + F11` | Step out

> Keymap based on Vistual Studio https://docs.microsoft.com/en-us/visualstudio/ide/default-keyboard-shortcuts-in-visual-studio?view=vs-2019

#### Buffer

Commands       | Descriptions
-------------- | -------
`cp`           | Copy current buffer relative path
`cP`           | Copy current buffer absolute path
`cf`           | Copy current buffer filename
`,c`           | Close current buffer
`,C`           | Force to close current buffer
`Ctrl + s`     | Save current buffer
`,sc`          | Toggle spell check
`J`            | Move selected text to up
`K`            | Move selected text to down
`>`            | Move selected text to left (Increment)
`<`            | Move selected text to right (Decrement)

#### Windows

Commands       | Descriptions
-------------- | -------
`sv`           | Open vertical window
`sh`           | Open horizontal window
`sc`           | Close current window
`so`           | Close other windows
`Alt + h`      | Move cursor to left window
`Alt + j`      | Move cursor to down window
`Alt + k`      | Move cursor to up window
`Alt + l`      | Move cursor to right window
`Ctrl + left`  | Resize window to left (-2 pixels)
`Ctrl + right` | Resize window to right (+2 pixels)
`s.`           | Resize window to left (-10 pixels)
`s,`           | Resize window to right (+10 pixels)
`Ctrl + Up`    | Resize window to up (-2 pixels)
`Ctrl + Down`  | Resize window to down (+2 pixels)
`sk`           | Resize window to up (-10 pixels)
`sj`           | Resize window to down (+10 pixels)
</details>

<details>
<summary>:black_small_square: LSP hotkeys</summary>

Commands     | Descriptions
------------ | -------
`,gD`        | Goto declaration
`,gd`        | Goto definition
`gr`         | Goto references
`ge` or `,e` | Goto documento symbol
`gw` or `,w` | Goto workspace symbol
`Ctrl + k`   | Show signature help
`Space + rn` | Rename the symbol under the cursor
`Space + ca` | Code action
`Space + f`  | Format buffer
`K`          | Show brief information about the symbol under the cursor

</details>

> The most hotkeys in neovim is the same of vim
    
## Neovim Packages Installed
    
TODO

## Learn Neovim

Visit the following sites to learn more about neovim:

* [Learn Neovim The Practical Way](https://alpha2phi.medium.com/learn-neovim-the-practical-way-8818fcf4830f)
* [Vimbook (in portuguese)](https://cassiobotaro.gitbooks.io/vimbook/content/)

