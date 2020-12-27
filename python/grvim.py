from __future__ import print_function
import re
import sys
import os
import subprocess
import vim

def setup_info():
    try: 
        out = subprocess.check_output(['gr_modtool info --python-readable'], 
                shell=True, stderr=subprocess.STDOUT)
        mod_info = eval(out.strip())
        vim.command("let b:grvim_name = '{0}'".format(mod_info['modname']))
        vim.command("let b:grvim_basedir = '{0}'".format(mod_info['base_dir']))
        vim.command("let b:grvim_builddir = '{0}'".format(mod_info['build_dir']))
    except subprocess.CalledProcessError:
        pass

