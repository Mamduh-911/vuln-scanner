from flask import Flask, render_template, request
import subprocess

app = Flask(__name__)

@app.route("/", methods=["GET", "POST"])
def home():
    results = None
    if request.method == "POST":
        url = request.form["url"]
        try:
            output = subprocess.check_output(["python3", "scanner.py", url], text=True)
            results = output
        except subprocess.CalledProcessError as e:
            results = f"حدث خطأ أثناء الفحص:\n{e}"
    return render_template("index.html", results=results)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=10000)
