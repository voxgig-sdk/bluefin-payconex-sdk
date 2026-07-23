
import { test, describe } from 'node:test'
import { equal } from 'node:assert'


import { BluefinPayconexSDK } from '..'


describe('exists', async () => {

  test('test-mode', async () => {
    const testsdk = await BluefinPayconexSDK.test()
    equal(null !== testsdk, true)
  })

})
