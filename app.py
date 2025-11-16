from flask import Flask  # <-- all imports at the top

app = Flask(__name__)


def simple_function():
    return "Hello World"


@app.route("/")
def home():
    return simple_function()


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
