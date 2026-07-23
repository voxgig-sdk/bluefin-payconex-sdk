
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


describe('DynamicDescriptorEntity', async () => {

  // Per-test live pacing. Delay is read from sdk-test-control.json's
  // `test.live.delayMs`; only sleeps when BLUEFINPAYCONEX_TEST_LIVE=TRUE.
  afterEach(liveDelay('BLUEFINPAYCONEX_TEST_LIVE'))

  test('instance', async () => {
    const testsdk = BluefinPayconexSDK.test()
    const ent = testsdk.DynamicDescriptor()
    assert(null != ent)
  })


  test('basic', async (t) => {

    const live = 'TRUE' === process.env.BLUEFIN_PAYCONEX_TEST_LIVE
    for (const op of ['create', 'list', 'update', 'load', 'remove']) {
      if (maybeSkipControl(t, 'entityOp', 'dynamic_descriptor.' + op, live)) return
    }

    const setup = basicSetup()
    // The basic flow consumes synthetic IDs and field values from the
    // fixture (entity TestData.json). Those don't exist on the live API.
    // Skip live runs unless the user provided a real ENTID env override.
    if (setup.syntheticOnly) {
      t.skip('live entity test uses synthetic IDs from fixture — set BLUEFIN_PAYCONEX_TEST_DYNAMIC_DESCRIPTOR_ENTID JSON to run live')
      return
    }
    const client = setup.client
    const struct = setup.struct

    const isempty = struct.isempty
    const select = struct.select


    // CREATE
    const dynamic_descriptor_ref01_ent = client.DynamicDescriptor()
    let dynamic_descriptor_ref01_data = setup.data.new.dynamic_descriptor['dynamic_descriptor_ref01']
    dynamic_descriptor_ref01_data['account_id'] = setup.idmap['account01']

    dynamic_descriptor_ref01_data = await dynamic_descriptor_ref01_ent.create(dynamic_descriptor_ref01_data)
    assert(null != dynamic_descriptor_ref01_data.id)


    // LIST
    const dynamic_descriptor_ref01_match: any = {}
    dynamic_descriptor_ref01_match['account_id'] = setup.idmap['account01']

    const dynamic_descriptor_ref01_list = await dynamic_descriptor_ref01_ent.list(dynamic_descriptor_ref01_match)

    assert(!isempty(select(dynamic_descriptor_ref01_list, { id: dynamic_descriptor_ref01_data.id })))


    // UPDATE
    const dynamic_descriptor_ref01_data_up0: any = {}
    dynamic_descriptor_ref01_data_up0.id = dynamic_descriptor_ref01_data.id
    dynamic_descriptor_ref01_data_up0 ['account_id'] = setup.idmap['account_id']

    const dynamic_descriptor_ref01_markdef_up0 = { name: 'city', value: 'Mark01-dynamic_descriptor_ref01_' + setup.now }
    ;(dynamic_descriptor_ref01_data_up0 as any)[dynamic_descriptor_ref01_markdef_up0.name] = dynamic_descriptor_ref01_markdef_up0.value

    const dynamic_descriptor_ref01_resdata_up0 = await dynamic_descriptor_ref01_ent.update(dynamic_descriptor_ref01_data_up0)
    assert(dynamic_descriptor_ref01_resdata_up0.id === dynamic_descriptor_ref01_data_up0.id)

    assert((dynamic_descriptor_ref01_resdata_up0 as any)[dynamic_descriptor_ref01_markdef_up0.name] === dynamic_descriptor_ref01_markdef_up0.value)


    // LOAD
    const dynamic_descriptor_ref01_match_dt0: any = {}
    dynamic_descriptor_ref01_match_dt0.id = dynamic_descriptor_ref01_data.id
    const dynamic_descriptor_ref01_data_dt0 = await dynamic_descriptor_ref01_ent.load(dynamic_descriptor_ref01_match_dt0)
    assert(dynamic_descriptor_ref01_data_dt0.id === dynamic_descriptor_ref01_data.id)


    // REMOVE
    const dynamic_descriptor_ref01_match_rm0: any = { id: dynamic_descriptor_ref01_data.id }
    await dynamic_descriptor_ref01_ent.remove(dynamic_descriptor_ref01_match_rm0)
  

    // LIST
    const dynamic_descriptor_ref01_match_rt0: any = {}
    dynamic_descriptor_ref01_match_rt0['account_id'] = setup.idmap['account01']

    const dynamic_descriptor_ref01_list_rt0 = await dynamic_descriptor_ref01_ent.list(dynamic_descriptor_ref01_match_rt0)

    assert(isempty(select(dynamic_descriptor_ref01_list_rt0, { id: dynamic_descriptor_ref01_data.id })))


  })
})



function basicSetup(extra?: any) {
  // TODO: fix test def options
  const options: any = {} // null

  // TODO: needs test utility to resolve path
  const entityDataFile =
    Path.resolve(__dirname, 
      '../../../../.sdk/test/entity/dynamic_descriptor/DynamicDescriptorTestData.json')

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
    ['dynamic_descriptor01','dynamic_descriptor02','dynamic_descriptor03','account01','account02','account03'],
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
  const idmapEnvVal = process.env['BLUEFIN_PAYCONEX_TEST_DYNAMIC_DESCRIPTOR_ENTID']
  const idmapOverridden = null != idmapEnvVal && idmapEnvVal.trim().startsWith('{')

  const env = envOverride({
    'BLUEFIN_PAYCONEX_TEST_DYNAMIC_DESCRIPTOR_ENTID': idmap,
    'BLUEFIN_PAYCONEX_TEST_LIVE': 'FALSE',
    'BLUEFIN_PAYCONEX_TEST_EXPLAIN': 'FALSE',
    'BLUEFIN_PAYCONEX_APIKEY': 'NONE',
  })

  idmap = env['BLUEFIN_PAYCONEX_TEST_DYNAMIC_DESCRIPTOR_ENTID']

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
  
