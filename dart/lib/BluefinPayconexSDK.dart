// BluefinPayconex Dart SDK

import 'entity/AccountUpdaterEntity.dart';
import 'entity/AccountUpdaterScheduleEntity.dart';
import 'entity/AccountUpdaterScheduleWithResultEntity.dart';
import 'entity/AccountUpdaterSubscriptionWithResultEntity.dart';
import 'entity/AccountUpdaterUpdateEntity.dart';
import 'entity/ApiKeyEntity.dart';
import 'entity/ApplePayMerchantDetailEntity.dart';
import 'entity/ApplePaySessionEntity.dart';
import 'entity/DynamicDescriptorEntity.dart';
import 'entity/IFrameCreateInstanceEntity.dart';
import 'entity/IFrameInstanceEntity.dart';
import 'entity/IframeEntity.dart';
import 'entity/InitEntity.dart';
import 'entity/ListApiKeyScopesEntryEntity.dart';
import 'entity/PaymentIframeEntity.dart';
import 'entity/ThreeDSecureAuthEntity.dart';
import 'entity/ThreeDSecureBrowserInitEntity.dart';
import 'entity/ThreeDSecureStatusEntity.dart';
import 'entity/TransactionDetailEntity.dart';
import 'entity/WebhookEntity.dart';


export 'BluefinPayconexTypes.dart';
export 'entity/AccountUpdaterEntity.dart';
export 'entity/AccountUpdaterScheduleEntity.dart';
export 'entity/AccountUpdaterScheduleWithResultEntity.dart';
export 'entity/AccountUpdaterSubscriptionWithResultEntity.dart';
export 'entity/AccountUpdaterUpdateEntity.dart';
export 'entity/ApiKeyEntity.dart';
export 'entity/ApplePayMerchantDetailEntity.dart';
export 'entity/ApplePaySessionEntity.dart';
export 'entity/DynamicDescriptorEntity.dart';
export 'entity/IFrameCreateInstanceEntity.dart';
export 'entity/IFrameInstanceEntity.dart';
export 'entity/IframeEntity.dart';
export 'entity/InitEntity.dart';
export 'entity/ListApiKeyScopesEntryEntity.dart';
export 'entity/PaymentIframeEntity.dart';
export 'entity/ThreeDSecureAuthEntity.dart';
export 'entity/ThreeDSecureBrowserInitEntity.dart';
export 'entity/ThreeDSecureStatusEntity.dart';
export 'entity/TransactionDetailEntity.dart';
export 'entity/WebhookEntity.dart';


// ignore_for_file: non_constant_identifier_names

import 'dart:async';

import 'Config.dart';
import 'Spec.dart';
// BluefinPayconexEntityBase / BluefinPayconexError / BaseFeature are re-exported below;
// a Dart `export` needs no matching `import`, so importing them here too is an
// unused_import. Keep only the imports actually referenced in this file.
import 'utility/ErrUtility.dart';
import 'utility/Utility.dart';

export 'Config.dart' show Config, config;
export 'BluefinPayconexEntityBase.dart' show BluefinPayconexEntityBase;
export 'BluefinPayconexError.dart' show BluefinPayconexError;
export 'feature/base/BaseFeature.dart' show BaseFeature;
export 'utility/Utility.dart' show Utility;

final Utility stdutil = Utility();

class BluefinPayconexSDK {
  String mode = 'live';
  dynamic _options;
  final Utility _utility = Utility();
  List<dynamic> features = [];
  dynamic rootctx;

  // Feature activity tracking store (retry attempts, cache hits, spans, ...).
  final Map<String, dynamic> track = {};

  BluefinPayconexSDK([dynamic options]) {
    rootctx = _utility.makeContext({
      'client': this,
      'utility': _utility,
      'config': config.toMap(),
      'options': options,
      'shared': {},
    });

    _options = _utility.makeOptions(rootctx);

    final struct = _utility.struct;

    if (true == struct.getpath(_options, 'feature.test.active')) {
      mode = 'test';
    }

    rootctx.options = _options;

    features = [];

    final featureAdd = _utility.featureAdd;
    final featureInit = _utility.featureInit;

    // Add features in the resolved order (makeOptions puts an explicit List
    // order first, else defaults to test-first). Ordering matters: the
    // `test` feature installs the base mock transport and the transport
    // features (retry/cache/netsim/proxy/ratelimit) wrap whatever is current,
    // so `test` must be added before them to sit at the base of the chain.
    final featureorder =
        struct.getpath(_options, '__derived__.featureorder') ?? [];
    for (final fname in featureorder) {
      final fopts = _options['feature'][fname];
      if (fopts is Map && true == fopts['active']) {
        featureAdd(rootctx, config.makeFeature(fname.toString()));
      }
    }

    if (null != _options['extend']) {
      for (final f in _options['extend']) {
        featureAdd(rootctx, f);
      }
    }

    for (final f in features) {
      featureInit(rootctx, f);
    }

    final featureHook = _utility.featureHook;
    featureHook(rootctx, 'PostConstruct');
  }

  dynamic options() {
    return _utility.struct.clone(_options);
  }

  Utility utility() {
    return _utility;
  }

  Future<dynamic> prepare([dynamic fetchargs]) async {
    final utility = _utility;

    final makeContext = utility.makeContext;
    final makeFetchDef = utility.makeFetchDef;
    final prepareHeaders = utility.prepareHeaders;
    final prepareAuth = utility.prepareAuth;

    fetchargs = fetchargs ?? {};

    final ctx = makeContext({
      'opname': 'prepare',
      'ctrl': fetchargs['ctrl'] ?? {},
    }, rootctx);

    final options = _options;

    // Build spec directly from SDK options + user-provided fetch args.
    final spec = Spec({
      'base': options['base'],
      'prefix': options['prefix'],
      'suffix': options['suffix'],
      'path': fetchargs['path'] ?? '',
      'method': fetchargs['method'] ?? 'GET',
      'params': fetchargs['params'] ?? {},
      'query': fetchargs['query'] ?? {},
      'body': fetchargs['body'],
      'step': 'start',
    });

    ctx.spec = spec;

    spec.headers = prepareHeaders(ctx);

    // Merge user-provided headers over SDK defaults.
    if (fetchargs['headers'] is Map) {
      (fetchargs['headers'] as Map).forEach((key, val) {
        spec.headers[key] = val;
      });
    }

    // Apply SDK auth (apikey, auth prefix, etc.)
    final authResult = prepareAuth(ctx);
    if (iserr(authResult)) {
      return authResult;
    }

    return makeFetchDef(ctx);
  }

  Future<dynamic> direct([dynamic fetchargs]) async {
    final utility = _utility;
    final fetcher = utility.fetcher;
    final makeContext = utility.makeContext;

    final fetchdef = await prepare(fetchargs);
    if (iserr(fetchdef)) {
      return fetchdef;
    }

    final ctx = makeContext({
      'opname': 'direct',
      'ctrl': (fetchargs ?? {})['ctrl'] ?? {},
    }, rootctx);

    try {
      final dynamic fetched =
          await Future.value(fetcher(ctx, fetchdef['url'], fetchdef));

      if (null == fetched) {
        return {
          'ok': false,
          'err': ctx.error('direct_no_response', 'response: undefined')
        };
      } else if (iserr(fetched)) {
        return {'ok': false, 'err': fetched};
      }

      final status = fetched['status'];

      // No body responses (204 No Content, 304 Not Modified) and explicit
      // zero content-length must skip JSON parsing.
      final headers = fetched['headers'];
      final contentLength =
          headers is Map ? headers['content-length'] : null;
      final noBody = 204 == status ||
          304 == status ||
          '0' == (null == contentLength ? null : contentLength.toString());

      dynamic json;
      if (!noBody) {
        try {
          final jsonFn = fetched['json'];
          json = jsonFn is Function
              ? await Future.value(jsonFn())
              : fetched['json'];
        } catch (_parseErr) {
          // Body wasn't valid JSON — surface the raw response rather than
          // throwing. data stays null; callers can inspect status/headers.
          json = null;
        }
      }

      return {
        'ok': status is num && status >= 200 && status < 300,
        'status': status,
        'headers': fetched['headers'],
        'data': json,
      };
    } catch (err) {
      return {'ok': false, 'err': err};
    }
  }


  // Entity access: `client.AccountUpdater().list()` / `client.AccountUpdater().load({'id': ...})`.
  AccountUpdaterEntity AccountUpdater([dynamic entopts]) {
    return AccountUpdaterEntity(this, entopts);
  }


  // Entity access: `client.AccountUpdaterSchedule().list()` / `client.AccountUpdaterSchedule().load({'id': ...})`.
  AccountUpdaterScheduleEntity AccountUpdaterSchedule([dynamic entopts]) {
    return AccountUpdaterScheduleEntity(this, entopts);
  }


  // Entity access: `client.AccountUpdaterScheduleWithResult().list()` / `client.AccountUpdaterScheduleWithResult().load({'id': ...})`.
  AccountUpdaterScheduleWithResultEntity AccountUpdaterScheduleWithResult([dynamic entopts]) {
    return AccountUpdaterScheduleWithResultEntity(this, entopts);
  }


  // Entity access: `client.AccountUpdaterSubscriptionWithResult().list()` / `client.AccountUpdaterSubscriptionWithResult().load({'id': ...})`.
  AccountUpdaterSubscriptionWithResultEntity AccountUpdaterSubscriptionWithResult([dynamic entopts]) {
    return AccountUpdaterSubscriptionWithResultEntity(this, entopts);
  }


  // Entity access: `client.AccountUpdaterUpdate().list()` / `client.AccountUpdaterUpdate().load({'id': ...})`.
  AccountUpdaterUpdateEntity AccountUpdaterUpdate([dynamic entopts]) {
    return AccountUpdaterUpdateEntity(this, entopts);
  }


  // Entity access: `client.ApiKey().list()` / `client.ApiKey().load({'id': ...})`.
  ApiKeyEntity ApiKey([dynamic entopts]) {
    return ApiKeyEntity(this, entopts);
  }


  // Entity access: `client.ApplePayMerchantDetail().list()` / `client.ApplePayMerchantDetail().load({'id': ...})`.
  ApplePayMerchantDetailEntity ApplePayMerchantDetail([dynamic entopts]) {
    return ApplePayMerchantDetailEntity(this, entopts);
  }


  // Entity access: `client.ApplePaySession().list()` / `client.ApplePaySession().load({'id': ...})`.
  ApplePaySessionEntity ApplePaySession([dynamic entopts]) {
    return ApplePaySessionEntity(this, entopts);
  }


  // Entity access: `client.DynamicDescriptor().list()` / `client.DynamicDescriptor().load({'id': ...})`.
  DynamicDescriptorEntity DynamicDescriptor([dynamic entopts]) {
    return DynamicDescriptorEntity(this, entopts);
  }


  // Entity access: `client.IFrameCreateInstance().list()` / `client.IFrameCreateInstance().load({'id': ...})`.
  IFrameCreateInstanceEntity IFrameCreateInstance([dynamic entopts]) {
    return IFrameCreateInstanceEntity(this, entopts);
  }


  // Entity access: `client.IFrameInstance().list()` / `client.IFrameInstance().load({'id': ...})`.
  IFrameInstanceEntity IFrameInstance([dynamic entopts]) {
    return IFrameInstanceEntity(this, entopts);
  }


  // Entity access: `client.Iframe().list()` / `client.Iframe().load({'id': ...})`.
  IframeEntity Iframe([dynamic entopts]) {
    return IframeEntity(this, entopts);
  }


  // Entity access: `client.Init().list()` / `client.Init().load({'id': ...})`.
  InitEntity Init([dynamic entopts]) {
    return InitEntity(this, entopts);
  }


  // Entity access: `client.ListApiKeyScopesEntry().list()` / `client.ListApiKeyScopesEntry().load({'id': ...})`.
  ListApiKeyScopesEntryEntity ListApiKeyScopesEntry([dynamic entopts]) {
    return ListApiKeyScopesEntryEntity(this, entopts);
  }


  // Entity access: `client.PaymentIframe().list()` / `client.PaymentIframe().load({'id': ...})`.
  PaymentIframeEntity PaymentIframe([dynamic entopts]) {
    return PaymentIframeEntity(this, entopts);
  }


  // Entity access: `client.ThreeDSecureAuth().list()` / `client.ThreeDSecureAuth().load({'id': ...})`.
  ThreeDSecureAuthEntity ThreeDSecureAuth([dynamic entopts]) {
    return ThreeDSecureAuthEntity(this, entopts);
  }


  // Entity access: `client.ThreeDSecureBrowserInit().list()` / `client.ThreeDSecureBrowserInit().load({'id': ...})`.
  ThreeDSecureBrowserInitEntity ThreeDSecureBrowserInit([dynamic entopts]) {
    return ThreeDSecureBrowserInitEntity(this, entopts);
  }


  // Entity access: `client.ThreeDSecureStatus().list()` / `client.ThreeDSecureStatus().load({'id': ...})`.
  ThreeDSecureStatusEntity ThreeDSecureStatus([dynamic entopts]) {
    return ThreeDSecureStatusEntity(this, entopts);
  }


  // Entity access: `client.TransactionDetail().list()` / `client.TransactionDetail().load({'id': ...})`.
  TransactionDetailEntity TransactionDetail([dynamic entopts]) {
    return TransactionDetailEntity(this, entopts);
  }


  // Entity access: `client.Webhook().list()` / `client.Webhook().load({'id': ...})`.
  WebhookEntity Webhook([dynamic entopts]) {
    return WebhookEntity(this, entopts);
  }



  static BluefinPayconexSDK test([dynamic testoptsarg, dynamic sdkoptsarg]) {
    final struct = stdutil.struct;
    final setpath = struct.setpath;
    final getdef = struct.getdef;
    final clone = struct.clone;
    final setprop = struct.setprop;

    final sdkopts = getdef(clone(sdkoptsarg), {});
    final testopts = getdef(clone(testoptsarg), {});
    setprop(testopts, 'active', true);
    setpath(sdkopts, 'feature.test', testopts);

    final testsdk = BluefinPayconexSDK(sdkopts);
    testsdk.mode = 'test';

    return testsdk;
  }

  BluefinPayconexSDK tester([dynamic testopts, dynamic sdkopts]) {
    return BluefinPayconexSDK.test(testopts, sdkopts);
  }

  Map<String, dynamic> toJSON() {
    return {'name': 'BluefinPayconex'};
  }

  @override
  String toString() {
    return 'BluefinPayconex ' + _utility.struct.jsonify(toJSON());
  }
}

typedef SDK = BluefinPayconexSDK;
