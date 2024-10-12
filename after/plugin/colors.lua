function ColorMyPencils(color)
    color = color or "tundra"
    vim.g.tundra_biome = 'jungle'
    vim.cmd.colorscheme(color)
end

ColorMyPencils()
