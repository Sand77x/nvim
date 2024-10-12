-- git
vim.api.nvim_set_hl(0, "DiffAdd", { fg = "#5fd75f" })
vim.api.nvim_set_hl(0, "DiffAdded", { link = "DiffAdd" })
vim.api.nvim_set_hl(0, "DiffDelete", { fg = "#d78787" })
vim.api.nvim_set_hl(0, "DiffRemoved", { link = "DiffDelete" })
-- vim.api.nvim_set_hl(0, "DiffChanged", { bg = "#ffda54" })

-- NormalFloat
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "None" })

-- floatborder
vim.api.nvim_set_hl(0, "FloatBorder", { link = "function" })

-- leap
vim.api.nvim_set_hl(0, "LeapLabelPrimary", { link = "visual" })
vim.api.nvim_set_hl(0, "LeapLabelSecondary", { link = "IncSearch" })

-- eyeliner
vim.api.nvim_set_hl(0, "EyelinerSecondary", { fg = "#faf8f5", underline = true })
vim.api.nvim_set_hl(0, "EyelinerPrimary", { fg = "#faf8f5", underline = false })
vim.api.nvim_set_hl(0, "EyelinerDimmed", { fg = "#060708", underline = false })

-- telescope
vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { link = "FloatBorder" })
vim.api.nvim_set_hl(0, "TelescopePromptBorder", { link = "FloatBorder" })
vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { link = "FloatBorder" })
