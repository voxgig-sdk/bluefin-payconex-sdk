
const envlocal = __dirname + '/../../../.env.local'
require('dotenv').config({ quiet: true, path: [envlocal] })

const { test, describe } = require('node:test')
const assert = require('node:assert')


const { BluefinPayconexSDK } = require('../../..')

const {
  envOverride,
} = require('../../utility')


describe('AccountUpdaterUpdateDirect', async () => {

  test('direct-exists', async () => {
    const sdk = new BluefinPayconexSDK({
      system: { fetch: async () => ({}) }
    })
    assert('function' === typeof sdk.direct)
    assert('function' === typeof sdk.prepare)
  })


  test('direct-load-account_updater_update', async () => {
    const setup = directSetup({ id: 'direct01' })
    const { client, calls } = setup

    const params = {}
    if (!setup.live) {
      params.account_id = 'direct01'
      params.id = 'direct02'
    }

    const result = await client.direct({
      path: 'api/v4/accounts/{account_id}/account-updater/updates/{id}',
      method: 'GET',
      params,
    })

    assert(result.ok === true)
    assert(result.status === 200)
    assert(null != result.data)

    if (!setup.live) {
      assert(result.data.id === 'direct01')
      assert(calls.length === 1)
      assert(calls[0].init.method === 'GET')
      assert(calls[0].url.includes('direct01'))
      assert(calls[0].url.includes('direct02'))
    }
  })

})



function directSetup(mockres) {
  const calls = []

  const env = envOverride({
    'BLUEFINPAYCONEX_TEST_ACCOUNT_UPDATER_UPDATE_ENTID': {},
    'BLUEFINPAYCONEX_TEST_LIVE': 'FALSE',
    'BLUEFINPAYCONEX_APIKEY': 'NONE',
  })

  const live = 'TRUE' === env.BLUEFINPAYCONEX_TEST_LIVE

  if (live) {
    const client = new BluefinPayconexSDK({
      apikey: env.BLUEFINPAYCONEX_APIKEY,
    })

    let idmap = env['BLUEFINPAYCONEX_TEST_ACCOUNT_UPDATER_UPDATE_ENTID']
    if ('string' === typeof idmap && idmap.startsWith('{')) {
      idmap = JSON.parse(idmap)
    }

    return { client, calls, live, idmap }
  }

  const mockFetch = async (url, init) => {
    calls.push({ url, init })
    return {
      status: 200,
      statusText: 'OK',
      headers: {},
      json: async () => (null != mockres ? mockres : { id: 'direct01' }),
    }
  }

  const client = new BluefinPayconexSDK({
    base: 'http://localhost:8080',
    system: { fetch: mockFetch },
  })

  return { client, calls, live, idmap: {} }
}
  
