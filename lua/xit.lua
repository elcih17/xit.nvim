local xit = {}

-- augroup xit_filetype
-- 	autocmd!
-- 	autocmd BufRead,BufNewFile,BufReadPost *.xit set filetype=xit
-- 	autocmd FileType xit setlocal shiftwidth=4 softtabstop=4 expandtab
-- augroup END

local function with_defaults(options)
   return {
			-- TODO not sure if I'll need any options, maybe eventually
      add_something_later = options.add_something_later or "Just something"
   }
end

function xit.setup(options)
   xit.options = with_defaults(options)

	local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
	parser_config.xit = {
		install_info = {
			url = "https://github.com/synaptiko/tree-sitter-xit",
			files = { "src/parser.c" },
			branch = "master",
			generate_requires_npm = false,
			requires_generate_from_grammar = false,
		},
		filetype = "xit",
	}
end

function xit.is_configured()
   return xit.options ~= nil
end

xit.options = nil
return xit