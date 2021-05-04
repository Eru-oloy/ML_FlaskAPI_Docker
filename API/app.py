from flask import Flask, request, jsonify, render_template, make_response
from flask_cors import CORS
from flask_restful import Resource, Api, reqparse
from utils.load_model import load_model
import os


app = Flask(__name__)

app.config['JSON_SORT_KEYS'] = False
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

api = Api(app)


class Home(Resource):
    def __init__(self):
        try:
            height = float(request.form.get('height'))
            width = float(request.form.get('width'))
            depth = float(request.form.get('depth'))
            weight = float(request.form.get('weight'))
            self.values = [height, width, depth, weight]
        except:
            pass

    def get(self):
        self.prediction = "Votre prediction sera affichée ici"
        headers = {'Content-Type': 'text/html'}
        return make_response(render_template('index.html', prediction=self.prediction), 200, headers)

    def post(self):
        headers = {'Content-Type': 'text/html'}
        model = load_model()
        self.prediction = "Activity :  "
        self.prediction += model.predict([self.values])[0]
        print(self.prediction)
        return make_response(render_template('index.html', prediction=self.prediction), 200, headers)


class Predict(Resource):
    def get(self):
        try:
            height = float(request.args.get('height'))
            width = float(request.args.get('width'))
            depth = float(request.args.get('depth'))
            weight = float(request.args.get('weight'))
            loaded_model = load_model()
            result = loaded_model.predict([[height, width, depth, weight]])
            print(result)
            return jsonify({'activity': result[0]})
        except:
            return jsonify({'Error': 'Incorrect args'})


api.add_resource(Home, '/', endpoint='')
api.add_resource(Predict, '/predict', endpoint='predict')

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=os.getenv('PORT'))
