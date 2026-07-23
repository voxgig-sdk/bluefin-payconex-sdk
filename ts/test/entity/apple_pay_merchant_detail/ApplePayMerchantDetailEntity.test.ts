
const envlocal = __dirname + '/../../../.env.local'
require('dotenv').config({ quiet: true, path: [envlocal] })

import Path from 'node:path'
import * as Fs from 'node:fs'

import { test, describe, afterEach } from 'node:test'
import assert from 'node:assert'


import { BluefinPayconexSDK, BaseFeature, stdutil } from '../../..'

import {
  envOverride,
  liveDelay,
  makeCtrl,
  makeMatch,
  makeReqdata,
  makeStepData,
  makeValid,
  maybeSkipControl,
} from '../../utility'


describe('ApplePayMerchantDetailEntity', async () => {

  // Per-test live pacing. Delay is read from sdk-test-control.json's
  // `test.live.delayMs`; only sleeps when BLUEFINPAYCONEX_TEST_LIVE=TRUE.
  afterEach(liveDelay('BLUEFINPAYCONEX_TEST_LIVE'))

  test('instance', async () => {
    const testsdk = BluefinPayconexSDK.test()
    const ent = testsdk.ApplePayMerchantDetail()
    assert(null != ent)
  })


  test('basic', async (t) => {

    const live = 'TRUE' === process.env.BLUEFIN_PAYCONEX_TEST_LIVE
    for (const op of ['create', 'list']) {
      if (maybeSkipControl(t, 'entityOp', 'apple_pay_merchant_detail.' + op, live)) return
    }

    const setup = basicSetup()
    // The basic flow consumes synthetic IDs and field values from the
    // fixture (entity TestData.json). Those don't exist on the live API.
    // Skip live runs unless the user provided a real ENTID env override.
    if (setup.syntheticOnly) {
      t.skip('live entity test uses synthetic IDs from fixture — set BLUEFIN_PAYCONEX_TEST_APPLE_PAY_MERCHANT_DETAIL_ENTID JSON to run live')
      return
    }
    const client = setup.client
    const struct = setup.struct

    const isempty = struct.isempty
    const select = struct.select


    // CREATE
    const apple_pay_merchant_detail_ref01_ent = client.ApplePayMerchantDetail()
    let apple_pay_merchant_detail_ref01_data = setup.data.new.apple_pay_merchant_detail['apple_pay_merchant_detail_ref01']
    apple_pay_merchant_detail_ref01_data['account_id'] = setup.idmap['account01']

    apple_pay_merchant_detail_ref01_data = await apple_pay_merchant_detail_ref01_ent.create(apple_pay_merchant_detail_ref01_data)
    assert(null != apple_pay_merchant_detail_ref01_data)


    // LIST
    const apple_pay_merchant_detail_ref01_match: any = {}
    apple_pay_merchant_detail_ref01_match['account_id'] = setup.idmap['account01']

    const apple_pay_merchant_detail_ref01_list = await apple_pay_merchant_detail_ref01_ent.list(apple_pay_merchant_detail_ref01_match)


  })
})



function basicSetup(extra?: any) {
  // TODO: fix test def options
  const options: any = {} // null

  // TODO: needs test utility to resolve path
  const entityDataFile =
    Path.resolve(__dirname, 
      '../../../../.sdk/test/entity/apple_pay_merchant_detail/ApplePayMerchantDetailTestData.json')

  // TODO: file ready util needed?
  const entityDataSource = Fs.readFileSync(entityDataFile).toString('utf8')

  // TODO: need a xlang JSON parse utility in voxgig/struct with better error msgs
  const entityData = JSON.parse(entityDataSource)

  options.entity = entityData.existing

  let client = BluefinPayconexSDK.test(options, extra)
  const struct = client.utility().struct
  const merge = struct.merge
  const transform = struct.transform

  let idmap = transform(
    ['apple_pay_merchant_detail01','apple_pay_merchant_detail02','apple_pay_merchant_detail03','account01','account02','account03'],
    {
      '`$PACK`': ['', {
        '`$KEY`': '`$COPY`',
        '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
      }]
    })

  // Detect whether the user provided a real ENTID JSON via env var. The
  // basic flow consumes synthetic IDs from the fixture file; without an
  // override those synthetic IDs reach the live API and 4xx. Surface this
  // to the test so it can skip rather than fail.
  const idmapEnvVal = process.env['BLUEFIN_PAYCONEX_TEST_APPLE_PAY_MERCHANT_DETAIL_ENTID']
  const idmapOverridden = null != idmapEnvVal && idmapEnvVal.trim().startsWith('{')

  const env = envOverride({
    'BLUEFIN_PAYCONEX_TEST_APPLE_PAY_MERCHANT_DETAIL_ENTID': idmap,
    'BLUEFIN_PAYCONEX_TEST_LIVE': 'FALSE',
    'BLUEFIN_PAYCONEX_TEST_EXPLAIN': 'FALSE',
    'BLUEFIN_PAYCONEX_APIKEY': 'NONE',
  })

  idmap = env['BLUEFIN_PAYCONEX_TEST_APPLE_PAY_MERCHANT_DETAIL_ENTID']

  const live = 'TRUE' === env.BLUEFIN_PAYCONEX_TEST_LIVE

  if (live) {
    client = new BluefinPayconexSDK(merge([
      {
        apikey: env.BLUEFIN_PAYCONEX_APIKEY,
      },
      extra
    ]))
  }

  const setup = {
    idmap,
    env,
    options,
    client,
    struct,
    data: entityData,
    explain: 'TRUE' === env.BLUEFIN_PAYCONEX_TEST_EXPLAIN,
    live,
    syntheticOnly: live && !idmapOverridden,
    now: Date.now(),
  }

  return setup
}
  
