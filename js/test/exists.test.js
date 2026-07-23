
const { test, describe } = require('node:test')
const { equal } = require('node:assert')


const { BluefinPayconexSDK } = require('..')


describe('exists', async () => {

  test('test-mode', async () => {
    const testsdk = await BluefinPayconexSDK.test()
    equal(null !== testsdk, true)
  })

})
