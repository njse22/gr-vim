" Plugin: gr-vim 
" Version: 0.1
" Description: This Plugin helps to working with OOT Module in GNU Radio 
" Maintainer: Nicolás J. Salazar E. 
" Credits: I took some inspiration from grproject.vim by Martin Braun 

if !has("python3")
    echo "vim has to be compiled with +python3 to run this"
    finish
endif

if exists('g:sample_python_plugin_loaded')
  finish
endif

let s:plugin_root_dir = fnamemodify(resolve(expand('<sfile>:p')), ':h')

python3 << EOF
import sys
from os.path import normpath, join
import vim
plugin_root_dir = vim.eval('s:plugin_root_dir')
python_root_dir = normpath(join(plugin_root_dir, '..', 'python'))
sys.path.insert(0, python_root_dir)
import grvim
EOF

let g:grvim_python_plugin_loaded = 0

augroup grvim 
autocmd! grvim 
autocmd grvim BufEnter *.cc,*.h,*.py,CMakeLists.txt call GRSetupInfo()

func! GRSetupInfo()
     python3 grvim.setup_info()
endfunc

func! GRBuildProject()
    execute "cd "b:grvim_builddir
    execute "!cmake .. && make"
endfunc

command! -nargs=0 GRBuildProject call GRBuildProject()

func! GRInstallProject()
    execute "cd "b:grvim_builddir
    execute "!cmake .. && make && sudo make install && sudo ldconfig"
endfunc

command! -nargs=0 GRInstallProject call GRInstallProject()

func! GRUninstallProject()
    execute "cd "b:grvim_builddir
    execute "!sudo make uninstall"
endfunc

command! -nargs=0 GRUninstallProject call GRUninstallProject() 

func! GRRunTestProject()
    execute "cd "b:grvim_builddir
    execute "!ctest -V"
endfunc

command! -nargs=0 GRRunTestProject call GRRunTestProject()
