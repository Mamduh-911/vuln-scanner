from flask import Flask, render_template, request
import subprocess

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html', results=None)

@app.route('/scan', methods=['POST'])
def scan():
    url = request.form.get('url')

    if not url:
        return render_template('index.html', results="❌ لم يتم إدخال رابط!")

    try:
        # Example using nuclei tool
        result = subprocess.check_output(['nuclei', '-u', url], stderr=subprocess.STDOUT, text=True)
    except subprocess.CalledProcessError as e:
        result = f"⚠️ خطأ في الفحص:\n{e.output}"

    return render_template('index.html', results=result)

if __name__ == '__main__':
    app.run(debug=True)
