#!/usr/bin/env texlua

-- Build script for "graphics-def" files

-- Identify the bundle and module
bundle = ""
module = "graphics-def"

-- Just the one file to worry about
installfiles = {"*.def"}
sourcefiles  = {"*.def"}
typesetfiles = {}

-- Find and run the build system
kpse.set_program_name("kpsewhich")
dofile(kpse.lookup("l3build.lua"))
