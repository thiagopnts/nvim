" Setup Vim Plug
call plug#begin('~/.config/nvim/plugged')

" Uses vundle to manage vundle

"Plug 'dag/vim-fish'
Plug 'wsdjeg/FlyGrep.vim'
Plug 'yorickpeterse/happy_hacking.vim'
Plug 'joshdick/onedark.vim'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tell-k/vim-autopep8'
Plug 'tpope/vim-fugitive'
Plug 'baskerville/bubblegum'
Plug 'c9s/vikube.vim'
Plug 'justinmk/vim-syntax-extra'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neomake/neomake', {'for': 'python'}
Plug 'aurieh/discord.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'ClockworkNet/vim-vcl'
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'tpope/vim-surround'
Plug 'junegunn/vim-emoji'
Plug 'etdev/vim-hexcolor'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
"Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'
Plug 'mileszs/ack.vim'
Plug 'Townk/vim-autoclose'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'nathanaelkane/vim-indent-guides'
Plug 'b4winckler/vim-objc'
Plug 'rust-lang/rust.vim'
Plug 'nono/vim-handlebars'
Plug 'bkad/CamelCaseMotion'
Plug 'python-mode/python-mode', { 'branch': 'develop' }
Plug 'cespare/vim-toml'
Plug 'pangloss/vim-javascript'
Plug 'Yggdroot/indentLine'
Plug 'ambv/black',
Plug 'bling/vim-airline'
Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoUpdateBinaries' }
Plug 'vim-airline/vim-airline-themes'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'mattn/emmet-vim'
Plug 'airblade/vim-gitgutter'
Plug 'xolox/vim-misc'
Plug 'tpope/vim-repeat'
"Plug 'w0rp/ale'
Plug 'nanotech/jellybeans.vim'
Plug 'timonv/vim-cargo'

call plug#end()
