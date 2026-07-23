// Typed models for the BluefinPayconex SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels (source of truth: @voxgig/apidef VALID_CANON).
// Do not edit by hand.
//
// The operation pipeline passes plain maps; these classes are the typed,
// convertible view: `BluefinPayconex.fromMap(ent.data())` / `model.toMap()`.

class AccountUpdater {
  AccountUpdater();

  factory AccountUpdater.fromMap(Map<String, dynamic> m) => AccountUpdater();

  Map<String, dynamic> toMap() => <String, dynamic>{};
}

class AccountUpdaterRemoveMatch {
  /// STRING (required at the API)
  String? account_id;
  /// STRING
  String? record_id;
  /// STRING (required at the API)
  String? subscription_id;

  AccountUpdaterRemoveMatch({
    this.account_id,
    this.record_id,
    this.subscription_id,
  });

  factory AccountUpdaterRemoveMatch.fromMap(Map<String, dynamic> m) => AccountUpdaterRemoveMatch(
        account_id: m['account_id'] is String ? m['account_id'] : null,
        record_id: m['record_id'] is String ? m['record_id'] : null,
        subscription_id: m['subscription_id'] is String ? m['subscription_id'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != account_id) {
      m['account_id'] = account_id;
    }
    if (null != record_id) {
      m['record_id'] = record_id;
    }
    if (null != subscription_id) {
      m['subscription_id'] = subscription_id;
    }
    return m;
  }
}

class AccountUpdaterSchedule {
  /// BOOLEAN
  bool? enabled;
  /// STRING
  String? period_date;
  /// STRING (required at the API)
  String? period_id;
  /// STRING
  String? response_format;
  /// ARRAY (required at the API)
  List<dynamic>? token;

  AccountUpdaterSchedule({
    this.enabled,
    this.period_date,
    this.period_id,
    this.response_format,
    this.token,
  });

  factory AccountUpdaterSchedule.fromMap(Map<String, dynamic> m) => AccountUpdaterSchedule(
        enabled: m['enabled'] is bool ? m['enabled'] : null,
        period_date: m['period_date'] is String ? m['period_date'] : null,
        period_id: m['period_id'] is String ? m['period_id'] : null,
        response_format: m['response_format'] is String ? m['response_format'] : null,
        token: m['token'] is List<dynamic> ? m['token'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != enabled) {
      m['enabled'] = enabled;
    }
    if (null != period_date) {
      m['period_date'] = period_date;
    }
    if (null != period_id) {
      m['period_id'] = period_id;
    }
    if (null != response_format) {
      m['response_format'] = response_format;
    }
    if (null != token) {
      m['token'] = token;
    }
    return m;
  }
}

class AccountUpdaterScheduleCreateData {
  /// STRING (required at the API)
  String? account_id;

  AccountUpdaterScheduleCreateData({
    this.account_id,
  });

  factory AccountUpdaterScheduleCreateData.fromMap(Map<String, dynamic> m) => AccountUpdaterScheduleCreateData(
        account_id: m['account_id'] is String ? m['account_id'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != account_id) {
      m['account_id'] = account_id;
    }
    return m;
  }
}

class AccountUpdaterScheduleWithResult {
  /// ARRAY (required at the API)
  List<dynamic>? card;
  /// STRING (required at the API)
  String? created_at;
  /// BOOLEAN
  bool? enabled;
  /// STRING
  String? expiry;
  /// STRING (required at the API)
  String? id;
  /// OBJECT
  Map<String, dynamic>? most_recent_update;
  /// STRING
  String? period_date;
  /// STRING (required at the API)
  String? period_id;
  /// STRING
  String? response_format;
  /// ARRAY (required at the API)
  List<dynamic>? token;
  /// STRING (required at the API)
  String? type;
  /// STRING (required at the API)
  String? updated_at;

  AccountUpdaterScheduleWithResult({
    this.card,
    this.created_at,
    this.enabled,
    this.expiry,
    this.id,
    this.most_recent_update,
    this.period_date,
    this.period_id,
    this.response_format,
    this.token,
    this.type,
    this.updated_at,
  });

  factory AccountUpdaterScheduleWithResult.fromMap(Map<String, dynamic> m) => AccountUpdaterScheduleWithResult(
        card: m['card'] is List<dynamic> ? m['card'] : null,
        created_at: m['created_at'] is String ? m['created_at'] : null,
        enabled: m['enabled'] is bool ? m['enabled'] : null,
        expiry: m['expiry'] is String ? m['expiry'] : null,
        id: m['id'] is String ? m['id'] : null,
        most_recent_update: m['most_recent_update'] is Map<String, dynamic> ? m['most_recent_update'] : null,
        period_date: m['period_date'] is String ? m['period_date'] : null,
        period_id: m['period_id'] is String ? m['period_id'] : null,
        response_format: m['response_format'] is String ? m['response_format'] : null,
        token: m['token'] is List<dynamic> ? m['token'] : null,
        type: m['type'] is String ? m['type'] : null,
        updated_at: m['updated_at'] is String ? m['updated_at'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != card) {
      m['card'] = card;
    }
    if (null != created_at) {
      m['created_at'] = created_at;
    }
    if (null != enabled) {
      m['enabled'] = enabled;
    }
    if (null != expiry) {
      m['expiry'] = expiry;
    }
    if (null != id) {
      m['id'] = id;
    }
    if (null != most_recent_update) {
      m['most_recent_update'] = most_recent_update;
    }
    if (null != period_date) {
      m['period_date'] = period_date;
    }
    if (null != period_id) {
      m['period_id'] = period_id;
    }
    if (null != response_format) {
      m['response_format'] = response_format;
    }
    if (null != token) {
      m['token'] = token;
    }
    if (null != type) {
      m['type'] = type;
    }
    if (null != updated_at) {
      m['updated_at'] = updated_at;
    }
    return m;
  }
}

class AccountUpdaterScheduleWithResultListMatch {
  /// STRING (required at the API)
  String? account_id;
  /// STRING (required at the API)
  String? schedule_id;

  AccountUpdaterScheduleWithResultListMatch({
    this.account_id,
    this.schedule_id,
  });

  factory AccountUpdaterScheduleWithResultListMatch.fromMap(Map<String, dynamic> m) => AccountUpdaterScheduleWithResultListMatch(
        account_id: m['account_id'] is String ? m['account_id'] : null,
        schedule_id: m['schedule_id'] is String ? m['schedule_id'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != account_id) {
      m['account_id'] = account_id;
    }
    if (null != schedule_id) {
      m['schedule_id'] = schedule_id;
    }
    return m;
  }
}

class AccountUpdaterScheduleWithResultCreateData {
  /// STRING (required at the API)
  String? account_id;

  AccountUpdaterScheduleWithResultCreateData({
    this.account_id,
  });

  factory AccountUpdaterScheduleWithResultCreateData.fromMap(Map<String, dynamic> m) => AccountUpdaterScheduleWithResultCreateData(
        account_id: m['account_id'] is String ? m['account_id'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != account_id) {
      m['account_id'] = account_id;
    }
    return m;
  }
}

class AccountUpdaterSubscriptionWithResult {
  /// STRING
  String? created_at;
  /// BOOLEAN
  bool? enabled;
  /// STRING
  String? id;
  /// STRING
  String? period_date;
  /// STRING
  String? period_id;
  /// ARRAY
  List<dynamic>? record;
  /// STRING
  String? response_format;
  /// STRING
  String? template_ref;
  /// STRING
  String? updated_at;

  AccountUpdaterSubscriptionWithResult({
    this.created_at,
    this.enabled,
    this.id,
    this.period_date,
    this.period_id,
    this.record,
    this.response_format,
    this.template_ref,
    this.updated_at,
  });

  factory AccountUpdaterSubscriptionWithResult.fromMap(Map<String, dynamic> m) => AccountUpdaterSubscriptionWithResult(
        created_at: m['created_at'] is String ? m['created_at'] : null,
        enabled: m['enabled'] is bool ? m['enabled'] : null,
        id: m['id'] is String ? m['id'] : null,
        period_date: m['period_date'] is String ? m['period_date'] : null,
        period_id: m['period_id'] is String ? m['period_id'] : null,
        record: m['record'] is List<dynamic> ? m['record'] : null,
        response_format: m['response_format'] is String ? m['response_format'] : null,
        template_ref: m['template_ref'] is String ? m['template_ref'] : null,
        updated_at: m['updated_at'] is String ? m['updated_at'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != created_at) {
      m['created_at'] = created_at;
    }
    if (null != enabled) {
      m['enabled'] = enabled;
    }
    if (null != id) {
      m['id'] = id;
    }
    if (null != period_date) {
      m['period_date'] = period_date;
    }
    if (null != period_id) {
      m['period_id'] = period_id;
    }
    if (null != record) {
      m['record'] = record;
    }
    if (null != response_format) {
      m['response_format'] = response_format;
    }
    if (null != template_ref) {
      m['template_ref'] = template_ref;
    }
    if (null != updated_at) {
      m['updated_at'] = updated_at;
    }
    return m;
  }
}

class AccountUpdaterSubscriptionWithResultLoadMatch {
  /// STRING (required at the API)
  String? account_id;
  /// STRING (required at the API)
  String? subscription_id;

  AccountUpdaterSubscriptionWithResultLoadMatch({
    this.account_id,
    this.subscription_id,
  });

  factory AccountUpdaterSubscriptionWithResultLoadMatch.fromMap(Map<String, dynamic> m) => AccountUpdaterSubscriptionWithResultLoadMatch(
        account_id: m['account_id'] is String ? m['account_id'] : null,
        subscription_id: m['subscription_id'] is String ? m['subscription_id'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != account_id) {
      m['account_id'] = account_id;
    }
    if (null != subscription_id) {
      m['subscription_id'] = subscription_id;
    }
    return m;
  }
}

class AccountUpdaterSubscriptionWithResultCreateData {
  /// STRING (required at the API)
  String? account_id;
  /// STRING (required at the API)
  String? subscription_id;

  AccountUpdaterSubscriptionWithResultCreateData({
    this.account_id,
    this.subscription_id,
  });

  factory AccountUpdaterSubscriptionWithResultCreateData.fromMap(Map<String, dynamic> m) => AccountUpdaterSubscriptionWithResultCreateData(
        account_id: m['account_id'] is String ? m['account_id'] : null,
        subscription_id: m['subscription_id'] is String ? m['subscription_id'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != account_id) {
      m['account_id'] = account_id;
    }
    if (null != subscription_id) {
      m['subscription_id'] = subscription_id;
    }
    return m;
  }
}

class AccountUpdaterSubscriptionWithResultUpdateData {
  /// STRING (required at the API)
  String? account_id;
  /// STRING (required at the API)
  String? subscription_id;

  AccountUpdaterSubscriptionWithResultUpdateData({
    this.account_id,
    this.subscription_id,
  });

  factory AccountUpdaterSubscriptionWithResultUpdateData.fromMap(Map<String, dynamic> m) => AccountUpdaterSubscriptionWithResultUpdateData(
        account_id: m['account_id'] is String ? m['account_id'] : null,
        subscription_id: m['subscription_id'] is String ? m['subscription_id'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != account_id) {
      m['account_id'] = account_id;
    }
    if (null != subscription_id) {
      m['subscription_id'] = subscription_id;
    }
    return m;
  }
}

class AccountUpdaterUpdate {
  /// STRING
  String? account_updater_schedule_record_id;
  /// STRING
  String? format;
  /// STRING
  String? id;
  /// STRING
  String? new_expiry;
  /// STRING
  String? new_token;
  /// STRING
  String? old_expiry;
  /// STRING
  String? old_token;
  /// ARRAY
  List<dynamic>? recurring_schedule;
  /// STRING
  String? status;
  /// STRING
  String? update_id;
  /// STRING
  String? updated_at;

  AccountUpdaterUpdate({
    this.account_updater_schedule_record_id,
    this.format,
    this.id,
    this.new_expiry,
    this.new_token,
    this.old_expiry,
    this.old_token,
    this.recurring_schedule,
    this.status,
    this.update_id,
    this.updated_at,
  });

  factory AccountUpdaterUpdate.fromMap(Map<String, dynamic> m) => AccountUpdaterUpdate(
        account_updater_schedule_record_id: m['account_updater_schedule_record_id'] is String ? m['account_updater_schedule_record_id'] : null,
        format: m['format'] is String ? m['format'] : null,
        id: m['id'] is String ? m['id'] : null,
        new_expiry: m['new_expiry'] is String ? m['new_expiry'] : null,
        new_token: m['new_token'] is String ? m['new_token'] : null,
        old_expiry: m['old_expiry'] is String ? m['old_expiry'] : null,
        old_token: m['old_token'] is String ? m['old_token'] : null,
        recurring_schedule: m['recurring_schedule'] is List<dynamic> ? m['recurring_schedule'] : null,
        status: m['status'] is String ? m['status'] : null,
        update_id: m['update_id'] is String ? m['update_id'] : null,
        updated_at: m['updated_at'] is String ? m['updated_at'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != account_updater_schedule_record_id) {
      m['account_updater_schedule_record_id'] = account_updater_schedule_record_id;
    }
    if (null != format) {
      m['format'] = format;
    }
    if (null != id) {
      m['id'] = id;
    }
    if (null != new_expiry) {
      m['new_expiry'] = new_expiry;
    }
    if (null != new_token) {
      m['new_token'] = new_token;
    }
    if (null != old_expiry) {
      m['old_expiry'] = old_expiry;
    }
    if (null != old_token) {
      m['old_token'] = old_token;
    }
    if (null != recurring_schedule) {
      m['recurring_schedule'] = recurring_schedule;
    }
    if (null != status) {
      m['status'] = status;
    }
    if (null != update_id) {
      m['update_id'] = update_id;
    }
    if (null != updated_at) {
      m['updated_at'] = updated_at;
    }
    return m;
  }
}

class AccountUpdaterUpdateLoadMatch {
  /// STRING (required at the API)
  String? account_id;
  /// STRING (required at the API)
  String? id;

  AccountUpdaterUpdateLoadMatch({
    this.account_id,
    this.id,
  });

  factory AccountUpdaterUpdateLoadMatch.fromMap(Map<String, dynamic> m) => AccountUpdaterUpdateLoadMatch(
        account_id: m['account_id'] is String ? m['account_id'] : null,
        id: m['id'] is String ? m['id'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != account_id) {
      m['account_id'] = account_id;
    }
    if (null != id) {
      m['id'] = id;
    }
    return m;
  }
}

class ApiKey {
  /// ARRAY
  List<dynamic>? account;
  /// BOOLEAN
  bool? enabled;
  /// STRING
  String? expires_at;
  /// STRING
  String? expires_in;
  /// STRING
  String? id;
  /// STRING
  String? label;
  /// ARRAY
  List<dynamic>? method;
  /// ARRAY
  List<dynamic>? scope;
  /// STRING
  String? secret;

  ApiKey({
    this.account,
    this.enabled,
    this.expires_at,
    this.expires_in,
    this.id,
    this.label,
    this.method,
    this.scope,
    this.secret,
  });

  factory ApiKey.fromMap(Map<String, dynamic> m) => ApiKey(
        account: m['account'] is List<dynamic> ? m['account'] : null,
        enabled: m['enabled'] is bool ? m['enabled'] : null,
        expires_at: m['expires_at'] is String ? m['expires_at'] : null,
        expires_in: m['expires_in'] is String ? m['expires_in'] : null,
        id: m['id'] is String ? m['id'] : null,
        label: m['label'] is String ? m['label'] : null,
        method: m['method'] is List<dynamic> ? m['method'] : null,
        scope: m['scope'] is List<dynamic> ? m['scope'] : null,
        secret: m['secret'] is String ? m['secret'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != account) {
      m['account'] = account;
    }
    if (null != enabled) {
      m['enabled'] = enabled;
    }
    if (null != expires_at) {
      m['expires_at'] = expires_at;
    }
    if (null != expires_in) {
      m['expires_in'] = expires_in;
    }
    if (null != id) {
      m['id'] = id;
    }
    if (null != label) {
      m['label'] = label;
    }
    if (null != method) {
      m['method'] = method;
    }
    if (null != scope) {
      m['scope'] = scope;
    }
    if (null != secret) {
      m['secret'] = secret;
    }
    return m;
  }
}

class ApiKeyLoadMatch {
  /// STRING (required at the API)
  String? account_id;
  /// STRING (required at the API)
  String? id;

  ApiKeyLoadMatch({
    this.account_id,
    this.id,
  });

  factory ApiKeyLoadMatch.fromMap(Map<String, dynamic> m) => ApiKeyLoadMatch(
        account_id: m['account_id'] is String ? m['account_id'] : null,
        id: m['id'] is String ? m['id'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != account_id) {
      m['account_id'] = account_id;
    }
    if (null != id) {
      m['id'] = id;
    }
    return m;
  }
}

class ApiKeyListMatch {
  /// STRING (required at the API)
  String? account_id;

  ApiKeyListMatch({
    this.account_id,
  });

  factory ApiKeyListMatch.fromMap(Map<String, dynamic> m) => ApiKeyListMatch(
        account_id: m['account_id'] is String ? m['account_id'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != account_id) {
      m['account_id'] = account_id;
    }
    return m;
  }
}

class ApiKeyCreateData {
  /// STRING (required at the API)
  String? account_id;

  ApiKeyCreateData({
    this.account_id,
  });

  factory ApiKeyCreateData.fromMap(Map<String, dynamic> m) => ApiKeyCreateData(
        account_id: m['account_id'] is String ? m['account_id'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != account_id) {
      m['account_id'] = account_id;
    }
    return m;
  }
}

class ApiKeyUpdateData {
  /// STRING (required at the API)
  String? account_id;
  /// STRING (required at the API)
  String? id;

  ApiKeyUpdateData({
    this.account_id,
    this.id,
  });

  factory ApiKeyUpdateData.fromMap(Map<String, dynamic> m) => ApiKeyUpdateData(
        account_id: m['account_id'] is String ? m['account_id'] : null,
        id: m['id'] is String ? m['id'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != account_id) {
      m['account_id'] = account_id;
    }
    if (null != id) {
      m['id'] = id;
    }
    return m;
  }
}

class ApiKeyRemoveMatch {
  /// STRING (required at the API)
  String? account_id;
  /// STRING (required at the API)
  String? id;

  ApiKeyRemoveMatch({
    this.account_id,
    this.id,
  });

  factory ApiKeyRemoveMatch.fromMap(Map<String, dynamic> m) => ApiKeyRemoveMatch(
        account_id: m['account_id'] is String ? m['account_id'] : null,
        id: m['id'] is String ? m['id'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != account_id) {
      m['account_id'] = account_id;
    }
    if (null != id) {
      m['id'] = id;
    }
    return m;
  }
}

class ApplePayMerchantDetail {
  /// ARRAY (required at the API)
  List<dynamic>? domain;
  /// STRING (required at the API)
  String? merchant_url;
  /// STRING
  String? partner_merchant_name;
  /// STRING (required at the API)
  String? payconex_account_id;

  ApplePayMerchantDetail({
    this.domain,
    this.merchant_url,
    this.partner_merchant_name,
    this.payconex_account_id,
  });

  factory ApplePayMerchantDetail.fromMap(Map<String, dynamic> m) => ApplePayMerchantDetail(
        domain: m['domain'] is List<dynamic> ? m['domain'] : null,
        merchant_url: m['merchant_url'] is String ? m['merchant_url'] : null,
        partner_merchant_name: m['partner_merchant_name'] is String ? m['partner_merchant_name'] : null,
        payconex_account_id: m['payconex_account_id'] is String ? m['payconex_account_id'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != domain) {
      m['domain'] = domain;
    }
    if (null != merchant_url) {
      m['merchant_url'] = merchant_url;
    }
    if (null != partner_merchant_name) {
      m['partner_merchant_name'] = partner_merchant_name;
    }
    if (null != payconex_account_id) {
      m['payconex_account_id'] = payconex_account_id;
    }
    return m;
  }
}

class ApplePayMerchantDetailListMatch {
  /// INTEGER (required at the API)
  int? account_id;

  ApplePayMerchantDetailListMatch({
    this.account_id,
  });

  factory ApplePayMerchantDetailListMatch.fromMap(Map<String, dynamic> m) => ApplePayMerchantDetailListMatch(
        account_id: m['account_id'] is int ? m['account_id'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != account_id) {
      m['account_id'] = account_id;
    }
    return m;
  }
}

class ApplePayMerchantDetailCreateData {
  /// INTEGER (required at the API)
  int? account_id;

  ApplePayMerchantDetailCreateData({
    this.account_id,
  });

  factory ApplePayMerchantDetailCreateData.fromMap(Map<String, dynamic> m) => ApplePayMerchantDetailCreateData(
        account_id: m['account_id'] is int ? m['account_id'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != account_id) {
      m['account_id'] = account_id;
    }
    return m;
  }
}

class ApplePaySession {
  /// STRING
  String? display_name;
  /// STRING
  String? domain_name;
  /// INTEGER
  int? epoch_timestamp;
  /// INTEGER
  int? expires_at;
  /// STRING
  String? merchant_identifier;
  /// STRING
  String? merchant_session_identifier;
  /// INTEGER
  int? nonce;
  /// STRING
  String? operational_analytics_identifier;
  /// STRING (required at the API)
  String? referrer;
  /// INTEGER
  int? retry;
  /// STRING
  String? signature;

  ApplePaySession({
    this.display_name,
    this.domain_name,
    this.epoch_timestamp,
    this.expires_at,
    this.merchant_identifier,
    this.merchant_session_identifier,
    this.nonce,
    this.operational_analytics_identifier,
    this.referrer,
    this.retry,
    this.signature,
  });

  factory ApplePaySession.fromMap(Map<String, dynamic> m) => ApplePaySession(
        display_name: m['display_name'] is String ? m['display_name'] : null,
        domain_name: m['domain_name'] is String ? m['domain_name'] : null,
        epoch_timestamp: m['epoch_timestamp'] is int ? m['epoch_timestamp'] : null,
        expires_at: m['expires_at'] is int ? m['expires_at'] : null,
        merchant_identifier: m['merchant_identifier'] is String ? m['merchant_identifier'] : null,
        merchant_session_identifier: m['merchant_session_identifier'] is String ? m['merchant_session_identifier'] : null,
        nonce: m['nonce'] is int ? m['nonce'] : null,
        operational_analytics_identifier: m['operational_analytics_identifier'] is String ? m['operational_analytics_identifier'] : null,
        referrer: m['referrer'] is String ? m['referrer'] : null,
        retry: m['retry'] is int ? m['retry'] : null,
        signature: m['signature'] is String ? m['signature'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != display_name) {
      m['display_name'] = display_name;
    }
    if (null != domain_name) {
      m['domain_name'] = domain_name;
    }
    if (null != epoch_timestamp) {
      m['epoch_timestamp'] = epoch_timestamp;
    }
    if (null != expires_at) {
      m['expires_at'] = expires_at;
    }
    if (null != merchant_identifier) {
      m['merchant_identifier'] = merchant_identifier;
    }
    if (null != merchant_session_identifier) {
      m['merchant_session_identifier'] = merchant_session_identifier;
    }
    if (null != nonce) {
      m['nonce'] = nonce;
    }
    if (null != operational_analytics_identifier) {
      m['operational_analytics_identifier'] = operational_analytics_identifier;
    }
    if (null != referrer) {
      m['referrer'] = referrer;
    }
    if (null != retry) {
      m['retry'] = retry;
    }
    if (null != signature) {
      m['signature'] = signature;
    }
    return m;
  }
}

class ApplePaySessionCreateData {
  /// INTEGER (required at the API)
  int? account_id;

  ApplePaySessionCreateData({
    this.account_id,
  });

  factory ApplePaySessionCreateData.fromMap(Map<String, dynamic> m) => ApplePaySessionCreateData(
        account_id: m['account_id'] is int ? m['account_id'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != account_id) {
      m['account_id'] = account_id;
    }
    return m;
  }
}

class DynamicDescriptor {
  /// STRING
  String? city;
  /// STRING
  String? descriptor;
  /// STRING
  String? id;
  /// STRING
  String? name;
  /// STRING
  String? state;

  DynamicDescriptor({
    this.city,
    this.descriptor,
    this.id,
    this.name,
    this.state,
  });

  factory DynamicDescriptor.fromMap(Map<String, dynamic> m) => DynamicDescriptor(
        city: m['city'] is String ? m['city'] : null,
        descriptor: m['descriptor'] is String ? m['descriptor'] : null,
        id: m['id'] is String ? m['id'] : null,
        name: m['name'] is String ? m['name'] : null,
        state: m['state'] is String ? m['state'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != city) {
      m['city'] = city;
    }
    if (null != descriptor) {
      m['descriptor'] = descriptor;
    }
    if (null != id) {
      m['id'] = id;
    }
    if (null != name) {
      m['name'] = name;
    }
    if (null != state) {
      m['state'] = state;
    }
    return m;
  }
}

class DynamicDescriptorLoadMatch {
  /// STRING (required at the API)
  String? account_id;
  /// STRING (required at the API)
  String? id;

  DynamicDescriptorLoadMatch({
    this.account_id,
    this.id,
  });

  factory DynamicDescriptorLoadMatch.fromMap(Map<String, dynamic> m) => DynamicDescriptorLoadMatch(
        account_id: m['account_id'] is String ? m['account_id'] : null,
        id: m['id'] is String ? m['id'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != account_id) {
      m['account_id'] = account_id;
    }
    if (null != id) {
      m['id'] = id;
    }
    return m;
  }
}

class DynamicDescriptorListMatch {
  /// STRING (required at the API)
  String? account_id;

  DynamicDescriptorListMatch({
    this.account_id,
  });

  factory DynamicDescriptorListMatch.fromMap(Map<String, dynamic> m) => DynamicDescriptorListMatch(
        account_id: m['account_id'] is String ? m['account_id'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != account_id) {
      m['account_id'] = account_id;
    }
    return m;
  }
}

class DynamicDescriptorCreateData {
  /// STRING (required at the API)
  String? account_id;

  DynamicDescriptorCreateData({
    this.account_id,
  });

  factory DynamicDescriptorCreateData.fromMap(Map<String, dynamic> m) => DynamicDescriptorCreateData(
        account_id: m['account_id'] is String ? m['account_id'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != account_id) {
      m['account_id'] = account_id;
    }
    return m;
  }
}

class DynamicDescriptorUpdateData {
  /// STRING (required at the API)
  String? account_id;
  /// STRING (required at the API)
  String? id;

  DynamicDescriptorUpdateData({
    this.account_id,
    this.id,
  });

  factory DynamicDescriptorUpdateData.fromMap(Map<String, dynamic> m) => DynamicDescriptorUpdateData(
        account_id: m['account_id'] is String ? m['account_id'] : null,
        id: m['id'] is String ? m['id'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != account_id) {
      m['account_id'] = account_id;
    }
    if (null != id) {
      m['id'] = id;
    }
    return m;
  }
}

class DynamicDescriptorRemoveMatch {
  /// STRING (required at the API)
  String? account_id;
  /// STRING (required at the API)
  String? id;

  DynamicDescriptorRemoveMatch({
    this.account_id,
    this.id,
  });

  factory DynamicDescriptorRemoveMatch.fromMap(Map<String, dynamic> m) => DynamicDescriptorRemoveMatch(
        account_id: m['account_id'] is String ? m['account_id'] : null,
        id: m['id'] is String ? m['id'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != account_id) {
      m['account_id'] = account_id;
    }
    if (null != id) {
      m['id'] = id;
    }
    return m;
  }
}

class IFrameCreateInstance {
  /// STRING
  String? amount;
  /// STRING
  String? currency;
  /// OBJECT
  Map<String, dynamic>? customer;
  /// BOOLEAN
  bool? initialize_transaction;
  /// STRING (required at the API)
  String? label;
  /// STRING
  String? language;
  /// STRING
  String? reference;
  /// NUMBER
  num? timeout;
  /// ARRAY
  List<dynamic>? token;

  IFrameCreateInstance({
    this.amount,
    this.currency,
    this.customer,
    this.initialize_transaction,
    this.label,
    this.language,
    this.reference,
    this.timeout,
    this.token,
  });

  factory IFrameCreateInstance.fromMap(Map<String, dynamic> m) => IFrameCreateInstance(
        amount: m['amount'] is String ? m['amount'] : null,
        currency: m['currency'] is String ? m['currency'] : null,
        customer: m['customer'] is Map<String, dynamic> ? m['customer'] : null,
        initialize_transaction: m['initialize_transaction'] is bool ? m['initialize_transaction'] : null,
        label: m['label'] is String ? m['label'] : null,
        language: m['language'] is String ? m['language'] : null,
        reference: m['reference'] is String ? m['reference'] : null,
        timeout: m['timeout'] is num ? m['timeout'] : null,
        token: m['token'] is List<dynamic> ? m['token'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != amount) {
      m['amount'] = amount;
    }
    if (null != currency) {
      m['currency'] = currency;
    }
    if (null != customer) {
      m['customer'] = customer;
    }
    if (null != initialize_transaction) {
      m['initialize_transaction'] = initialize_transaction;
    }
    if (null != label) {
      m['label'] = label;
    }
    if (null != language) {
      m['language'] = language;
    }
    if (null != reference) {
      m['reference'] = reference;
    }
    if (null != timeout) {
      m['timeout'] = timeout;
    }
    if (null != token) {
      m['token'] = token;
    }
    return m;
  }
}

class IFrameCreateInstanceCreateData {
  /// STRING (required at the API)
  String? account_id;
  /// STRING (required at the API)
  String? payment_iframe_id;

  IFrameCreateInstanceCreateData({
    this.account_id,
    this.payment_iframe_id,
  });

  factory IFrameCreateInstanceCreateData.fromMap(Map<String, dynamic> m) => IFrameCreateInstanceCreateData(
        account_id: m['account_id'] is String ? m['account_id'] : null,
        payment_iframe_id: m['payment_iframe_id'] is String ? m['payment_iframe_id'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != account_id) {
      m['account_id'] = account_id;
    }
    if (null != payment_iframe_id) {
      m['payment_iframe_id'] = payment_iframe_id;
    }
    return m;
  }
}

class IFrameInstance {
  IFrameInstance();

  factory IFrameInstance.fromMap(Map<String, dynamic> m) => IFrameInstance();

  Map<String, dynamic> toMap() => <String, dynamic>{};
}

class IFrameInstanceLoadMatch {
  /// STRING (required at the API)
  String? account_id;
  /// STRING (required at the API)
  String? id;
  /// STRING (required at the API)
  String? payment_iframe_id;

  IFrameInstanceLoadMatch({
    this.account_id,
    this.id,
    this.payment_iframe_id,
  });

  factory IFrameInstanceLoadMatch.fromMap(Map<String, dynamic> m) => IFrameInstanceLoadMatch(
        account_id: m['account_id'] is String ? m['account_id'] : null,
        id: m['id'] is String ? m['id'] : null,
        payment_iframe_id: m['payment_iframe_id'] is String ? m['payment_iframe_id'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != account_id) {
      m['account_id'] = account_id;
    }
    if (null != id) {
      m['id'] = id;
    }
    if (null != payment_iframe_id) {
      m['payment_iframe_id'] = payment_iframe_id;
    }
    return m;
  }
}

class Iframe {
  /// OBJECT
  Map<String, dynamic>? ach_setting;
  /// ARRAY (required at the API)
  List<dynamic>? allowed_parent_domain;
  /// ARRAY (required at the API)
  List<dynamic>? allowed_payment_method;
  /// OBJECT
  Map<String, dynamic>? card_setting;
  /// OBJECT
  Map<String, dynamic>? click_to_pay_setting;
  /// STRING
  String? currency;
  /// STRING
  String? id;
  /// STRING (required at the API)
  String? label;
  /// STRING
  String? language;
  /// NUMBER
  num? timeout;

  Iframe({
    this.ach_setting,
    this.allowed_parent_domain,
    this.allowed_payment_method,
    this.card_setting,
    this.click_to_pay_setting,
    this.currency,
    this.id,
    this.label,
    this.language,
    this.timeout,
  });

  factory Iframe.fromMap(Map<String, dynamic> m) => Iframe(
        ach_setting: m['ach_setting'] is Map<String, dynamic> ? m['ach_setting'] : null,
        allowed_parent_domain: m['allowed_parent_domain'] is List<dynamic> ? m['allowed_parent_domain'] : null,
        allowed_payment_method: m['allowed_payment_method'] is List<dynamic> ? m['allowed_payment_method'] : null,
        card_setting: m['card_setting'] is Map<String, dynamic> ? m['card_setting'] : null,
        click_to_pay_setting: m['click_to_pay_setting'] is Map<String, dynamic> ? m['click_to_pay_setting'] : null,
        currency: m['currency'] is String ? m['currency'] : null,
        id: m['id'] is String ? m['id'] : null,
        label: m['label'] is String ? m['label'] : null,
        language: m['language'] is String ? m['language'] : null,
        timeout: m['timeout'] is num ? m['timeout'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != ach_setting) {
      m['ach_setting'] = ach_setting;
    }
    if (null != allowed_parent_domain) {
      m['allowed_parent_domain'] = allowed_parent_domain;
    }
    if (null != allowed_payment_method) {
      m['allowed_payment_method'] = allowed_payment_method;
    }
    if (null != card_setting) {
      m['card_setting'] = card_setting;
    }
    if (null != click_to_pay_setting) {
      m['click_to_pay_setting'] = click_to_pay_setting;
    }
    if (null != currency) {
      m['currency'] = currency;
    }
    if (null != id) {
      m['id'] = id;
    }
    if (null != label) {
      m['label'] = label;
    }
    if (null != language) {
      m['language'] = language;
    }
    if (null != timeout) {
      m['timeout'] = timeout;
    }
    return m;
  }
}

class IframeLoadMatch {
  /// STRING (required at the API)
  String? account_id;
  /// STRING (required at the API)
  String? iframe_id;

  IframeLoadMatch({
    this.account_id,
    this.iframe_id,
  });

  factory IframeLoadMatch.fromMap(Map<String, dynamic> m) => IframeLoadMatch(
        account_id: m['account_id'] is String ? m['account_id'] : null,
        iframe_id: m['iframe_id'] is String ? m['iframe_id'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != account_id) {
      m['account_id'] = account_id;
    }
    if (null != iframe_id) {
      m['iframe_id'] = iframe_id;
    }
    return m;
  }
}

class IframeListMatch {
  /// STRING (required at the API)
  String? account_id;

  IframeListMatch({
    this.account_id,
  });

  factory IframeListMatch.fromMap(Map<String, dynamic> m) => IframeListMatch(
        account_id: m['account_id'] is String ? m['account_id'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != account_id) {
      m['account_id'] = account_id;
    }
    return m;
  }
}

class IframeCreateData {
  /// STRING (required at the API)
  String? account_id;

  IframeCreateData({
    this.account_id,
  });

  factory IframeCreateData.fromMap(Map<String, dynamic> m) => IframeCreateData(
        account_id: m['account_id'] is String ? m['account_id'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != account_id) {
      m['account_id'] = account_id;
    }
    return m;
  }
}

class IframeUpdateData {
  /// STRING (required at the API)
  String? account_id;
  /// STRING (required at the API)
  String? iframe_id;

  IframeUpdateData({
    this.account_id,
    this.iframe_id,
  });

  factory IframeUpdateData.fromMap(Map<String, dynamic> m) => IframeUpdateData(
        account_id: m['account_id'] is String ? m['account_id'] : null,
        iframe_id: m['iframe_id'] is String ? m['iframe_id'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != account_id) {
      m['account_id'] = account_id;
    }
    if (null != iframe_id) {
      m['iframe_id'] = iframe_id;
    }
    return m;
  }
}

class Init {
  /// OBJECT
  Map<String, dynamic>? customer;
  /// STRING
  String? description;
  /// ARRAY
  List<dynamic>? item;
  /// OBJECT
  Map<String, dynamic>? level2;
  /// OBJECT
  Map<String, dynamic>? level3;
  /// OBJECT (required at the API)
  Map<String, dynamic>? shipping_address;
  /// OBJECT
  Map<String, dynamic>? trace;

  Init({
    this.customer,
    this.description,
    this.item,
    this.level2,
    this.level3,
    this.shipping_address,
    this.trace,
  });

  factory Init.fromMap(Map<String, dynamic> m) => Init(
        customer: m['customer'] is Map<String, dynamic> ? m['customer'] : null,
        description: m['description'] is String ? m['description'] : null,
        item: m['item'] is List<dynamic> ? m['item'] : null,
        level2: m['level2'] is Map<String, dynamic> ? m['level2'] : null,
        level3: m['level3'] is Map<String, dynamic> ? m['level3'] : null,
        shipping_address: m['shipping_address'] is Map<String, dynamic> ? m['shipping_address'] : null,
        trace: m['trace'] is Map<String, dynamic> ? m['trace'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != customer) {
      m['customer'] = customer;
    }
    if (null != description) {
      m['description'] = description;
    }
    if (null != item) {
      m['item'] = item;
    }
    if (null != level2) {
      m['level2'] = level2;
    }
    if (null != level3) {
      m['level3'] = level3;
    }
    if (null != shipping_address) {
      m['shipping_address'] = shipping_address;
    }
    if (null != trace) {
      m['trace'] = trace;
    }
    return m;
  }
}

class InitCreateData {
  /// STRING (required at the API)
  String? account_id;

  InitCreateData({
    this.account_id,
  });

  factory InitCreateData.fromMap(Map<String, dynamic> m) => InitCreateData(
        account_id: m['account_id'] is String ? m['account_id'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != account_id) {
      m['account_id'] = account_id;
    }
    return m;
  }
}

class ListApiKeyScopesEntry {
  /// STRING
  String? category;
  /// STRING
  String? description;
  /// BOOLEAN
  bool? enabled;
  /// INTEGER
  int? level;
  /// STRING
  String? scope;

  ListApiKeyScopesEntry({
    this.category,
    this.description,
    this.enabled,
    this.level,
    this.scope,
  });

  factory ListApiKeyScopesEntry.fromMap(Map<String, dynamic> m) => ListApiKeyScopesEntry(
        category: m['category'] is String ? m['category'] : null,
        description: m['description'] is String ? m['description'] : null,
        enabled: m['enabled'] is bool ? m['enabled'] : null,
        level: m['level'] is int ? m['level'] : null,
        scope: m['scope'] is String ? m['scope'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != category) {
      m['category'] = category;
    }
    if (null != description) {
      m['description'] = description;
    }
    if (null != enabled) {
      m['enabled'] = enabled;
    }
    if (null != level) {
      m['level'] = level;
    }
    if (null != scope) {
      m['scope'] = scope;
    }
    return m;
  }
}

class ListApiKeyScopesEntryListMatch {
  /// STRING
  String? category;
  /// STRING
  String? description;
  /// BOOLEAN
  bool? enabled;
  /// INTEGER
  int? level;
  /// STRING
  String? scope;

  ListApiKeyScopesEntryListMatch({
    this.category,
    this.description,
    this.enabled,
    this.level,
    this.scope,
  });

  factory ListApiKeyScopesEntryListMatch.fromMap(Map<String, dynamic> m) => ListApiKeyScopesEntryListMatch(
        category: m['category'] is String ? m['category'] : null,
        description: m['description'] is String ? m['description'] : null,
        enabled: m['enabled'] is bool ? m['enabled'] : null,
        level: m['level'] is int ? m['level'] : null,
        scope: m['scope'] is String ? m['scope'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != category) {
      m['category'] = category;
    }
    if (null != description) {
      m['description'] = description;
    }
    if (null != enabled) {
      m['enabled'] = enabled;
    }
    if (null != level) {
      m['level'] = level;
    }
    if (null != scope) {
      m['scope'] = scope;
    }
    return m;
  }
}

class PaymentIframe {
  PaymentIframe();

  factory PaymentIframe.fromMap(Map<String, dynamic> m) => PaymentIframe();

  Map<String, dynamic> toMap() => <String, dynamic>{};
}

class PaymentIframeRemoveMatch {
  /// STRING (required at the API)
  String? account_id;
  /// STRING (required at the API)
  String? id;

  PaymentIframeRemoveMatch({
    this.account_id,
    this.id,
  });

  factory PaymentIframeRemoveMatch.fromMap(Map<String, dynamic> m) => PaymentIframeRemoveMatch(
        account_id: m['account_id'] is String ? m['account_id'] : null,
        id: m['id'] is String ? m['id'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != account_id) {
      m['account_id'] = account_id;
    }
    if (null != id) {
      m['id'] = id;
    }
    return m;
  }
}

class ThreeDSecureAuth {
  /// OBJECT (required at the API)
  Map<String, dynamic>? browser;
  /// OBJECT (required at the API)
  Map<String, dynamic>? card;
  /// OBJECT
  Map<String, dynamic>? challenge;
  /// OBJECT
  Map<String, dynamic>? customer;
  /// OBJECT (required at the API)
  Map<String, dynamic>? purchase;
  /// STRING
  String? server_transaction_id;
  /// OBJECT (required at the API)
  Map<String, dynamic>? shipping;
  /// STRING
  String? status;
  /// STRING
  String? three_d_secure_challenge_indicator;
  /// STRING
  String? three_d_secure_id;
  /// OBJECT
  Map<String, dynamic>? trace;

  ThreeDSecureAuth({
    this.browser,
    this.card,
    this.challenge,
    this.customer,
    this.purchase,
    this.server_transaction_id,
    this.shipping,
    this.status,
    this.three_d_secure_challenge_indicator,
    this.three_d_secure_id,
    this.trace,
  });

  factory ThreeDSecureAuth.fromMap(Map<String, dynamic> m) => ThreeDSecureAuth(
        browser: m['browser'] is Map<String, dynamic> ? m['browser'] : null,
        card: m['card'] is Map<String, dynamic> ? m['card'] : null,
        challenge: m['challenge'] is Map<String, dynamic> ? m['challenge'] : null,
        customer: m['customer'] is Map<String, dynamic> ? m['customer'] : null,
        purchase: m['purchase'] is Map<String, dynamic> ? m['purchase'] : null,
        server_transaction_id: m['server_transaction_id'] is String ? m['server_transaction_id'] : null,
        shipping: m['shipping'] is Map<String, dynamic> ? m['shipping'] : null,
        status: m['status'] is String ? m['status'] : null,
        three_d_secure_challenge_indicator: m['three_d_secure_challenge_indicator'] is String ? m['three_d_secure_challenge_indicator'] : null,
        three_d_secure_id: m['three_d_secure_id'] is String ? m['three_d_secure_id'] : null,
        trace: m['trace'] is Map<String, dynamic> ? m['trace'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != browser) {
      m['browser'] = browser;
    }
    if (null != card) {
      m['card'] = card;
    }
    if (null != challenge) {
      m['challenge'] = challenge;
    }
    if (null != customer) {
      m['customer'] = customer;
    }
    if (null != purchase) {
      m['purchase'] = purchase;
    }
    if (null != server_transaction_id) {
      m['server_transaction_id'] = server_transaction_id;
    }
    if (null != shipping) {
      m['shipping'] = shipping;
    }
    if (null != status) {
      m['status'] = status;
    }
    if (null != three_d_secure_challenge_indicator) {
      m['three_d_secure_challenge_indicator'] = three_d_secure_challenge_indicator;
    }
    if (null != three_d_secure_id) {
      m['three_d_secure_id'] = three_d_secure_id;
    }
    if (null != trace) {
      m['trace'] = trace;
    }
    return m;
  }
}

class ThreeDSecureAuthCreateData {
  /// STRING (required at the API)
  String? account_id;

  ThreeDSecureAuthCreateData({
    this.account_id,
  });

  factory ThreeDSecureAuthCreateData.fromMap(Map<String, dynamic> m) => ThreeDSecureAuthCreateData(
        account_id: m['account_id'] is String ? m['account_id'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != account_id) {
      m['account_id'] = account_id;
    }
    return m;
  }
}

class ThreeDSecureBrowserInit {
  /// STRING
  String? acs_result_url;
  /// STRING
  String? acs_url;
  /// STRING
  String? cvv;
  /// STRING (required at the API)
  String? expiry;
  /// STRING (required at the API)
  String? pan;
  /// STRING
  String? payment_details_reference;
  /// STRING
  String? server_transaction_id;
  /// STRING
  String? status;
  /// STRING
  String? three_d_secure_data;
  /// STRING
  String? three_d_secure_id;

  ThreeDSecureBrowserInit({
    this.acs_result_url,
    this.acs_url,
    this.cvv,
    this.expiry,
    this.pan,
    this.payment_details_reference,
    this.server_transaction_id,
    this.status,
    this.three_d_secure_data,
    this.three_d_secure_id,
  });

  factory ThreeDSecureBrowserInit.fromMap(Map<String, dynamic> m) => ThreeDSecureBrowserInit(
        acs_result_url: m['acs_result_url'] is String ? m['acs_result_url'] : null,
        acs_url: m['acs_url'] is String ? m['acs_url'] : null,
        cvv: m['cvv'] is String ? m['cvv'] : null,
        expiry: m['expiry'] is String ? m['expiry'] : null,
        pan: m['pan'] is String ? m['pan'] : null,
        payment_details_reference: m['payment_details_reference'] is String ? m['payment_details_reference'] : null,
        server_transaction_id: m['server_transaction_id'] is String ? m['server_transaction_id'] : null,
        status: m['status'] is String ? m['status'] : null,
        three_d_secure_data: m['three_d_secure_data'] is String ? m['three_d_secure_data'] : null,
        three_d_secure_id: m['three_d_secure_id'] is String ? m['three_d_secure_id'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != acs_result_url) {
      m['acs_result_url'] = acs_result_url;
    }
    if (null != acs_url) {
      m['acs_url'] = acs_url;
    }
    if (null != cvv) {
      m['cvv'] = cvv;
    }
    if (null != expiry) {
      m['expiry'] = expiry;
    }
    if (null != pan) {
      m['pan'] = pan;
    }
    if (null != payment_details_reference) {
      m['payment_details_reference'] = payment_details_reference;
    }
    if (null != server_transaction_id) {
      m['server_transaction_id'] = server_transaction_id;
    }
    if (null != status) {
      m['status'] = status;
    }
    if (null != three_d_secure_data) {
      m['three_d_secure_data'] = three_d_secure_data;
    }
    if (null != three_d_secure_id) {
      m['three_d_secure_id'] = three_d_secure_id;
    }
    return m;
  }
}

class ThreeDSecureBrowserInitCreateData {
  /// STRING (required at the API)
  String? account_id;

  ThreeDSecureBrowserInitCreateData({
    this.account_id,
  });

  factory ThreeDSecureBrowserInitCreateData.fromMap(Map<String, dynamic> m) => ThreeDSecureBrowserInitCreateData(
        account_id: m['account_id'] is String ? m['account_id'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != account_id) {
      m['account_id'] = account_id;
    }
    return m;
  }
}

class ThreeDSecureStatus {
  /// OBJECT
  Map<String, dynamic>? error;
  /// OBJECT
  Map<String, dynamic>? info;
  /// STRING
  String? server_transaction_id;
  /// STRING
  String? status;
  /// OBJECT
  Map<String, dynamic>? three_d_secure;
  /// STRING
  String? three_d_secure_id;

  ThreeDSecureStatus({
    this.error,
    this.info,
    this.server_transaction_id,
    this.status,
    this.three_d_secure,
    this.three_d_secure_id,
  });

  factory ThreeDSecureStatus.fromMap(Map<String, dynamic> m) => ThreeDSecureStatus(
        error: m['error'] is Map<String, dynamic> ? m['error'] : null,
        info: m['info'] is Map<String, dynamic> ? m['info'] : null,
        server_transaction_id: m['server_transaction_id'] is String ? m['server_transaction_id'] : null,
        status: m['status'] is String ? m['status'] : null,
        three_d_secure: m['three_d_secure'] is Map<String, dynamic> ? m['three_d_secure'] : null,
        three_d_secure_id: m['three_d_secure_id'] is String ? m['three_d_secure_id'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != error) {
      m['error'] = error;
    }
    if (null != info) {
      m['info'] = info;
    }
    if (null != server_transaction_id) {
      m['server_transaction_id'] = server_transaction_id;
    }
    if (null != status) {
      m['status'] = status;
    }
    if (null != three_d_secure) {
      m['three_d_secure'] = three_d_secure;
    }
    if (null != three_d_secure_id) {
      m['three_d_secure_id'] = three_d_secure_id;
    }
    return m;
  }
}

class ThreeDSecureStatusLoadMatch {
  /// STRING (required at the API)
  String? account_id;

  ThreeDSecureStatusLoadMatch({
    this.account_id,
  });

  factory ThreeDSecureStatusLoadMatch.fromMap(Map<String, dynamic> m) => ThreeDSecureStatusLoadMatch(
        account_id: m['account_id'] is String ? m['account_id'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != account_id) {
      m['account_id'] = account_id;
    }
    return m;
  }
}

class TransactionDetail {
  /// OBJECT (required at the API)
  Map<String, dynamic>? amount;
  /// OBJECT (required at the API)
  Map<String, dynamic>? auth;
  /// OBJECT
  Map<String, dynamic>? card;
  /// OBJECT
  Map<String, dynamic>? customer;
  /// STRING
  String? description;
  /// STRING
  String? id;
  /// ARRAY
  List<dynamic>? item;
  /// OBJECT
  Map<String, dynamic>? level2;
  /// OBJECT
  Map<String, dynamic>? level3;
  /// OBJECT
  Map<String, dynamic>? override;
  /// OBJECT (required at the API)
  Map<String, dynamic>? shipping_address;
  /// STRING (required at the API)
  String? status;
  /// STRING
  String? timestamp;
  /// OBJECT
  Map<String, dynamic>? trace;

  TransactionDetail({
    this.amount,
    this.auth,
    this.card,
    this.customer,
    this.description,
    this.id,
    this.item,
    this.level2,
    this.level3,
    this.override,
    this.shipping_address,
    this.status,
    this.timestamp,
    this.trace,
  });

  factory TransactionDetail.fromMap(Map<String, dynamic> m) => TransactionDetail(
        amount: m['amount'] is Map<String, dynamic> ? m['amount'] : null,
        auth: m['auth'] is Map<String, dynamic> ? m['auth'] : null,
        card: m['card'] is Map<String, dynamic> ? m['card'] : null,
        customer: m['customer'] is Map<String, dynamic> ? m['customer'] : null,
        description: m['description'] is String ? m['description'] : null,
        id: m['id'] is String ? m['id'] : null,
        item: m['item'] is List<dynamic> ? m['item'] : null,
        level2: m['level2'] is Map<String, dynamic> ? m['level2'] : null,
        level3: m['level3'] is Map<String, dynamic> ? m['level3'] : null,
        override: m['override'] is Map<String, dynamic> ? m['override'] : null,
        shipping_address: m['shipping_address'] is Map<String, dynamic> ? m['shipping_address'] : null,
        status: m['status'] is String ? m['status'] : null,
        timestamp: m['timestamp'] is String ? m['timestamp'] : null,
        trace: m['trace'] is Map<String, dynamic> ? m['trace'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != amount) {
      m['amount'] = amount;
    }
    if (null != auth) {
      m['auth'] = auth;
    }
    if (null != card) {
      m['card'] = card;
    }
    if (null != customer) {
      m['customer'] = customer;
    }
    if (null != description) {
      m['description'] = description;
    }
    if (null != id) {
      m['id'] = id;
    }
    if (null != item) {
      m['item'] = item;
    }
    if (null != level2) {
      m['level2'] = level2;
    }
    if (null != level3) {
      m['level3'] = level3;
    }
    if (null != override) {
      m['override'] = override;
    }
    if (null != shipping_address) {
      m['shipping_address'] = shipping_address;
    }
    if (null != status) {
      m['status'] = status;
    }
    if (null != timestamp) {
      m['timestamp'] = timestamp;
    }
    if (null != trace) {
      m['trace'] = trace;
    }
    return m;
  }
}

class TransactionDetailLoadMatch {
  /// STRING (required at the API)
  String? account_id;
  /// STRING (required at the API)
  String? transaction_id;

  TransactionDetailLoadMatch({
    this.account_id,
    this.transaction_id,
  });

  factory TransactionDetailLoadMatch.fromMap(Map<String, dynamic> m) => TransactionDetailLoadMatch(
        account_id: m['account_id'] is String ? m['account_id'] : null,
        transaction_id: m['transaction_id'] is String ? m['transaction_id'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != account_id) {
      m['account_id'] = account_id;
    }
    if (null != transaction_id) {
      m['transaction_id'] = transaction_id;
    }
    return m;
  }
}

class TransactionDetailUpdateData {
  /// STRING (required at the API)
  String? account_id;
  /// STRING (required at the API)
  String? transaction_id;

  TransactionDetailUpdateData({
    this.account_id,
    this.transaction_id,
  });

  factory TransactionDetailUpdateData.fromMap(Map<String, dynamic> m) => TransactionDetailUpdateData(
        account_id: m['account_id'] is String ? m['account_id'] : null,
        transaction_id: m['transaction_id'] is String ? m['transaction_id'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != account_id) {
      m['account_id'] = account_id;
    }
    if (null != transaction_id) {
      m['transaction_id'] = transaction_id;
    }
    return m;
  }
}

class Webhook {
  /// STRING (required at the API)
  String? event;
  /// STRING
  String? id;
  /// STRING (required at the API)
  String? url;

  Webhook({
    this.event,
    this.id,
    this.url,
  });

  factory Webhook.fromMap(Map<String, dynamic> m) => Webhook(
        event: m['event'] is String ? m['event'] : null,
        id: m['id'] is String ? m['id'] : null,
        url: m['url'] is String ? m['url'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != event) {
      m['event'] = event;
    }
    if (null != id) {
      m['id'] = id;
    }
    if (null != url) {
      m['url'] = url;
    }
    return m;
  }
}

class WebhookLoadMatch {
  /// STRING (required at the API)
  String? account_id;
  /// STRING (required at the API)
  String? id;

  WebhookLoadMatch({
    this.account_id,
    this.id,
  });

  factory WebhookLoadMatch.fromMap(Map<String, dynamic> m) => WebhookLoadMatch(
        account_id: m['account_id'] is String ? m['account_id'] : null,
        id: m['id'] is String ? m['id'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != account_id) {
      m['account_id'] = account_id;
    }
    if (null != id) {
      m['id'] = id;
    }
    return m;
  }
}

class WebhookListMatch {
  /// STRING (required at the API)
  String? account_id;

  WebhookListMatch({
    this.account_id,
  });

  factory WebhookListMatch.fromMap(Map<String, dynamic> m) => WebhookListMatch(
        account_id: m['account_id'] is String ? m['account_id'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != account_id) {
      m['account_id'] = account_id;
    }
    return m;
  }
}

class WebhookCreateData {
  /// STRING (required at the API)
  String? account_id;

  WebhookCreateData({
    this.account_id,
  });

  factory WebhookCreateData.fromMap(Map<String, dynamic> m) => WebhookCreateData(
        account_id: m['account_id'] is String ? m['account_id'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != account_id) {
      m['account_id'] = account_id;
    }
    return m;
  }
}

class WebhookUpdateData {
  /// STRING (required at the API)
  String? account_id;
  /// STRING (required at the API)
  String? id;

  WebhookUpdateData({
    this.account_id,
    this.id,
  });

  factory WebhookUpdateData.fromMap(Map<String, dynamic> m) => WebhookUpdateData(
        account_id: m['account_id'] is String ? m['account_id'] : null,
        id: m['id'] is String ? m['id'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != account_id) {
      m['account_id'] = account_id;
    }
    if (null != id) {
      m['id'] = id;
    }
    return m;
  }
}

class WebhookRemoveMatch {
  /// STRING (required at the API)
  String? account_id;
  /// STRING (required at the API)
  String? id;

  WebhookRemoveMatch({
    this.account_id,
    this.id,
  });

  factory WebhookRemoveMatch.fromMap(Map<String, dynamic> m) => WebhookRemoveMatch(
        account_id: m['account_id'] is String ? m['account_id'] : null,
        id: m['id'] is String ? m['id'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != account_id) {
      m['account_id'] = account_id;
    }
    if (null != id) {
      m['id'] = id;
    }
    return m;
  }
}

