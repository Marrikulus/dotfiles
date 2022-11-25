if !exists('g:loaded_telescope') | finish | endif
lua << EOF
local actions = require('telescope.actions')
require('telescope').setup{
    defaults = {
        mappings = {
            n = {
                ["q"] = actions.close
            }
        },
        file_sorter = require('telescope.sorters').get_fzy_sorter
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        }
    }
}

require('telescope').load_extension('fzy_native')

function _G.project_files()
    local opts = {
        prompt_title = title,
        cwd = path,
    }
    local ok = pcall(require('telescope.builtin').git_files, opts)

    if not ok then require('telescope.builtin').find_files(opts) end
end

function _G.searchfiles(title, path)
    require('telescope.builtin').find_files({
        prompt_title = title,
        cwd = path,
    })
end


EOF

nnoremap <C-p> <cmd>call v:lua.project_files()<cr>
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
"nnoremap <C-p> <cmd>lua require('telescope.builtin').git_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>vr <cmd>call v:lua.searchfiles("<dotfiles>", "$HOME/.config/nvim/")<cr>
nnoremap <leader>fd <cmd>call v:lua.searchfiles("<docs>", "$HOME/Documents/")<cr>


