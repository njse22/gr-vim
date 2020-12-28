# gr-vim

This is a simple vim plugin to work with OOT moduloes of GNU Radio in Vim

## Funtionality

this plugin have a four functions:

1. *Build Project*: this function go to the build directory and build the project

<img src="img/gr-vim1.gif" title="" alt="Figura 1. Build Project " data-align="center">

2. *Install Project*: this function  install the projec, note that you don't need 
   build the projec before

<img src="img/gr-vim2.gif" title="" alt="Figura 2. Install Project" data-align="center">

3. *Uninstall Project*: this function uninstall the projec 

<img src="img/gr-vim3.gif" title="" alt="Figura 3. Uninstall Project" data-align="center">

4. *Test Project*: this function run the test of project, it use ctest, but you can 
   change it if you want

<img src="img/gr-vim4.gif" title="" alt="Figura 4. Test Project" data-align="center">

## Instalation

Ofcourse you need have [gnuradio](https://github.com/gnuradio/gnuradio) installed for used this plugin, and you can installed like other pluging, for example using [vim-plug](https://github.com/junegunn/vim-plug) put this in your vimrc: 

```vim
Plug 'njse22/gr-vim'
```

## Configuration

Example configuration:

```vim
nmap <F4> :GRBuildProject<CR>
nmap <F5> :GRInstallProject<CR>
nmap <F6> :GRUninstallProject<CR>
nmap <F7> :GRRunTestProject<CR>
```
