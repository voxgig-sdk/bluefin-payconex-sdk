import 'feature/base/BaseFeature.dart';
import 'feature/test/TestFeature.dart';


// ignore: non_constant_identifier_names
final Map<String, BaseFeature Function()> FEATURE_CLASS = {
    'test': () => TestFeature(),

};

class Config {
  BaseFeature makeFeature(String fn) {
    final fc = FEATURE_CLASS[fn];
    if (null == fc) {
      // TODO: errors etc
      throw StateError('Unknown feature: ' + fn);
    }
    return fc();
  }

  final Map<String, dynamic> main = <String, dynamic>{
    'name': 'ProjectName',
  };

  final Map<String, dynamic> feature = <String, dynamic>{
        'test': <String, dynamic>{
      'options': <String, dynamic>{
        'active': false,
      },
    },

  };

  final Map<String, dynamic> options = <String, dynamic>{
    'base': 'https://api.payconex.net/',

    'auth': <String, dynamic>{
      'prefix': 'Basic',
    },

    'headers': <String, dynamic>{
      'content-type': 'application/json',
    },

    'entity': <String, dynamic>{
            'account_updater': <String, dynamic>{},
      'account_updater_schedule': <String, dynamic>{},
      'account_updater_schedule_with_result': <String, dynamic>{},
      'account_updater_subscription_with_result': <String, dynamic>{},
      'account_updater_update': <String, dynamic>{},
      'api_key': <String, dynamic>{},
      'apple_pay_merchant_detail': <String, dynamic>{},
      'apple_pay_session': <String, dynamic>{},
      'dynamic_descriptor': <String, dynamic>{},
      'i_frame_create_instance': <String, dynamic>{},
      'i_frame_instance': <String, dynamic>{},
      'iframe': <String, dynamic>{},
      'init': <String, dynamic>{},
      'list_api_key_scopes_entry': <String, dynamic>{},
      'payment_iframe': <String, dynamic>{},
      'three_d_secure_auth': <String, dynamic>{},
      'three_d_secure_browser_init': <String, dynamic>{},
      'three_d_secure_status': <String, dynamic>{},
      'transaction_detail': <String, dynamic>{},
      'webhook': <String, dynamic>{},

    }
  };

  final Map<String, dynamic> entity = <String, dynamic>{
    'account_updater': <String, dynamic>{
      'fields': <dynamic>[],
      'name': 'account_updater',
      'op': <String, dynamic>{
        'remove': <String, dynamic>{
          'input': 'data',
          'name': 'remove',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'example': 120615523104,
                    'kind': 'param',
                    'name': 'account_id',
                    'orig': 'account',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 0,
                  },
                  <String, dynamic>{
                    'active': true,
                    'example': 120615523104,
                    'kind': 'param',
                    'name': 'record_id',
                    'orig': 'record_id',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 1,
                  },
                  <String, dynamic>{
                    'active': true,
                    'example': 120615523104,
                    'kind': 'param',
                    'name': 'subscription_id',
                    'orig': 'subscription_id',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 2,
                  },
                ],
              },
              'method': 'DELETE',
              'orig': '/api/v4/accounts/{account}/account-updater/subscriptions/{subscriptionId}/records/{recordId}',
              'parts': <dynamic>[
                'api',
                'v4',
                'accounts',
                '{account_id}',
                'account-updater',
                'subscriptions',
                '{subscription_id}',
                'records',
                '{record_id}',
              ],
              'rename': <String, dynamic>{
                'param': <String, dynamic>{
                  'account': 'account_id',
                  'recordId': 'record_id',
                  'subscriptionId': 'subscription_id',
                },
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'account_id',
                  'record_id',
                  'subscription_id',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'index\$': 0,
            },
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'example': 120615523104,
                    'kind': 'param',
                    'name': 'account_id',
                    'orig': 'account',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 0,
                  },
                  <String, dynamic>{
                    'active': true,
                    'example': 120615523104,
                    'kind': 'param',
                    'name': 'subscription_id',
                    'orig': 'subscription_id',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 1,
                  },
                ],
              },
              'method': 'DELETE',
              'orig': '/api/v4/accounts/{account}/account-updater/subscriptions/{subscriptionId}',
              'parts': <dynamic>[
                'api',
                'v4',
                'accounts',
                '{account_id}',
                'account-updater',
                'subscriptions',
                '{subscription_id}',
              ],
              'rename': <String, dynamic>{
                'param': <String, dynamic>{
                  'account': 'account_id',
                  'subscriptionId': 'subscription_id',
                },
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'account_id',
                  'subscription_id',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'index\$': 1,
            },
          ],
          'key\$': 'remove',
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[
          <dynamic>[
            'account',
            'subscription',
          ],
          <dynamic>[
            'account',
            'subscription',
            'record',
          ],
        ],
      },
    },
    'account_updater_schedule': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'active': true,
          'name': 'enabled',
          'req': false,
          'type': '`\$BOOLEAN`',
          'index\$': 0,
        },
        <String, dynamic>{
          'active': true,
          'name': 'period_date',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 1,
        },
        <String, dynamic>{
          'active': true,
          'name': 'period_id',
          'req': true,
          'type': '`\$STRING`',
          'index\$': 2,
        },
        <String, dynamic>{
          'active': true,
          'name': 'response_format',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 3,
        },
        <String, dynamic>{
          'active': true,
          'name': 'token',
          'req': true,
          'type': '`\$ARRAY`',
          'index\$': 4,
        },
      ],
      'name': 'account_updater_schedule',
      'op': <String, dynamic>{
        'create': <String, dynamic>{
          'input': 'data',
          'name': 'create',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'example': '120615523104',
                    'kind': 'param',
                    'name': 'account_id',
                    'orig': 'account_id',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 0,
                  },
                ],
              },
              'method': 'POST',
              'orig': '/api/v4/accounts/{accountId}/account-updater/payconex/subscribe',
              'parts': <dynamic>[
                'api',
                'v4',
                'accounts',
                '{account_id}',
                'account-updater',
                'payconex',
                'subscribe',
              ],
              'rename': <String, dynamic>{
                'param': <String, dynamic>{
                  'accountId': 'account_id',
                },
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'account_id',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'index\$': 0,
            },
          ],
          'key\$': 'create',
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[
          <dynamic>[
            'account',
          ],
        ],
      },
    },
    'account_updater_schedule_with_result': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'active': true,
          'name': 'card',
          'req': true,
          'type': '`\$ARRAY`',
          'index\$': 0,
        },
        <String, dynamic>{
          'active': true,
          'name': 'created_at',
          'req': true,
          'type': '`\$STRING`',
          'index\$': 1,
        },
        <String, dynamic>{
          'active': true,
          'name': 'enabled',
          'op': <String, dynamic>{
            'list': <String, dynamic>{
              'req': true,
              'type': '`\$BOOLEAN`',
            },
          },
          'req': false,
          'type': '`\$BOOLEAN`',
          'index\$': 2,
        },
        <String, dynamic>{
          'active': true,
          'name': 'expiry',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 3,
        },
        <String, dynamic>{
          'active': true,
          'name': 'id',
          'req': true,
          'type': '`\$STRING`',
          'index\$': 4,
        },
        <String, dynamic>{
          'active': true,
          'name': 'most_recent_update',
          'req': false,
          'type': '`\$OBJECT`',
          'index\$': 5,
        },
        <String, dynamic>{
          'active': true,
          'name': 'period_date',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 6,
        },
        <String, dynamic>{
          'active': true,
          'name': 'period_id',
          'req': true,
          'type': '`\$STRING`',
          'index\$': 7,
        },
        <String, dynamic>{
          'active': true,
          'name': 'response_format',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 8,
        },
        <String, dynamic>{
          'active': true,
          'name': 'token',
          'req': true,
          'type': '`\$ARRAY`',
          'index\$': 9,
        },
        <String, dynamic>{
          'active': true,
          'name': 'type',
          'req': true,
          'type': '`\$STRING`',
          'index\$': 10,
        },
        <String, dynamic>{
          'active': true,
          'name': 'updated_at',
          'req': true,
          'type': '`\$STRING`',
          'index\$': 11,
        },
      ],
      'name': 'account_updater_schedule_with_result',
      'op': <String, dynamic>{
        'create': <String, dynamic>{
          'input': 'data',
          'name': 'create',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'example': '120615523104',
                    'kind': 'param',
                    'name': 'account_id',
                    'orig': 'account_id',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 0,
                  },
                ],
              },
              'method': 'POST',
              'orig': '/api/v4/accounts/{accountId}/account-updater/pan/subscribe',
              'parts': <dynamic>[
                'api',
                'v4',
                'accounts',
                '{account_id}',
                'account-updater',
                'pan',
                'subscribe',
              ],
              'rename': <String, dynamic>{
                'param': <String, dynamic>{
                  'accountId': 'account_id',
                },
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'account_id',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'index\$': 0,
            },
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'example': '120615523104',
                    'kind': 'param',
                    'name': 'account_id',
                    'orig': 'account_id',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 0,
                  },
                ],
              },
              'method': 'POST',
              'orig': '/api/v4/accounts/{accountId}/account-updater/shieldconex/subscribe',
              'parts': <dynamic>[
                'api',
                'v4',
                'accounts',
                '{account_id}',
                'account-updater',
                'shieldconex',
                'subscribe',
              ],
              'rename': <String, dynamic>{
                'param': <String, dynamic>{
                  'accountId': 'account_id',
                },
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'account_id',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'index\$': 1,
            },
          ],
          'key\$': 'create',
        },
        'list': <String, dynamic>{
          'input': 'data',
          'name': 'list',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'example': 120615523104,
                    'kind': 'param',
                    'name': 'account_id',
                    'orig': 'account',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 0,
                  },
                  <String, dynamic>{
                    'active': true,
                    'example': 'css_42ffe2fd59e74d719970f1c966430323',
                    'kind': 'param',
                    'name': 'schedule_id',
                    'orig': 'schedule_id',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 1,
                  },
                ],
              },
              'method': 'GET',
              'orig': '/api/v4/accounts/{account}/account-updater/schedules/{scheduleId}/results',
              'parts': <dynamic>[
                'api',
                'v4',
                'accounts',
                '{account_id}',
                'account-updater',
                'schedules',
                '{schedule_id}',
                'results',
              ],
              'rename': <String, dynamic>{
                'param': <String, dynamic>{
                  'account': 'account_id',
                  'scheduleId': 'schedule_id',
                },
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'account_id',
                  'schedule_id',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'index\$': 0,
            },
          ],
          'key\$': 'list',
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[
          <dynamic>[
            'account',
          ],
          <dynamic>[
            'account',
            'schedule',
          ],
        ],
      },
    },
    'account_updater_subscription_with_result': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'active': true,
          'name': 'created_at',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 0,
        },
        <String, dynamic>{
          'active': true,
          'name': 'enabled',
          'req': false,
          'type': '`\$BOOLEAN`',
          'index\$': 1,
        },
        <String, dynamic>{
          'active': true,
          'name': 'id',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 2,
        },
        <String, dynamic>{
          'active': true,
          'name': 'period_date',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 3,
        },
        <String, dynamic>{
          'active': true,
          'name': 'period_id',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 4,
        },
        <String, dynamic>{
          'active': true,
          'name': 'record',
          'req': false,
          'type': '`\$ARRAY`',
          'index\$': 5,
        },
        <String, dynamic>{
          'active': true,
          'name': 'response_format',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 6,
        },
        <String, dynamic>{
          'active': true,
          'name': 'template_ref',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 7,
        },
        <String, dynamic>{
          'active': true,
          'name': 'updated_at',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 8,
        },
      ],
      'name': 'account_updater_subscription_with_result',
      'op': <String, dynamic>{
        'create': <String, dynamic>{
          'input': 'data',
          'name': 'create',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'example': 120615523104,
                    'kind': 'param',
                    'name': 'account_id',
                    'orig': 'account',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 0,
                  },
                  <String, dynamic>{
                    'active': true,
                    'example': 'css_42ffe2fd59e74d719970f1c966430323',
                    'kind': 'param',
                    'name': 'subscription_id',
                    'orig': 'subscription_id',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 1,
                  },
                ],
              },
              'method': 'POST',
              'orig': '/api/v4/accounts/{account}/account-updater/subscriptions/{subscriptionId}/pan',
              'parts': <dynamic>[
                'api',
                'v4',
                'accounts',
                '{account_id}',
                'account-updater',
                'subscriptions',
                '{subscription_id}',
                'pan',
              ],
              'rename': <String, dynamic>{
                'param': <String, dynamic>{
                  'account': 'account_id',
                  'subscriptionId': 'subscription_id',
                },
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'account_id',
                  'subscription_id',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'index\$': 0,
            },
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'example': 120615523104,
                    'kind': 'param',
                    'name': 'account_id',
                    'orig': 'account',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 0,
                  },
                  <String, dynamic>{
                    'active': true,
                    'example': 'css_42ffe2fd59e74d719970f1c966430323',
                    'kind': 'param',
                    'name': 'subscription_id',
                    'orig': 'subscription_id',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 1,
                  },
                ],
              },
              'method': 'POST',
              'orig': '/api/v4/accounts/{account}/account-updater/subscriptions/{subscriptionId}/payconex',
              'parts': <dynamic>[
                'api',
                'v4',
                'accounts',
                '{account_id}',
                'account-updater',
                'subscriptions',
                '{subscription_id}',
                'payconex',
              ],
              'rename': <String, dynamic>{
                'param': <String, dynamic>{
                  'account': 'account_id',
                  'subscriptionId': 'subscription_id',
                },
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'account_id',
                  'subscription_id',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'index\$': 1,
            },
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'example': 120615523104,
                    'kind': 'param',
                    'name': 'account_id',
                    'orig': 'account',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 0,
                  },
                  <String, dynamic>{
                    'active': true,
                    'example': 'css_42ffe2fd59e74d719970f1c966430323',
                    'kind': 'param',
                    'name': 'subscription_id',
                    'orig': 'subscription_id',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 1,
                  },
                ],
              },
              'method': 'POST',
              'orig': '/api/v4/accounts/{account}/account-updater/subscriptions/{subscriptionId}/shieldconex',
              'parts': <dynamic>[
                'api',
                'v4',
                'accounts',
                '{account_id}',
                'account-updater',
                'subscriptions',
                '{subscription_id}',
                'shieldconex',
              ],
              'rename': <String, dynamic>{
                'param': <String, dynamic>{
                  'account': 'account_id',
                  'subscriptionId': 'subscription_id',
                },
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'account_id',
                  'subscription_id',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'index\$': 2,
            },
          ],
          'key\$': 'create',
        },
        'load': <String, dynamic>{
          'input': 'data',
          'name': 'load',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'example': 120615523104,
                    'kind': 'param',
                    'name': 'account_id',
                    'orig': 'account',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 0,
                  },
                  <String, dynamic>{
                    'active': true,
                    'example': 'css_42ffe2fd59e74d719970f1c966430323',
                    'kind': 'param',
                    'name': 'subscription_id',
                    'orig': 'subscription_id',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 1,
                  },
                ],
              },
              'method': 'GET',
              'orig': '/api/v4/accounts/{account}/account-updater/subscriptions/{subscriptionId}',
              'parts': <dynamic>[
                'api',
                'v4',
                'accounts',
                '{account_id}',
                'account-updater',
                'subscriptions',
                '{subscription_id}',
              ],
              'rename': <String, dynamic>{
                'param': <String, dynamic>{
                  'account': 'account_id',
                  'subscriptionId': 'subscription_id',
                },
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'account_id',
                  'subscription_id',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'index\$': 0,
            },
          ],
          'key\$': 'load',
        },
        'update': <String, dynamic>{
          'input': 'data',
          'name': 'update',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'example': 120615523104,
                    'kind': 'param',
                    'name': 'account_id',
                    'orig': 'account',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 0,
                  },
                  <String, dynamic>{
                    'active': true,
                    'example': 'css_42ffe2fd59e74d719970f1c966430323',
                    'kind': 'param',
                    'name': 'subscription_id',
                    'orig': 'subscription_id',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 1,
                  },
                ],
              },
              'method': 'PATCH',
              'orig': '/api/v4/accounts/{account}/account-updater/subscriptions/{subscriptionId}',
              'parts': <dynamic>[
                'api',
                'v4',
                'accounts',
                '{account_id}',
                'account-updater',
                'subscriptions',
                '{subscription_id}',
              ],
              'rename': <String, dynamic>{
                'param': <String, dynamic>{
                  'account': 'account_id',
                  'subscriptionId': 'subscription_id',
                },
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'account_id',
                  'subscription_id',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'index\$': 0,
            },
          ],
          'key\$': 'update',
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[
          <dynamic>[
            'account',
            'subscription',
          ],
        ],
      },
    },
    'account_updater_update': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'active': true,
          'name': 'account_updater_schedule_record_id',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 0,
        },
        <String, dynamic>{
          'active': true,
          'name': 'format',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 1,
        },
        <String, dynamic>{
          'active': true,
          'name': 'id',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 2,
        },
        <String, dynamic>{
          'active': true,
          'name': 'new_expiry',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 3,
        },
        <String, dynamic>{
          'active': true,
          'name': 'new_token',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 4,
        },
        <String, dynamic>{
          'active': true,
          'name': 'old_expiry',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 5,
        },
        <String, dynamic>{
          'active': true,
          'name': 'old_token',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 6,
        },
        <String, dynamic>{
          'active': true,
          'name': 'recurring_schedule',
          'req': false,
          'type': '`\$ARRAY`',
          'index\$': 7,
        },
        <String, dynamic>{
          'active': true,
          'name': 'status',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 8,
        },
        <String, dynamic>{
          'active': true,
          'name': 'update_id',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 9,
        },
        <String, dynamic>{
          'active': true,
          'name': 'updated_at',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 10,
        },
      ],
      'name': 'account_updater_update',
      'op': <String, dynamic>{
        'load': <String, dynamic>{
          'input': 'data',
          'name': 'load',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'example': 120615523104,
                    'kind': 'param',
                    'name': 'account_id',
                    'orig': 'account',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 0,
                  },
                  <String, dynamic>{
                    'active': true,
                    'example': 120615523104,
                    'kind': 'param',
                    'name': 'id',
                    'orig': 'update_id',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 1,
                  },
                ],
              },
              'method': 'GET',
              'orig': '/api/v4/accounts/{account}/account-updater/updates/{updateId}',
              'parts': <dynamic>[
                'api',
                'v4',
                'accounts',
                '{account_id}',
                'account-updater',
                'updates',
                '{id}',
              ],
              'rename': <String, dynamic>{
                'param': <String, dynamic>{
                  'account': 'account_id',
                  'updateId': 'id',
                },
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'account_id',
                  'id',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'index\$': 0,
            },
          ],
          'key\$': 'load',
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[
          <dynamic>[
            'account',
          ],
        ],
      },
    },
    'api_key': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'active': true,
          'name': 'account',
          'req': false,
          'type': '`\$ARRAY`',
          'index\$': 0,
        },
        <String, dynamic>{
          'active': true,
          'name': 'enabled',
          'req': false,
          'type': '`\$BOOLEAN`',
          'index\$': 1,
        },
        <String, dynamic>{
          'active': true,
          'name': 'expires_at',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 2,
        },
        <String, dynamic>{
          'active': true,
          'name': 'expires_in',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 3,
        },
        <String, dynamic>{
          'active': true,
          'name': 'id',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 4,
        },
        <String, dynamic>{
          'active': true,
          'name': 'label',
          'op': <String, dynamic>{
            'create': <String, dynamic>{
              'req': true,
              'type': '`\$STRING`',
            },
          },
          'req': false,
          'type': '`\$STRING`',
          'index\$': 5,
        },
        <String, dynamic>{
          'active': true,
          'name': 'method',
          'req': false,
          'type': '`\$ARRAY`',
          'index\$': 6,
        },
        <String, dynamic>{
          'active': true,
          'name': 'scope',
          'op': <String, dynamic>{
            'create': <String, dynamic>{
              'req': true,
              'type': '`\$ARRAY`',
            },
          },
          'req': false,
          'type': '`\$ARRAY`',
          'index\$': 7,
        },
        <String, dynamic>{
          'active': true,
          'name': 'secret',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 8,
        },
      ],
      'name': 'api_key',
      'op': <String, dynamic>{
        'create': <String, dynamic>{
          'input': 'data',
          'name': 'create',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'example': '120615523104',
                    'kind': 'param',
                    'name': 'account_id',
                    'orig': 'account_id',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 0,
                  },
                ],
              },
              'method': 'POST',
              'orig': '/api/v4/accounts/{accountId}/api-keys',
              'parts': <dynamic>[
                'api',
                'v4',
                'accounts',
                '{account_id}',
                'api-keys',
              ],
              'rename': <String, dynamic>{
                'param': <String, dynamic>{
                  'accountId': 'account_id',
                },
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'account_id',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'index\$': 0,
            },
          ],
          'key\$': 'create',
        },
        'list': <String, dynamic>{
          'input': 'data',
          'name': 'list',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'example': 180000027666,
                    'kind': 'param',
                    'name': 'account_id',
                    'orig': 'account_id',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 0,
                  },
                ],
                'query': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'example': 25,
                    'kind': 'query',
                    'name': 'limit',
                    'orig': 'limit',
                    'reqd': false,
                    'type': '`\$INTEGER`',
                  },
                  <String, dynamic>{
                    'active': true,
                    'example': 5,
                    'kind': 'query',
                    'name': 'page',
                    'orig': 'page',
                    'reqd': false,
                    'type': '`\$INTEGER`',
                  },
                  <String, dynamic>{
                    'active': true,
                    'example': 'words to search',
                    'kind': 'query',
                    'name': 'query',
                    'orig': 'query',
                    'reqd': false,
                    'type': '`\$STRING`',
                  },
                ],
              },
              'method': 'GET',
              'orig': '/api/v4/accounts/{accountId}/api-keys',
              'parts': <dynamic>[
                'api',
                'v4',
                'accounts',
                '{account_id}',
                'api-keys',
              ],
              'rename': <String, dynamic>{
                'param': <String, dynamic>{
                  'accountId': 'account_id',
                },
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'account_id',
                  'limit',
                  'page',
                  'query',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'index\$': 0,
            },
          ],
          'key\$': 'list',
        },
        'load': <String, dynamic>{
          'input': 'data',
          'name': 'load',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'example': 180000027666,
                    'kind': 'param',
                    'name': 'account_id',
                    'orig': 'account_id',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 0,
                  },
                  <String, dynamic>{
                    'active': true,
                    'example': 'api_d193148ac2624de7b43a191682a8822f',
                    'kind': 'param',
                    'name': 'id',
                    'orig': 'resource_id',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 1,
                  },
                ],
              },
              'method': 'GET',
              'orig': '/api/v4/accounts/{accountId}/api-keys/{resourceId}',
              'parts': <dynamic>[
                'api',
                'v4',
                'accounts',
                '{account_id}',
                'api-keys',
                '{id}',
              ],
              'rename': <String, dynamic>{
                'param': <String, dynamic>{
                  'accountId': 'account_id',
                  'resourceId': 'id',
                },
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'account_id',
                  'id',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'index\$': 0,
            },
          ],
          'key\$': 'load',
        },
        'remove': <String, dynamic>{
          'input': 'data',
          'name': 'remove',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'example': 180000027666,
                    'kind': 'param',
                    'name': 'account_id',
                    'orig': 'account_id',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 0,
                  },
                  <String, dynamic>{
                    'active': true,
                    'example': 'api_d193148ac2624de7b43a191682a8822f',
                    'kind': 'param',
                    'name': 'id',
                    'orig': 'resource_id',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 1,
                  },
                ],
              },
              'method': 'DELETE',
              'orig': '/api/v4/accounts/{accountId}/api-keys/{resourceId}',
              'parts': <dynamic>[
                'api',
                'v4',
                'accounts',
                '{account_id}',
                'api-keys',
                '{id}',
              ],
              'rename': <String, dynamic>{
                'param': <String, dynamic>{
                  'accountId': 'account_id',
                  'resourceId': 'id',
                },
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'account_id',
                  'id',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'index\$': 0,
            },
          ],
          'key\$': 'remove',
        },
        'update': <String, dynamic>{
          'input': 'data',
          'name': 'update',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'example': 180000027666,
                    'kind': 'param',
                    'name': 'account_id',
                    'orig': 'account_id',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 0,
                  },
                  <String, dynamic>{
                    'active': true,
                    'example': 'api_d193148ac2624de7b43a191682a8822f',
                    'kind': 'param',
                    'name': 'id',
                    'orig': 'resource_id',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 1,
                  },
                ],
              },
              'method': 'PATCH',
              'orig': '/api/v4/accounts/{accountId}/api-keys/{resourceId}',
              'parts': <dynamic>[
                'api',
                'v4',
                'accounts',
                '{account_id}',
                'api-keys',
                '{id}',
              ],
              'rename': <String, dynamic>{
                'param': <String, dynamic>{
                  'accountId': 'account_id',
                  'resourceId': 'id',
                },
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'account_id',
                  'id',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'index\$': 0,
            },
          ],
          'key\$': 'update',
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[
          <dynamic>[
            'account',
          ],
        ],
      },
    },
    'apple_pay_merchant_detail': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'active': true,
          'name': 'domain',
          'req': true,
          'type': '`\$ARRAY`',
          'index\$': 0,
        },
        <String, dynamic>{
          'active': true,
          'name': 'merchant_url',
          'op': <String, dynamic>{
            'create': <String, dynamic>{
              'req': false,
              'type': '`\$STRING`',
            },
          },
          'req': true,
          'type': '`\$STRING`',
          'index\$': 1,
        },
        <String, dynamic>{
          'active': true,
          'name': 'partner_merchant_name',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 2,
        },
        <String, dynamic>{
          'active': true,
          'name': 'payconex_account_id',
          'req': true,
          'type': '`\$STRING`',
          'index\$': 3,
        },
      ],
      'name': 'apple_pay_merchant_detail',
      'op': <String, dynamic>{
        'create': <String, dynamic>{
          'input': 'data',
          'name': 'create',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'kind': 'param',
                    'name': 'account_id',
                    'orig': 'account_id',
                    'reqd': true,
                    'type': '`\$INTEGER`',
                    'index\$': 0,
                  },
                ],
              },
              'method': 'POST',
              'orig': '/api/v4/accounts/{accountId}/applePay/enrollment',
              'parts': <dynamic>[
                'api',
                'v4',
                'accounts',
                '{account_id}',
                'applePay',
                'enrollment',
              ],
              'rename': <String, dynamic>{
                'param': <String, dynamic>{
                  'accountId': 'account_id',
                },
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'account_id',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'index\$': 0,
            },
          ],
          'key\$': 'create',
        },
        'list': <String, dynamic>{
          'input': 'data',
          'name': 'list',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'kind': 'param',
                    'name': 'account_id',
                    'orig': 'account_id',
                    'reqd': true,
                    'type': '`\$INTEGER`',
                    'index\$': 0,
                  },
                ],
              },
              'method': 'GET',
              'orig': '/api/v4/accounts/{accountId}/applePay/enrollment',
              'parts': <dynamic>[
                'api',
                'v4',
                'accounts',
                '{account_id}',
                'applePay',
                'enrollment',
              ],
              'rename': <String, dynamic>{
                'param': <String, dynamic>{
                  'accountId': 'account_id',
                },
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'account_id',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'index\$': 0,
            },
          ],
          'key\$': 'list',
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[
          <dynamic>[
            'account',
          ],
        ],
      },
    },
    'apple_pay_session': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'active': true,
          'name': 'display_name',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 0,
        },
        <String, dynamic>{
          'active': true,
          'name': 'domain_name',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 1,
        },
        <String, dynamic>{
          'active': true,
          'name': 'epoch_timestamp',
          'req': false,
          'type': '`\$INTEGER`',
          'index\$': 2,
        },
        <String, dynamic>{
          'active': true,
          'name': 'expires_at',
          'req': false,
          'type': '`\$INTEGER`',
          'index\$': 3,
        },
        <String, dynamic>{
          'active': true,
          'name': 'merchant_identifier',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 4,
        },
        <String, dynamic>{
          'active': true,
          'name': 'merchant_session_identifier',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 5,
        },
        <String, dynamic>{
          'active': true,
          'name': 'nonce',
          'req': false,
          'type': '`\$INTEGER`',
          'index\$': 6,
        },
        <String, dynamic>{
          'active': true,
          'name': 'operational_analytics_identifier',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 7,
        },
        <String, dynamic>{
          'active': true,
          'name': 'referrer',
          'req': true,
          'type': '`\$STRING`',
          'index\$': 8,
        },
        <String, dynamic>{
          'active': true,
          'name': 'retry',
          'req': false,
          'type': '`\$INTEGER`',
          'index\$': 9,
        },
        <String, dynamic>{
          'active': true,
          'name': 'signature',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 10,
        },
      ],
      'name': 'apple_pay_session',
      'op': <String, dynamic>{
        'create': <String, dynamic>{
          'input': 'data',
          'name': 'create',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'kind': 'param',
                    'name': 'account_id',
                    'orig': 'account_id',
                    'reqd': true,
                    'type': '`\$INTEGER`',
                    'index\$': 0,
                  },
                ],
              },
              'method': 'POST',
              'orig': '/api/v4/accounts/{accountId}/applePay/session',
              'parts': <dynamic>[
                'api',
                'v4',
                'accounts',
                '{account_id}',
                'applePay',
                'session',
              ],
              'rename': <String, dynamic>{
                'param': <String, dynamic>{
                  'accountId': 'account_id',
                },
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'account_id',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'index\$': 0,
            },
          ],
          'key\$': 'create',
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[
          <dynamic>[
            'account',
          ],
        ],
      },
    },
    'dynamic_descriptor': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'active': true,
          'name': 'city',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 0,
        },
        <String, dynamic>{
          'active': true,
          'name': 'descriptor',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 1,
        },
        <String, dynamic>{
          'active': true,
          'name': 'id',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 2,
        },
        <String, dynamic>{
          'active': true,
          'name': 'name',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 3,
        },
        <String, dynamic>{
          'active': true,
          'name': 'state',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 4,
        },
      ],
      'name': 'dynamic_descriptor',
      'op': <String, dynamic>{
        'create': <String, dynamic>{
          'input': 'data',
          'name': 'create',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'example': 180000027666,
                    'kind': 'param',
                    'name': 'account_id',
                    'orig': 'account_id',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 0,
                  },
                ],
              },
              'method': 'POST',
              'orig': '/api/v4/accounts/{accountId}/dynamic_descriptors',
              'parts': <dynamic>[
                'api',
                'v4',
                'accounts',
                '{account_id}',
                'dynamic_descriptors',
              ],
              'rename': <String, dynamic>{
                'param': <String, dynamic>{
                  'accountId': 'account_id',
                },
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'account_id',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'index\$': 0,
            },
          ],
          'key\$': 'create',
        },
        'list': <String, dynamic>{
          'input': 'data',
          'name': 'list',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'example': 180000027666,
                    'kind': 'param',
                    'name': 'account_id',
                    'orig': 'account_id',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 0,
                  },
                ],
                'query': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'example': 25,
                    'kind': 'query',
                    'name': 'limit',
                    'orig': 'limit',
                    'reqd': false,
                    'type': '`\$INTEGER`',
                  },
                  <String, dynamic>{
                    'active': true,
                    'example': 5,
                    'kind': 'query',
                    'name': 'page',
                    'orig': 'page',
                    'reqd': false,
                    'type': '`\$INTEGER`',
                  },
                  <String, dynamic>{
                    'active': true,
                    'example': 'words to search',
                    'kind': 'query',
                    'name': 'query',
                    'orig': 'query',
                    'reqd': false,
                    'type': '`\$STRING`',
                  },
                ],
              },
              'method': 'GET',
              'orig': '/api/v4/accounts/{accountId}/dynamic_descriptors',
              'parts': <dynamic>[
                'api',
                'v4',
                'accounts',
                '{account_id}',
                'dynamic_descriptors',
              ],
              'rename': <String, dynamic>{
                'param': <String, dynamic>{
                  'accountId': 'account_id',
                },
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'account_id',
                  'limit',
                  'page',
                  'query',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'index\$': 0,
            },
          ],
          'key\$': 'list',
        },
        'load': <String, dynamic>{
          'input': 'data',
          'name': 'load',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'example': 180000027666,
                    'kind': 'param',
                    'name': 'account_id',
                    'orig': 'account_id',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 0,
                  },
                  <String, dynamic>{
                    'active': true,
                    'example': 'ddesc_1669911404412ae74cd5eef8f463495d6b',
                    'kind': 'param',
                    'name': 'id',
                    'orig': 'id',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 1,
                  },
                ],
              },
              'method': 'GET',
              'orig': '/api/v4/accounts/{accountId}/dynamic_descriptors/{id}',
              'parts': <dynamic>[
                'api',
                'v4',
                'accounts',
                '{account_id}',
                'dynamic_descriptors',
                '{id}',
              ],
              'rename': <String, dynamic>{
                'param': <String, dynamic>{
                  'accountId': 'account_id',
                },
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'account_id',
                  'id',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'index\$': 0,
            },
          ],
          'key\$': 'load',
        },
        'remove': <String, dynamic>{
          'input': 'data',
          'name': 'remove',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'example': 180000027666,
                    'kind': 'param',
                    'name': 'account_id',
                    'orig': 'account_id',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 0,
                  },
                  <String, dynamic>{
                    'active': true,
                    'example': 'ddesc_1669911404412ae74cd5eef8f463495d6b',
                    'kind': 'param',
                    'name': 'id',
                    'orig': 'id',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 1,
                  },
                ],
              },
              'method': 'DELETE',
              'orig': '/api/v4/accounts/{accountId}/dynamic_descriptors/{id}',
              'parts': <dynamic>[
                'api',
                'v4',
                'accounts',
                '{account_id}',
                'dynamic_descriptors',
                '{id}',
              ],
              'rename': <String, dynamic>{
                'param': <String, dynamic>{
                  'accountId': 'account_id',
                },
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'account_id',
                  'id',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'index\$': 0,
            },
          ],
          'key\$': 'remove',
        },
        'update': <String, dynamic>{
          'input': 'data',
          'name': 'update',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'example': 180000027666,
                    'kind': 'param',
                    'name': 'account_id',
                    'orig': 'account_id',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 0,
                  },
                  <String, dynamic>{
                    'active': true,
                    'example': 'ddesc_1669911404412ae74cd5eef8f463495d6b',
                    'kind': 'param',
                    'name': 'id',
                    'orig': 'id',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 1,
                  },
                ],
              },
              'method': 'PATCH',
              'orig': '/api/v4/accounts/{accountId}/dynamic_descriptors/{id}',
              'parts': <dynamic>[
                'api',
                'v4',
                'accounts',
                '{account_id}',
                'dynamic_descriptors',
                '{id}',
              ],
              'rename': <String, dynamic>{
                'param': <String, dynamic>{
                  'accountId': 'account_id',
                },
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'account_id',
                  'id',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'index\$': 0,
            },
          ],
          'key\$': 'update',
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[
          <dynamic>[
            'account',
          ],
        ],
      },
    },
    'i_frame_create_instance': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'active': true,
          'name': 'amount',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 0,
        },
        <String, dynamic>{
          'active': true,
          'name': 'currency',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 1,
        },
        <String, dynamic>{
          'active': true,
          'name': 'customer',
          'req': false,
          'type': '`\$OBJECT`',
          'index\$': 2,
        },
        <String, dynamic>{
          'active': true,
          'name': 'initialize_transaction',
          'req': false,
          'type': '`\$BOOLEAN`',
          'index\$': 3,
        },
        <String, dynamic>{
          'active': true,
          'name': 'label',
          'req': true,
          'type': '`\$STRING`',
          'index\$': 4,
        },
        <String, dynamic>{
          'active': true,
          'name': 'language',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 5,
        },
        <String, dynamic>{
          'active': true,
          'name': 'reference',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 6,
        },
        <String, dynamic>{
          'active': true,
          'name': 'timeout',
          'req': false,
          'type': '`\$NUMBER`',
          'index\$': 7,
        },
        <String, dynamic>{
          'active': true,
          'name': 'token',
          'req': false,
          'type': '`\$ARRAY`',
          'index\$': 8,
        },
      ],
      'name': 'i_frame_create_instance',
      'op': <String, dynamic>{
        'create': <String, dynamic>{
          'input': 'data',
          'name': 'create',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'example': 120615523104,
                    'kind': 'param',
                    'name': 'account_id',
                    'orig': 'account_id',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 0,
                  },
                  <String, dynamic>{
                    'active': true,
                    'example': 'ifr_2a08d8fc30b64a8a9d8b9f0ec37b59c9',
                    'kind': 'param',
                    'name': 'payment_iframe_id',
                    'orig': 'iframe_id',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 1,
                  },
                ],
              },
              'method': 'POST',
              'orig': '/api/v4/accounts/{accountId}/payment-iframe/{iframeId}/instance/init',
              'parts': <dynamic>[
                'api',
                'v4',
                'accounts',
                '{account_id}',
                'payment-iframe',
                '{payment_iframe_id}',
                'instance',
                'init',
              ],
              'rename': <String, dynamic>{
                'param': <String, dynamic>{
                  'accountId': 'account_id',
                  'iframeId': 'payment_iframe_id',
                },
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'account_id',
                  'payment_iframe_id',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'index\$': 0,
            },
          ],
          'key\$': 'create',
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[
          <dynamic>[
            'account',
            'payment_iframe',
          ],
        ],
      },
    },
    'i_frame_instance': <String, dynamic>{
      'fields': <dynamic>[],
      'name': 'i_frame_instance',
      'op': <String, dynamic>{
        'load': <String, dynamic>{
          'input': 'data',
          'name': 'load',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'example': 120615523104,
                    'kind': 'param',
                    'name': 'account_id',
                    'orig': 'account_id',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 0,
                  },
                  <String, dynamic>{
                    'active': true,
                    'example': 'ifri_2a08d8fc30b64a8a9d8b9f0ec37b59c9',
                    'kind': 'param',
                    'name': 'id',
                    'orig': 'iframe_instance_id',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 1,
                  },
                  <String, dynamic>{
                    'active': true,
                    'example': 'ifr_2a08d8fc30b64a8a9d8b9f0ec37b59c9',
                    'kind': 'param',
                    'name': 'payment_iframe_id',
                    'orig': 'iframe_id',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 2,
                  },
                ],
              },
              'method': 'GET',
              'orig': '/api/v4/accounts/{accountId}/payment-iframe/{iframeId}/instance/{iframeInstanceId}',
              'parts': <dynamic>[
                'api',
                'v4',
                'accounts',
                '{account_id}',
                'payment-iframe',
                '{payment_iframe_id}',
                'instance',
                '{id}',
              ],
              'rename': <String, dynamic>{
                'param': <String, dynamic>{
                  'accountId': 'account_id',
                  'iframeId': 'payment_iframe_id',
                  'iframeInstanceId': 'id',
                },
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'account_id',
                  'id',
                  'payment_iframe_id',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'index\$': 0,
            },
          ],
          'key\$': 'load',
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[
          <dynamic>[
            'account',
            'payment_iframe',
          ],
        ],
      },
    },
    'iframe': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'active': true,
          'name': 'ach_setting',
          'req': false,
          'type': '`\$OBJECT`',
          'index\$': 0,
        },
        <String, dynamic>{
          'active': true,
          'name': 'allowed_parent_domain',
          'op': <String, dynamic>{
            'list': <String, dynamic>{
              'req': false,
              'type': '`\$ARRAY`',
            },
            'update': <String, dynamic>{
              'req': false,
              'type': '`\$ARRAY`',
            },
          },
          'req': true,
          'type': '`\$ARRAY`',
          'index\$': 1,
        },
        <String, dynamic>{
          'active': true,
          'name': 'allowed_payment_method',
          'op': <String, dynamic>{
            'list': <String, dynamic>{
              'req': false,
              'type': '`\$ARRAY`',
            },
            'update': <String, dynamic>{
              'req': false,
              'type': '`\$ARRAY`',
            },
          },
          'req': true,
          'type': '`\$ARRAY`',
          'index\$': 2,
        },
        <String, dynamic>{
          'active': true,
          'name': 'card_setting',
          'req': false,
          'type': '`\$OBJECT`',
          'index\$': 3,
        },
        <String, dynamic>{
          'active': true,
          'name': 'click_to_pay_setting',
          'req': false,
          'type': '`\$OBJECT`',
          'index\$': 4,
        },
        <String, dynamic>{
          'active': true,
          'name': 'currency',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 5,
        },
        <String, dynamic>{
          'active': true,
          'name': 'id',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 6,
        },
        <String, dynamic>{
          'active': true,
          'name': 'label',
          'op': <String, dynamic>{
            'list': <String, dynamic>{
              'req': false,
              'type': '`\$STRING`',
            },
            'update': <String, dynamic>{
              'req': false,
              'type': '`\$STRING`',
            },
          },
          'req': true,
          'type': '`\$STRING`',
          'index\$': 7,
        },
        <String, dynamic>{
          'active': true,
          'name': 'language',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 8,
        },
        <String, dynamic>{
          'active': true,
          'name': 'timeout',
          'req': false,
          'type': '`\$NUMBER`',
          'index\$': 9,
        },
      ],
      'name': 'iframe',
      'op': <String, dynamic>{
        'create': <String, dynamic>{
          'input': 'data',
          'name': 'create',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'example': '120615523104',
                    'kind': 'param',
                    'name': 'account_id',
                    'orig': 'account_id',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 0,
                  },
                ],
              },
              'method': 'POST',
              'orig': '/api/v4/accounts/{accountId}/payment-iframe',
              'parts': <dynamic>[
                'api',
                'v4',
                'accounts',
                '{account_id}',
                'payment-iframe',
              ],
              'rename': <String, dynamic>{
                'param': <String, dynamic>{
                  'accountId': 'account_id',
                },
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'account_id',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'index\$': 0,
            },
          ],
          'key\$': 'create',
        },
        'list': <String, dynamic>{
          'input': 'data',
          'name': 'list',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'example': '120615523104',
                    'kind': 'param',
                    'name': 'account_id',
                    'orig': 'account_id',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 0,
                  },
                ],
              },
              'method': 'GET',
              'orig': '/api/v4/accounts/{accountId}/payment-iframe',
              'parts': <dynamic>[
                'api',
                'v4',
                'accounts',
                '{account_id}',
                'payment-iframe',
              ],
              'rename': <String, dynamic>{
                'param': <String, dynamic>{
                  'accountId': 'account_id',
                },
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'account_id',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'index\$': 0,
            },
          ],
          'key\$': 'list',
        },
        'load': <String, dynamic>{
          'input': 'data',
          'name': 'load',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'example': 120615523104,
                    'kind': 'param',
                    'name': 'account_id',
                    'orig': 'account_id',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 0,
                  },
                  <String, dynamic>{
                    'active': true,
                    'example': 'ifr_d193148ac2624de7b43a191682a8822f',
                    'kind': 'param',
                    'name': 'iframe_id',
                    'orig': 'iframe_id',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 1,
                  },
                ],
              },
              'method': 'GET',
              'orig': '/api/v4/accounts/{accountId}/payment-iframe/{iframeId}',
              'parts': <dynamic>[
                'api',
                'v4',
                'accounts',
                '{account_id}',
                'payment-iframe',
                '{iframe_id}',
              ],
              'rename': <String, dynamic>{
                'param': <String, dynamic>{
                  'accountId': 'account_id',
                  'iframeId': 'iframe_id',
                },
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'account_id',
                  'iframe_id',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'index\$': 0,
            },
          ],
          'key\$': 'load',
        },
        'update': <String, dynamic>{
          'input': 'data',
          'name': 'update',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'example': 120615523104,
                    'kind': 'param',
                    'name': 'account_id',
                    'orig': 'account_id',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 0,
                  },
                  <String, dynamic>{
                    'active': true,
                    'example': 'ifr_d193148ac2624de7b43a191682a8822f',
                    'kind': 'param',
                    'name': 'iframe_id',
                    'orig': 'iframe_id',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 1,
                  },
                ],
              },
              'method': 'PATCH',
              'orig': '/api/v4/accounts/{accountId}/payment-iframe/{iframeId}',
              'parts': <dynamic>[
                'api',
                'v4',
                'accounts',
                '{account_id}',
                'payment-iframe',
                '{iframe_id}',
              ],
              'rename': <String, dynamic>{
                'param': <String, dynamic>{
                  'accountId': 'account_id',
                  'iframeId': 'iframe_id',
                },
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'account_id',
                  'iframe_id',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'index\$': 0,
            },
          ],
          'key\$': 'update',
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[
          <dynamic>[
            'account',
          ],
          <dynamic>[
            'account',
            'payment_iframe',
          ],
        ],
      },
    },
    'init': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'active': true,
          'name': 'customer',
          'req': false,
          'type': '`\$OBJECT`',
          'index\$': 0,
        },
        <String, dynamic>{
          'active': true,
          'name': 'description',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 1,
        },
        <String, dynamic>{
          'active': true,
          'name': 'item',
          'req': false,
          'type': '`\$ARRAY`',
          'index\$': 2,
        },
        <String, dynamic>{
          'active': true,
          'name': 'level2',
          'req': false,
          'type': '`\$OBJECT`',
          'index\$': 3,
        },
        <String, dynamic>{
          'active': true,
          'name': 'level3',
          'req': false,
          'type': '`\$OBJECT`',
          'index\$': 4,
        },
        <String, dynamic>{
          'active': true,
          'name': 'shipping_address',
          'req': true,
          'type': '`\$OBJECT`',
          'index\$': 5,
        },
        <String, dynamic>{
          'active': true,
          'name': 'trace',
          'req': false,
          'type': '`\$OBJECT`',
          'index\$': 6,
        },
      ],
      'name': 'init',
      'op': <String, dynamic>{
        'create': <String, dynamic>{
          'input': 'data',
          'name': 'create',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'example': '120615523104',
                    'kind': 'param',
                    'name': 'account_id',
                    'orig': 'account_id',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 0,
                  },
                ],
              },
              'method': 'POST',
              'orig': '/api/v4/accounts/{accountId}/payments/init',
              'parts': <dynamic>[
                'api',
                'v4',
                'accounts',
                '{account_id}',
                'payments',
                'init',
              ],
              'rename': <String, dynamic>{
                'param': <String, dynamic>{
                  'accountId': 'account_id',
                },
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'account_id',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'index\$': 0,
            },
          ],
          'key\$': 'create',
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[
          <dynamic>[
            'account',
          ],
        ],
      },
    },
    'list_api_key_scopes_entry': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'active': true,
          'name': 'category',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 0,
        },
        <String, dynamic>{
          'active': true,
          'name': 'description',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 1,
        },
        <String, dynamic>{
          'active': true,
          'name': 'enabled',
          'req': false,
          'type': '`\$BOOLEAN`',
          'index\$': 2,
        },
        <String, dynamic>{
          'active': true,
          'name': 'level',
          'req': false,
          'type': '`\$INTEGER`',
          'index\$': 3,
        },
        <String, dynamic>{
          'active': true,
          'name': 'scope',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 4,
        },
      ],
      'name': 'list_api_key_scopes_entry',
      'op': <String, dynamic>{
        'list': <String, dynamic>{
          'input': 'data',
          'name': 'list',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{},
              'method': 'GET',
              'orig': '/api/v4/api-key-scopes',
              'parts': <dynamic>[
                'api',
                'v4',
                'api-key-scopes',
              ],
              'select': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'index\$': 0,
            },
          ],
          'key\$': 'list',
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[],
      },
    },
    'payment_iframe': <String, dynamic>{
      'fields': <dynamic>[],
      'name': 'payment_iframe',
      'op': <String, dynamic>{
        'remove': <String, dynamic>{
          'input': 'data',
          'name': 'remove',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'example': 120615523104,
                    'kind': 'param',
                    'name': 'account_id',
                    'orig': 'account_id',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 0,
                  },
                  <String, dynamic>{
                    'active': true,
                    'example': 'ifr_d193148ac2624de7b43a191682a8822f',
                    'kind': 'param',
                    'name': 'id',
                    'orig': 'iframe_id',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 1,
                  },
                ],
              },
              'method': 'DELETE',
              'orig': '/api/v4/accounts/{accountId}/payment-iframe/{iframeId}',
              'parts': <dynamic>[
                'api',
                'v4',
                'accounts',
                '{account_id}',
                'payment-iframe',
                '{id}',
              ],
              'rename': <String, dynamic>{
                'param': <String, dynamic>{
                  'accountId': 'account_id',
                  'iframeId': 'id',
                },
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'account_id',
                  'id',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'index\$': 0,
            },
          ],
          'key\$': 'remove',
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[
          <dynamic>[
            'account',
          ],
        ],
      },
    },
    'three_d_secure_auth': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'active': true,
          'name': 'browser',
          'req': true,
          'type': '`\$OBJECT`',
          'index\$': 0,
        },
        <String, dynamic>{
          'active': true,
          'name': 'card',
          'req': true,
          'type': '`\$OBJECT`',
          'index\$': 1,
        },
        <String, dynamic>{
          'active': true,
          'name': 'challenge',
          'req': false,
          'type': '`\$OBJECT`',
          'index\$': 2,
        },
        <String, dynamic>{
          'active': true,
          'name': 'customer',
          'req': false,
          'type': '`\$OBJECT`',
          'index\$': 3,
        },
        <String, dynamic>{
          'active': true,
          'name': 'purchase',
          'req': true,
          'type': '`\$OBJECT`',
          'index\$': 4,
        },
        <String, dynamic>{
          'active': true,
          'name': 'server_transaction_id',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 5,
        },
        <String, dynamic>{
          'active': true,
          'name': 'shipping',
          'req': true,
          'type': '`\$OBJECT`',
          'index\$': 6,
        },
        <String, dynamic>{
          'active': true,
          'name': 'status',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 7,
        },
        <String, dynamic>{
          'active': true,
          'name': 'three_d_secure_challenge_indicator',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 8,
        },
        <String, dynamic>{
          'active': true,
          'name': 'three_d_secure_id',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 9,
        },
        <String, dynamic>{
          'active': true,
          'name': 'trace',
          'req': false,
          'type': '`\$OBJECT`',
          'index\$': 10,
        },
      ],
      'name': 'three_d_secure_auth',
      'op': <String, dynamic>{
        'create': <String, dynamic>{
          'input': 'data',
          'name': 'create',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'example': 'tds_23d0e53de3c64e94887116da65abc8ce',
                    'kind': 'param',
                    'name': '3_d_id',
                    'orig': 'resource_id',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 0,
                  },
                  <String, dynamic>{
                    'active': true,
                    'example': '120615523104',
                    'kind': 'param',
                    'name': 'account_id',
                    'orig': 'account_id',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 1,
                  },
                ],
              },
              'method': 'POST',
              'orig': '/api/v4/accounts/{accountId}/3DS/{resourceId}/browser-authenticate',
              'parts': <dynamic>[
                'api',
                'v4',
                'accounts',
                '{account_id}',
                '3DS',
                '{3_d_id}',
                'browser-authenticate',
              ],
              'rename': <String, dynamic>{
                'param': <String, dynamic>{
                  'accountId': 'account_id',
                  'resourceId': '3_d_id',
                },
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  '3_d_id',
                  'account_id',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'index\$': 0,
            },
          ],
          'key\$': 'create',
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[
          <dynamic>[
            'account',
            '3_d',
          ],
        ],
      },
    },
    'three_d_secure_browser_init': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'active': true,
          'name': 'acs_result_url',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 0,
        },
        <String, dynamic>{
          'active': true,
          'name': 'acs_url',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 1,
        },
        <String, dynamic>{
          'active': true,
          'name': 'cvv',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 2,
        },
        <String, dynamic>{
          'active': true,
          'name': 'expiry',
          'req': true,
          'type': '`\$STRING`',
          'index\$': 3,
        },
        <String, dynamic>{
          'active': true,
          'name': 'pan',
          'req': true,
          'type': '`\$STRING`',
          'index\$': 4,
        },
        <String, dynamic>{
          'active': true,
          'name': 'payment_details_reference',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 5,
        },
        <String, dynamic>{
          'active': true,
          'name': 'server_transaction_id',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 6,
        },
        <String, dynamic>{
          'active': true,
          'name': 'status',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 7,
        },
        <String, dynamic>{
          'active': true,
          'name': 'three_d_secure_data',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 8,
        },
        <String, dynamic>{
          'active': true,
          'name': 'three_d_secure_id',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 9,
        },
      ],
      'name': 'three_d_secure_browser_init',
      'op': <String, dynamic>{
        'create': <String, dynamic>{
          'input': 'data',
          'name': 'create',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'example': '120615523104',
                    'kind': 'param',
                    'name': 'account_id',
                    'orig': 'account_id',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 0,
                  },
                ],
              },
              'method': 'POST',
              'orig': '/api/v4/accounts/{accountId}/3DS/init-card-details',
              'parts': <dynamic>[
                'api',
                'v4',
                'accounts',
                '{account_id}',
                '3DS',
                'init-card-details',
              ],
              'rename': <String, dynamic>{
                'param': <String, dynamic>{
                  'accountId': 'account_id',
                },
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'account_id',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'index\$': 0,
            },
          ],
          'key\$': 'create',
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[
          <dynamic>[
            'account',
          ],
        ],
      },
    },
    'three_d_secure_status': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'active': true,
          'name': 'error',
          'req': false,
          'type': '`\$OBJECT`',
          'index\$': 0,
        },
        <String, dynamic>{
          'active': true,
          'name': 'info',
          'req': false,
          'type': '`\$OBJECT`',
          'index\$': 1,
        },
        <String, dynamic>{
          'active': true,
          'name': 'server_transaction_id',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 2,
        },
        <String, dynamic>{
          'active': true,
          'name': 'status',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 3,
        },
        <String, dynamic>{
          'active': true,
          'name': 'three_d_secure',
          'req': false,
          'type': '`\$OBJECT`',
          'index\$': 4,
        },
        <String, dynamic>{
          'active': true,
          'name': 'three_d_secure_id',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 5,
        },
      ],
      'name': 'three_d_secure_status',
      'op': <String, dynamic>{
        'load': <String, dynamic>{
          'input': 'data',
          'name': 'load',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'example': 'tds_23d0e53de3c64e94887116da65abc8ce',
                    'kind': 'param',
                    'name': '3_d_id',
                    'orig': 'resource_id',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 0,
                  },
                  <String, dynamic>{
                    'active': true,
                    'example': '120615523104',
                    'kind': 'param',
                    'name': 'account_id',
                    'orig': 'account_id',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 1,
                  },
                ],
              },
              'method': 'GET',
              'orig': '/api/v4/accounts/{accountId}/3DS/{resourceId}/status',
              'parts': <dynamic>[
                'api',
                'v4',
                'accounts',
                '{account_id}',
                '3DS',
                '{3_d_id}',
                'status',
              ],
              'rename': <String, dynamic>{
                'param': <String, dynamic>{
                  'accountId': 'account_id',
                  'resourceId': '3_d_id',
                },
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  '3_d_id',
                  'account_id',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'index\$': 0,
            },
          ],
          'key\$': 'load',
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[
          <dynamic>[
            'account',
            '3_d',
          ],
        ],
      },
    },
    'transaction_detail': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'active': true,
          'name': 'amount',
          'req': true,
          'type': '`\$OBJECT`',
          'index\$': 0,
        },
        <String, dynamic>{
          'active': true,
          'name': 'auth',
          'req': true,
          'type': '`\$OBJECT`',
          'index\$': 1,
        },
        <String, dynamic>{
          'active': true,
          'name': 'card',
          'req': false,
          'type': '`\$OBJECT`',
          'index\$': 2,
        },
        <String, dynamic>{
          'active': true,
          'name': 'customer',
          'req': false,
          'type': '`\$OBJECT`',
          'index\$': 3,
        },
        <String, dynamic>{
          'active': true,
          'name': 'description',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 4,
        },
        <String, dynamic>{
          'active': true,
          'name': 'id',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 5,
        },
        <String, dynamic>{
          'active': true,
          'name': 'item',
          'req': false,
          'type': '`\$ARRAY`',
          'index\$': 6,
        },
        <String, dynamic>{
          'active': true,
          'name': 'level2',
          'req': false,
          'type': '`\$OBJECT`',
          'index\$': 7,
        },
        <String, dynamic>{
          'active': true,
          'name': 'level3',
          'req': false,
          'type': '`\$OBJECT`',
          'index\$': 8,
        },
        <String, dynamic>{
          'active': true,
          'name': 'override',
          'req': false,
          'type': '`\$OBJECT`',
          'index\$': 9,
        },
        <String, dynamic>{
          'active': true,
          'name': 'shipping_address',
          'op': <String, dynamic>{
            'update': <String, dynamic>{
              'req': false,
              'type': '`\$OBJECT`',
            },
          },
          'req': true,
          'type': '`\$OBJECT`',
          'index\$': 10,
        },
        <String, dynamic>{
          'active': true,
          'name': 'status',
          'req': true,
          'type': '`\$STRING`',
          'index\$': 11,
        },
        <String, dynamic>{
          'active': true,
          'name': 'timestamp',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 12,
        },
        <String, dynamic>{
          'active': true,
          'name': 'trace',
          'req': false,
          'type': '`\$OBJECT`',
          'index\$': 13,
        },
      ],
      'name': 'transaction_detail',
      'op': <String, dynamic>{
        'load': <String, dynamic>{
          'input': 'data',
          'name': 'load',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'example': '120615523104',
                    'kind': 'param',
                    'name': 'account_id',
                    'orig': 'account_id',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 0,
                  },
                  <String, dynamic>{
                    'active': true,
                    'example': 1861,
                    'kind': 'param',
                    'name': 'transaction_id',
                    'orig': 'transaction_id',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 1,
                  },
                ],
              },
              'method': 'GET',
              'orig': '/api/v4/accounts/{accountId}/payments/{transactionId}',
              'parts': <dynamic>[
                'api',
                'v4',
                'accounts',
                '{account_id}',
                'payments',
                '{transaction_id}',
              ],
              'rename': <String, dynamic>{
                'param': <String, dynamic>{
                  'accountId': 'account_id',
                  'transactionId': 'transaction_id',
                },
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'account_id',
                  'transaction_id',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'index\$': 0,
            },
          ],
          'key\$': 'load',
        },
        'update': <String, dynamic>{
          'input': 'data',
          'name': 'update',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'example': '120615523104',
                    'kind': 'param',
                    'name': 'account_id',
                    'orig': 'account_id',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 0,
                  },
                  <String, dynamic>{
                    'active': true,
                    'example': 1861,
                    'kind': 'param',
                    'name': 'transaction_id',
                    'orig': 'transaction_id',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 1,
                  },
                ],
              },
              'method': 'PATCH',
              'orig': '/api/v4/accounts/{accountId}/payments/{transactionId}',
              'parts': <dynamic>[
                'api',
                'v4',
                'accounts',
                '{account_id}',
                'payments',
                '{transaction_id}',
              ],
              'rename': <String, dynamic>{
                'param': <String, dynamic>{
                  'accountId': 'account_id',
                  'transactionId': 'transaction_id',
                },
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'account_id',
                  'transaction_id',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'index\$': 0,
            },
          ],
          'key\$': 'update',
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[
          <dynamic>[
            'account',
            'payment',
          ],
        ],
      },
    },
    'webhook': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'active': true,
          'name': 'event',
          'req': true,
          'type': '`\$STRING`',
          'index\$': 0,
        },
        <String, dynamic>{
          'active': true,
          'name': 'id',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 1,
        },
        <String, dynamic>{
          'active': true,
          'name': 'url',
          'req': true,
          'type': '`\$STRING`',
          'index\$': 2,
        },
      ],
      'name': 'webhook',
      'op': <String, dynamic>{
        'create': <String, dynamic>{
          'input': 'data',
          'name': 'create',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'example': '120615523104',
                    'kind': 'param',
                    'name': 'account_id',
                    'orig': 'account_id',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 0,
                  },
                ],
              },
              'method': 'POST',
              'orig': '/api/v4/accounts/{accountId}/webhooks',
              'parts': <dynamic>[
                'api',
                'v4',
                'accounts',
                '{account_id}',
                'webhooks',
              ],
              'rename': <String, dynamic>{
                'param': <String, dynamic>{
                  'accountId': 'account_id',
                },
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'account_id',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'index\$': 0,
            },
          ],
          'key\$': 'create',
        },
        'list': <String, dynamic>{
          'input': 'data',
          'name': 'list',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'example': '120615523104',
                    'kind': 'param',
                    'name': 'account_id',
                    'orig': 'account_id',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 0,
                  },
                ],
              },
              'method': 'GET',
              'orig': '/api/v4/accounts/{accountId}/webhooks',
              'parts': <dynamic>[
                'api',
                'v4',
                'accounts',
                '{account_id}',
                'webhooks',
              ],
              'rename': <String, dynamic>{
                'param': <String, dynamic>{
                  'accountId': 'account_id',
                },
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'account_id',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'index\$': 0,
            },
          ],
          'key\$': 'list',
        },
        'load': <String, dynamic>{
          'input': 'data',
          'name': 'load',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'example': 120615523104,
                    'kind': 'param',
                    'name': 'account_id',
                    'orig': 'account_id',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 0,
                  },
                  <String, dynamic>{
                    'active': true,
                    'example': 'wbh_d193148ac2624de7b43a191682a8822f',
                    'kind': 'param',
                    'name': 'id',
                    'orig': 'webhook_id',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 1,
                  },
                ],
              },
              'method': 'GET',
              'orig': '/api/v4/accounts/{accountId}/webhooks/{webhookID}',
              'parts': <dynamic>[
                'api',
                'v4',
                'accounts',
                '{account_id}',
                'webhooks',
                '{id}',
              ],
              'rename': <String, dynamic>{
                'param': <String, dynamic>{
                  'accountId': 'account_id',
                  'webhookID': 'id',
                },
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'account_id',
                  'id',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'index\$': 0,
            },
          ],
          'key\$': 'load',
        },
        'remove': <String, dynamic>{
          'input': 'data',
          'name': 'remove',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'example': 120615523104,
                    'kind': 'param',
                    'name': 'account_id',
                    'orig': 'account_id',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 0,
                  },
                  <String, dynamic>{
                    'active': true,
                    'example': 'wbh_d193148ac2624de7b43a191682a8822f',
                    'kind': 'param',
                    'name': 'id',
                    'orig': 'webhook_id',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 1,
                  },
                ],
              },
              'method': 'DELETE',
              'orig': '/api/v4/accounts/{accountId}/webhooks/{webhookID}',
              'parts': <dynamic>[
                'api',
                'v4',
                'accounts',
                '{account_id}',
                'webhooks',
                '{id}',
              ],
              'rename': <String, dynamic>{
                'param': <String, dynamic>{
                  'accountId': 'account_id',
                  'webhookID': 'id',
                },
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'account_id',
                  'id',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'index\$': 0,
            },
          ],
          'key\$': 'remove',
        },
        'update': <String, dynamic>{
          'input': 'data',
          'name': 'update',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'example': 120615523104,
                    'kind': 'param',
                    'name': 'account_id',
                    'orig': 'account_id',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 0,
                  },
                  <String, dynamic>{
                    'active': true,
                    'example': 'wbh_d193148ac2624de7b43a191682a8822f',
                    'kind': 'param',
                    'name': 'id',
                    'orig': 'webhook_id',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 1,
                  },
                ],
              },
              'method': 'PATCH',
              'orig': '/api/v4/accounts/{accountId}/webhooks/{webhookID}',
              'parts': <dynamic>[
                'api',
                'v4',
                'accounts',
                '{account_id}',
                'webhooks',
                '{id}',
              ],
              'rename': <String, dynamic>{
                'param': <String, dynamic>{
                  'accountId': 'account_id',
                  'webhookID': 'id',
                },
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'account_id',
                  'id',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'index\$': 0,
            },
          ],
          'key\$': 'update',
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[
          <dynamic>[
            'account',
          ],
        ],
      },
    },
  };

  // The pipeline context carries the config as a plain map.
  Map<String, dynamic> toMap() => <String, dynamic>{
        'main': main,
        'feature': feature,
        'options': options,
        'entity': entity,
      };
}

final config = Config();
