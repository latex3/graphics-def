#!/usr/bin/env texlua

-- Build script for "luatex-def" files

-- Identify the bundle and module
bundle = ""
module = "luatex-def"

-- Just the one file to worry about
installfiles = {"luatex.def"}
sourcefiles  = {"luatex.def"}
typesetfiles = {}

-- TDS info (not required at present)
tdsroot = "luatex"

-- No automated tests for this bundle
testfildir = ""


-- Find and run the build system
kpse.set_program_name ("kpsewhich")
dofile (kpse.lookup ("l3build.lua"))
