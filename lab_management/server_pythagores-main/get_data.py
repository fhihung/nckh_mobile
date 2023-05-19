import date_of_birth
import life 
import destiny 
import soul 
import personality 
import grow
import json 
import attitude
import individual_day
import individual_month
import individual_year

def get_res(user_data):
    dob = str(date_of_birth.solve_DOB(str(user_data["day"])))
    life_num = life.solve_life(user_data["day"], user_data["month"], user_data["year"])
    nod = destiny.solve_destiny(user_data["name"])
    soul_num = soul.solve_soul(user_data["name"])
    personality_num = personality.solve_personality(user_data["name"])
    attitude_num = attitude.solve_attitude(user_data["day"], user_data["month"])
    individual_year_num = individual_year.solve_individual_year(attitude_num, user_data["current_year"])
    individual_month_num = individual_month.solve_individual_month(individual_year_num, user_data["current_month"])
    individual_day_num = individual_day.solve_individual_day(individual_month_num, user_data["current_day"])

    data = {
        "ngay_sinh": dob,
        "duong_doi": life_num,
        "van_menh": nod,
        "linh_hon": soul_num,
        "tinh_cach": personality_num,
        "thai_do": attitude_num,
        "ngay_ca_nhan": individual_day_num,
        "thang_ca_nhan": individual_month_num,
        "nam_ca_nhan": individual_year_num
    }
    return data