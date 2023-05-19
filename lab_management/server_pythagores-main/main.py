# from flask import Flask 
# from flask_cors import CORS, cross_origin
# from flask import request, jsonify
# import get_data
# import json



# response1 = ''
# response2 = ''
# response3 = ''
# response4 = ''
# response5 = ''
# response6 = ''
# response7 = ''
# response8 = ''
# response9 = ''

# app = Flask(__name__)

# @app.route('/example', methods = ['GET', 'POST'])
# def nameRoute():
#     global response1
#     global response2
#     global response3
#     global response4
#     global response5
#     global response6
#     global response7
#     global response8
#     global response9

#     if(request.method == 'POST'):
#         user_data = request.data
#         user_data = json.loads(user_data.decode('utf-8'))
#         user_data = get_data.get_res(user_data)
#         tinh_cach = user_data['tinh_cach']
#         van_menh = user_data['van_menh']
#         linh_hon = user_data['linh_hon']
#         ngay_sinh = user_data['ngay_sinh']
#         duong_doi = user_data['duong_doi']
#         thai_do = user_data['thai_do']
#         ngay_ca_nhan = user_data['ngay_ca_nhan']
#         thang_ca_nhan = user_data['thang_ca_nhan']
#         nam_ca_nhan = user_data['nam_ca_nhan']
#         response1 = f'{tinh_cach}'
#         response2 = f'{van_menh}'
#         response3 = f'{linh_hon}'
#         response4 = f'{ngay_sinh}'
#         response5 = f'{duong_doi}'
#         response6 = f'{thai_do}'
#         response7 = f'{ngay_ca_nhan}'
#         response8 = f'{thang_ca_nhan}'
#         response9 = f'{nam_ca_nhan}'
#         return (response1, response2, response3, response4, response5, response6, response7, response8, response9)
#     else:
#         return jsonify({'van_menh': response2, 
#                         'tinh_cach': response1, 
#                         'linh_hon': response3, 
#                         'ngay_sinh': response4, 
#                         'duong_doi': response5, 
#                         'thai_do': response6,
#                         'ngay_ca_nhan': response7,
#                         'thang_ca_nhan': response8,
#                         'nam_ca_nhan': response9})
    
# if __name__ == "__main__":
#     app.run(debug=True)

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