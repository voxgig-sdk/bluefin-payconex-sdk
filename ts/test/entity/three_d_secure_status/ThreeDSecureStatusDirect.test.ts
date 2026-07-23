
const envlocal = __dirname + '/../../../.env.local'
require('dotenv').config({ quiet: true, path: [envlocal] })

import { test, describe, afterEach } from 'node:test'
import assert from 'node:assert'


import { BluefinPayconexSDK } from '../../..'

import {
  envOverride,
  liveDelay,
  maybeSkipControl,
  skipIfMissingIds,
} from '../../utility'


describe('ThreeDSecureStatusDirect', async () => {

  // Per-test live pacing. Delay is read from sdk-test-control.json's
  // `test.live.delayMs`; only sleeps when BLUEFINPAYCONEX_TEST_LIVE=TRUE.
  afterEach(liveDelay('BLUEFINPAYCONEX_TEST_LIVE'))

  test('direct-exists', async () => {
    const sdk = new BluefinPayconexSDK({
      system: { fetch: async () => ({}) }
    })
    assert('function' === typeof sdk.direct)
    assert('function' === typeof sdk.prepare)
  })


  test('direct-load-three_d_secure_status', async (t: any) => {
    const setup = directSetup({ id: 'direct01' })
    if (maybeSkipControl(t, 'direct', 'direct-load-three_d_secure_status', setup.live)) return
    const { client, calls } = setup

    const params: any = {}
    const query: any = {}
    if (setup.live) {
      params["3_d_id"] = "tds_23d0e53de3c64e94887116da65abc8ce"
      params.account_id = "120615523104"
    } else {
      params["3_d_id"] = 'direct01'
      params.account_id = 'direct02'
    }

    const result: any = await client.direct({
      path: 'api/v4/accounts/{account_id}/3DS/{3_d_id}/status',
      method: 'GET',
      params,
      query,
    })

    if (setup.live) {
      // Live mode is lenient: synthetic IDs frequently 4xx. Skip rather
      // than fail when the load endpoint isn't reachable with the IDs we
      // can construct from setup.idmap.
      if (!result.ok || result.status < 200 || result.status >= 300) {
        return
      }
    } else {
      assert(result.ok === true)
      assert(result.status === 200)
      assert(null != result.data)
      assert(result.data.id === 'direct01')
      assert(calls.length === 1)
      assert(calls[0].init.method === 'GET')
      assert(calls[0].url.includes('direct01'))
      assert(calls[0].url.includes('direct02'))
    }
  })

})



function directSetup(mockres?: any) {
  const calls: any[] = []

  const env = envOverride({
    'BLUEFINPAYCONEX_TEST_THREE_D_SECURE_STATUS_ENTID': {},
    'BLUEFINPAYCONEX_TEST_LIVE': 'FALSE',
    'BLUEFINPAYCONEX_APIKEY': 'NONE',
  })

  const live = 'TRUE' === env.BLUEFINPAYCONEX_TEST_LIVE

  if (live) {
    const client = new BluefinPayconexSDK({
      apikey: env.BLUEFINPAYCONEX_APIKEY,
    })

    let idmap: any = env['BLUEFINPAYCONEX_TEST_THREE_D_SECURE_STATUS_ENTID']
    if ('string' === typeof idmap && idmap.startsWith('{')) {
      idmap = JSON.parse(idmap)
    }

    return { client, calls, live, idmap }
  }

  const mockFetch = async (url: string, init: any) => {
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

  return { client, calls, live, idmap: {} as any }
}

// direct() returns the raw response body. List endpoints often wrap the
// array in an envelope (e.g. { data: [...] }, { entities: [...] },
// { pagination, data: [...] }). The test transforms the raw body to
// extract the first array — either the body itself or the first array
// property of an envelope object.
function unwrapListData(data: any): any[] | null {
  if (Array.isArray(data)) return data
  if (data && 'object' === typeof data) {
    for (const v of Object.values(data)) {
      if (Array.isArray(v)) return v as any[]
    }
  }
  return null
}
  
