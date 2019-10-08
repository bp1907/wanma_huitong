
abstract class JsonString {
  static final String loginData = '''
  {"code":0,"msg":"成功","result":{"token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJBUFAiLCJ1c2
  VyX2lkIjoiMjAwNSIsImlzcyI6IlNlcnZpY2UiLCJleHAiOjE1NTgzMzY5NTEsImlhdCI6MTU1NzQ3Mjk1MX0.xEaBlABUbguUFU9
  Dzm36R5zF81DBTZJXGHu4MY2resw"}}
  ''';
  static final String mockdata = '''
  {
    "result": [
        {
            "add_org_id": null,
            "auth_type": 1,
            "menu_icon": "fa-cog",
            "level": null,
            "module": "HTAPP",
            "mandt": null,
            "add_org": "1003",
            "pid": 1555484503235001,
            "title": "无锡会通",
            "priority": 1,
            "menu": 1,
            "add_dept": "1003",
            "action_key": null,
            "menu_key": null,
            "action": "/1555484503235001/1555485021022001",
            "lm_time": "2019-04-17 15:17:59",
            "id": 1555485021022001,
            "lm_user": "2005",
            "add_dept_id": 1,
            "add_time": "2019-04-17 15:10:33",
            "vkorg": null,
            "add_user": "2005",
            "isfunc": 0
        },
        {
            "add_org_id": null,
            "auth_type": 1,
            "menu_icon": "fa-cog",
            "level": null,
            "module": "HTAPP",
            "mandt": null,
            "add_org": "1003",
            "pid": 1555484503235001,
            "title": "广州会通",
            "priority": 2,
            "menu": 1,
            "add_dept": "1003",
            "action_key": null,
            "menu_key": null,
            "action": "/1555484503235001/1555485021022002",
            "lm_time": "2019-04-17 15:18:04",
            "id": 1555485021022002,
            "lm_user": "2005",
            "add_dept_id": 1,
            "add_time": "2019-04-17 15:13:23",
            "vkorg": null,
            "add_user": "2005",
            "isfunc": 0
        },
        {
            "add_org_id": null,
            "auth_type": 1,
            "menu_icon": "fa-cog",
            "level": null,
            "module": "HTAPP",
            "mandt": null,
            "add_org": "1003",
            "pid": 1555484503235001,
            "title": "重庆会通",
            "priority": 3,
            "menu": 1,
            "add_dept": "1003",
            "action_key": null,
            "menu_key": null,
            "action": "/1555484503235001/1555485021022003",
            "lm_time": "2019-04-17 15:18:12",
            "id": 1555485021022003,
            "lm_user": "2005",
            "add_dept_id": 1,
            "add_time": "2019-04-17 15:13:48",
            "vkorg": null,
            "add_user": "2005",
            "isfunc": 0
        }
    ],
    "msg": "成功",
    "code": 0
}
  ''';

  static final String subMenu = '''
  {
    "result": [
        {
            "add_org_id": null,
            "auth_type": 1,
            "menu_icon": "fa-cog",
            "level": null,
            "module": "HTAPP",
            "mandt": null,
            "add_org": "1003",
            "pid": 1555485021022001,
            "title": "一次发泡",
            "priority": 1,
            "menu": 1,
            "add_dept": "1003",
            "action_key": null,
            "menu_key": null,
            "action": "/1555484503235001/1555485021022001/1555485021022004",
            "lm_time": "2019-04-17 15:18:15",
            "id": 1555485021022004,
            "lm_user": "2005",
            "add_dept_id": 1,
            "add_time": "2019-04-17 15:14:04",
            "vkorg": null,
            "add_user": "2005",
            "isfunc": 0
        },
        {
            "add_org_id": null,
            "auth_type": 1,
            "menu_icon": "fa-cog",
            "level": null,
            "module": "HTAPP",
            "mandt": null,
            "add_org": "1003",
            "pid": 1555485021022001,
            "title": "二次发泡",
            "priority": 2,
            "menu": 1,
            "add_dept": "1003",
            "action_key": null,
            "menu_key": null,
            "action": "/1555484503235001/1555485021022001/1555485021022005",
            "lm_time": "2019-04-17 15:18:18",
            "id": 1555485021022005,
            "lm_user": "2005",
            "add_dept_id": 1,
            "add_time": "2019-04-17 15:15:53",
            "vkorg": null,
            "add_user": "2005",
            "isfunc": 0
        }
    ],
    "msg": "成功",
    "code": 0
}
  ''';

  static final String firstBubbleList = '''
  {
    "result": [
        {
            "add_org_id": null,
            "auth_type": 2,
            "menu_icon": "fa-cog",
            "level": null,
            "module": "HTAPP",
            "mandt": null,
            "add_org": "1003",
            "pid": 1555485021022004,
            "title": "一次发泡1号线",
            "priority": 1,
            "menu": 1,
            "add_dept": "1003",
            "action_key": null,
            "menu_key": null,
            "action": "/1555484503235001/1555485021022001/1555485021022004/1555485021022007",
            "lm_time": "2019-04-22 17:06:16",
            "id": 1555485021022007,
            "lm_user": "2005",
            "add_dept_id": 2,
            "add_time": "2019-04-17 15:17:06",
            "vkorg": null,
            "add_user": "2005",
            "isfunc": 0
        },
        {
            "add_org_id": null,
            "auth_type": 2,
            "menu_icon": "fa-cog",
            "level": null,
            "module": "HTAPP",
            "mandt": null,
            "add_org": "1003",
            "pid": 1555485021022004,
            "title": "一次发泡2号线",
            "priority": 2,
            "menu": 1,
            "add_dept": "1003",
            "action_key": null,
            "menu_key": null,
            "action": "/1555484503235001/1555485021022001/1555485021022004/1555485021022008",
            "lm_time": "2019-04-17 15:17:54",
            "id": 1555485021022008,
            "lm_user": "2005",
            "add_dept_id": 2,
            "add_time": "2019-04-17 15:17:20",
            "vkorg": null,
            "add_user": "2005",
            "isfunc": 0
        },
        {
            "add_org_id": null,
            "auth_type": 2,
            "menu_icon": "fa-cog",
            "level": null,
            "module": "HTAPP",
            "mandt": null,
            "add_org": "1003",
            "pid": 1555485021022004,
            "title": "一次发泡3号线",
            "priority": 3,
            "menu": 1,
            "add_dept": "1003",
            "action_key": null,
            "menu_key": null,
            "action": "/1555484503235001/1555485021022001/1555485021022004/1555485021022009",
            "lm_time": "2019-04-17 15:17:56",
            "id": 1555485021022009,
            "lm_user": "2005",
            "add_dept_id": 2,
            "add_time": "2019-04-17 15:17:32",
            "vkorg": null,
            "add_user": "2005",
            "isfunc": 0
        }
    ],
    "msg": "成功",
    "code": 0
}
  ''';

  static final String wlData = '''
  {
    "code": 0,
    "msg": "成功",
    "result": [
        [
            1,
            2,
            null,
            null,
            null,
            null,
            null,
            null,
            null,
            null,
            null,
            null,
            0,
            0,
            0,
            0,
            1557379259151,
            76,
            0,
            0,
            0,
            0,
            0,
            1
        ]
    ]
}
  ''';
}