# apt-get install python-flask
from flask import Flask, request, jsonify

app = Flask(__name__)


@app.route("/")
def index():
    return "api is working"

@app.route("/dologin", methods=["POST"])
def login():
    """登入"""
    name = request.form.get("name")
    password = request.form.get("password")

    if not all([name, password]):
        # 如果name或password中有一個為空或者都為空
        return jsonify(code=1, message=u"引數不完整")
    if name == "admin" and password =="python":
        return jsonify(code=0, message=u"OK")
    else:
        return jsonify(code=2, message=u"使用者名稱或密碼錯誤")

if __name__ == "__main__":
    # Get Parameter
    app.run(host='0.0.0.0', port=10009)
