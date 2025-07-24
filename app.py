from flask import Flask, render_template, request
import subprocess

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/scan', methods=['POST'])
def scan():
    url = request.form.get('url')

    if not url:
        return render_template('result.html', result="❌ يرجى إدخال رابط صحيح.")

    try:
        result = subprocess.check_output(['dalfox', 'url', url], stderr=subprocess.STDOUT, text=True)
    except subprocess.CalledProcessError as e:
        result = e.output or "❌ فشل في تنفيذ الفحص."

    return render_template('result.html', result=result)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=10000)
