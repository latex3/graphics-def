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

-- Allow for 'dev' release
--
-- See stackoverflow.com/a/12142066/212001
-- Also luaotfload build.lua: getting the Travis-CI version right is 'fun'
do
  local tag = os.getenv'TRAVIS_TAG'
  if tag and tag ~= "" then
    main_branch = not string.match(tag, '^dev-')
  else
    local branch = os.getenv'TRAVIS_BRANCH'
    if not branch then
      local f = io.popen'git rev-parse --abbrev-ref HEAD'
      branch = f:read'*a':sub(1,-2)
      assert(f:close())
    end
    main_branch = string.match(branch, '^main')
  end
  if not main_branch then
    tdsroot = "latex-dev"
    print("Creating/installing dev-version in " .. tdsroot)
    ctanpkg = "graphics-def-dev"
    ctanzip = ctanpkg
  end
end

-- Find and run the build system
kpse.set_program_name ("kpsewhich")
if not release_date then
 dofile ( kpse.lookup ("l3build.lua"))
end
