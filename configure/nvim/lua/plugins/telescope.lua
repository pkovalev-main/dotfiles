return {
    'nvim-telescope/telescope.nvim',
    lazy = false,
    branch = '0.1.x',
    dependencies = {
		'nvim-lua/plenary.nvim',
		{"nvim-telescope/telescope-fzf-native.nvim", build = "make"},
	},

	config = function()
		local telescope = require("telescope")
		telescope.setup {
			defaults = {
				hidden = true,
			},
			pickers = {
				find_files = {
					hidden = true,
					no_ignore = true,
					follow = true,
				}
			},
		    extensions = {
				fzf = {
				fuzzy = true,                    -- false will only do exact matching
					override_generic_sorter = true,  -- override the generic sorter
				    override_file_sorter = true,     -- override the file sorter
			        case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
			    }
		    }
		}		
		telescope.load_extension("fzf")

		local builtin = require('telescope.builtin')
		local keymap = vim.keymap
		keymap.set('n', '<leader>ff', builtin.find_files, {})
		keymap.set('n', '<leader>fg', builtin.live_grep, {})
		keymap.set('n', '<leader>fw', builtin.grep_string, {})
		keymap.set('n', '<leader>fh', builtin.help_tags, {})
	end,
}
