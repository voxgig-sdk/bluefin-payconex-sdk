
// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import '../utility/ErrUtility.dart';import '../BluefinPayconexEntityBase.dart';

// Typed models: see ../BluefinPayconexTypes.dart (Webhook and the per-op request/match types).
class WebhookEntity extends BluefinPayconexEntityBase {
  WebhookEntity(dynamic client, dynamic entopts) : super(client, entopts) {
    name = 'webhook';
    name_ = 'webhook';
    Name = 'Webhook';
  }

  WebhookEntity make() {
    return WebhookEntity(client, entopts());
  }


  /// Load a Webhook by match (see WebhookLoadMatch in
  /// BluefinPayconexTypes.dart). Returns the entity data map (Webhook).
  Future<dynamic> load([dynamic reqmatch, dynamic ctrl]) async {
    final utility = this.utility;

    final makeContext = utility.makeContext;
    final done = utility.done;
    final error = utility.makeError;
    final featureHook = utility.featureHook;
    final makePoint = utility.makePoint;
    final makeRequest = utility.makeRequest;
    final makeResponse = utility.makeResponse;
    final makeResult = utility.makeResult;
    final makeSpec = utility.makeSpec;

    dynamic fres;

    final ctx = makeContext({
      'opname': 'load',
      'ctrl': ctrl ?? {},
      'match': matchVal,
      'data': dataVal,
      'reqmatch': reqmatch ?? {},
    }, entctx);

    try {

      fres = featureHook(ctx, 'PrePoint');
      if (fres is Future) {
        await fres;
      }

      ctx.out['point'] = makePoint(ctx);
      if (iserr(ctx.out['point'])) {
        return error(ctx, ctx.out['point']);
      }


      fres = featureHook(ctx, 'PreSpec');
      if (fres is Future) {
        await fres;
      }

      ctx.out['spec'] = makeSpec(ctx);
      if (iserr(ctx.out['spec'])) {
        return error(ctx, ctx.out['spec']);
      }


      fres = featureHook(ctx, 'PreRequest');
      if (fres is Future) {
        await fres;
      }

      ctx.out['request'] = await makeRequest(ctx);
      if (iserr(ctx.out['request'])) {
        return error(ctx, ctx.out['request']);
      }


      fres = featureHook(ctx, 'PreResponse');
      if (fres is Future) {
        await fres;
      }

      ctx.out['response'] = await makeResponse(ctx);
      if (iserr(ctx.out['response'])) {
        return error(ctx, ctx.out['response']);
      }


      fres = featureHook(ctx, 'PreResult');
      if (fres is Future) {
        await fres;
      }

      ctx.out['result'] = makeResult(ctx);
      if (iserr(ctx.out['result'])) {
        return error(ctx, ctx.out['result']);
      }


      fres = featureHook(ctx, 'PreDone');
      if (fres is Future) {
        await fres;
      }

      if (null != ctx.result) {
        if (null != ctx.result.resmatch) {
          matchVal = ctx.result.resmatch;
        }

        if (null != ctx.result.resdata) {
          dataVal = ctx.result.resdata;
        }
      }

      return done(ctx);
    } catch (err) {

      fres = featureHook(ctx, 'PreUnexpected');
      if (fres is Future) {
        await fres;
      }

      final uerr = unexpected(ctx, err);

      if (null != uerr) {
        throw uerr;
      } else {
        // Off-happy-path (throw disabled).
        return null;
      }
    }
  }



  /// List Webhook entities by match (see WebhookListMatch in
  /// BluefinPayconexTypes.dart). Returns a list of Webhook entity instances.
  Future<dynamic> list([dynamic reqmatch, dynamic ctrl]) async {
    final utility = this.utility;

    final makeContext = utility.makeContext;
    final done = utility.done;
    final error = utility.makeError;
    final featureHook = utility.featureHook;
    final makePoint = utility.makePoint;
    final makeRequest = utility.makeRequest;
    final makeResponse = utility.makeResponse;
    final makeResult = utility.makeResult;
    final makeSpec = utility.makeSpec;

    dynamic fres;

    final ctx = makeContext({
      'opname': 'list',
      'ctrl': ctrl ?? {},
      'match': matchVal,
      'data': dataVal,
      'reqmatch': reqmatch ?? {},
    }, entctx);

    try {

      fres = featureHook(ctx, 'PrePoint');
      if (fres is Future) {
        await fres;
      }

      ctx.out['point'] = makePoint(ctx);
      if (iserr(ctx.out['point'])) {
        return error(ctx, ctx.out['point']);
      }


      fres = featureHook(ctx, 'PreSpec');
      if (fres is Future) {
        await fres;
      }

      ctx.out['spec'] = makeSpec(ctx);
      if (iserr(ctx.out['spec'])) {
        return error(ctx, ctx.out['spec']);
      }


      fres = featureHook(ctx, 'PreRequest');
      if (fres is Future) {
        await fres;
      }

      ctx.out['request'] = await makeRequest(ctx);
      if (iserr(ctx.out['request'])) {
        return error(ctx, ctx.out['request']);
      }


      fres = featureHook(ctx, 'PreResponse');
      if (fres is Future) {
        await fres;
      }

      ctx.out['response'] = await makeResponse(ctx);
      if (iserr(ctx.out['response'])) {
        return error(ctx, ctx.out['response']);
      }


      fres = featureHook(ctx, 'PreResult');
      if (fres is Future) {
        await fres;
      }

      ctx.out['result'] = makeResult(ctx);
      if (iserr(ctx.out['result'])) {
        return error(ctx, ctx.out['result']);
      }


      fres = featureHook(ctx, 'PreDone');
      if (fres is Future) {
        await fres;
      }

      if (null != ctx.result) {
        if (null != ctx.result.resmatch) {
          matchVal = ctx.result.resmatch;
        }
      }

      return done(ctx);
    } catch (err) {

      fres = featureHook(ctx, 'PreUnexpected');
      if (fres is Future) {
        await fres;
      }

      final uerr = unexpected(ctx, err);

      if (null != uerr) {
        throw uerr;
      } else {
        // Off-happy-path (throw disabled).
        return null;
      }
    }
  }



  /// Create a Webhook (see WebhookCreateData in
  /// BluefinPayconexTypes.dart). Returns the entity data map (Webhook).
  Future<dynamic> create([dynamic reqdata, dynamic ctrl]) async {
    final utility = this.utility;

    final makeContext = utility.makeContext;
    final done = utility.done;
    final error = utility.makeError;
    final featureHook = utility.featureHook;
    final makePoint = utility.makePoint;
    final makeRequest = utility.makeRequest;
    final makeResponse = utility.makeResponse;
    final makeResult = utility.makeResult;
    final makeSpec = utility.makeSpec;

    dynamic fres;

    final ctx = makeContext({
      'opname': 'create',
      'ctrl': ctrl ?? {},
      'match': matchVal,
      'data': dataVal,
      'reqdata': reqdata ?? {},
    }, entctx);

    try {

      fres = featureHook(ctx, 'PrePoint');
      if (fres is Future) {
        await fres;
      }

      ctx.out['point'] = makePoint(ctx);
      if (iserr(ctx.out['point'])) {
        return error(ctx, ctx.out['point']);
      }


      fres = featureHook(ctx, 'PreSpec');
      if (fres is Future) {
        await fres;
      }

      ctx.out['spec'] = makeSpec(ctx);
      if (iserr(ctx.out['spec'])) {
        return error(ctx, ctx.out['spec']);
      }


      fres = featureHook(ctx, 'PreRequest');
      if (fres is Future) {
        await fres;
      }

      ctx.out['request'] = await makeRequest(ctx);
      if (iserr(ctx.out['request'])) {
        return error(ctx, ctx.out['request']);
      }


      fres = featureHook(ctx, 'PreResponse');
      if (fres is Future) {
        await fres;
      }

      ctx.out['response'] = await makeResponse(ctx);
      if (iserr(ctx.out['response'])) {
        return error(ctx, ctx.out['response']);
      }


      fres = featureHook(ctx, 'PreResult');
      if (fres is Future) {
        await fres;
      }

      ctx.out['result'] = makeResult(ctx);
      if (iserr(ctx.out['result'])) {
        return error(ctx, ctx.out['result']);
      }


      fres = featureHook(ctx, 'PreDone');
      if (fres is Future) {
        await fres;
      }

      if (null != ctx.result) {
        if (null != ctx.result.resdata) {
          dataVal = ctx.result.resdata;
        }
      }

      return done(ctx);
    } catch (err) {

      fres = featureHook(ctx, 'PreUnexpected');
      if (fres is Future) {
        await fres;
      }

      final uerr = unexpected(ctx, err);

      if (null != uerr) {
        throw uerr;
      } else {
        // Off-happy-path (throw disabled).
        return null;
      }
    }
  }



  /// Update a Webhook (see WebhookUpdateData in
  /// BluefinPayconexTypes.dart). Returns the entity data map (Webhook).
  Future<dynamic> update([dynamic reqdata, dynamic ctrl]) async {
    final utility = this.utility;

    final makeContext = utility.makeContext;
    final done = utility.done;
    final error = utility.makeError;
    final featureHook = utility.featureHook;
    final makePoint = utility.makePoint;
    final makeRequest = utility.makeRequest;
    final makeResponse = utility.makeResponse;
    final makeResult = utility.makeResult;
    final makeSpec = utility.makeSpec;

    dynamic fres;

    final ctx = makeContext({
      'opname': 'update',
      'ctrl': ctrl ?? {},
      'match': matchVal,
      'data': dataVal,
      'reqdata': reqdata ?? {},
    }, entctx);

    try {

      fres = featureHook(ctx, 'PrePoint');
      if (fres is Future) {
        await fres;
      }

      ctx.out['point'] = makePoint(ctx);
      if (iserr(ctx.out['point'])) {
        return error(ctx, ctx.out['point']);
      }


      fres = featureHook(ctx, 'PreSpec');
      if (fres is Future) {
        await fres;
      }

      ctx.out['spec'] = makeSpec(ctx);
      if (iserr(ctx.out['spec'])) {
        return error(ctx, ctx.out['spec']);
      }


      fres = featureHook(ctx, 'PreRequest');
      if (fres is Future) {
        await fres;
      }

      ctx.out['request'] = await makeRequest(ctx);
      if (iserr(ctx.out['request'])) {
        return error(ctx, ctx.out['request']);
      }


      fres = featureHook(ctx, 'PreResponse');
      if (fres is Future) {
        await fres;
      }

      ctx.out['response'] = await makeResponse(ctx);
      if (iserr(ctx.out['response'])) {
        return error(ctx, ctx.out['response']);
      }


      fres = featureHook(ctx, 'PreResult');
      if (fres is Future) {
        await fres;
      }

      ctx.out['result'] = makeResult(ctx);
      if (iserr(ctx.out['result'])) {
        return error(ctx, ctx.out['result']);
      }


      fres = featureHook(ctx, 'PreDone');
      if (fres is Future) {
        await fres;
      }

      if (null != ctx.result) {
        if (null != ctx.result.resmatch) {
          matchVal = ctx.result.resmatch;
        }

        if (null != ctx.result.resdata) {
          dataVal = ctx.result.resdata;
        }
      }

      return done(ctx);
    } catch (err) {

      fres = featureHook(ctx, 'PreUnexpected');
      if (fres is Future) {
        await fres;
      }

      final uerr = unexpected(ctx, err);

      if (null != uerr) {
        throw uerr;
      } else {
        // Off-happy-path (throw disabled).
        return null;
      }
    }
  }



  /// Remove a Webhook by match (see WebhookRemoveMatch in
  /// BluefinPayconexTypes.dart). Returns the entity data map (Webhook).
  Future<dynamic> remove([dynamic reqmatch, dynamic ctrl]) async {
    final utility = this.utility;

    final makeContext = utility.makeContext;
    final done = utility.done;
    final error = utility.makeError;
    final featureHook = utility.featureHook;
    final makePoint = utility.makePoint;
    final makeRequest = utility.makeRequest;
    final makeResponse = utility.makeResponse;
    final makeResult = utility.makeResult;
    final makeSpec = utility.makeSpec;

    dynamic fres;

    final ctx = makeContext({
      'opname': 'remove',
      'ctrl': ctrl ?? {},
      'match': matchVal,
      'data': dataVal,
      'reqmatch': reqmatch ?? {},
    }, entctx);

    try {

      fres = featureHook(ctx, 'PrePoint');
      if (fres is Future) {
        await fres;
      }

      ctx.out['point'] = makePoint(ctx);
      if (iserr(ctx.out['point'])) {
        return error(ctx, ctx.out['point']);
      }


      fres = featureHook(ctx, 'PreSpec');
      if (fres is Future) {
        await fres;
      }

      ctx.out['spec'] = makeSpec(ctx);
      if (iserr(ctx.out['spec'])) {
        return error(ctx, ctx.out['spec']);
      }


      fres = featureHook(ctx, 'PreRequest');
      if (fres is Future) {
        await fres;
      }

      ctx.out['request'] = await makeRequest(ctx);
      if (iserr(ctx.out['request'])) {
        return error(ctx, ctx.out['request']);
      }


      fres = featureHook(ctx, 'PreResponse');
      if (fres is Future) {
        await fres;
      }

      ctx.out['response'] = await makeResponse(ctx);
      if (iserr(ctx.out['response'])) {
        return error(ctx, ctx.out['response']);
      }


      fres = featureHook(ctx, 'PreResult');
      if (fres is Future) {
        await fres;
      }

      ctx.out['result'] = makeResult(ctx);
      if (iserr(ctx.out['result'])) {
        return error(ctx, ctx.out['result']);
      }


      fres = featureHook(ctx, 'PreDone');
      if (fres is Future) {
        await fres;
      }

      if (null != ctx.result) {
        if (null != ctx.result.resmatch) {
          matchVal = ctx.result.resmatch;
        }

        if (null != ctx.result.resdata) {
          dataVal = ctx.result.resdata;
        }
      }

      return done(ctx);
    } catch (err) {

      fres = featureHook(ctx, 'PreUnexpected');
      if (fres is Future) {
        await fres;
      }

      final uerr = unexpected(ctx, err);

      if (null != uerr) {
        throw uerr;
      } else {
        // Off-happy-path (throw disabled).
        return null;
      }
    }
  }

}
