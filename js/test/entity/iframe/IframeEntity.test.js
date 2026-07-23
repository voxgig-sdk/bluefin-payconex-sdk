
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


describe('IframeEntity', async () => {

  test('instance', async () => {
    const testsdk = BluefinPayconexSDK.test()
    const ent = testsdk.Iframe()
    assert(null != ent)
  })


  // Feature #4: the entity `stream(action, ...)` method runs the op pipeline
  // and returns an async iterator over result items. With the streaming
  // feature active it yields the feature's incremental output; otherwise it
  // falls back to the materialised list so `stream` always yields.
  test('stream', async () => {
    const seed = {
      entity: {
        iframe: { s1: { id: 's1' }, s2: { id: 's2' }, s3: { id: 's3' } }
      }
    }

    // Fallback: streaming inactive -> yields the materialised list items.
    const base = BluefinPayconexSDK.test(seed)
    const seen = []
    for await (const item of base.Iframe().stream('list')) {
      seen.push(item)
    }
    assert.equal(seen.length, 3)

    // Inbound: streaming active -> yields each item from the feature iterator.
    if (config.feature && config.feature.streaming) {
      const sdk = BluefinPayconexSDK.test(seed, { feature: { streaming: { active: true } } })
      const got = []
      for await (const item of sdk.Iframe().stream('list')) {
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
    const iframe_ref01_ent = client.Iframe()
    let iframe_ref01_data = setup.data.new.iframe['iframe_ref01']
    iframe_ref01_data['account_id'] = setup.idmap['account01']

    iframe_ref01_data = await iframe_ref01_ent.create(iframe_ref01_data)
    assert(null != iframe_ref01_data.id)


    // LIST
    const iframe_ref01_match = {}
    iframe_ref01_match['account_id'] = setup.idmap['account01']

    const iframe_ref01_list = await iframe_ref01_ent.list(iframe_ref01_match)

    assert(!isempty(select(iframe_ref01_list, { id: iframe_ref01_data.id })))


    // UPDATE
    const iframe_ref01_data_up0 = {}
    iframe_ref01_data_up0.id = iframe_ref01_data.id
    iframe_ref01_data_up0 ['account_id'] = setup.idmap['account_id']

    const iframe_ref01_markdef_up0 = { name: 'currency', value: 'Mark01-iframe_ref01_' + setup.now }
    iframe_ref01_data_up0 [iframe_ref01_markdef_up0.name] = iframe_ref01_markdef_up0.value

    const iframe_ref01_resdata_up0 = await iframe_ref01_ent.update(iframe_ref01_data_up0)
    assert(iframe_ref01_resdata_up0.id === iframe_ref01_data_up0.id)

    assert(iframe_ref01_resdata_up0[iframe_ref01_markdef_up0.name] === iframe_ref01_markdef_up0.value)


    // LOAD
    const iframe_ref01_match_dt0 = {}
    iframe_ref01_match_dt0.id = iframe_ref01_data.id
    const iframe_ref01_data_dt0 = await iframe_ref01_ent.load(iframe_ref01_match_dt0)
    assert(iframe_ref01_data_dt0.id === iframe_ref01_data.id)


  })
})



function basicSetup(extra) {
  // TODO: fix test def options
  const options = {} // null

  // TODO: needs test utility to resolve path
  const entityDataFile =
    Path.resolve(__dirname,
      '../../../../.sdk/test/entity/iframe/IframeTestData.json')

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
    ['iframe01','iframe02','iframe03','account01','account02','account03','account01','account02','account03','payment_iframe01','payment_iframe02','payment_iframe03'],
    {
      '`$PACK`': ['', {
        '`$KEY`': '`$COPY`',
        '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
      }]
    })

  const env = envOverride({
    'BLUEFIN_PAYCONEX_TEST_IFRAME_ENTID': idmap,
    'BLUEFIN_PAYCONEX_TEST_LIVE': 'FALSE',
    'BLUEFIN_PAYCONEX_TEST_EXPLAIN': 'FALSE',
    'BLUEFIN_PAYCONEX_APIKEY': 'NONE',
  })

  idmap = env['BLUEFIN_PAYCONEX_TEST_IFRAME_ENTID']

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
  
