import json
import sys
import re
import urllib.request
import urllib.error
from os import path
from urllib.parse import quote
from django.http import HttpResponse
from django.views.decorators.csrf import csrf_exempt

def test_weather(request, location):
    _weather_pic = _weather(location)
    return HttpResponse(_weather_pic["_weather_pic"])

def _weather(location):
    utf_location=quote(location) #request to weather need be UTF8 (E.g.enter chonese)
    req = urllib.request.urlopen(
        "<a href="http://api.openweathermap.org/data/2.5/weather?APPID=EL">http://api.openweathermap.org/data/2.5/weather?APPID=E</a>ricbalabababa_ID"
         % utf_location)
    req_decode = req.read().decode('utf-8')
    req_object = json.loads(req_decode)
    _country='Current country: {:.2}'.format(req_object['sys']['country'])
    _weather_pic='Current weather: {:.10}'.format(req_object['weather'][0]['main'])
    _temperature='Current tempearture: {:.2f}'.format(req_object['main']['temp'] - 273.15)
    return {"_country":_country, "_weather_pic":_weather_pic, "_temperature":_temperature}
def weather_picture(request, weather, size):
    BASE_DIR = path.dirname(path.dirname(path.abspath(__file__)))
    image_path='app/weather_image'
    full_path=path.join(BASE_DIR ,image_path, weather, size+".jpg")
    with open(full_path, "rb") as read_file:
        return HttpResponse(read_file.read(), content_type="image/jpeg")

def whattoeat_picture(request, size):
    BASE_DIR = path.dirname(path.dirname(path.abspath(__file__)))
    image_path='app/whattoeat_image'
    full_path=path.join(BASE_DIR ,image_path, size+".jpg")
    with open(full_path, "rb") as read_file:
        return HttpResponse(read_file.read(), content_type="image/jpeg")

@csrf_exempt
def elapp(request):
    (token, text)=_decode_json(request)
    _pasered_input = _paser_input_text(text)
    if _pasered_input == text:
        payload = echo_payload(token, text)
        result = _to_LINE_server(payload)
    else:
        payload = weather_payload(token, _pasered_input)
        result = _to_LINE_server(payload)
    if request.method == 'GET':
        return HttpResponse("GET")
    elif request.method == 'POST':
        return HttpResponse(json.dumps(result))

def _paser_input_text(_text):
    text_split = _text.split()
    first_split = text_split[0] #from user text
    if first_split == 'weather' or first_split == 'Weather' or first_split == 'WEATHER' or first_split == 'W' or first_split == 'w':
        location = text_split[1]
        return _weather(location)
    else:
        return _text

def _decode_json(request):
    body_unicode = request.body.decode('utf-8') #亂碼變正常
    body = json.loads(body_unicode) #JSON 文字轉物件
    _token=body["events"][0]["replyToken"]   # LINE message from client
    _text=body["events"][0]["message"]["text"] # LINE message from client
    return (_token, _text)

def echo_payload(_token, _text):
    payload = {
    "replyToken": _token,
    "messages":[
        {
            "type":"text",
            "text":"Hello, I am Nanguachumo.\nType 'w cityname' get weather!"
        },
        {
            "type":"text",
            "text":_text
        },
    ]
    }
    return payload
def weather_payload(_token, _text):
    all_weather = ["Wind", "Clouds", "Snow", "Rain", "Sun", "Clear"]
    weather_string=_text["_country"] + "\n" + _text["_weather_pic"] + "\n" + _text["_temperature"]
    space_weather=_text["_weather_pic"].split(":")[1] #' Rain'
    weather = space_weather.split(" ")[1] #'Rain'

    if weather in all_weather:
        weather = weather
    else:
        weather = '404'

    payload = {
    "replyToken": _token,
    "messages":[
        {
            "type":"text",
            "text":weather_string
        },
        {
            "type": "image",
            "originalContentUrl":
            #"https://Ericbalabababa_URL/weather_picture/%s/1024.jpg" %weather,
            "previewImageUrl":
            #"https://Ericbalabababa_URL/weather_picture/%s/240.jpg" %weather
        }
    ]
    }
    return payload

def _to_LINE_server(payload):
    payload = payload
    req=urllib.request.Request("https://api.line.me/v2/bot/message/reply",
        data=json.dumps(payload).encode('utf8'),
        headers={
            "Content-type": "application/json; charset=UTF-8",
            "Authorization": "Bearer zL/OkRwbOMFCIzu7uUU4luAfHAUKtEGFFnSRgx9ROTgvtRIG2ITQj3B7ODHVu8aGeDHNL+lSEDorwpsq9Maf6kU5LjFp1PceECRfRnRf+d7S/kQRXnDhp1zrljVAb27gp4or4x3h6hAaDaPVVcpQ8gdB04t89/1O/w1cDnyilFU=",
        })

    try:
        with urllib.request.urlopen(req) as response:
            print(response.read())
    except urllib.error.HTTPError as err:
        print(err)
