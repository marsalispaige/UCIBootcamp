from flask import Flask, render_template, jsonify, redirect
from flask_pymongo import PyMongo
import scrape_mars

app = Flask(__name__)

mongo = PyMongo(app)

@app.route('/')
def index():
    mars_db = mongo.db.mars_db.find_one()
    print("MONGODB GET*******************")
    print(mars_db)
    return render_template('index.html', mars_db=mars_db)
    print("RETURN EXECUTED")

@app.route('/scrape')
def scrape():
    mars_db = mongo.db.mars_db
    data = scrape_mars.scrape()
    print('**************************')
    print(data)
    mars_db.update(
        {},
        data,
        upsert=True
    )
    return redirect("http://127.0.0.1:5000/", code=302)


if __name__ == "__main__":
    app.run(debug=True)