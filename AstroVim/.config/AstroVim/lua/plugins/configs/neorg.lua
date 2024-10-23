local opts = {
  load = {
    ["external.templates"] = {},
    ["core.defaults"] = {}, -- Loads default behaviour
    ["core.pivot"] = {},
    ["core.highlights"] = {
      config = {
        highlights = { modifiers = { escape = "+@spell" } },
      },
    },
    ["core.keybinds"] = {
      config = {
        hook = function(keybinds)
          -- Unmaps any Neorg key from the `norg` mode
          -- keybinds.unmap("norg", "n", "gtd")

          -- Binds the `gtd` key in `norg` mode to execute `:echo 'Hello'`
          -- keybinds.map("norg", "n", "gtd", "<cmd>echo 'Hello!'<CR>")

          -- Remap unbinds the current key then rebinds it to have a different action
          -- associated with it.
          -- The following is the equivalent of the `unmap` and `map` calls you saw above:
          keybinds.remap("norg", "n", "g0", "<cmd>Neorg toc split<CR>")
          keybinds.remap("norg", "n", "<leader>nt", "<cmd>Neorg toc qflist<CR>")
          keybinds.remap("norg", "n", "<leader>t", "<cmd>Neorg toc<CR>")

          -- Sometimes you may simply want to rebind the Neorg action something is bound to
          -- versus remapping the entire keybind. This remap is essentially the same as if you
          -- did `keybinds.remap("norg", "n", "<C-Space>, "<cmd>Neorg keybind norg core.norg.qol.todo_items.todo.task_done<CR>")
          -- keybinds.remap_event("norg", "n", "<C-Space>", "core.norg.qol.todo_items.todo.task_done")
          keybinds.remap_event("norg", "n", "q", "core.qol.toc.close")
          keybinds.remap_event("norg", "n", "<leader>d", "core.qol.todo_items.todo.task_cycle")
          keybinds.remap_event("norg", "n", "<leader>sl", "core.integrations.telescope.find_linkable")
          keybinds.remap_event("norg", "i", "<C-l>", "core.integrations.telescope.insert_link")
          keybinds.remap_event("norg", "i", "<C-f>", "core.integrations.telescope.insert_file_link")

          -- Want to move one keybind into the other? `remap_key` moves the data of the
          -- first keybind to the second keybind, then unbinds the first keybind.
          -- keybinds.remap_key("norg", "n", "<C-Space>", "<Leader>t")
        end,
      },
    },
    ["core.concealer"] = {
      config = {
        folds = true,
        icons = {
          code_block = {
            conceal = true,
          },
        },
      },
    }, -- Adds pretty icons to your documents
    ["core.dirman"] = { -- Manages Neorg workspaces
      config = {
        workspaces = { notes = "~/Notes" },
        default_workspace = "notes",
      },
    },
    ["core.journal"] = {
      config = {
        workspace = "notes",
        journal_folder = "journal",
        strategy = "nested",
      },
    },
    ["core.summary"] = {
      config = {
        strategy = "default",
      },
    },
    ["core.qol.toc"] = {
      config = {
        close_after_use = true,
        toc_split_placement = "qflist",
      },
    },
    ["core.esupports.metagen"] = {
      config = {
        type = "empty",
        strategy = "default",
        template = {
          { "title", "" },
          { "description", "" },
          { "authors", "Wenjing Fang" },
          { "categories", "[notes]" },
          {
            "created",
            function() return os.date "%Y-%m-%d" end,
          },
          {
            "updated",
            function() return os.date "%Y-%m-%d" end,
          },
          { "version", "0.1.0" },
        },
      },
    },
    ["core.export.markdown"] = { config = { extensions = "all" } },
    ["core.export"] = {},
    ["core.integrations.telescope"] = {},
    -- ["external.context"] = {},
  },
}

return opts
