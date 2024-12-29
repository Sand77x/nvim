-- toggles cmp from enabled to disabled
local M = {}
local cmp_enabled = true
local cmp = require("cmp")

-- enable cmp by default
cmp.setup.buffer({ enabled = true })

M.toggle_cmp = function()
	cmp.setup.buffer({ enabled = not cmp_enabled })
	cmp_enabled = not cmp_enabled
end

M.is_cmp_enabled = function()
	return cmp_enabled
end

return M
