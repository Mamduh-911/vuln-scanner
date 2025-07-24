from flask import Flask, render_template_string

app = Flask(__name__)

html_code = '''
<!DOCTYPE html>
<html>
<head>
    <title>🔍 كاشف الثغرات</title>
    <style>
        body {
            background-color: #121212;
            color: #00ffae;
            font-family: Tahoma, sans-serif;
            text-align: center;
            padding-top: 100px;
        }
        h1 {
            font-size: 3em;
        }
        button {
            background-color: #00ffae;
            color: black;
            border: none;
            padding: 15px 30px;
            font-size: 1.2em;
            border-radius: 8px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <h1>🔍 كاشف الثغرات</h1>
    <p>اضغط على الزر لبدء الفحص الأمني</p>
    <form action="/scan" method="post">
        <input type="text" name="url" placeholder="ادخل رابط الموقع" style="padding:10px;width:300px;">
        <br><br>
        <button type="submit">ابدأ الفحص</button>
    </form>
</body>
</html>
'''

@app.route('/')
def index():
    return render_template_string(html_code)

@app.route('/scan', methods=['POST'])
def scan():
    return 'الفحص تحت التطوير حالياً...'

if __name__ == '__main__':
    app.run(debug=False, host='0.0.0.0', port=10000)
