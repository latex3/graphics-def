-- Build script for "graphics-def" files

-- Identify the bundle and module
bundle = ""
module = "graphics-def"

-- Just the one file to worry about
installfiles = {"*.def"}
sourcefiles  = {"*.def"}
typesetfiles = {}
textfiles= {"README.md"}

specialformats = {}
specialformats["latex"] = specialformats["latex"] or
  {
    luatex = {binary="luahbtex",format = "lualatex"},
  }
specialformats["latex-dev"] = specialformats["latex-dev"] or
  {
     luatex = {binary="luahbtex",format = "lualatex-dev"}
  }


checkconfigs = {"build","config-plain","config-xetex"}