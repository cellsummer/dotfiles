lvim.builtin.which_key.mappings["n"] = {
  name = "Notes",
  c = { "<cmd>Telekasten show_calendar<cr>", "Calendar" },
  n = { "<cmd>Telekasten new_note<cr>", "Note" },
  f = { "<cmd>Telekasten find_notes<cr>", "Find" },
  F = { "<cmd>Telekasten find_daily_notes<cr>", "Find Journal" },
  j = { "<cmd>Telekasten goto_today<cr>", "Journal" },
  p = { "<cmd>Telekasten panel<cr>", "Panel" },
  t = { "<cmd>Telekasten toggle_todo<cr>", "Toggle Todo" },
}
lvim.builtin.which_key.mappings["m"] = {
  name = "Mind",
  m = { "<cmd>MindOpenProject<cr>", "Local Mind" },
  g = { "<cmd>MindOpenMain<cr>", "Global Mind" },
  c = { "<cmd>MindClose<cr>", "Close Mind" },
}
-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
-- }
