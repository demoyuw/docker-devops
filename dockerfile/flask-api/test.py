# coding:utf-8

import unittest
from api import app
import json


class TestLogin(unittest.TestCase):
    """定義測試案例"""
    
    # 測試程式碼執行之前呼叫 (方法名固定)
    def setUp(self):
        """在執行具體的測試方法前，先被呼叫"""
        # 可以使用python的http標準客戶端進行測試
        # urllib  urllib2  requests

        # app.config['TESTING'] = True  # 指定app在測試模式下執行
        app.testing = True   # 指定app在測試模式下執行。 (測試模式下,檢視中的意外異常可以正常列印顯示出來)
        # 使用flask提供的測試客戶端進行測試 (Flask客戶端可以模擬傳送請求)
        self.client = app.test_client()
    
    # 測試程式碼。 (方法名必須以"test_"開頭)
    def test_empty_name_password(self):
        """測試模擬場景，使用者名稱或密碼不完整"""
        # 使用Flask客戶端向後端傳送post請求, data指明發送的資料，會返回一個響應物件
        response = self.client.post("/dologin", data={})

        # respoonse.data是響應體資料
        resp_json = response.data

        # 按照json解析
        resp_dict = json.loads(resp_json)

        # 使用斷言進行驗證
        self.assertIn("code", resp_dict)

        code = resp_dict.get("code")
        self.assertEqual(code, 1)

        # 測試只傳name
        response = self.client.post("/dologin", data={"name": "admin"})

        # respoonse.data是響應體資料
        resp_json = response.data

        # 按照json解析
        resp_dict = json.loads(resp_json)

        # 使用斷言進行驗證
        self.assertIn("code", resp_dict)

        code = resp_dict.get("code")
        self.assertEqual(code, 1)


    # 測試程式碼。 (方法名必須以"test_"開頭)
    def test_wrong_name_password(self):
        """測試使用者名稱或密碼錯誤"""
        
        response = self.client.post("/dologin", data={"name": "admin", "password": "xxx"})

        # respoonse.data是響應體資料
        resp_json = response.data

        # 按照json解析
        resp_dict = json.loads(resp_json)

        # 使用斷言進行驗證
        self.assertIn("code", resp_dict)

        code = resp_dict.get("code")
        self.assertEqual(code, 2)


if __name__ == '__main__':
    unittest.main()  # 進行測試