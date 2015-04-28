#!/usr/bin/env python


"""
Python script to do the following:
    + initialise and update all git submodules in the repo.
    + create relevant symbolic links for `.vimrc` file and `.vim` folder.
"""


import os, sys


def do_git_init_update():
    os.system("git submodule init")
    os.system("git submodule update")


def make_symbolic_links(dir_path):
    wk_dir = os.environ['HOME']
    vimrc_path = os.path.join(dir_path, 'vimrc')
    vim_dir_path = os.path.join(dir_path, 'vim')
    ln_pattern = "ln -s {0} {1}"
    os.chdir(wk_dir)
    os.system(ln_pattern.format(vimrc_path, '.vimrc'))
    os.system(ln_pattern.format(vim_dir_path, '.vim'))


def main():
    curr_file_path = os.path.realpath(__file__)
    curr_dir_path = os.path.dirname(curr_file_path)
    os.chdir(curr_dir_path)
    do_git_init_update()
    make_symbolic_links(curr_dir_path)


if __name__ == '__main__':
    try:
        main()
    except KeyboardInterrupt:
        print("shutting down...")
        sys.exit(0)


