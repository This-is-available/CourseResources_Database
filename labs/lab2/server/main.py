from flask import Flask, render_template
import mysql.connector

app = Flask(__name__)


connection = mysql.connector.connect(
    host='localhost',
    user='root',
    password='huangyujin123',
    database='lab2'
)


@app.route('/')
def index():
    return {
        "msg": "success",
        "data": "welcome to use flask.",
        "user_id": "localhost:5000/user/1"
    }


@app.route('/user/<u_id>')
def user_info(u_id):
    return {
        "msg": "success",
        "data": {
            "id": u_id,
            "username": 'yuz',
            "age": 18
        }
    }


app.run()
