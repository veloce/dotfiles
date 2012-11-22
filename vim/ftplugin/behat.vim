if exists("b:did_ftplugin") | finish | endif

setlocal tabstop=2
setlocal shiftwidth=2
setlocal softtabstop=2

if match(expand('%:p:h'), 'jirafe\/api/') != -1
    let b:behat_cmd_args = '-c behat/behat.yml'
endif

if match(expand('%:h'), 'Features\/admin') != -1
    let b:behat_profile = 'admin_api'
elseif match(expand('%:h'), 'Features\/reports') != -1
    let b:behat_profile = 'reports_api'
elseif match(expand('%'), '\(dashboard\|plugin_versions\)\.feature$') != -1
    let b:behat_profile = 'freebird'
elseif match(expand('%:h'), 'DashboardBundle\/Features') != -1
    let b:behat_profile = 'cloud'
elseif match(expand('%:h'), 'CharonBundle\/Features') != -1
    let b:behat_profile = 'charon'
endif

if exists('b:behat_profile')
    let b:behat_cmd_args = b:behat_cmd_args . ' -p ' . b:behat_profile
endif

compiler behat

" align automatically tables
" Thanks Tim Pope !
inoremap <buffer> <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction
