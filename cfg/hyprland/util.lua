local util = {}

function util.create_control_center()
  return function()
    hl.exec_cmd("kitty nvim /tmp/scratchpad.md", { workspace = "special:control" })
    hl.exec_cmd("kitty nnn", { workspace = "special:control" })
    hl.exec_cmd("kitty gotop", { workspace = "special:control" })
    hl.exec_cmd("kitty nvtop", { workspace = "special:control" })
  end
end

return util
