local ProjTemplates = {}

function ProjTemplates.InitProjectTemplates()
  -- Empty Project (Git)
  require("neoproj").register_template({
    name = "Empty Project (Git)",
    expand = "git init",
  })

  -- C# Console
  require("neoproj").register_template({
    name = "C# Console",
    expand = "dotnet new console || git init",
  })

  -- C# Class Library
  require("neoproj").register_template({
    name = "C# Class Library",
    expand = "dotnet new classlib || git init",
  })

  -- ASP.NET Core
  require("neoproj").register_template({
    name = "ASP.NET Core",
    expand = "dotnet new razor || git init",
  })
end

return ProjTemplates
