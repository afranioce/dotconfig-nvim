# dotconfig-nvim

It's a 

## Pre-requisites

The distribution is designed to work with [neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim) >= 0.8.

### Linux

* Ubuntu\Debian

```bash
$ sudo apt-get install git curl
```

* Arch Linux via *pacman*

```bash
sudo pacman -S git curl
```

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

```bash
nvim --headless \
    -c 'autocmd User PackerComplete quitall' \
    -c 'PackerSync'
```

<details>
<summary>:black_small_square: Basic hotkeys</summary>

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
`,u`         | Include use statement
`,mm`        | Invoke the context menu
`,nn`        | Invoke the navigation menu
`,gD`        | Goto declaration
`,gd`        | Goto definition
`Ctrl + k`   | Show signature help
`Space + rn` | Rename the symbol under the cursor
`Space + ca` | Code action
`gr`         | Coto references
`ge`         | Coto documento symbol
`gw`         | Coto workspace symbol
`Space + f`  | Format buffer
`K`          | Show brief information about the symbol under the cursor

</details>

## Learn Neovim

Visit the following sites to learn more about neovim:

* [Learn Neovim The Practical Way](https://alpha2phi.medium.com/learn-neovim-the-practical-way-8818fcf4830f)
* [Vimbook (in portuguese)](https://cassiobotaro.gitbooks.io/vimbook/content/)

> The most hotkeys in neovim is the same of vim
