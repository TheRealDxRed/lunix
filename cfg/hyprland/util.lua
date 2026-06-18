local util = {}

---@param id integer|string
---@param move_window boolean?
---@return function
function util.switch_workspace(id, move_window)
  return function()
    local special_workspace = hl.get_active_special_workspace() ~= nil
    local target_special = type(id) == "string"

    if target_special then
      hl.dispatch(hl.dsp.exec_cmd("killall waybar"))
    else
      hl.dispatch(hl.dsp.exec_cmd("pidof waybar || waybar"))
    end

    if move_window then
      hl.dispatch(hl.dsp.window.move({ workspace = id }))
    else
      if target_special and not special_workspace then
        hl.dispatch(hl.dsp.workspace.toggle_special(id))
      elseif not target_special then
        if special_workspace then
          hl.dispatch(hl.dsp.workspace.toggle_special())
        end
        hl.dispatch(hl.dsp.focus({ workspace = id }))
      end
    end
  end
end

return util
