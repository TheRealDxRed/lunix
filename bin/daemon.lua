#!/usr/bin/env lua

local notify_string = "inotifywait -q -m -r -c -e modify ."
local modules = {}

local function break_event(event)
  local args = {}

  for arg in event:gmatch("[%w/.%-_%+]+") do
    table.insert(args, arg)
  end

  if #args ~= 3 then
    print("ERROR: Event has " .. #args .. " arguments")

    for i, arg in pairs(args) do
      print("  " .. i .. ": " .. arg)
    end

    error("Malformed event: " .. event, 2)
    os.exit(1)
  end

  return args
end

local function init_all_modules()
  for module in io.popen("ls mod"):lines() do
    local module_name = module:match("(%w+).lua")
    modules[module_name] = require("mod." .. module_name)
  end
end

local function run()
  init_all_modules()

  for event in io.popen(notify_string):lines() do
    local args = break_event(event)

    if args[1]:find("mod/") then
      local module_name = args[3]:match("(%w+).lua")

      print("Module file '" .. module_name .. "' modified. Reloading ")

      package.loaded["mod." .. module_name] = nil
      modules[module_name] = require("mod." .. module_name)

      print("New module pointer: " .. tostring(modules[module_name]))
    elseif args[1]:find("cfg/") then
      local module_name = args[1]:match("./cfg/(%w+)")

      if modules[module_name] ~= nil and type(modules[module_name].reload) == "function" then
        print("Configuration file for module '" .. module_name .. "' modified. Reloading")
        modules[module_name].reload()
      end
    else
      print("Untracked file modified: " .. args[1] .. args[3])
    end
  end
end

run()
