from flask import Flask, render_template, request
import subprocess

app = Flask(__name__)

@app.route('/', methods=['GET'])
def index():
    return render_template('index.html')

@app.route('/scan', methods=['POST'])
def scan():
    url = request.form['url']
    result = ""

    try:
        # شغل nuclei
        nuclei_output = subprocess.getoutput(f"nuclei -u {url}")
        result += "\n--- Nuclei Results ---\n" + nuclei_output

        # شغل dalfox
        dalfox_output = subprocess.getoutput(f"dalfox url {url}")
        result += "\n\n--- Dalfox Results ---\n" + dalfox_output

    except Exception as e:
        result = f"حدث خطأ أثناء الفحص: {str(e)}"

    return render_template('index.html', result=result)

if __name__ == '__main__':
    app.run(debug=True)
