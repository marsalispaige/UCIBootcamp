from flask import Flask, render_template, jsonify
from flask_pymongo import PyMongo
import scrape_mars

app = Flask(__name__)

mongo = PyMongo(app)

@app.route('/')
def index():
    mars_db = mongo.db.mars_db.find_one()
    return render_template('index.html', mars_db=mars_db)


@app.route('/scrape')
def scrape():
    mars_db = mongo.db.mars_db
    data = scrape_mars.scrape()
    mars_db.update(
        {},
        data,
        upsert=True
    )
    return redirect("http://localhost:5000/", code=302)


if __name__ == "__main__":
    app.run(debug=True)