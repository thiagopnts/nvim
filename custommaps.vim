
" Clear search history
nnoremap // :nohlsearch<CR>

" Change Leader key to ,
let mapleader = ','

"alt+w close buffer but keep split
command Bd bp|bd #
map <A-w> :Bd<cr>
map ∑ :Bd<cr>

" Buffer navigation. This is a hack, specific for OSX. it's equivalent to
" alt + ] to bn and alt + [ to bp
map ‘ :bn<cr>
map “ :bp<cr>
map <A-]> :bn<cr>
map <A-[> :bp<cr>
map <D-s> :w<cr>
map <C-s> :w<cr>

