
import { test, describe } from 'node:test'
import { equal } from 'node:assert'


import { MagicTheGatheringTwoSDK } from '..'


describe('exists', async () => {

  test('test-mode', () => {
    const testsdk = MagicTheGatheringTwoSDK.test()
    equal(testsdk instanceof MagicTheGatheringTwoSDK, true,
      'MagicTheGatheringTwoSDK.test() must return a client synchronously')
  })

})
