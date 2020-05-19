 if !has('python3')
     echo "Vim must support python in order to use the repeater"
     finish
 endif

" Settings to make life easier
set hidden

setfiletype html
set nosplitright
set nosplitbelow


let s:pyscript = resolve(expand('<sfile>:p:h') . '/repeater.py')

function! RepeaterAction(...)
    execute 'py3file ' . s:pyscript
	windo setfiletype request
	exec "wincmd h"
endfunc

command! -nargs=* RepeaterSetup call RepeaterAction('setup', <f-args>)
command! RepeaterSubmitBuffer call RepeaterAction('submit')


" Bind forward to <leader>f
nnoremap <leader>f :RepeaterSubmitBuffer<CR>


