package core

func MakeConfig() map[string]any {
	return map[string]any{
		"main": map[string]any{
			"name": "BluefinPayconex",
		},
		"feature": map[string]any{
			"test": map[string]any{
				"options": map[string]any{
					"active": false,
				},
			},
		},
		"options": map[string]any{
			"base": "https://api.payconex.net/",
			"auth": map[string]any{
				"prefix": "Basic",
			},
			"headers": map[string]any{
				"content-type": "application/json",
			},
			"entity": map[string]any{
				"account_updater": map[string]any{},
				"account_updater_schedule": map[string]any{},
				"account_updater_schedule_with_result": map[string]any{},
				"account_updater_subscription_with_result": map[string]any{},
				"account_updater_update": map[string]any{},
				"api_key": map[string]any{},
				"apple_pay_merchant_detail": map[string]any{},
				"apple_pay_session": map[string]any{},
				"dynamic_descriptor": map[string]any{},
				"i_frame_create_instance": map[string]any{},
				"i_frame_instance": map[string]any{},
				"iframe": map[string]any{},
				"init": map[string]any{},
				"list_api_key_scopes_entry": map[string]any{},
				"payment_iframe": map[string]any{},
				"three_d_secure_auth": map[string]any{},
				"three_d_secure_browser_init": map[string]any{},
				"three_d_secure_status": map[string]any{},
				"transaction_detail": map[string]any{},
				"webhook": map[string]any{},
			},
		},
		"entity": map[string]any{
			"account_updater": map[string]any{
				"fields": []any{},
				"name": "account_updater",
				"op": map[string]any{
					"remove": map[string]any{
						"input": "data",
						"name": "remove",
						"points": []any{
							map[string]any{
								"active": true,
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"active": true,
											"example": 120615523104,
											"kind": "param",
											"name": "account_id",
											"orig": "account",
											"reqd": true,
											"type": "`$STRING`",
											"index$": 0,
										},
										map[string]any{
											"active": true,
											"example": 120615523104,
											"kind": "param",
											"name": "record_id",
											"orig": "record_id",
											"reqd": true,
											"type": "`$STRING`",
											"index$": 1,
										},
										map[string]any{
											"active": true,
											"example": 120615523104,
											"kind": "param",
											"name": "subscription_id",
											"orig": "subscription_id",
											"reqd": true,
											"type": "`$STRING`",
											"index$": 2,
										},
									},
								},
								"method": "DELETE",
								"orig": "/api/v4/accounts/{account}/account-updater/subscriptions/{subscriptionId}/records/{recordId}",
								"parts": []any{
									"api",
									"v4",
									"accounts",
									"{account_id}",
									"account-updater",
									"subscriptions",
									"{subscription_id}",
									"records",
									"{record_id}",
								},
								"rename": map[string]any{
									"param": map[string]any{
										"account": "account_id",
										"recordId": "record_id",
										"subscriptionId": "subscription_id",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"account_id",
										"record_id",
										"subscription_id",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"index$": 0,
							},
							map[string]any{
								"active": true,
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"active": true,
											"example": 120615523104,
											"kind": "param",
											"name": "account_id",
											"orig": "account",
											"reqd": true,
											"type": "`$STRING`",
											"index$": 0,
										},
										map[string]any{
											"active": true,
											"example": 120615523104,
											"kind": "param",
											"name": "subscription_id",
											"orig": "subscription_id",
											"reqd": true,
											"type": "`$STRING`",
											"index$": 1,
										},
									},
								},
								"method": "DELETE",
								"orig": "/api/v4/accounts/{account}/account-updater/subscriptions/{subscriptionId}",
								"parts": []any{
									"api",
									"v4",
									"accounts",
									"{account_id}",
									"account-updater",
									"subscriptions",
									"{subscription_id}",
								},
								"rename": map[string]any{
									"param": map[string]any{
										"account": "account_id",
										"subscriptionId": "subscription_id",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"account_id",
										"subscription_id",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"index$": 1,
							},
						},
						"key$": "remove",
					},
				},
				"relations": map[string]any{
					"ancestors": []any{
						[]any{
							"account",
							"subscription",
						},
						[]any{
							"account",
							"subscription",
							"record",
						},
					},
				},
			},
			"account_updater_schedule": map[string]any{
				"fields": []any{
					map[string]any{
						"active": true,
						"name": "enabled",
						"req": false,
						"type": "`$BOOLEAN`",
						"index$": 0,
					},
					map[string]any{
						"active": true,
						"name": "period_date",
						"req": false,
						"type": "`$STRING`",
						"index$": 1,
					},
					map[string]any{
						"active": true,
						"name": "period_id",
						"req": true,
						"type": "`$STRING`",
						"index$": 2,
					},
					map[string]any{
						"active": true,
						"name": "response_format",
						"req": false,
						"type": "`$STRING`",
						"index$": 3,
					},
					map[string]any{
						"active": true,
						"name": "token",
						"req": true,
						"type": "`$ARRAY`",
						"index$": 4,
					},
				},
				"name": "account_updater_schedule",
				"op": map[string]any{
					"create": map[string]any{
						"input": "data",
						"name": "create",
						"points": []any{
							map[string]any{
								"active": true,
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"active": true,
											"example": "120615523104",
											"kind": "param",
											"name": "account_id",
											"orig": "account_id",
											"reqd": true,
											"type": "`$STRING`",
											"index$": 0,
										},
									},
								},
								"method": "POST",
								"orig": "/api/v4/accounts/{accountId}/account-updater/payconex/subscribe",
								"parts": []any{
									"api",
									"v4",
									"accounts",
									"{account_id}",
									"account-updater",
									"payconex",
									"subscribe",
								},
								"rename": map[string]any{
									"param": map[string]any{
										"accountId": "account_id",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"account_id",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"index$": 0,
							},
						},
						"key$": "create",
					},
				},
				"relations": map[string]any{
					"ancestors": []any{
						[]any{
							"account",
						},
					},
				},
			},
			"account_updater_schedule_with_result": map[string]any{
				"fields": []any{
					map[string]any{
						"active": true,
						"name": "card",
						"req": true,
						"type": "`$ARRAY`",
						"index$": 0,
					},
					map[string]any{
						"active": true,
						"name": "created_at",
						"req": true,
						"type": "`$STRING`",
						"index$": 1,
					},
					map[string]any{
						"active": true,
						"name": "enabled",
						"op": map[string]any{
							"list": map[string]any{
								"req": true,
								"type": "`$BOOLEAN`",
							},
						},
						"req": false,
						"type": "`$BOOLEAN`",
						"index$": 2,
					},
					map[string]any{
						"active": true,
						"name": "expiry",
						"req": false,
						"type": "`$STRING`",
						"index$": 3,
					},
					map[string]any{
						"active": true,
						"name": "id",
						"req": true,
						"type": "`$STRING`",
						"index$": 4,
					},
					map[string]any{
						"active": true,
						"name": "most_recent_update",
						"req": false,
						"type": "`$OBJECT`",
						"index$": 5,
					},
					map[string]any{
						"active": true,
						"name": "period_date",
						"req": false,
						"type": "`$STRING`",
						"index$": 6,
					},
					map[string]any{
						"active": true,
						"name": "period_id",
						"req": true,
						"type": "`$STRING`",
						"index$": 7,
					},
					map[string]any{
						"active": true,
						"name": "response_format",
						"req": false,
						"type": "`$STRING`",
						"index$": 8,
					},
					map[string]any{
						"active": true,
						"name": "token",
						"req": true,
						"type": "`$ARRAY`",
						"index$": 9,
					},
					map[string]any{
						"active": true,
						"name": "type",
						"req": true,
						"type": "`$STRING`",
						"index$": 10,
					},
					map[string]any{
						"active": true,
						"name": "updated_at",
						"req": true,
						"type": "`$STRING`",
						"index$": 11,
					},
				},
				"name": "account_updater_schedule_with_result",
				"op": map[string]any{
					"create": map[string]any{
						"input": "data",
						"name": "create",
						"points": []any{
							map[string]any{
								"active": true,
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"active": true,
											"example": "120615523104",
											"kind": "param",
											"name": "account_id",
											"orig": "account_id",
											"reqd": true,
											"type": "`$STRING`",
											"index$": 0,
										},
									},
								},
								"method": "POST",
								"orig": "/api/v4/accounts/{accountId}/account-updater/pan/subscribe",
								"parts": []any{
									"api",
									"v4",
									"accounts",
									"{account_id}",
									"account-updater",
									"pan",
									"subscribe",
								},
								"rename": map[string]any{
									"param": map[string]any{
										"accountId": "account_id",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"account_id",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"index$": 0,
							},
							map[string]any{
								"active": true,
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"active": true,
											"example": "120615523104",
											"kind": "param",
											"name": "account_id",
											"orig": "account_id",
											"reqd": true,
											"type": "`$STRING`",
											"index$": 0,
										},
									},
								},
								"method": "POST",
								"orig": "/api/v4/accounts/{accountId}/account-updater/shieldconex/subscribe",
								"parts": []any{
									"api",
									"v4",
									"accounts",
									"{account_id}",
									"account-updater",
									"shieldconex",
									"subscribe",
								},
								"rename": map[string]any{
									"param": map[string]any{
										"accountId": "account_id",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"account_id",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"index$": 1,
							},
						},
						"key$": "create",
					},
					"list": map[string]any{
						"input": "data",
						"name": "list",
						"points": []any{
							map[string]any{
								"active": true,
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"active": true,
											"example": 120615523104,
											"kind": "param",
											"name": "account_id",
											"orig": "account",
											"reqd": true,
											"type": "`$STRING`",
											"index$": 0,
										},
										map[string]any{
											"active": true,
											"example": "css_42ffe2fd59e74d719970f1c966430323",
											"kind": "param",
											"name": "schedule_id",
											"orig": "schedule_id",
											"reqd": true,
											"type": "`$STRING`",
											"index$": 1,
										},
									},
								},
								"method": "GET",
								"orig": "/api/v4/accounts/{account}/account-updater/schedules/{scheduleId}/results",
								"parts": []any{
									"api",
									"v4",
									"accounts",
									"{account_id}",
									"account-updater",
									"schedules",
									"{schedule_id}",
									"results",
								},
								"rename": map[string]any{
									"param": map[string]any{
										"account": "account_id",
										"scheduleId": "schedule_id",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"account_id",
										"schedule_id",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"index$": 0,
							},
						},
						"key$": "list",
					},
				},
				"relations": map[string]any{
					"ancestors": []any{
						[]any{
							"account",
						},
						[]any{
							"account",
							"schedule",
						},
					},
				},
			},
			"account_updater_subscription_with_result": map[string]any{
				"fields": []any{
					map[string]any{
						"active": true,
						"name": "created_at",
						"req": false,
						"type": "`$STRING`",
						"index$": 0,
					},
					map[string]any{
						"active": true,
						"name": "enabled",
						"req": false,
						"type": "`$BOOLEAN`",
						"index$": 1,
					},
					map[string]any{
						"active": true,
						"name": "id",
						"req": false,
						"type": "`$STRING`",
						"index$": 2,
					},
					map[string]any{
						"active": true,
						"name": "period_date",
						"req": false,
						"type": "`$STRING`",
						"index$": 3,
					},
					map[string]any{
						"active": true,
						"name": "period_id",
						"req": false,
						"type": "`$STRING`",
						"index$": 4,
					},
					map[string]any{
						"active": true,
						"name": "record",
						"req": false,
						"type": "`$ARRAY`",
						"index$": 5,
					},
					map[string]any{
						"active": true,
						"name": "response_format",
						"req": false,
						"type": "`$STRING`",
						"index$": 6,
					},
					map[string]any{
						"active": true,
						"name": "template_ref",
						"req": false,
						"type": "`$STRING`",
						"index$": 7,
					},
					map[string]any{
						"active": true,
						"name": "updated_at",
						"req": false,
						"type": "`$STRING`",
						"index$": 8,
					},
				},
				"name": "account_updater_subscription_with_result",
				"op": map[string]any{
					"create": map[string]any{
						"input": "data",
						"name": "create",
						"points": []any{
							map[string]any{
								"active": true,
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"active": true,
											"example": 120615523104,
											"kind": "param",
											"name": "account_id",
											"orig": "account",
											"reqd": true,
											"type": "`$STRING`",
											"index$": 0,
										},
										map[string]any{
											"active": true,
											"example": "css_42ffe2fd59e74d719970f1c966430323",
											"kind": "param",
											"name": "subscription_id",
											"orig": "subscription_id",
											"reqd": true,
											"type": "`$STRING`",
											"index$": 1,
										},
									},
								},
								"method": "POST",
								"orig": "/api/v4/accounts/{account}/account-updater/subscriptions/{subscriptionId}/pan",
								"parts": []any{
									"api",
									"v4",
									"accounts",
									"{account_id}",
									"account-updater",
									"subscriptions",
									"{subscription_id}",
									"pan",
								},
								"rename": map[string]any{
									"param": map[string]any{
										"account": "account_id",
										"subscriptionId": "subscription_id",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"account_id",
										"subscription_id",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"index$": 0,
							},
							map[string]any{
								"active": true,
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"active": true,
											"example": 120615523104,
											"kind": "param",
											"name": "account_id",
											"orig": "account",
											"reqd": true,
											"type": "`$STRING`",
											"index$": 0,
										},
										map[string]any{
											"active": true,
											"example": "css_42ffe2fd59e74d719970f1c966430323",
											"kind": "param",
											"name": "subscription_id",
											"orig": "subscription_id",
											"reqd": true,
											"type": "`$STRING`",
											"index$": 1,
										},
									},
								},
								"method": "POST",
								"orig": "/api/v4/accounts/{account}/account-updater/subscriptions/{subscriptionId}/payconex",
								"parts": []any{
									"api",
									"v4",
									"accounts",
									"{account_id}",
									"account-updater",
									"subscriptions",
									"{subscription_id}",
									"payconex",
								},
								"rename": map[string]any{
									"param": map[string]any{
										"account": "account_id",
										"subscriptionId": "subscription_id",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"account_id",
										"subscription_id",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"index$": 1,
							},
							map[string]any{
								"active": true,
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"active": true,
											"example": 120615523104,
											"kind": "param",
											"name": "account_id",
											"orig": "account",
											"reqd": true,
											"type": "`$STRING`",
											"index$": 0,
										},
										map[string]any{
											"active": true,
											"example": "css_42ffe2fd59e74d719970f1c966430323",
											"kind": "param",
											"name": "subscription_id",
											"orig": "subscription_id",
											"reqd": true,
											"type": "`$STRING`",
											"index$": 1,
										},
									},
								},
								"method": "POST",
								"orig": "/api/v4/accounts/{account}/account-updater/subscriptions/{subscriptionId}/shieldconex",
								"parts": []any{
									"api",
									"v4",
									"accounts",
									"{account_id}",
									"account-updater",
									"subscriptions",
									"{subscription_id}",
									"shieldconex",
								},
								"rename": map[string]any{
									"param": map[string]any{
										"account": "account_id",
										"subscriptionId": "subscription_id",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"account_id",
										"subscription_id",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"index$": 2,
							},
						},
						"key$": "create",
					},
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"active": true,
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"active": true,
											"example": 120615523104,
											"kind": "param",
											"name": "account_id",
											"orig": "account",
											"reqd": true,
											"type": "`$STRING`",
											"index$": 0,
										},
										map[string]any{
											"active": true,
											"example": "css_42ffe2fd59e74d719970f1c966430323",
											"kind": "param",
											"name": "subscription_id",
											"orig": "subscription_id",
											"reqd": true,
											"type": "`$STRING`",
											"index$": 1,
										},
									},
								},
								"method": "GET",
								"orig": "/api/v4/accounts/{account}/account-updater/subscriptions/{subscriptionId}",
								"parts": []any{
									"api",
									"v4",
									"accounts",
									"{account_id}",
									"account-updater",
									"subscriptions",
									"{subscription_id}",
								},
								"rename": map[string]any{
									"param": map[string]any{
										"account": "account_id",
										"subscriptionId": "subscription_id",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"account_id",
										"subscription_id",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"index$": 0,
							},
						},
						"key$": "load",
					},
					"update": map[string]any{
						"input": "data",
						"name": "update",
						"points": []any{
							map[string]any{
								"active": true,
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"active": true,
											"example": 120615523104,
											"kind": "param",
											"name": "account_id",
											"orig": "account",
											"reqd": true,
											"type": "`$STRING`",
											"index$": 0,
										},
										map[string]any{
											"active": true,
											"example": "css_42ffe2fd59e74d719970f1c966430323",
											"kind": "param",
											"name": "subscription_id",
											"orig": "subscription_id",
											"reqd": true,
											"type": "`$STRING`",
											"index$": 1,
										},
									},
								},
								"method": "PATCH",
								"orig": "/api/v4/accounts/{account}/account-updater/subscriptions/{subscriptionId}",
								"parts": []any{
									"api",
									"v4",
									"accounts",
									"{account_id}",
									"account-updater",
									"subscriptions",
									"{subscription_id}",
								},
								"rename": map[string]any{
									"param": map[string]any{
										"account": "account_id",
										"subscriptionId": "subscription_id",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"account_id",
										"subscription_id",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"index$": 0,
							},
						},
						"key$": "update",
					},
				},
				"relations": map[string]any{
					"ancestors": []any{
						[]any{
							"account",
							"subscription",
						},
					},
				},
			},
			"account_updater_update": map[string]any{
				"fields": []any{
					map[string]any{
						"active": true,
						"name": "account_updater_schedule_record_id",
						"req": false,
						"type": "`$STRING`",
						"index$": 0,
					},
					map[string]any{
						"active": true,
						"name": "format",
						"req": false,
						"type": "`$STRING`",
						"index$": 1,
					},
					map[string]any{
						"active": true,
						"name": "id",
						"req": false,
						"type": "`$STRING`",
						"index$": 2,
					},
					map[string]any{
						"active": true,
						"name": "new_expiry",
						"req": false,
						"type": "`$STRING`",
						"index$": 3,
					},
					map[string]any{
						"active": true,
						"name": "new_token",
						"req": false,
						"type": "`$STRING`",
						"index$": 4,
					},
					map[string]any{
						"active": true,
						"name": "old_expiry",
						"req": false,
						"type": "`$STRING`",
						"index$": 5,
					},
					map[string]any{
						"active": true,
						"name": "old_token",
						"req": false,
						"type": "`$STRING`",
						"index$": 6,
					},
					map[string]any{
						"active": true,
						"name": "recurring_schedule",
						"req": false,
						"type": "`$ARRAY`",
						"index$": 7,
					},
					map[string]any{
						"active": true,
						"name": "status",
						"req": false,
						"type": "`$STRING`",
						"index$": 8,
					},
					map[string]any{
						"active": true,
						"name": "update_id",
						"req": false,
						"type": "`$STRING`",
						"index$": 9,
					},
					map[string]any{
						"active": true,
						"name": "updated_at",
						"req": false,
						"type": "`$STRING`",
						"index$": 10,
					},
				},
				"name": "account_updater_update",
				"op": map[string]any{
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"active": true,
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"active": true,
											"example": 120615523104,
											"kind": "param",
											"name": "account_id",
											"orig": "account",
											"reqd": true,
											"type": "`$STRING`",
											"index$": 0,
										},
										map[string]any{
											"active": true,
											"example": 120615523104,
											"kind": "param",
											"name": "id",
											"orig": "update_id",
											"reqd": true,
											"type": "`$STRING`",
											"index$": 1,
										},
									},
								},
								"method": "GET",
								"orig": "/api/v4/accounts/{account}/account-updater/updates/{updateId}",
								"parts": []any{
									"api",
									"v4",
									"accounts",
									"{account_id}",
									"account-updater",
									"updates",
									"{id}",
								},
								"rename": map[string]any{
									"param": map[string]any{
										"account": "account_id",
										"updateId": "id",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"account_id",
										"id",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"index$": 0,
							},
						},
						"key$": "load",
					},
				},
				"relations": map[string]any{
					"ancestors": []any{
						[]any{
							"account",
						},
					},
				},
			},
			"api_key": map[string]any{
				"fields": []any{
					map[string]any{
						"active": true,
						"name": "account",
						"req": false,
						"type": "`$ARRAY`",
						"index$": 0,
					},
					map[string]any{
						"active": true,
						"name": "enabled",
						"req": false,
						"type": "`$BOOLEAN`",
						"index$": 1,
					},
					map[string]any{
						"active": true,
						"name": "expires_at",
						"req": false,
						"type": "`$STRING`",
						"index$": 2,
					},
					map[string]any{
						"active": true,
						"name": "expires_in",
						"req": false,
						"type": "`$STRING`",
						"index$": 3,
					},
					map[string]any{
						"active": true,
						"name": "id",
						"req": false,
						"type": "`$STRING`",
						"index$": 4,
					},
					map[string]any{
						"active": true,
						"name": "label",
						"op": map[string]any{
							"create": map[string]any{
								"req": true,
								"type": "`$STRING`",
							},
						},
						"req": false,
						"type": "`$STRING`",
						"index$": 5,
					},
					map[string]any{
						"active": true,
						"name": "method",
						"req": false,
						"type": "`$ARRAY`",
						"index$": 6,
					},
					map[string]any{
						"active": true,
						"name": "scope",
						"op": map[string]any{
							"create": map[string]any{
								"req": true,
								"type": "`$ARRAY`",
							},
						},
						"req": false,
						"type": "`$ARRAY`",
						"index$": 7,
					},
					map[string]any{
						"active": true,
						"name": "secret",
						"req": false,
						"type": "`$STRING`",
						"index$": 8,
					},
				},
				"name": "api_key",
				"op": map[string]any{
					"create": map[string]any{
						"input": "data",
						"name": "create",
						"points": []any{
							map[string]any{
								"active": true,
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"active": true,
											"example": "120615523104",
											"kind": "param",
											"name": "account_id",
											"orig": "account_id",
											"reqd": true,
											"type": "`$STRING`",
											"index$": 0,
										},
									},
								},
								"method": "POST",
								"orig": "/api/v4/accounts/{accountId}/api-keys",
								"parts": []any{
									"api",
									"v4",
									"accounts",
									"{account_id}",
									"api-keys",
								},
								"rename": map[string]any{
									"param": map[string]any{
										"accountId": "account_id",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"account_id",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"index$": 0,
							},
						},
						"key$": "create",
					},
					"list": map[string]any{
						"input": "data",
						"name": "list",
						"points": []any{
							map[string]any{
								"active": true,
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"active": true,
											"example": 180000027666,
											"kind": "param",
											"name": "account_id",
											"orig": "account_id",
											"reqd": true,
											"type": "`$STRING`",
											"index$": 0,
										},
									},
									"query": []any{
										map[string]any{
											"active": true,
											"example": 25,
											"kind": "query",
											"name": "limit",
											"orig": "limit",
											"reqd": false,
											"type": "`$INTEGER`",
										},
										map[string]any{
											"active": true,
											"example": 5,
											"kind": "query",
											"name": "page",
											"orig": "page",
											"reqd": false,
											"type": "`$INTEGER`",
										},
										map[string]any{
											"active": true,
											"example": "words to search",
											"kind": "query",
											"name": "query",
											"orig": "query",
											"reqd": false,
											"type": "`$STRING`",
										},
									},
								},
								"method": "GET",
								"orig": "/api/v4/accounts/{accountId}/api-keys",
								"parts": []any{
									"api",
									"v4",
									"accounts",
									"{account_id}",
									"api-keys",
								},
								"rename": map[string]any{
									"param": map[string]any{
										"accountId": "account_id",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"account_id",
										"limit",
										"page",
										"query",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"index$": 0,
							},
						},
						"key$": "list",
					},
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"active": true,
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"active": true,
											"example": 180000027666,
											"kind": "param",
											"name": "account_id",
											"orig": "account_id",
											"reqd": true,
											"type": "`$STRING`",
											"index$": 0,
										},
										map[string]any{
											"active": true,
											"example": "api_d193148ac2624de7b43a191682a8822f",
											"kind": "param",
											"name": "id",
											"orig": "resource_id",
											"reqd": true,
											"type": "`$STRING`",
											"index$": 1,
										},
									},
								},
								"method": "GET",
								"orig": "/api/v4/accounts/{accountId}/api-keys/{resourceId}",
								"parts": []any{
									"api",
									"v4",
									"accounts",
									"{account_id}",
									"api-keys",
									"{id}",
								},
								"rename": map[string]any{
									"param": map[string]any{
										"accountId": "account_id",
										"resourceId": "id",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"account_id",
										"id",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"index$": 0,
							},
						},
						"key$": "load",
					},
					"remove": map[string]any{
						"input": "data",
						"name": "remove",
						"points": []any{
							map[string]any{
								"active": true,
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"active": true,
											"example": 180000027666,
											"kind": "param",
											"name": "account_id",
											"orig": "account_id",
											"reqd": true,
											"type": "`$STRING`",
											"index$": 0,
										},
										map[string]any{
											"active": true,
											"example": "api_d193148ac2624de7b43a191682a8822f",
											"kind": "param",
											"name": "id",
											"orig": "resource_id",
											"reqd": true,
											"type": "`$STRING`",
											"index$": 1,
										},
									},
								},
								"method": "DELETE",
								"orig": "/api/v4/accounts/{accountId}/api-keys/{resourceId}",
								"parts": []any{
									"api",
									"v4",
									"accounts",
									"{account_id}",
									"api-keys",
									"{id}",
								},
								"rename": map[string]any{
									"param": map[string]any{
										"accountId": "account_id",
										"resourceId": "id",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"account_id",
										"id",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"index$": 0,
							},
						},
						"key$": "remove",
					},
					"update": map[string]any{
						"input": "data",
						"name": "update",
						"points": []any{
							map[string]any{
								"active": true,
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"active": true,
											"example": 180000027666,
											"kind": "param",
											"name": "account_id",
											"orig": "account_id",
											"reqd": true,
											"type": "`$STRING`",
											"index$": 0,
										},
										map[string]any{
											"active": true,
											"example": "api_d193148ac2624de7b43a191682a8822f",
											"kind": "param",
											"name": "id",
											"orig": "resource_id",
											"reqd": true,
											"type": "`$STRING`",
											"index$": 1,
										},
									},
								},
								"method": "PATCH",
								"orig": "/api/v4/accounts/{accountId}/api-keys/{resourceId}",
								"parts": []any{
									"api",
									"v4",
									"accounts",
									"{account_id}",
									"api-keys",
									"{id}",
								},
								"rename": map[string]any{
									"param": map[string]any{
										"accountId": "account_id",
										"resourceId": "id",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"account_id",
										"id",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"index$": 0,
							},
						},
						"key$": "update",
					},
				},
				"relations": map[string]any{
					"ancestors": []any{
						[]any{
							"account",
						},
					},
				},
			},
			"apple_pay_merchant_detail": map[string]any{
				"fields": []any{
					map[string]any{
						"active": true,
						"name": "domain",
						"req": true,
						"type": "`$ARRAY`",
						"index$": 0,
					},
					map[string]any{
						"active": true,
						"name": "merchant_url",
						"op": map[string]any{
							"create": map[string]any{
								"req": false,
								"type": "`$STRING`",
							},
						},
						"req": true,
						"type": "`$STRING`",
						"index$": 1,
					},
					map[string]any{
						"active": true,
						"name": "partner_merchant_name",
						"req": false,
						"type": "`$STRING`",
						"index$": 2,
					},
					map[string]any{
						"active": true,
						"name": "payconex_account_id",
						"req": true,
						"type": "`$STRING`",
						"index$": 3,
					},
				},
				"name": "apple_pay_merchant_detail",
				"op": map[string]any{
					"create": map[string]any{
						"input": "data",
						"name": "create",
						"points": []any{
							map[string]any{
								"active": true,
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"active": true,
											"kind": "param",
											"name": "account_id",
											"orig": "account_id",
											"reqd": true,
											"type": "`$INTEGER`",
											"index$": 0,
										},
									},
								},
								"method": "POST",
								"orig": "/api/v4/accounts/{accountId}/applePay/enrollment",
								"parts": []any{
									"api",
									"v4",
									"accounts",
									"{account_id}",
									"applePay",
									"enrollment",
								},
								"rename": map[string]any{
									"param": map[string]any{
										"accountId": "account_id",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"account_id",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"index$": 0,
							},
						},
						"key$": "create",
					},
					"list": map[string]any{
						"input": "data",
						"name": "list",
						"points": []any{
							map[string]any{
								"active": true,
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"active": true,
											"kind": "param",
											"name": "account_id",
											"orig": "account_id",
											"reqd": true,
											"type": "`$INTEGER`",
											"index$": 0,
										},
									},
								},
								"method": "GET",
								"orig": "/api/v4/accounts/{accountId}/applePay/enrollment",
								"parts": []any{
									"api",
									"v4",
									"accounts",
									"{account_id}",
									"applePay",
									"enrollment",
								},
								"rename": map[string]any{
									"param": map[string]any{
										"accountId": "account_id",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"account_id",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"index$": 0,
							},
						},
						"key$": "list",
					},
				},
				"relations": map[string]any{
					"ancestors": []any{
						[]any{
							"account",
						},
					},
				},
			},
			"apple_pay_session": map[string]any{
				"fields": []any{
					map[string]any{
						"active": true,
						"name": "display_name",
						"req": false,
						"type": "`$STRING`",
						"index$": 0,
					},
					map[string]any{
						"active": true,
						"name": "domain_name",
						"req": false,
						"type": "`$STRING`",
						"index$": 1,
					},
					map[string]any{
						"active": true,
						"name": "epoch_timestamp",
						"req": false,
						"type": "`$INTEGER`",
						"index$": 2,
					},
					map[string]any{
						"active": true,
						"name": "expires_at",
						"req": false,
						"type": "`$INTEGER`",
						"index$": 3,
					},
					map[string]any{
						"active": true,
						"name": "merchant_identifier",
						"req": false,
						"type": "`$STRING`",
						"index$": 4,
					},
					map[string]any{
						"active": true,
						"name": "merchant_session_identifier",
						"req": false,
						"type": "`$STRING`",
						"index$": 5,
					},
					map[string]any{
						"active": true,
						"name": "nonce",
						"req": false,
						"type": "`$INTEGER`",
						"index$": 6,
					},
					map[string]any{
						"active": true,
						"name": "operational_analytics_identifier",
						"req": false,
						"type": "`$STRING`",
						"index$": 7,
					},
					map[string]any{
						"active": true,
						"name": "referrer",
						"req": true,
						"type": "`$STRING`",
						"index$": 8,
					},
					map[string]any{
						"active": true,
						"name": "retry",
						"req": false,
						"type": "`$INTEGER`",
						"index$": 9,
					},
					map[string]any{
						"active": true,
						"name": "signature",
						"req": false,
						"type": "`$STRING`",
						"index$": 10,
					},
				},
				"name": "apple_pay_session",
				"op": map[string]any{
					"create": map[string]any{
						"input": "data",
						"name": "create",
						"points": []any{
							map[string]any{
								"active": true,
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"active": true,
											"kind": "param",
											"name": "account_id",
											"orig": "account_id",
											"reqd": true,
											"type": "`$INTEGER`",
											"index$": 0,
										},
									},
								},
								"method": "POST",
								"orig": "/api/v4/accounts/{accountId}/applePay/session",
								"parts": []any{
									"api",
									"v4",
									"accounts",
									"{account_id}",
									"applePay",
									"session",
								},
								"rename": map[string]any{
									"param": map[string]any{
										"accountId": "account_id",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"account_id",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"index$": 0,
							},
						},
						"key$": "create",
					},
				},
				"relations": map[string]any{
					"ancestors": []any{
						[]any{
							"account",
						},
					},
				},
			},
			"dynamic_descriptor": map[string]any{
				"fields": []any{
					map[string]any{
						"active": true,
						"name": "city",
						"req": false,
						"type": "`$STRING`",
						"index$": 0,
					},
					map[string]any{
						"active": true,
						"name": "descriptor",
						"req": false,
						"type": "`$STRING`",
						"index$": 1,
					},
					map[string]any{
						"active": true,
						"name": "id",
						"req": false,
						"type": "`$STRING`",
						"index$": 2,
					},
					map[string]any{
						"active": true,
						"name": "name",
						"req": false,
						"type": "`$STRING`",
						"index$": 3,
					},
					map[string]any{
						"active": true,
						"name": "state",
						"req": false,
						"type": "`$STRING`",
						"index$": 4,
					},
				},
				"name": "dynamic_descriptor",
				"op": map[string]any{
					"create": map[string]any{
						"input": "data",
						"name": "create",
						"points": []any{
							map[string]any{
								"active": true,
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"active": true,
											"example": 180000027666,
											"kind": "param",
											"name": "account_id",
											"orig": "account_id",
											"reqd": true,
											"type": "`$STRING`",
											"index$": 0,
										},
									},
								},
								"method": "POST",
								"orig": "/api/v4/accounts/{accountId}/dynamic_descriptors",
								"parts": []any{
									"api",
									"v4",
									"accounts",
									"{account_id}",
									"dynamic_descriptors",
								},
								"rename": map[string]any{
									"param": map[string]any{
										"accountId": "account_id",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"account_id",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"index$": 0,
							},
						},
						"key$": "create",
					},
					"list": map[string]any{
						"input": "data",
						"name": "list",
						"points": []any{
							map[string]any{
								"active": true,
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"active": true,
											"example": 180000027666,
											"kind": "param",
											"name": "account_id",
											"orig": "account_id",
											"reqd": true,
											"type": "`$STRING`",
											"index$": 0,
										},
									},
									"query": []any{
										map[string]any{
											"active": true,
											"example": 25,
											"kind": "query",
											"name": "limit",
											"orig": "limit",
											"reqd": false,
											"type": "`$INTEGER`",
										},
										map[string]any{
											"active": true,
											"example": 5,
											"kind": "query",
											"name": "page",
											"orig": "page",
											"reqd": false,
											"type": "`$INTEGER`",
										},
										map[string]any{
											"active": true,
											"example": "words to search",
											"kind": "query",
											"name": "query",
											"orig": "query",
											"reqd": false,
											"type": "`$STRING`",
										},
									},
								},
								"method": "GET",
								"orig": "/api/v4/accounts/{accountId}/dynamic_descriptors",
								"parts": []any{
									"api",
									"v4",
									"accounts",
									"{account_id}",
									"dynamic_descriptors",
								},
								"rename": map[string]any{
									"param": map[string]any{
										"accountId": "account_id",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"account_id",
										"limit",
										"page",
										"query",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"index$": 0,
							},
						},
						"key$": "list",
					},
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"active": true,
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"active": true,
											"example": 180000027666,
											"kind": "param",
											"name": "account_id",
											"orig": "account_id",
											"reqd": true,
											"type": "`$STRING`",
											"index$": 0,
										},
										map[string]any{
											"active": true,
											"example": "ddesc_1669911404412ae74cd5eef8f463495d6b",
											"kind": "param",
											"name": "id",
											"orig": "id",
											"reqd": true,
											"type": "`$STRING`",
											"index$": 1,
										},
									},
								},
								"method": "GET",
								"orig": "/api/v4/accounts/{accountId}/dynamic_descriptors/{id}",
								"parts": []any{
									"api",
									"v4",
									"accounts",
									"{account_id}",
									"dynamic_descriptors",
									"{id}",
								},
								"rename": map[string]any{
									"param": map[string]any{
										"accountId": "account_id",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"account_id",
										"id",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"index$": 0,
							},
						},
						"key$": "load",
					},
					"remove": map[string]any{
						"input": "data",
						"name": "remove",
						"points": []any{
							map[string]any{
								"active": true,
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"active": true,
											"example": 180000027666,
											"kind": "param",
											"name": "account_id",
											"orig": "account_id",
											"reqd": true,
											"type": "`$STRING`",
											"index$": 0,
										},
										map[string]any{
											"active": true,
											"example": "ddesc_1669911404412ae74cd5eef8f463495d6b",
											"kind": "param",
											"name": "id",
											"orig": "id",
											"reqd": true,
											"type": "`$STRING`",
											"index$": 1,
										},
									},
								},
								"method": "DELETE",
								"orig": "/api/v4/accounts/{accountId}/dynamic_descriptors/{id}",
								"parts": []any{
									"api",
									"v4",
									"accounts",
									"{account_id}",
									"dynamic_descriptors",
									"{id}",
								},
								"rename": map[string]any{
									"param": map[string]any{
										"accountId": "account_id",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"account_id",
										"id",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"index$": 0,
							},
						},
						"key$": "remove",
					},
					"update": map[string]any{
						"input": "data",
						"name": "update",
						"points": []any{
							map[string]any{
								"active": true,
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"active": true,
											"example": 180000027666,
											"kind": "param",
											"name": "account_id",
											"orig": "account_id",
											"reqd": true,
											"type": "`$STRING`",
											"index$": 0,
										},
										map[string]any{
											"active": true,
											"example": "ddesc_1669911404412ae74cd5eef8f463495d6b",
											"kind": "param",
											"name": "id",
											"orig": "id",
											"reqd": true,
											"type": "`$STRING`",
											"index$": 1,
										},
									},
								},
								"method": "PATCH",
								"orig": "/api/v4/accounts/{accountId}/dynamic_descriptors/{id}",
								"parts": []any{
									"api",
									"v4",
									"accounts",
									"{account_id}",
									"dynamic_descriptors",
									"{id}",
								},
								"rename": map[string]any{
									"param": map[string]any{
										"accountId": "account_id",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"account_id",
										"id",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"index$": 0,
							},
						},
						"key$": "update",
					},
				},
				"relations": map[string]any{
					"ancestors": []any{
						[]any{
							"account",
						},
					},
				},
			},
			"i_frame_create_instance": map[string]any{
				"fields": []any{
					map[string]any{
						"active": true,
						"name": "amount",
						"req": false,
						"type": "`$STRING`",
						"index$": 0,
					},
					map[string]any{
						"active": true,
						"name": "currency",
						"req": false,
						"type": "`$STRING`",
						"index$": 1,
					},
					map[string]any{
						"active": true,
						"name": "customer",
						"req": false,
						"type": "`$OBJECT`",
						"index$": 2,
					},
					map[string]any{
						"active": true,
						"name": "initialize_transaction",
						"req": false,
						"type": "`$BOOLEAN`",
						"index$": 3,
					},
					map[string]any{
						"active": true,
						"name": "label",
						"req": true,
						"type": "`$STRING`",
						"index$": 4,
					},
					map[string]any{
						"active": true,
						"name": "language",
						"req": false,
						"type": "`$STRING`",
						"index$": 5,
					},
					map[string]any{
						"active": true,
						"name": "reference",
						"req": false,
						"type": "`$STRING`",
						"index$": 6,
					},
					map[string]any{
						"active": true,
						"name": "timeout",
						"req": false,
						"type": "`$NUMBER`",
						"index$": 7,
					},
					map[string]any{
						"active": true,
						"name": "token",
						"req": false,
						"type": "`$ARRAY`",
						"index$": 8,
					},
				},
				"name": "i_frame_create_instance",
				"op": map[string]any{
					"create": map[string]any{
						"input": "data",
						"name": "create",
						"points": []any{
							map[string]any{
								"active": true,
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"active": true,
											"example": 120615523104,
											"kind": "param",
											"name": "account_id",
											"orig": "account_id",
											"reqd": true,
											"type": "`$STRING`",
											"index$": 0,
										},
										map[string]any{
											"active": true,
											"example": "ifr_2a08d8fc30b64a8a9d8b9f0ec37b59c9",
											"kind": "param",
											"name": "payment_iframe_id",
											"orig": "iframe_id",
											"reqd": true,
											"type": "`$STRING`",
											"index$": 1,
										},
									},
								},
								"method": "POST",
								"orig": "/api/v4/accounts/{accountId}/payment-iframe/{iframeId}/instance/init",
								"parts": []any{
									"api",
									"v4",
									"accounts",
									"{account_id}",
									"payment-iframe",
									"{payment_iframe_id}",
									"instance",
									"init",
								},
								"rename": map[string]any{
									"param": map[string]any{
										"accountId": "account_id",
										"iframeId": "payment_iframe_id",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"account_id",
										"payment_iframe_id",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"index$": 0,
							},
						},
						"key$": "create",
					},
				},
				"relations": map[string]any{
					"ancestors": []any{
						[]any{
							"account",
							"payment_iframe",
						},
					},
				},
			},
			"i_frame_instance": map[string]any{
				"fields": []any{},
				"name": "i_frame_instance",
				"op": map[string]any{
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"active": true,
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"active": true,
											"example": 120615523104,
											"kind": "param",
											"name": "account_id",
											"orig": "account_id",
											"reqd": true,
											"type": "`$STRING`",
											"index$": 0,
										},
										map[string]any{
											"active": true,
											"example": "ifri_2a08d8fc30b64a8a9d8b9f0ec37b59c9",
											"kind": "param",
											"name": "id",
											"orig": "iframe_instance_id",
											"reqd": true,
											"type": "`$STRING`",
											"index$": 1,
										},
										map[string]any{
											"active": true,
											"example": "ifr_2a08d8fc30b64a8a9d8b9f0ec37b59c9",
											"kind": "param",
											"name": "payment_iframe_id",
											"orig": "iframe_id",
											"reqd": true,
											"type": "`$STRING`",
											"index$": 2,
										},
									},
								},
								"method": "GET",
								"orig": "/api/v4/accounts/{accountId}/payment-iframe/{iframeId}/instance/{iframeInstanceId}",
								"parts": []any{
									"api",
									"v4",
									"accounts",
									"{account_id}",
									"payment-iframe",
									"{payment_iframe_id}",
									"instance",
									"{id}",
								},
								"rename": map[string]any{
									"param": map[string]any{
										"accountId": "account_id",
										"iframeId": "payment_iframe_id",
										"iframeInstanceId": "id",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"account_id",
										"id",
										"payment_iframe_id",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"index$": 0,
							},
						},
						"key$": "load",
					},
				},
				"relations": map[string]any{
					"ancestors": []any{
						[]any{
							"account",
							"payment_iframe",
						},
					},
				},
			},
			"iframe": map[string]any{
				"fields": []any{
					map[string]any{
						"active": true,
						"name": "ach_setting",
						"req": false,
						"type": "`$OBJECT`",
						"index$": 0,
					},
					map[string]any{
						"active": true,
						"name": "allowed_parent_domain",
						"op": map[string]any{
							"list": map[string]any{
								"req": false,
								"type": "`$ARRAY`",
							},
							"update": map[string]any{
								"req": false,
								"type": "`$ARRAY`",
							},
						},
						"req": true,
						"type": "`$ARRAY`",
						"index$": 1,
					},
					map[string]any{
						"active": true,
						"name": "allowed_payment_method",
						"op": map[string]any{
							"list": map[string]any{
								"req": false,
								"type": "`$ARRAY`",
							},
							"update": map[string]any{
								"req": false,
								"type": "`$ARRAY`",
							},
						},
						"req": true,
						"type": "`$ARRAY`",
						"index$": 2,
					},
					map[string]any{
						"active": true,
						"name": "card_setting",
						"req": false,
						"type": "`$OBJECT`",
						"index$": 3,
					},
					map[string]any{
						"active": true,
						"name": "click_to_pay_setting",
						"req": false,
						"type": "`$OBJECT`",
						"index$": 4,
					},
					map[string]any{
						"active": true,
						"name": "currency",
						"req": false,
						"type": "`$STRING`",
						"index$": 5,
					},
					map[string]any{
						"active": true,
						"name": "id",
						"req": false,
						"type": "`$STRING`",
						"index$": 6,
					},
					map[string]any{
						"active": true,
						"name": "label",
						"op": map[string]any{
							"list": map[string]any{
								"req": false,
								"type": "`$STRING`",
							},
							"update": map[string]any{
								"req": false,
								"type": "`$STRING`",
							},
						},
						"req": true,
						"type": "`$STRING`",
						"index$": 7,
					},
					map[string]any{
						"active": true,
						"name": "language",
						"req": false,
						"type": "`$STRING`",
						"index$": 8,
					},
					map[string]any{
						"active": true,
						"name": "timeout",
						"req": false,
						"type": "`$NUMBER`",
						"index$": 9,
					},
				},
				"name": "iframe",
				"op": map[string]any{
					"create": map[string]any{
						"input": "data",
						"name": "create",
						"points": []any{
							map[string]any{
								"active": true,
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"active": true,
											"example": "120615523104",
											"kind": "param",
											"name": "account_id",
											"orig": "account_id",
											"reqd": true,
											"type": "`$STRING`",
											"index$": 0,
										},
									},
								},
								"method": "POST",
								"orig": "/api/v4/accounts/{accountId}/payment-iframe",
								"parts": []any{
									"api",
									"v4",
									"accounts",
									"{account_id}",
									"payment-iframe",
								},
								"rename": map[string]any{
									"param": map[string]any{
										"accountId": "account_id",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"account_id",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"index$": 0,
							},
						},
						"key$": "create",
					},
					"list": map[string]any{
						"input": "data",
						"name": "list",
						"points": []any{
							map[string]any{
								"active": true,
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"active": true,
											"example": "120615523104",
											"kind": "param",
											"name": "account_id",
											"orig": "account_id",
											"reqd": true,
											"type": "`$STRING`",
											"index$": 0,
										},
									},
								},
								"method": "GET",
								"orig": "/api/v4/accounts/{accountId}/payment-iframe",
								"parts": []any{
									"api",
									"v4",
									"accounts",
									"{account_id}",
									"payment-iframe",
								},
								"rename": map[string]any{
									"param": map[string]any{
										"accountId": "account_id",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"account_id",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"index$": 0,
							},
						},
						"key$": "list",
					},
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"active": true,
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"active": true,
											"example": 120615523104,
											"kind": "param",
											"name": "account_id",
											"orig": "account_id",
											"reqd": true,
											"type": "`$STRING`",
											"index$": 0,
										},
										map[string]any{
											"active": true,
											"example": "ifr_d193148ac2624de7b43a191682a8822f",
											"kind": "param",
											"name": "iframe_id",
											"orig": "iframe_id",
											"reqd": true,
											"type": "`$STRING`",
											"index$": 1,
										},
									},
								},
								"method": "GET",
								"orig": "/api/v4/accounts/{accountId}/payment-iframe/{iframeId}",
								"parts": []any{
									"api",
									"v4",
									"accounts",
									"{account_id}",
									"payment-iframe",
									"{iframe_id}",
								},
								"rename": map[string]any{
									"param": map[string]any{
										"accountId": "account_id",
										"iframeId": "iframe_id",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"account_id",
										"iframe_id",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"index$": 0,
							},
						},
						"key$": "load",
					},
					"update": map[string]any{
						"input": "data",
						"name": "update",
						"points": []any{
							map[string]any{
								"active": true,
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"active": true,
											"example": 120615523104,
											"kind": "param",
											"name": "account_id",
											"orig": "account_id",
											"reqd": true,
											"type": "`$STRING`",
											"index$": 0,
										},
										map[string]any{
											"active": true,
											"example": "ifr_d193148ac2624de7b43a191682a8822f",
											"kind": "param",
											"name": "iframe_id",
											"orig": "iframe_id",
											"reqd": true,
											"type": "`$STRING`",
											"index$": 1,
										},
									},
								},
								"method": "PATCH",
								"orig": "/api/v4/accounts/{accountId}/payment-iframe/{iframeId}",
								"parts": []any{
									"api",
									"v4",
									"accounts",
									"{account_id}",
									"payment-iframe",
									"{iframe_id}",
								},
								"rename": map[string]any{
									"param": map[string]any{
										"accountId": "account_id",
										"iframeId": "iframe_id",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"account_id",
										"iframe_id",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"index$": 0,
							},
						},
						"key$": "update",
					},
				},
				"relations": map[string]any{
					"ancestors": []any{
						[]any{
							"account",
						},
						[]any{
							"account",
							"payment_iframe",
						},
					},
				},
			},
			"init": map[string]any{
				"fields": []any{
					map[string]any{
						"active": true,
						"name": "customer",
						"req": false,
						"type": "`$OBJECT`",
						"index$": 0,
					},
					map[string]any{
						"active": true,
						"name": "description",
						"req": false,
						"type": "`$STRING`",
						"index$": 1,
					},
					map[string]any{
						"active": true,
						"name": "item",
						"req": false,
						"type": "`$ARRAY`",
						"index$": 2,
					},
					map[string]any{
						"active": true,
						"name": "level2",
						"req": false,
						"type": "`$OBJECT`",
						"index$": 3,
					},
					map[string]any{
						"active": true,
						"name": "level3",
						"req": false,
						"type": "`$OBJECT`",
						"index$": 4,
					},
					map[string]any{
						"active": true,
						"name": "shipping_address",
						"req": true,
						"type": "`$OBJECT`",
						"index$": 5,
					},
					map[string]any{
						"active": true,
						"name": "trace",
						"req": false,
						"type": "`$OBJECT`",
						"index$": 6,
					},
				},
				"name": "init",
				"op": map[string]any{
					"create": map[string]any{
						"input": "data",
						"name": "create",
						"points": []any{
							map[string]any{
								"active": true,
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"active": true,
											"example": "120615523104",
											"kind": "param",
											"name": "account_id",
											"orig": "account_id",
											"reqd": true,
											"type": "`$STRING`",
											"index$": 0,
										},
									},
								},
								"method": "POST",
								"orig": "/api/v4/accounts/{accountId}/payments/init",
								"parts": []any{
									"api",
									"v4",
									"accounts",
									"{account_id}",
									"payments",
									"init",
								},
								"rename": map[string]any{
									"param": map[string]any{
										"accountId": "account_id",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"account_id",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"index$": 0,
							},
						},
						"key$": "create",
					},
				},
				"relations": map[string]any{
					"ancestors": []any{
						[]any{
							"account",
						},
					},
				},
			},
			"list_api_key_scopes_entry": map[string]any{
				"fields": []any{
					map[string]any{
						"active": true,
						"name": "category",
						"req": false,
						"type": "`$STRING`",
						"index$": 0,
					},
					map[string]any{
						"active": true,
						"name": "description",
						"req": false,
						"type": "`$STRING`",
						"index$": 1,
					},
					map[string]any{
						"active": true,
						"name": "enabled",
						"req": false,
						"type": "`$BOOLEAN`",
						"index$": 2,
					},
					map[string]any{
						"active": true,
						"name": "level",
						"req": false,
						"type": "`$INTEGER`",
						"index$": 3,
					},
					map[string]any{
						"active": true,
						"name": "scope",
						"req": false,
						"type": "`$STRING`",
						"index$": 4,
					},
				},
				"name": "list_api_key_scopes_entry",
				"op": map[string]any{
					"list": map[string]any{
						"input": "data",
						"name": "list",
						"points": []any{
							map[string]any{
								"active": true,
								"args": map[string]any{},
								"method": "GET",
								"orig": "/api/v4/api-key-scopes",
								"parts": []any{
									"api",
									"v4",
									"api-key-scopes",
								},
								"select": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"index$": 0,
							},
						},
						"key$": "list",
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"payment_iframe": map[string]any{
				"fields": []any{},
				"name": "payment_iframe",
				"op": map[string]any{
					"remove": map[string]any{
						"input": "data",
						"name": "remove",
						"points": []any{
							map[string]any{
								"active": true,
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"active": true,
											"example": 120615523104,
											"kind": "param",
											"name": "account_id",
											"orig": "account_id",
											"reqd": true,
											"type": "`$STRING`",
											"index$": 0,
										},
										map[string]any{
											"active": true,
											"example": "ifr_d193148ac2624de7b43a191682a8822f",
											"kind": "param",
											"name": "id",
											"orig": "iframe_id",
											"reqd": true,
											"type": "`$STRING`",
											"index$": 1,
										},
									},
								},
								"method": "DELETE",
								"orig": "/api/v4/accounts/{accountId}/payment-iframe/{iframeId}",
								"parts": []any{
									"api",
									"v4",
									"accounts",
									"{account_id}",
									"payment-iframe",
									"{id}",
								},
								"rename": map[string]any{
									"param": map[string]any{
										"accountId": "account_id",
										"iframeId": "id",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"account_id",
										"id",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"index$": 0,
							},
						},
						"key$": "remove",
					},
				},
				"relations": map[string]any{
					"ancestors": []any{
						[]any{
							"account",
						},
					},
				},
			},
			"three_d_secure_auth": map[string]any{
				"fields": []any{
					map[string]any{
						"active": true,
						"name": "browser",
						"req": true,
						"type": "`$OBJECT`",
						"index$": 0,
					},
					map[string]any{
						"active": true,
						"name": "card",
						"req": true,
						"type": "`$OBJECT`",
						"index$": 1,
					},
					map[string]any{
						"active": true,
						"name": "challenge",
						"req": false,
						"type": "`$OBJECT`",
						"index$": 2,
					},
					map[string]any{
						"active": true,
						"name": "customer",
						"req": false,
						"type": "`$OBJECT`",
						"index$": 3,
					},
					map[string]any{
						"active": true,
						"name": "purchase",
						"req": true,
						"type": "`$OBJECT`",
						"index$": 4,
					},
					map[string]any{
						"active": true,
						"name": "server_transaction_id",
						"req": false,
						"type": "`$STRING`",
						"index$": 5,
					},
					map[string]any{
						"active": true,
						"name": "shipping",
						"req": true,
						"type": "`$OBJECT`",
						"index$": 6,
					},
					map[string]any{
						"active": true,
						"name": "status",
						"req": false,
						"type": "`$STRING`",
						"index$": 7,
					},
					map[string]any{
						"active": true,
						"name": "three_d_secure_challenge_indicator",
						"req": false,
						"type": "`$STRING`",
						"index$": 8,
					},
					map[string]any{
						"active": true,
						"name": "three_d_secure_id",
						"req": false,
						"type": "`$STRING`",
						"index$": 9,
					},
					map[string]any{
						"active": true,
						"name": "trace",
						"req": false,
						"type": "`$OBJECT`",
						"index$": 10,
					},
				},
				"name": "three_d_secure_auth",
				"op": map[string]any{
					"create": map[string]any{
						"input": "data",
						"name": "create",
						"points": []any{
							map[string]any{
								"active": true,
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"active": true,
											"example": "tds_23d0e53de3c64e94887116da65abc8ce",
											"kind": "param",
											"name": "3_d_id",
											"orig": "resource_id",
											"reqd": true,
											"type": "`$STRING`",
											"index$": 0,
										},
										map[string]any{
											"active": true,
											"example": "120615523104",
											"kind": "param",
											"name": "account_id",
											"orig": "account_id",
											"reqd": true,
											"type": "`$STRING`",
											"index$": 1,
										},
									},
								},
								"method": "POST",
								"orig": "/api/v4/accounts/{accountId}/3DS/{resourceId}/browser-authenticate",
								"parts": []any{
									"api",
									"v4",
									"accounts",
									"{account_id}",
									"3DS",
									"{3_d_id}",
									"browser-authenticate",
								},
								"rename": map[string]any{
									"param": map[string]any{
										"accountId": "account_id",
										"resourceId": "3_d_id",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"3_d_id",
										"account_id",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"index$": 0,
							},
						},
						"key$": "create",
					},
				},
				"relations": map[string]any{
					"ancestors": []any{
						[]any{
							"account",
							"3_d",
						},
					},
				},
			},
			"three_d_secure_browser_init": map[string]any{
				"fields": []any{
					map[string]any{
						"active": true,
						"name": "acs_result_url",
						"req": false,
						"type": "`$STRING`",
						"index$": 0,
					},
					map[string]any{
						"active": true,
						"name": "acs_url",
						"req": false,
						"type": "`$STRING`",
						"index$": 1,
					},
					map[string]any{
						"active": true,
						"name": "cvv",
						"req": false,
						"type": "`$STRING`",
						"index$": 2,
					},
					map[string]any{
						"active": true,
						"name": "expiry",
						"req": true,
						"type": "`$STRING`",
						"index$": 3,
					},
					map[string]any{
						"active": true,
						"name": "pan",
						"req": true,
						"type": "`$STRING`",
						"index$": 4,
					},
					map[string]any{
						"active": true,
						"name": "payment_details_reference",
						"req": false,
						"type": "`$STRING`",
						"index$": 5,
					},
					map[string]any{
						"active": true,
						"name": "server_transaction_id",
						"req": false,
						"type": "`$STRING`",
						"index$": 6,
					},
					map[string]any{
						"active": true,
						"name": "status",
						"req": false,
						"type": "`$STRING`",
						"index$": 7,
					},
					map[string]any{
						"active": true,
						"name": "three_d_secure_data",
						"req": false,
						"type": "`$STRING`",
						"index$": 8,
					},
					map[string]any{
						"active": true,
						"name": "three_d_secure_id",
						"req": false,
						"type": "`$STRING`",
						"index$": 9,
					},
				},
				"name": "three_d_secure_browser_init",
				"op": map[string]any{
					"create": map[string]any{
						"input": "data",
						"name": "create",
						"points": []any{
							map[string]any{
								"active": true,
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"active": true,
											"example": "120615523104",
											"kind": "param",
											"name": "account_id",
											"orig": "account_id",
											"reqd": true,
											"type": "`$STRING`",
											"index$": 0,
										},
									},
								},
								"method": "POST",
								"orig": "/api/v4/accounts/{accountId}/3DS/init-card-details",
								"parts": []any{
									"api",
									"v4",
									"accounts",
									"{account_id}",
									"3DS",
									"init-card-details",
								},
								"rename": map[string]any{
									"param": map[string]any{
										"accountId": "account_id",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"account_id",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"index$": 0,
							},
						},
						"key$": "create",
					},
				},
				"relations": map[string]any{
					"ancestors": []any{
						[]any{
							"account",
						},
					},
				},
			},
			"three_d_secure_status": map[string]any{
				"fields": []any{
					map[string]any{
						"active": true,
						"name": "error",
						"req": false,
						"type": "`$OBJECT`",
						"index$": 0,
					},
					map[string]any{
						"active": true,
						"name": "info",
						"req": false,
						"type": "`$OBJECT`",
						"index$": 1,
					},
					map[string]any{
						"active": true,
						"name": "server_transaction_id",
						"req": false,
						"type": "`$STRING`",
						"index$": 2,
					},
					map[string]any{
						"active": true,
						"name": "status",
						"req": false,
						"type": "`$STRING`",
						"index$": 3,
					},
					map[string]any{
						"active": true,
						"name": "three_d_secure",
						"req": false,
						"type": "`$OBJECT`",
						"index$": 4,
					},
					map[string]any{
						"active": true,
						"name": "three_d_secure_id",
						"req": false,
						"type": "`$STRING`",
						"index$": 5,
					},
				},
				"name": "three_d_secure_status",
				"op": map[string]any{
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"active": true,
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"active": true,
											"example": "tds_23d0e53de3c64e94887116da65abc8ce",
											"kind": "param",
											"name": "3_d_id",
											"orig": "resource_id",
											"reqd": true,
											"type": "`$STRING`",
											"index$": 0,
										},
										map[string]any{
											"active": true,
											"example": "120615523104",
											"kind": "param",
											"name": "account_id",
											"orig": "account_id",
											"reqd": true,
											"type": "`$STRING`",
											"index$": 1,
										},
									},
								},
								"method": "GET",
								"orig": "/api/v4/accounts/{accountId}/3DS/{resourceId}/status",
								"parts": []any{
									"api",
									"v4",
									"accounts",
									"{account_id}",
									"3DS",
									"{3_d_id}",
									"status",
								},
								"rename": map[string]any{
									"param": map[string]any{
										"accountId": "account_id",
										"resourceId": "3_d_id",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"3_d_id",
										"account_id",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"index$": 0,
							},
						},
						"key$": "load",
					},
				},
				"relations": map[string]any{
					"ancestors": []any{
						[]any{
							"account",
							"3_d",
						},
					},
				},
			},
			"transaction_detail": map[string]any{
				"fields": []any{
					map[string]any{
						"active": true,
						"name": "amount",
						"req": true,
						"type": "`$OBJECT`",
						"index$": 0,
					},
					map[string]any{
						"active": true,
						"name": "auth",
						"req": true,
						"type": "`$OBJECT`",
						"index$": 1,
					},
					map[string]any{
						"active": true,
						"name": "card",
						"req": false,
						"type": "`$OBJECT`",
						"index$": 2,
					},
					map[string]any{
						"active": true,
						"name": "customer",
						"req": false,
						"type": "`$OBJECT`",
						"index$": 3,
					},
					map[string]any{
						"active": true,
						"name": "description",
						"req": false,
						"type": "`$STRING`",
						"index$": 4,
					},
					map[string]any{
						"active": true,
						"name": "id",
						"req": false,
						"type": "`$STRING`",
						"index$": 5,
					},
					map[string]any{
						"active": true,
						"name": "item",
						"req": false,
						"type": "`$ARRAY`",
						"index$": 6,
					},
					map[string]any{
						"active": true,
						"name": "level2",
						"req": false,
						"type": "`$OBJECT`",
						"index$": 7,
					},
					map[string]any{
						"active": true,
						"name": "level3",
						"req": false,
						"type": "`$OBJECT`",
						"index$": 8,
					},
					map[string]any{
						"active": true,
						"name": "override",
						"req": false,
						"type": "`$OBJECT`",
						"index$": 9,
					},
					map[string]any{
						"active": true,
						"name": "shipping_address",
						"op": map[string]any{
							"update": map[string]any{
								"req": false,
								"type": "`$OBJECT`",
							},
						},
						"req": true,
						"type": "`$OBJECT`",
						"index$": 10,
					},
					map[string]any{
						"active": true,
						"name": "status",
						"req": true,
						"type": "`$STRING`",
						"index$": 11,
					},
					map[string]any{
						"active": true,
						"name": "timestamp",
						"req": false,
						"type": "`$STRING`",
						"index$": 12,
					},
					map[string]any{
						"active": true,
						"name": "trace",
						"req": false,
						"type": "`$OBJECT`",
						"index$": 13,
					},
				},
				"name": "transaction_detail",
				"op": map[string]any{
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"active": true,
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"active": true,
											"example": "120615523104",
											"kind": "param",
											"name": "account_id",
											"orig": "account_id",
											"reqd": true,
											"type": "`$STRING`",
											"index$": 0,
										},
										map[string]any{
											"active": true,
											"example": 1861,
											"kind": "param",
											"name": "transaction_id",
											"orig": "transaction_id",
											"reqd": true,
											"type": "`$STRING`",
											"index$": 1,
										},
									},
								},
								"method": "GET",
								"orig": "/api/v4/accounts/{accountId}/payments/{transactionId}",
								"parts": []any{
									"api",
									"v4",
									"accounts",
									"{account_id}",
									"payments",
									"{transaction_id}",
								},
								"rename": map[string]any{
									"param": map[string]any{
										"accountId": "account_id",
										"transactionId": "transaction_id",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"account_id",
										"transaction_id",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"index$": 0,
							},
						},
						"key$": "load",
					},
					"update": map[string]any{
						"input": "data",
						"name": "update",
						"points": []any{
							map[string]any{
								"active": true,
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"active": true,
											"example": "120615523104",
											"kind": "param",
											"name": "account_id",
											"orig": "account_id",
											"reqd": true,
											"type": "`$STRING`",
											"index$": 0,
										},
										map[string]any{
											"active": true,
											"example": 1861,
											"kind": "param",
											"name": "transaction_id",
											"orig": "transaction_id",
											"reqd": true,
											"type": "`$STRING`",
											"index$": 1,
										},
									},
								},
								"method": "PATCH",
								"orig": "/api/v4/accounts/{accountId}/payments/{transactionId}",
								"parts": []any{
									"api",
									"v4",
									"accounts",
									"{account_id}",
									"payments",
									"{transaction_id}",
								},
								"rename": map[string]any{
									"param": map[string]any{
										"accountId": "account_id",
										"transactionId": "transaction_id",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"account_id",
										"transaction_id",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"index$": 0,
							},
						},
						"key$": "update",
					},
				},
				"relations": map[string]any{
					"ancestors": []any{
						[]any{
							"account",
							"payment",
						},
					},
				},
			},
			"webhook": map[string]any{
				"fields": []any{
					map[string]any{
						"active": true,
						"name": "event",
						"req": true,
						"type": "`$STRING`",
						"index$": 0,
					},
					map[string]any{
						"active": true,
						"name": "id",
						"req": false,
						"type": "`$STRING`",
						"index$": 1,
					},
					map[string]any{
						"active": true,
						"name": "url",
						"req": true,
						"type": "`$STRING`",
						"index$": 2,
					},
				},
				"name": "webhook",
				"op": map[string]any{
					"create": map[string]any{
						"input": "data",
						"name": "create",
						"points": []any{
							map[string]any{
								"active": true,
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"active": true,
											"example": "120615523104",
											"kind": "param",
											"name": "account_id",
											"orig": "account_id",
											"reqd": true,
											"type": "`$STRING`",
											"index$": 0,
										},
									},
								},
								"method": "POST",
								"orig": "/api/v4/accounts/{accountId}/webhooks",
								"parts": []any{
									"api",
									"v4",
									"accounts",
									"{account_id}",
									"webhooks",
								},
								"rename": map[string]any{
									"param": map[string]any{
										"accountId": "account_id",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"account_id",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"index$": 0,
							},
						},
						"key$": "create",
					},
					"list": map[string]any{
						"input": "data",
						"name": "list",
						"points": []any{
							map[string]any{
								"active": true,
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"active": true,
											"example": "120615523104",
											"kind": "param",
											"name": "account_id",
											"orig": "account_id",
											"reqd": true,
											"type": "`$STRING`",
											"index$": 0,
										},
									},
								},
								"method": "GET",
								"orig": "/api/v4/accounts/{accountId}/webhooks",
								"parts": []any{
									"api",
									"v4",
									"accounts",
									"{account_id}",
									"webhooks",
								},
								"rename": map[string]any{
									"param": map[string]any{
										"accountId": "account_id",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"account_id",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"index$": 0,
							},
						},
						"key$": "list",
					},
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"active": true,
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"active": true,
											"example": 120615523104,
											"kind": "param",
											"name": "account_id",
											"orig": "account_id",
											"reqd": true,
											"type": "`$STRING`",
											"index$": 0,
										},
										map[string]any{
											"active": true,
											"example": "wbh_d193148ac2624de7b43a191682a8822f",
											"kind": "param",
											"name": "id",
											"orig": "webhook_id",
											"reqd": true,
											"type": "`$STRING`",
											"index$": 1,
										},
									},
								},
								"method": "GET",
								"orig": "/api/v4/accounts/{accountId}/webhooks/{webhookID}",
								"parts": []any{
									"api",
									"v4",
									"accounts",
									"{account_id}",
									"webhooks",
									"{id}",
								},
								"rename": map[string]any{
									"param": map[string]any{
										"accountId": "account_id",
										"webhookID": "id",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"account_id",
										"id",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"index$": 0,
							},
						},
						"key$": "load",
					},
					"remove": map[string]any{
						"input": "data",
						"name": "remove",
						"points": []any{
							map[string]any{
								"active": true,
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"active": true,
											"example": 120615523104,
											"kind": "param",
											"name": "account_id",
											"orig": "account_id",
											"reqd": true,
											"type": "`$STRING`",
											"index$": 0,
										},
										map[string]any{
											"active": true,
											"example": "wbh_d193148ac2624de7b43a191682a8822f",
											"kind": "param",
											"name": "id",
											"orig": "webhook_id",
											"reqd": true,
											"type": "`$STRING`",
											"index$": 1,
										},
									},
								},
								"method": "DELETE",
								"orig": "/api/v4/accounts/{accountId}/webhooks/{webhookID}",
								"parts": []any{
									"api",
									"v4",
									"accounts",
									"{account_id}",
									"webhooks",
									"{id}",
								},
								"rename": map[string]any{
									"param": map[string]any{
										"accountId": "account_id",
										"webhookID": "id",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"account_id",
										"id",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"index$": 0,
							},
						},
						"key$": "remove",
					},
					"update": map[string]any{
						"input": "data",
						"name": "update",
						"points": []any{
							map[string]any{
								"active": true,
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"active": true,
											"example": 120615523104,
											"kind": "param",
											"name": "account_id",
											"orig": "account_id",
											"reqd": true,
											"type": "`$STRING`",
											"index$": 0,
										},
										map[string]any{
											"active": true,
											"example": "wbh_d193148ac2624de7b43a191682a8822f",
											"kind": "param",
											"name": "id",
											"orig": "webhook_id",
											"reqd": true,
											"type": "`$STRING`",
											"index$": 1,
										},
									},
								},
								"method": "PATCH",
								"orig": "/api/v4/accounts/{accountId}/webhooks/{webhookID}",
								"parts": []any{
									"api",
									"v4",
									"accounts",
									"{account_id}",
									"webhooks",
									"{id}",
								},
								"rename": map[string]any{
									"param": map[string]any{
										"accountId": "account_id",
										"webhookID": "id",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"account_id",
										"id",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"index$": 0,
							},
						},
						"key$": "update",
					},
				},
				"relations": map[string]any{
					"ancestors": []any{
						[]any{
							"account",
						},
					},
				},
			},
		},
	}
}

func makeFeature(name string) Feature {
	switch name {
	case "test":
		if NewTestFeatureFunc != nil {
			return NewTestFeatureFunc()
		}
	default:
		if NewBaseFeatureFunc != nil {
			return NewBaseFeatureFunc()
		}
	}
	return nil
}
