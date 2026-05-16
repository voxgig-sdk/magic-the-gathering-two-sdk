
import { test, describe } from 'node:test'
import { equal } from 'node:assert'


import { MagicTheGatheringTwoSDK } from '..'


describe('exists', async () => {

  test('test-mode', async () => {
    const testsdk = await MagicTheGatheringTwoSDK.test()
    equal(null !== testsdk, true)
  })

})
