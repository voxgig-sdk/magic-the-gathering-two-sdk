-- MagicTheGatheringTwo SDK error

local MagicTheGatheringTwoError = {}
MagicTheGatheringTwoError.__index = MagicTheGatheringTwoError


function MagicTheGatheringTwoError.new(code, msg, ctx)
  local self = setmetatable({}, MagicTheGatheringTwoError)
  self.is_sdk_error = true
  self.sdk = "MagicTheGatheringTwo"
  self.code = code or ""
  self.msg = msg or ""
  self.ctx = ctx
  self.result = nil
  self.spec = nil
  return self
end


function MagicTheGatheringTwoError:error()
  return self.msg
end


function MagicTheGatheringTwoError:__tostring()
  return self.msg
end


return MagicTheGatheringTwoError
