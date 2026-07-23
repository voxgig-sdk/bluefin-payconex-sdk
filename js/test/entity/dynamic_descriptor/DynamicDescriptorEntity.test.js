
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


describe('DynamicDescriptorEntity', async () => {

  test('instance', async () => {
    const testsdk = BluefinPayconexSDK.test()
    const ent = testsdk.DynamicDescriptor()
    assert(null != ent)
  })


  // Feature #4: the entity `stream(action, ...)` method runs the op pipeline
  // and returns an async iterator over result items. With the streaming
  // feature active it yields the feature's incremental output; otherwise it
  // falls back to the materialised list so `stream` always yields.
  test('stream', async () => {
    const seed = {
      entity: {
        dynamic_descriptor: { s1: { id: 's1' }, s2: { id: 's2' }, s3: { id: 's3' } }
      }
    }

    // Fallback: streaming inactive -> yields the materialised list items.
    const base = BluefinPayconexSDK.test(seed)
    const seen = []
    for await (const item of base.DynamicDescriptor().stream('list')) {
      seen.push(item)
    }
    assert.equal(seen.length, 3)

    // Inbound: streaming active -> yields each item from the feature iterator.
    if (config.feature && config.feature.streaming) {
      const sdk = BluefinPayconexSDK.test(seed, { feature: { streaming: { active: true } } })
      const got = []
      for await (const item of sdk.DynamicDescriptor().stream('list')) {
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
    const dynamic_descriptor_ref01_ent = client.DynamicDescriptor()
    let dynamic_descriptor_ref01_data = setup.data.new.dynamic_descriptor['dynamic_descriptor_ref01']
    dynamic_descriptor_ref01_data['account_id'] = setup.idmap['account01']

    dynamic_descriptor_ref01_data = await dynamic_descriptor_ref01_ent.create(dynamic_descriptor_ref01_data)
    assert(null != dynamic_descriptor_ref01_data.id)


    // LIST
    const dynamic_descriptor_ref01_match = {}
    dynamic_descriptor_ref01_match['account_id'] = setup.idmap['account01']

    const dynamic_descriptor_ref01_list = await dynamic_descriptor_ref01_ent.list(dynamic_descriptor_ref01_match)

    assert(!isempty(select(dynamic_descriptor_ref01_list, { id: dynamic_descriptor_ref01_data.id })))


    // UPDATE
    const dynamic_descriptor_ref01_data_up0 = {}
    dynamic_descriptor_ref01_data_up0.id = dynamic_descriptor_ref01_data.id
    dynamic_descriptor_ref01_data_up0 ['account_id'] = setup.idmap['account_id']

    const dynamic_descriptor_ref01_markdef_up0 = { name: 'city', value: 'Mark01-dynamic_descriptor_ref01_' + setup.now }
    dynamic_descriptor_ref01_data_up0 [dynamic_descriptor_ref01_markdef_up0.name] = dynamic_descriptor_ref01_markdef_up0.value

    const dynamic_descriptor_ref01_resdata_up0 = await dynamic_descriptor_ref01_ent.update(dynamic_descriptor_ref01_data_up0)
    assert(dynamic_descriptor_ref01_resdata_up0.id === dynamic_descriptor_ref01_data_up0.id)

    assert(dynamic_descriptor_ref01_resdata_up0[dynamic_descriptor_ref01_markdef_up0.name] === dynamic_descriptor_ref01_markdef_up0.value)


    // LOAD
    const dynamic_descriptor_ref01_match_dt0 = {}
    dynamic_descriptor_ref01_match_dt0.id = dynamic_descriptor_ref01_data.id
    const dynamic_descriptor_ref01_data_dt0 = await dynamic_descriptor_ref01_ent.load(dynamic_descriptor_ref01_match_dt0)
    assert(dynamic_descriptor_ref01_data_dt0.id === dynamic_descriptor_ref01_data.id)


    // REMOVE
    const dynamic_descriptor_ref01_match_rm0 = {}
    dynamic_descriptor_ref01_match_rm0.id = dynamic_descriptor_ref01_data.id
    await dynamic_descriptor_ref01_ent.remove(dynamic_descriptor_ref01_match_rm0)
  

    // LIST
    const dynamic_descriptor_ref01_match_rt0 = {}
    dynamic_descriptor_ref01_match_rt0['account_id'] = setup.idmap['account01']

    const dynamic_descriptor_ref01_list_rt0 = await dynamic_descriptor_ref01_ent.list(dynamic_descriptor_ref01_match_rt0)

    assert(isempty(select(dynamic_descriptor_ref01_list_rt0, { id: dynamic_descriptor_ref01_data.id })))


  })
})



function basicSetup(extra) {
  // TODO: fix test def options
  const options = {} // null

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

  const env = envOverride({
    'BLUEFIN_PAYCONEX_TEST_DYNAMIC_DESCRIPTOR_ENTID': idmap,
    'BLUEFIN_PAYCONEX_TEST_LIVE': 'FALSE',
    'BLUEFIN_PAYCONEX_TEST_EXPLAIN': 'FALSE',
    'BLUEFIN_PAYCONEX_APIKEY': 'NONE',
  })

  idmap = env['BLUEFIN_PAYCONEX_TEST_DYNAMIC_DESCRIPTOR_ENTID']

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
  
