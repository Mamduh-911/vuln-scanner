from flask import Flask, render_template, request
import subprocess

app = Flask(__name__)

@app.route('/', methods=['GET', 'POST'])
def index():
    result = ''
    if request.method == 'POST':
        url = request.form['url']
        try:
            result = subprocess.check_output(
                ['dalfox', 'url', url],
                stderr=subprocess.STDOUT,
                text=True
            )
        except subprocess.CalledProcessError as e:
            result = f"خطأ في الفحص:\n{e.output}"
    return render_template('index.html', result=result)
