local Job = require "plenary.job"

return function(cmd, cwd)
  local command = table.remove(cmd, 1)
  local stderr = {}
  local stdout, ret = Job:new({
    command = command,
    args = cmd,
    cwd = cwd,
    on_stderr = function(_, data)
        table.insert(stderr, data)
    end,
  }):sync()
  return stdout, ret, stderr
end
