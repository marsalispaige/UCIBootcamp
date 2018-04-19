from flask import Flask, render_template, jsonify, redirect
import pandas as pd

app = Flask(__name__)

bbSamplesdf = pd.read_csv('data/belly_button_biodiversity_samples.csv')
bbOtudf = pd.read_csv('data/belly_button_biodiversity_otu_id.csv')
bbMetadf = pd.read_csv('data/Belly_Button_Biodiversity_Metadata.csv')

@app.route('/')
def index():
    return render_template('index.html')


@app.route('/names')
def names():
    sampleName = list(bbSamplesdf)
    return jsonify(sampleName)

@app.route('/otu')
def otu():
    print('OTU')
    
    otudes = list(bbOtudf['lowest_taxonomic_unit_found'])
    return jsonify(otudes)

@app.route('/metadata/<sample>')
def sample(sample):
    print('Sample')
    sampleID = int(sample.split('_')[1])
    sampleRecord = bbMetadf.loc[bbMetadf['SAMPLEID'] == sampleID]
    sampleRecordDict = sampleRecord[['AGE','BBTYPE','ETHNICITY','GENDER','LOCATION','SAMPLEID']].to_dict('records')
    return jsonify(sampleRecordDict)

@app.route('/wfreq/<sample>')
def wfreq(sample):
    print('wfreg')
    sampleID = int(sample.split('_')[1])
    sampleRecord = list(bbMetadf['WFREQ'].loc[bbMetadf['SAMPLEID'] == sampleID])
    return jsonify(sampleRecord)

@app.route('/samples/<sample>')
def samplevalue(sample):
    print('Sample')
    sampleCol = bbSamplesdf[['otu_id',sample]].sort_values(by=[sample],ascending=False)
    sampleCol = sampleCol.rename(columns={sample:'sample_values'})
    sampleColDict = sampleCol.to_dict('list')
    #sampleRecordDict = sampleRecord[['AGE','BBTYPE','ETHNICITY','GENDER','LOCATION','SAMPLEID']].to_dict('records')
    return jsonify(sampleColDict)



if __name__ == "__main__":
    app.run(debug=True)