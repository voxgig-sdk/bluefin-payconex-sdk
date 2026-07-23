
const envlocal = __dirname + '/../../../.env.local'
require('dotenv').config({ quiet: true, path: [envlocal] })

const Path = require('node:path')
const Fs = require('node:fs')

const { test, describe } = require('node:test')
const assert = require('node:assert')


const { BluefinPayconexSDK, BaseFeature, stdutil, config } = require('../../..')

const {
  envOverride,
  makeCtrl,
  makeMatch,
  makeReqdata,
  makeStepData,
  makeValid,
} = require('../../utility')


describe('AccountUpdaterScheduleWithResultEntity', async () => {

  test('instance', async () => {
    const testsdk = BluefinPayconexSDK.test()
    const ent = testsdk.AccountUpdaterScheduleWithResult()
    assert(null != ent)
  })


  // Feature #4: the entity `stream(action, ...)` method runs the op pipeline
  // and returns an async iterator over result items. With the streaming
  // feature active it yields the feature's incremental output; otherwise it
  // falls back to the materialised list so `stream` always yields.
  test('stream', async () => {
    const seed = {
      entity: {
        account_updater_schedule_with_result: { s1: { id: 's1' }, s2: { id: 's2' }, s3: { id: 's3' } }
      }
    }

    // Fallback: streaming inactive -> yields the materialised list items.
    const base = BluefinPayconexSDK.test(seed)
    const seen = []
    for await (const item of base.AccountUpdaterScheduleWithResult().stream('list')) {
      seen.push(item)
    }
    assert.equal(seen.length, 3)

    // Inbound: streaming active -> yields each item from the feature iterator.
    if (config.feature && config.feature.streaming) {
      const sdk = BluefinPayconexSDK.test(seed, { feature: { streaming: { active: true } } })
      const got = []
      for await (const item of sdk.AccountUpdaterScheduleWithResult().stream('list')) {
        if (Array.isArray(item)) { got.push(...item) } else { got.push(item) }
      }
      assert.equal(got.length, 3)
    }
  })


  test('basic', async () => {

    const setup = basicSetup()
    const client = setup.client
    const struct = setup.struct

    const isempty = struct.isempty
    const select = struct.select


    // CREATE
    const account_updater_schedule_with_result_ref01_ent = client.AccountUpdaterScheduleWithResult()
    let account_updater_schedule_with_result_ref01_data = setup.data.new.account_updater_schedule_with_result['account_updater_schedule_with_result_ref01']
    account_updater_schedule_with_result_ref01_data['account_id'] = setup.idmap['account01']
    account_updater_schedule_with_result_ref01_data['schedule_id'] = setup.idmap['schedule01']

    account_updater_schedule_with_result_ref01_data = await account_updater_schedule_with_result_ref01_ent.create(account_updater_schedule_with_result_ref01_data)
    assert(null != account_updater_schedule_with_result_ref01_data.id)


    // LIST
    const account_updater_schedule_with_result_ref01_match = {}
    account_updater_schedule_with_result_ref01_match['account_id'] = setup.idmap['account01']
    account_updater_schedule_with_result_ref01_match['schedule_id'] = setup.idmap['schedule01']

    const account_updater_schedule_with_result_ref01_list = await account_updater_schedule_with_result_ref01_ent.list(account_updater_schedule_with_result_ref01_match)

    assert(!isempty(select(account_updater_schedule_with_result_ref01_list, { id: account_updater_schedule_with_result_ref01_data.id })))


  })
})



function basicSetup(extra) {
  // TODO: fix test def options
  const options = {} // null

  // TODO: needs test utility to resolve path
  const entityDataFile =
    Path.resolve(__dirname,
      '../../../../.sdk/test/entity/account_updater_schedule_with_result/AccountUpdaterScheduleWithResultTestData.json')

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
    ['account_updater_schedule_with_result01','account_updater_schedule_with_result02','account_updater_schedule_with_result03','account01','account02','account03','account01','account02','account03','schedule01','schedule02','schedule03'],
    {
      '`$PACK`': ['', {
        '`$KEY`': '`$COPY`',
        '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
      }]
    })

  const env = envOverride({
    'BLUEFIN_PAYCONEX_TEST_ACCOUNT_UPDATER_SCHEDULE_WITH_RESULT_ENTID': idmap,
    'BLUEFIN_PAYCONEX_TEST_LIVE': 'FALSE',
    'BLUEFIN_PAYCONEX_TEST_EXPLAIN': 'FALSE',
    'BLUEFIN_PAYCONEX_APIKEY': 'NONE',
  })

  idmap = env['BLUEFIN_PAYCONEX_TEST_ACCOUNT_UPDATER_SCHEDULE_WITH_RESULT_ENTID']

  if ('TRUE' === env.BLUEFIN_PAYCONEX_TEST_LIVE) {
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
    now: Date.now(),
  }

  return setup
}
  
