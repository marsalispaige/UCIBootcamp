import datetime as dt
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import json

import sqlalchemy
from sqlalchemy.ext.automap import automap_base
from sqlalchemy.orm import Session
from sqlalchemy import create_engine, func
from statistics import mean

from flask import Flask, jsonify


engine = create_engine("sqlite:///hawaii.sqlite")

# reflect an existing database into a new model
Base = automap_base()
# reflect the tables
Base.prepare(engine, reflect=True)

#setting tables to variables
Station = Base.classes.stations
Measurement = Base.classes.measurements
# Create our session (link) from Python to the DB
session = Session(engine)


prec_dict = {}
temp_dict = {}
#################################################
# Flask Setup
#################################################
app = Flask(__name__)

@app.route("/")
def welcome():
    """List all available api routes."""
    return (
        f"Available Routes:<br/>"
        f"/api/v1.0/precipitation<br/>"
        f"/api/v1.0/stations<br/>"
        f"/api/v1.0/tobs<br/>"
        f"/api/v1.0/<start><br/>"
        f"/api/v1.0/<start>/<end>"
    )

#################################################
# Flask Routes
#################################################

@app.route("/api/v1.0/precipitation")
def prec():

    prev_year = dt.date.today() - dt.timedelta(days=365)

    results = session.query(Measurement.date, Measurement.prcp).filter(Measurement.date >= prev_year).order_by(Measurement.date).all()
    
    jsonClean = json.dumps(results, indent=4, sort_keys=True, default=str)
    jsonLoad = json.loads(jsonClean)
   
    prec_dict = {date: prcp for date,prcp in jsonLoad}
    
    
    return jsonify(prec_dict)

@app.route("/api/v1.0/stations")
def station():
    stationCount = session.query(Station.station).count()
    
    return jsonify(f"There are " + str(stationCount) + f" stations.")


@app.route("/api/v1.0/tobs")
def tobs():
    prev_year = dt.date.today() - dt.timedelta(days=365)
    results = session.query(Measurement.tobs).filter(Measurement.date >= prev_year).all()
    return jsonify(results)

@app.route("/api/v1.0/<start>")
def startDate(start):
    start_date = start
    temp_list = []
    results = session.query(Measurement.tobs).filter(Measurement.date >= start_date).all()
   
    temp_list = (x[0] for x in results)
  
    tMin = min(x[0] for x in results)
    
    tMax = max(x[0] for x in results)
   
    tMean = mean(temp_list)

    temp={"Mininum Temperature":tMin,"Maximum Temperature":tMax,"Average Temperature":tMean}
    return jsonify(temp)

@app.route("/api/v1.0/<start>/<end>")
def startEndDate(start,end):
    start_date = start
    end_date = end
    temp_list = []
    results = session.query(Measurement.tobs).filter(Measurement.date >= start_date, Measurement.date<= end_date).all()
   
    temp_list = (x[0] for x in results)
  
    tMin = min(x[0] for x in results)
    
    tMax = max(x[0] for x in results)
   
    tMean = mean(temp_list)

    temp={"Mininum Temperature":tMin,"Maximum Temperature":tMax,"Average Temperature":tMean}
    return jsonify(temp)