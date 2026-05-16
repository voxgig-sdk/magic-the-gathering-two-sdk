-- ProjectName SDK exists test

local sdk = require("magic-the-gathering-two_sdk")

describe("MagicTheGatheringTwoSDK", function()
  it("should create test SDK", function()
    local testsdk = sdk.test(nil, nil)
    assert.is_not_nil(testsdk)
  end)
end)
