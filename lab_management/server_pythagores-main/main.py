from flask import Flask, request, jsonify
from flask_cors import CORS, cross_origin
import get_data

app = Flask(__name__)
CORS(app)

@app.route('/example', methods=['POST','GET'])
def example_route():
    user_data = request.get_json()
    results = get_data.get_res(user_data)

    response_data = {
        'duong_doi': results['duong_doi'],
        'van_menh': results['van_menh'],
        'linh_hon': results['linh_hon'],
        'tinh_cach': results['tinh_cach'],
        'ngay_sinh': results['ngay_sinh'],
        'thai_do': results['thai_do'],
        'ngay_ca_nhan': results['ngay_ca_nhan'],
        'thang_ca_nhan': results['thang_ca_nhan'],
        'nam_ca_nhan': results['nam_ca_nhan']
    }

    return jsonify(response_data)

if __name__ == '__main__':
    app.run(port=5500)