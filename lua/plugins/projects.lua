return {
  "pluffie/neoproj",
  cmd = { "ProjectOpen", "ProjectNew" },
  config = function()
    require("neoproj").setup({
      -- Directory which contains all of your projects
      project_path = "~/Developer",
    })
  end,
}
