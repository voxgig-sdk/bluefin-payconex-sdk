
const envlocal = __dirname + '/../../../.env.local'
require('dotenv').config({ quiet: true, path: [envlocal] })

const { test, describe } = require('node:test')
const assert = require('node:assert')


const { BluefinPayconexSDK } = require('../../..')

const {
  envOverride,
} = require('../../utility')


describe('ListApiKeyScopesEntryDirect', async () => {

  test('direct-exists', async () => {
    const sdk = new BluefinPayconexSDK({
      system: { fetch: async () => ({}) }
    })
    assert('function' === typeof sdk.direct)
    assert('function' === typeof sdk.prepare)
  })


  test('direct-list-list_api_key_scopes_entry', async () => {
    const setup = directSetup([{ id: 'direct01' }, { id: 'direct02' }])
    const { client, calls } = setup

    const params = {}

    const result = await client.direct({
      path: 'api/v4/api-key-scopes',
      method: 'GET',
      params,
    })

    assert(result.ok === true)
    assert(result.status === 200)
    assert(Array.isArray(result.data))

    if (!setup.live) {
      assert(result.data.length === 2)
      assert(calls.length === 1)
      assert(calls[0].init.method === 'GET')
    }
  })

})



function directSetup(mockres) {
  const calls = []

  const env = envOverride({
    'BLUEFINPAYCONEX_TEST_LIST_API_KEY_SCOPES_ENTRY_ENTID': {},
    'BLUEFINPAYCONEX_TEST_LIVE': 'FALSE',
    'BLUEFINPAYCONEX_APIKEY': 'NONE',
  })

  const live = 'TRUE' === env.BLUEFINPAYCONEX_TEST_LIVE

  if (live) {
    const client = new BluefinPayconexSDK({
      apikey: env.BLUEFINPAYCONEX_APIKEY,
    })

    let idmap = env['BLUEFINPAYCONEX_TEST_LIST_API_KEY_SCOPES_ENTRY_ENTID']
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
  
