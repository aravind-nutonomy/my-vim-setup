" Vim syntax file
" Language: gazeboworld XML
"
" gazebo-world xml syntax highlighting
"
" Put this file in ~/.vim/syntax/gazeboworld.vim
" Put the following in your .vimrc:
"   autocmd BufRead,BufNewFile *.world setfiletype gazeboworld

if exists("b:current_syntax")
    finish
endif

runtime syntax/xml.vim

let s:current_syntax=b:current_syntax
unlet b:current_syntax
