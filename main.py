from flask import Flask, render_template, request
from scanner import run_scan

app = Flask(__name__)

@app.route('/')
def home():
    return render_template("index.html")

@app.route('/scan', methods=['POST'])
def scan():
    url = request.form['url']
    result = run_scan(url)
    return render_template("index.html", result=result, url=url)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=10000)
