
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


describe('AccountUpdaterSubscriptionWithResultEntity', async () => {

  // Per-test live pacing. Delay is read from sdk-test-control.json's
  // `test.live.delayMs`; only sleeps when BLUEFINPAYCONEX_TEST_LIVE=TRUE.
  afterEach(liveDelay('BLUEFINPAYCONEX_TEST_LIVE'))

  test('instance', async () => {
    const testsdk = BluefinPayconexSDK.test()
    const ent = testsdk.AccountUpdaterSubscriptionWithResult()
    assert(null != ent)
  })


  test('basic', async (t) => {

    const live = 'TRUE' === process.env.BLUEFIN_PAYCONEX_TEST_LIVE
    for (const op of ['create', 'update', 'load']) {
      if (maybeSkipControl(t, 'entityOp', 'account_updater_subscription_with_result.' + op, live)) return
    }

    const setup = basicSetup()
    // The basic flow consumes synthetic IDs and field values from the
    // fixture (entity TestData.json). Those don't exist on the live API.
    // Skip live runs unless the user provided a real ENTID env override.
    if (setup.syntheticOnly) {
      t.skip('live entity test uses synthetic IDs from fixture — set BLUEFIN_PAYCONEX_TEST_ACCOUNT_UPDATER_SUBSCRIPTION_WITH_RESULT_ENTID JSON to run live')
      return
    }
    const client = setup.client
    const struct = setup.struct

    const isempty = struct.isempty
    const select = struct.select


    // CREATE
    const account_updater_subscription_with_result_ref01_ent = client.AccountUpdaterSubscriptionWithResult()
    let account_updater_subscription_with_result_ref01_data = setup.data.new.account_updater_subscription_with_result['account_updater_subscription_with_result_ref01']
    account_updater_subscription_with_result_ref01_data['account_id'] = setup.idmap['account01']
    account_updater_subscription_with_result_ref01_data['subscription_id'] = setup.idmap['subscription01']

    account_updater_subscription_with_result_ref01_data = await account_updater_subscription_with_result_ref01_ent.create(account_updater_subscription_with_result_ref01_data)
    assert(null != account_updater_subscription_with_result_ref01_data.id)


    // UPDATE
    const account_updater_subscription_with_result_ref01_data_up0: any = {}
    account_updater_subscription_with_result_ref01_data_up0.id = account_updater_subscription_with_result_ref01_data.id
    account_updater_subscription_with_result_ref01_data_up0 ['account_id'] = setup.idmap['account_id']

    const account_updater_subscription_with_result_ref01_markdef_up0 = { name: 'created_at', value: 'Mark01-account_updater_subscription_with_result_ref01_' + setup.now }
    ;(account_updater_subscription_with_result_ref01_data_up0 as any)[account_updater_subscription_with_result_ref01_markdef_up0.name] = account_updater_subscription_with_result_ref01_markdef_up0.value

    const account_updater_subscription_with_result_ref01_resdata_up0 = await account_updater_subscription_with_result_ref01_ent.update(account_updater_subscription_with_result_ref01_data_up0)
    assert(account_updater_subscription_with_result_ref01_resdata_up0.id === account_updater_subscription_with_result_ref01_data_up0.id)

    assert((account_updater_subscription_with_result_ref01_resdata_up0 as any)[account_updater_subscription_with_result_ref01_markdef_up0.name] === account_updater_subscription_with_result_ref01_markdef_up0.value)


    // LOAD
    const account_updater_subscription_with_result_ref01_match_dt0: any = {}
    account_updater_subscription_with_result_ref01_match_dt0.id = account_updater_subscription_with_result_ref01_data.id
    const account_updater_subscription_with_result_ref01_data_dt0 = await account_updater_subscription_with_result_ref01_ent.load(account_updater_subscription_with_result_ref01_match_dt0)
    assert(account_updater_subscription_with_result_ref01_data_dt0.id === account_updater_subscription_with_result_ref01_data.id)


  })
})



function basicSetup(extra?: any) {
  // TODO: fix test def options
  const options: any = {} // null

  // TODO: needs test utility to resolve path
  const entityDataFile =
    Path.resolve(__dirname, 
      '../../../../.sdk/test/entity/account_updater_subscription_with_result/AccountUpdaterSubscriptionWithResultTestData.json')

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
    ['account_updater_subscription_with_result01','account_updater_subscription_with_result02','account_updater_subscription_with_result03','account01','account02','account03','subscription01','subscription02','subscription03'],
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
  const idmapEnvVal = process.env['BLUEFIN_PAYCONEX_TEST_ACCOUNT_UPDATER_SUBSCRIPTION_WITH_RESULT_ENTID']
  const idmapOverridden = null != idmapEnvVal && idmapEnvVal.trim().startsWith('{')

  const env = envOverride({
    'BLUEFIN_PAYCONEX_TEST_ACCOUNT_UPDATER_SUBSCRIPTION_WITH_RESULT_ENTID': idmap,
    'BLUEFIN_PAYCONEX_TEST_LIVE': 'FALSE',
    'BLUEFIN_PAYCONEX_TEST_EXPLAIN': 'FALSE',
    'BLUEFIN_PAYCONEX_APIKEY': 'NONE',
  })

  idmap = env['BLUEFIN_PAYCONEX_TEST_ACCOUNT_UPDATER_SUBSCRIPTION_WITH_RESULT_ENTID']

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
  
