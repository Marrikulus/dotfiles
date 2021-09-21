local actions = require('telescope.actions')
require('telescope').setup{
    defaults = {
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

function SearchFiles(title, path)
    return function()
        require('telescope.builtin').find_files({
            prompt_title = title,
            cwd = path,
        })
    end
end

local mappings = {}

mappings.search_dotfiles = SearchFiles("<dotfiles>","$HOME/.config/nvim/")
mappings.search_documents = SearchFiles("<docs>","$HOME/Documents/")

return mappings
