#!/usr/bin/env texlua

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

-- Find and run the build system
kpse.set_program_name ("kpsewhich")
if not release_date then
 dofile ( kpse.lookup ("l3build.lua"))
end
