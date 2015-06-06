from flask import Flask, render_template
import os

app = Flask(__name__)

def get_thresholds():
    return {"0.0":"0","1.0":"1","2.0":"2","3.0":"3","4.0":"4",
           "5.0":"5","6.0":"6","7.0":"7","8.0":"8","9.0":"9"}
def get_metrics():
    return {"Pearson":"pearson","Spearman":"spearman"}

def get_directions():
    return {"Positive and Negative":"posneg","Positive Only":"pos"}

def get_accuracy():
   return 99.9

@app.route('/')
def show_analyses():

   #TODO show accuracy values

    metric = "pearson"
    threshold = "1"
    direction = "posneg"
    datafile = "confdata.tsv"
    return render_template('index.html',datafile=datafile,
                            thresholds=get_thresholds(),
                            metrics=get_metrics(),
                            directions=get_directions(),
                            threshold=threshold,
                            direction=direction,
                            metric=metric)

@app.route('/<metric>/<direction>/<threshold>')
def get_help(metric,direction,threshold):

    datafile = "%s_%s_%s.tsv" %(metric,direction,threshold)
    return render_template('index.html',datafile=datafile,
                            thresholds=get_thresholds(),
                            metrics=get_metrics(),
                            directions=get_directions(),
                            threshold=threshold,
                            direction=direction,
                            metric=metric)

if __name__ == '__main__':
    app.debug = True
    app.run()
