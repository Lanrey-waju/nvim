return {
	"epwalsh/obsidian.nvim",
	version = "*",
	lazy = true,
	ft = "markdown",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("obsidian").setup({
			workspaces = {
				{
					name = "Zettelkasten",
					path = "/Users/user/Library/CloudStorage/GoogleDrive-lanreywaju97@gmail.com/My Drive/Zettelkasten",
				},
			},
			completion = {
				nvim_cmp = true,
				min_chars = 2,
			},
			new_notes_location = "notes_subdir",
			note_id_func = function(title)
				return title
			end,
			note_frontmatter_func = function(note)
				local out = { id = note.id, aliases = note.aliases, tags = note.tags }

				if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
					for k, v in pairs(note.metadata) do
						out[k] = v
					end
				end

				return out
			end,
			mappings = {},

			templates = {
				subdir = "Atomic Notes",
				date_format = "%Y-%m-%d",
				time_format = "%H:%M",
				tags = "",
				substitutions = {
					yesterday = function()
						return os.date("%Y-%m-%d", os.time() - 86400)
					end,
					tomorrow = function()
						return os.date("%Y-%m-%d", os.time() + 86400)
					end,
				},
			},

			ui = {
				enable = false, -- using render-markdown.nvim instead
			},
		})
	end,
}
