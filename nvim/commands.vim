" CUSTOM COMMANDS

" Processing results in quickfix http://efiquest.org/2009-02-19/32/
com! -nargs=1 Qfdo try | sil cfirst |
\ while 1 | exec <q-args> | sil cn | endwhile |
\ catch /^Vim\%((\a\+)\)\=:E\%(553\|42\):/ |
\ endtry
com! -nargs=1 Qfdofile try | sil cfirst |
\ while 1 | exec <q-args> | sil cnf | endwhile |
\ catch /^Vim\%((\a\+)\)\=:E\%(553\|42\):/ |
\ endtry

" Strip trailing whitespaces
function! <SID>StripTWS()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
command! StripTWS call <SID>StripTWS()
autocmd BufWritePre *.php,*.c,*.cpp,*.py,*.js,*.ts,*.tsx,*.hs,*.java,*.scala,*.rb,*.twig,*.html,*.xml,*.css,*.less,*.styl,*.vim,*.feature,*.md,*.markdown,*.clj,*.cljs,*.jade :call <SID>StripTWS()

" Show syntax highlighting groups for word under cursor
nnoremap <F8> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" Show differences between buffer and saved versions of a file
function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()

" Clean code function
function! s:CleanCode()
  %retab " Replace tabs with spaces
  %s= *$==e " Delete end of line blanks
  %s/\r//eg " Remove DOS returns ^M
  echo "Cleaned up this mess."
endfunction
com! CleanCode call s:CleanCode()
