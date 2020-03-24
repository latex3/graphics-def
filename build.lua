#!/usr/bin/env texlua

-- Build script for "graphics-def" files

-- Identify the bundle and module
bundle = ""
module = "graphics-def"

-- Just the one file to worry about
installfiles = {"*.def"}
sourcefiles  = {"*.def"}
typesetfiles = {}

if string.find(status.banner,"2019") then
  print("TL2019")
  TL2019bool=true
else
  -- tl2020
  print("TL2020 or later")

 specialformats={}
  specialformats["latex"] = specialformats["latex"] or
   {
    luatex     = {binary="luahbtex",format = "lualatex"},
   }
  specialformats["latex-dev"] = specialformats["latex-dev"] or
   {
    luatex = {binary="luahbtex",format = "lualatex-dev"}
   }
end


-- Find and run the build system
kpse.set_program_name ("kpsewhich")
if not release_date then
 dofile ( kpse.lookup ("l3build.lua"))
end
