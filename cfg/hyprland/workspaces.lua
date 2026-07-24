local util = require "util"
local workspaces = {}

workspaces.alpha = {
  selector = "1",
  bind = 1,
  rules = {
    {
      layout = "monocle",
    }
  },
}

workspaces.beta = {
  selector = "2",
  bind = 2,
  rules = {
    {
      layout = "dwindle",
    },
  },
}

workspaces.gamma = {
  selector = "3",
  bind = 3,
  rules = {
    {
      layout = "master",
    }
  },
}

workspaces.delta = {
  selector = "4",
  bind = 4,
  rules = {
    {
      layout = "scrolling",
    }
  },
}

workspaces.control_center = {
  selector = "control",
  bind = "grave",
  rules = {
    {
      layout = "dwindle",
      gaps_in = 1,
      gaps_out = 1,
      border_size = 2,
      no_shadows = true,
      no_rounding = true,
      persistent = false,
      on_created_empty = util.create_control_center()
    }
  },
}

local function register_binds(wksp)
  hl.bind("SUPER + " .. wksp.bind, hl.dsp.focus({ workspace = wksp.selector }))
  hl.bind("SUPER + SHIFT + " .. wksp.bind, hl.dsp.window.move({ workspace = wksp.selector }))
end

local function register_special_binds(wksp)
  hl.bind("SUPER + " .. wksp.bind, hl.dsp.workspace.toggle_special(wksp.selector))
  hl.bind("SUPER + SHIFT + " .. wksp.bind, hl.dsp.window.move({ workspace = "special:" .. wksp.selector }))
end

local function register_rules(wksp)
  for _, rule in pairs(wksp.rules) do
    rule.workspace = wksp.selector
    hl.workspace_rule(rule)
  end
end

function workspaces.setup()
  register_binds(workspaces.alpha)
  register_binds(workspaces.beta)
  register_binds(workspaces.gamma)
  register_binds(workspaces.delta)
  register_special_binds(workspaces.control_center)

  register_rules(workspaces.alpha)
  register_rules(workspaces.beta)
  register_rules(workspaces.gamma)
  register_rules(workspaces.delta)
end

return workspaces
