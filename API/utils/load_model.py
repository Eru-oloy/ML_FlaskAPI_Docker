import joblib


def load_model():
    loaded_model = joblib.load(open('./utils/model.joblib', 'rb'))
    return loaded_model


if __name__ == '__main__':
    pass
