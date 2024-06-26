-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map

    -- navigate buffer tabs with `H` and `L`
    ["<Tab>"] = {
      function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Next buffer",
    },
    ["<S-Tab>"] = {
      function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "Previous buffer",
    },
    -- mappings seen under group name "Buffer"
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    ["<S-Up>"] = { "<cmd>resize -2<CR>", desc = "Resize split up" },
    ["<S-Down>"] = { "<cmd>resize +2<CR>", desc = "Resize split down" },
    ["<S-Left>"] = { "<cmd>vertical resize -2<CR>", desc = "Resize split left" },
    ["<S-Right>"] = { "<cmd>vertical resize +2<CR>", desc = "Resize split right" },

    ["<A-j>"] = { "<cmd>:m +1<CR>", desc = "move line down" },
    ["<A-k>"] = { "<cmd>:m -2<CR>", desc = "move line up" },
    
    ["<leader>W"] = { "<cmd>:noa w<CR>", desc = "save without formatting" },

    ["<S-e>"] = { "<cmd>:lua vim.diagnostic.open_float()<CR>", desc = "show error in float" },

    ["<S-g>"] = { "<cmd>:GitBlameOpenCommitURL<CR>", desc = "show error in float" },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
  v = {
    ["<A-j>"] = { "<cmd>:m +1<CR>", desc = "move line down" },
    ["<A-k>"] = { "<cmd>:m -2<CR>", desc = "move line up" },
  }
}
