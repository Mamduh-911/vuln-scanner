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
        return "يرجى إدخال رابط صحيح", 400

    # مثال: فحص nuclei
    try:
        result = subprocess.check_output(['nuclei', '-u', url], text=True)
    except Exception as e:
        result = f"حدث خطأ أثناء الفحص: {str(e)}"

    return render_template('index.html', results=result)
