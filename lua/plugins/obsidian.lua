return {
	"epwalsh/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	lazy = true,
	keys = {
		{
			"<leader>so",
			"<cmd>ObsidianSearch<CR>",
			desc = "[S]earch [O]bsidian"
		},
		{
			"<leader>on",
			"<cmd>ObsidianNew<CR>",
			desc = "[O]bsidian [N]ew"
		},
		{
			"<leader>sb",
			"<cmd>ObsidianBacklinks<CR>",
			desc = "[S]earch [B]acklinks"
		}
	},
	-- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
	event = {
		-- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
		-- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
		"BufReadPre " .. vim.fn.expand "~" .. "/Documents/Walker-Brain-Fork/**.md",
		"BufReadPre " .. vim.fn.expand "~" .. "/Documents/Surgical-Coatings/**.md",
		"BufReadPre " .. vim.fn.expand "~" .. "/Documents/SC-Shared/**.md",
		"BufNewFile " .. vim.fn.expand "~" .. "/Documents/Walker-Brain-Fork/**.md",
		"BufNewFile " .. vim.fn.expand "~" .. "/Documents/Surgical-Coatings/**.md",
		"BufNewFile " .. vim.fn.expand "~" .. "/Documents/SC-Shared/**.md",
	},
	dependencies = {
		-- Required.
		"nvim-lua/plenary.nvim",

		-- see below for full list of optional dependencies 👇
	},
	opts = {
		workspaces = {
			{
				name = "personal",
				path = "~/Documents/Walker-Brain-Fork/",
			},
			{
				name = "work",
				path = "~/Documents/Surgical-Coatings/",
			},
		},

		-- see below for full list of options 👇

		-- Optional, completion of wiki links, local markdown links, and tags using nvim-cmp.
		completion = {
			-- Set to false to disable completion.
			nvim_cmp = true,
			-- Trigger completion at 2 chars.
			min_chars = 2,
		},


		-- Optional, customize how note IDs are generated given an optional title.
		---@param title string|?
		---@return string
		note_id_func = function(title)
			-- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
			-- In this case a note with the title 'My new note' will be given an ID that looks
			-- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
			local suffix = ""
			if title ~= nil then
				-- If title is given, transform it into valid file name.
				suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
			else
				-- If title is nil, just add 4 random uppercase letters to the suffix.
				for _ = 1, 4 do
					suffix = suffix .. string.char(math.random(65, 90))
				end
			end
			return tostring(os.time()) .. "-" .. suffix
		end,

		-- Optional, customize how note file names are generated given the ID, target directory, and title.
		---@param spec { id: string, dir: obsidian.Path, title: string|? }
		---@return string|obsidian.Path The full path to the new note.
		note_path_func = function(spec)
			-- This is equivalent to the default behavior.
			local path = spec.dir / tostring(spec.id)
			return path:with_suffix(".md")
		end,

		-- Either 'wiki' or 'markdown'.
		preferred_link_style = "wiki",

		picker = {
			-- Set your preferred picker. Can be one of 'telescope.nvim', 'fzf-lua', or 'mini.pick'.
			name = "telescope.nvim",
			-- Optional, configure key mappings for the picker. These are the defaults.
			-- Not all pickers support all mappings.
			mappings = {
				-- Create a new note from your query.
				new = "<C-x>",
				-- Insert a link to the selected note.
				insert_link = "<C-l>",
			},
		},
	},
}
