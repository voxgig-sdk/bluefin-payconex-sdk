-- BluefinPayconex SDK error

local BluefinPayconexError = {}
BluefinPayconexError.__index = BluefinPayconexError


function BluefinPayconexError.new(code, msg, ctx)
  local self = setmetatable({}, BluefinPayconexError)
  self.is_sdk_error = true
  self.sdk = "BluefinPayconex"
  self.code = code or ""
  self.msg = msg or ""
  self.ctx = ctx
  self.result = nil
  self.spec = nil
  return self
end


function BluefinPayconexError:error()
  return self.msg
end


function BluefinPayconexError:__tostring()
  return self.msg
end


return BluefinPayconexError
