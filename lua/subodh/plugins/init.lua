--add plugins that do not require any configurations
return {
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' },
}
--return {
--    "christoomy/vim-tmux-navigator"
--}
