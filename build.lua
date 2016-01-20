#!/usr/bin/env texlua

-- Build script for "luatex-def" files

-- Identify the bundle and module
bundle = ""
module = "luatex-def"

sourcefiles =
  {
    "luatex.def"
  }
typesetfiles =
  {
  }

-- No automated tests for this bundle
testfildir = ""


-- Find and run the build system
kpse.set_program_name ("kpsewhich")
dofile (kpse.lookup ("l3build.lua"))
