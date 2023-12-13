import asyncio
import websockets
import socket
import cv2
from mss import mss
import numpy as np
import time
import timeit
import os
import math
import clipboard
import imutils
import multiprocessing
from multiprocessing import Value
import configparser

config = configparser.ConfigParser()
config.sections()
config.read('settings.ini')
host = config['server']['host']
user = os.getlogin()
user = config['server'][user]  # if erorr th

server_user = {
    "1700_1_1": "1600_1_1",
    "1700_2_1": "1600_2_1",
    "1700_3_1": "33-32",
    "1700_4_1": "Admin",
    "1600_1_1": "4-5",
    "1600_2_1": "8-9",
    "2700_1_1": "24-25",
    "3700_1_1": "-",
    "8320_1_1": "1700_4_1",
    "8350_1_1": "1700_4_1",
    "pc-4": "10-11",
    "intel": "44-45",
    "Admin": "24-25",
    "game": "Administrator",
    "bot": "Administrator",
}


#user = "intel"
#user = "Administrator"

# if __name__ == '__main__':
# time.sleep(2)

sct = mss()
scst = mss()

#host = "127.0.0.1"
host = "192.168.1.101"
port = 4455
addr = (host, port)
mid = 0

print('controlling ' + user + ' host=' + host)

""" Creating the UDP socket """
client = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
ortakare = 200
fovlimit = 200
breadth = 960
length = 540

boyutlar = sct.monitors[1]
boyutlar['left'] = int(breadth - (ortakare*3.2))
boyutlar['top'] = int(length - ortakare)
boyutlar['width'] = int(ortakare*6.4)
boyutlar['height'] = int(ortakare*2)

minimap = scst.monitors[1]
minimap['left'] = 172
minimap['top'] = 100
minimap['width'] = 112
minimap['height'] = 144


lower_map = np.array([0, 0, 176])
upper_map = np.array([131, 4, 190])
lower_map2 = np.array([26, 24, 185])
upper_map2 = np.array([34, 47, 196])



# aim trainer
lower = np.array([0, 156, 210])
upper = np.array([4, 255, 243])
# SIGHT
lower = np.array([173, 100, 182])
upper = np.array([179, 173, 193])
# purple
lower = np.array([143, 132, 164])
upper = np.array([156, 211, 255])


print("Ready !")
keyboardkeys = {
"a": 0x04,
"b": 0x05,
"c": 0x06,
"d": 0x07,
"e": 0x08,
"f": 0x09,
"g": 0x0a,
"h": 0x0b,
"i": 0x0c,
"j": 0x0d,
"k": 0x0e,
"l": 0x0f,
"m": 0x10,
"n": 0x11,
"o": 0x12,
"p": 0x13,
"q": 0x14,
"r": 0x15,
"s": 0x16,
"t": 0x17,
"u": 0x18,
"v": 0x19,
"w": 0x1a,
"x": 0x1b,
"y": 0x1c,
"z": 0x1d,
"1": 0x1e,
"2": 0x1f,
"3": 0x20,
"4": 0x21,
"5": 0x22,
"6": 0x23,
"7": 0x24,
"8": 0x25,
"9": 0x26,
"0": 0x27,
"enter": 0x28,
"escape": 0x29,
"backspace": 0x2a,
"tab": 0x2b,
"spacebar": 0x2c,
"minus": 0x2d,
"equals": 0x2e,
"left_bracket": 0x2f,
"right_bracket": 0x30,
"backslash": 0x31,
"pound": 0x32,
"semicolon": 0x33,
"quote": 0x34,
"grave_accent": 0x35,
"comma": 0x36,
"period": 0x37,
"forward_slash": 0x38,
"caps_lock": 0x39,
"f1": 0x3a,
"f2": 0x3b,
"f3": 0x3c,
"f4": 0x3d,
"f5": 0x3e,
"f6": 0x3f,
"f7": 0x40,
"f8": 0x41,
"f9": 0x42,
"f10": 0x43,
"f11": 0x44,
"f12": 0x45,
"print_screen": 0x46,
"scroll_lock": 0x47,
"pause": 0x48,
"insert": 0x49,
"home": 0x4a,
"page_up": 0x4b,
"delete": 0x4c,
"end": 0x4d,
"page_down": 0x4e,
"right_arrow": 0x4f,
"left_arrow": 0x50,
"down_arrow": 0x51,
"up_arrow": 0x52,
"keypad_numlock": 0x53,
"keypad_forward_slash": 0x54
}

keyboardkeyss = {
    "escape": 118,
    "f1": 5,
    "f2": 6,
    "f3": 4,
    "f4": 12,
    "f5": 3,
    "f6": 11,
    "f7": 131,
    "f8": 10,
    "f9": 1,
    "f10": 9,
    "f11": 120,
    "f12": 7,
    "scroll_lock": 126,
    "accent": 14,
    "one": 22,
    "two": 30,
    "three": 38,
    "four": 37,
    "five": 46,
    "six": 54,
    "seven": 61,
    "eight": 62,
    "nine": 70,
    "zero": 69,
    "minus": 78,
    "equal": 85,
    "backspace": 102,
    "tab": 13,
    "q": 21,
    "w": 29,
    "e": 36,
    "r": 45,
    "t": 44,
    "y": 53,
    "u": 60,
    "i": 67,
    "o": 68,
    "p": 77,
    "open_bracket": 84,
    "close_bracket": 91,
    "backslash": 93,
    "caps_lock": 88,
    "a": 28,
    "s": 27,
    "d": 35,
    "f": 43,
    "g": 52,
    "h": 51,
    "j": 59,
    "k": 66,
    "l": 75,
    "semi_colon": 76,
    "tick_mark": 82,
    "enter": 90,
    "left_shift": 18,
    "shift": 18,
    "z": 26,
    "x": 34,
    "c": 33,
    "v": 42,
    "b": 50,
    "n": 49,
    "m": 58,
    "0": 69,
    "1": 22,
    "2": 30,
    "3": 38,
    "4": 37,
    "5": 46,
    "6": 54,
    "7": 61,
    "8": 62,
    "9": 70,
    "Q": 21,
    "W": 29,
    "E": 36,
    "R": 45,
    "T": 44,
    "Y": 53,
    "U": 60,
    "I": 67,
    "O": 68,
    "P": 77,
    "A": 28,
    "S": 27,
    "D": 35,
    "F": 43,
    "G": 52,
    "H": 51,
    "J": 59,
    "K": 66,
    "L": 75,
    "A": 28,
    "S": 27,
    "D": 35,
    "F": 43,
    "G": 52,
    "H": 51,
    "J": 59,
    "K": 66,
    "L": 75,
    "Z": 26,
    "X": 34,
    "C": 33,
    "V": 42,
    "B": 50,
    "N": 49,
    "M": 58,
    "comma": 65,
    "period": 73,
    "slash": 74,
    "right_shift": 89,
    "left_control": 20,
    "left_alt": 17,
    "alt": 17,
    "space": 41,
    "num_lock": 119,
    "asterisk": 124,
    "numpad_minus": 123,
    "numpad_seven": 108,
    "numpad_eight": 117,
    "numpad_nine": 125,
    "plus": 121,
    "numpad_four": 107,
    "numpad_five": 115,
    "numpad_six": 116,
    "numpad_one": 105,
    "numpad_two": 114,
    "numpad_three": 122,
    "numpad_zero": 112,
    "decimal": 113,
    "left_win": 31,
    "right_alt": 17,
    "right_win": 39,
    "menus": 47,
    "right_control": 20,
    "ctrl": 20,
    "insert": 112,
    "home": 108,
    "page_up": 125,
    "delete": 113,
    "end": 105,
    "page_down": 122,
    "up_arrow": 117,
    "left_arrow": 107,
    "down_arrow": 114,
    "right_arrow": 116,
    "divide": 74,
    "numpad_enter": 90,
    "next_track": 77,
    "previous_track": 21,
    "stop": 59,
    "play_pause": 52,
    "mute": 35,
    "volume_up": 50,
    "volume_down": 33,
    "media_select": 80,
    "email": 72,
    "calculator": 43,
    "my_computer": 64,
    "www_search": 16,
    "www_home": 58,
    "www_back": 56,
    "www_forward": 48,
    "www_stop": 40,
    "www_refresh": 32,
    "www_favorites": 24,
    "power": 94,
    "sleep": 95,
    "wake": 99
}
inputkeys = {
    "mmcal": 8,
    "mccal": 9,
    "mm": 4,
    "mc": 2,
    "mp": 5,
    "mr": 1,
    "key": 3,
    "up": 7,
    "down": 6
}
keystate = {
    "0": 0,
    "up": 7,
    "down": 6
}


def senddata(q, walkmsg, walkbotloop, aimbotloop, qt):
    # asyncio.run(connect_sv(data))
    mid = 0
    while True:
        if (q.empty() is False) and (aimbotloop.value == 1):
            data = q.get().encode("utf-8")
            #print('aim ' + str(data))
            # addr ip address he te enu use kar k apan dynamic thread bna skde an fer try catch kar sirf one thread usekran ge jine di lod aa
            client.sendto(data, addr)
        else:
            while not q.empty():
                q.get()
        if (not walkmsg.empty()) and (walkbotloop.value == 1):
            data = walkmsg.get().encode("utf-8")
            #print('walk ' + str(data))
            client.sendto(data, addr)
        else:
            while not walkmsg.empty():
                walkmsg.get()
        if qt.empty() is False:
            client.sendto(qt.get().encode("utf-8"), addr)


async def connect_sv(name):
    uri = "ws://localhost:8765"
    try:
        async with websockets.connect(uri) as websocket:
            await websocket.send(name)
            #print(f"sent {name}")
            # time.sleep(0.1)
    except:
        pass

lastsign = 0

def walkbot(q, walkbotloop, key_w, key_s):
    while True:
        if walkbotloop.value == 1:  # 1 value kro
            walkbot1(q, key_w, key_s, walkbotloop)


def walkbot_screen_coordinates():
    img = np.array(sct.grab(minimap))
    hsv = cv2.cvtColor(img, cv2.COLOR_BGR2HSV)
    mask = cv2.inRange(hsv, lower_map, upper_map)
    mask1 = cv2.inRange(hsv, lower_map2, upper_map2)
    mask = mask + mask1
    kernel = np.ones((2, 2), np.uint8)
    erode = cv2.erode(mask, kernel, iterations=2)
    dilated = cv2.dilate(erode, kernel, iterations=5)
    #cv2.imshow("raw", img)
    #cv2.imshow("dilated", dilated)
    #cv2.destroyAllWindows()

    # find contours in thresholded image
    cnts = cv2.findContours(dilated.copy(), cv2.RETR_EXTERNAL,
                            cv2.CHAIN_APPROX_SIMPLE)
    cnts = imutils.grab_contours(cnts)
    if len(cnts) != 0:  # j lab gea  tan
        extLeft, extRight, extTop, extBot = 1e9, -1e9, 1e9, -1e9   # values jali likho
        for cc in cnts:   # extreme points labbo
            extLeft = min(cc[:, :, 0].min(), extLeft)
            extRight = max(cc[:, :, 0].max(), extRight)
            extTop = min(cc[:, :, 1].min(), extTop)
            extBot = max(cc[:, :, 1].max(), extBot)
        #print(extBot, extTop)
        if (extBot > 85) and extLeft < 70 and extRight > 40: # error value na chk lai es lai 
            return extLeft,extRight,extTop
    return -1,-1,-1


def walkbot1(q, key_w, key_s, walkbotloop):
        extLeft, extRight, extTop, extBot = -1, -1, -1, -1   # values jali likho
        try:
            extLeft,extRight,extTop = walkbot_screen_coordinates()
        except :    
            pass
        if extRight != -1:     # thr is a way
            if walkbotloop.value == 0:  
                return
            q.put(str(user+','+'3'+','+str(keyboardkeys["s"]) + ','+str('7')))
            q.put(str(user+','+'3'+','+str(keyboardkeys["w"]) + ','+str('6')))
       


        #if ((extTop - extRight) < 6) and ((extTop - extLeft) < 6):   #  samne rah hega
            # else: # use only top cordiante
            #        lastsign = "top"
            #print("all alinged")
        #if (abs((extRight - 57) - (57 - extLeft)) > 5):
            if (extRight - 57) > (57 - extLeft):  # rah kider a jaan wala left ya right?
                    #print("right")
                    q.put(str(user+','+'8'+',' +
                              (str(extRight - 57)*1) + ','+str('0')))
            else:
                    #print("Left")
                    q.put(str(user+','+'8'+',' +
                          str((extLeft - 57)*1) + ','+str('0')))
            return

        #lastsign = math.copysign(1, 57 - int(extTop[0]))
        #lastside = int(abs(extTop[0] - 57))
        # lastsidex = int((57 - int(extTop[0])) * 3) start

            
        q.put(str(user+','+'3'+','+str(keyboardkeys["w"]) + ','+str('7')))
        key_w.value = 0
        q.put(str(user+','+'3'+','+str(keyboardkeys["s"]) + ','+str('6')))
        key_s.value = 1
        time.sleep(1)
        q.put(str(user+','+'3'+','+str(keyboardkeys["s"]) + ','+str('7')))
        key_s.value = 0


        extexttop = -10
        while extexttop != -1 and walkbotloop.value == 1 and extexttop <= extTop :     # find way
            q.put(str(user+','+'8'+','+str(500) + ','+str('0')))
            time.sleep(1)
            extexttop = extTop
            extLeft,extRight,extTop = walkbot_screen_coordinates()
            if extTop == 0:
                q.put(str(user+','+'8'+','+str(500) + ','+str('0')))
                time.sleep(0.025)
                return

        #q.put(str(user+','+'8'+','+str(500) + ','+str('0')))
        #    time.sleep(0.025)
        #q.put(str(user+','+'8'+','+str(500) + ','+str('0')))
        # time.sleep(0.025)
       # q.put(str(user+','+'8'+','+str(500) + ','+str('0')))


def pixel(q, boyutlar, ortakare, walkbotloop, aimbotloop, key_w, key_s):
    lastfov = 200
    freez = 0
    last = 0
    start = -8888
    x_last = 78
    y_last = 56
    break_now = 0
    while True:
        if aimbotloop.value == 1:
            '''''
            if ortakare >= 50 and freez >= 1:
                ortakare = int(ortakare/2)
            elif ortakare < fovlimit:
                ortakare = int(ortakare*2)
            if lastfov != ortakare:
                # if ortakare > fovlimit:
                #ortakare = fovlimit
                boyutlar['left'] = int(breadth - ortakare*3.2)
                boyutlar['top'] = int(length - ortakare)
                boyutlar['width'] = int(ortakare*6.4)
                boyutlar['height'] = int(ortakare*2)
                lastfov = ortakare
                print("fov=", ortakare)
        #'''
            img = np.array(sct.grab(boyutlar))
            #cv2.imshow("Open", img)
            hsv = cv2.cvtColor(img, cv2.COLOR_BGR2HSV)
            mask = cv2.inRange(hsv, lower, upper)
            kernel = np.ones((3, 3), np.uint8)
            dilated = cv2.dilate(mask, kernel, iterations=5)
            thresh = cv2.threshold(dilated, 60, 255, cv2.THRESH_BINARY)[1]
            # print(thresh)
            #cv2.imshow("thresh", thresh)
            contours, hierarchy = cv2.findContours(
                thresh, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_NONE)

            if len(contours) != 0:
                M = cv2.moments(thresh)
                cX = int(M["m10"] / M["m00"])
                cY = int(M["m01"] / M["m00"])
                x = cX + boyutlar['left'] - 960
                y = cY + boyutlar['top'] - 540
                '''''
                if x_last == x and break_now == 5:
                    break_now = 0
                    print(break_now, " on break num its stick")
                    # break
                elif x_last == x:
                    break_now = break_now + 1
                x_last = x
                '''
                if ((timeit.default_timer() - last) < 0.28):
                    # try:
                    #time.sleep(0.014 - (timeit.default_timer() - last))
                    pass
                else:  # except:
                    #print(timeit.default_timer() - last)
                    q.put(str(user+','+'9'+','+str(x) + ','+str(y) + ',aim'))
                    last = timeit.default_timer()
                # print("shoot")
                freez = freez + 1
                try:
                    q.put(str(user+','+'3'+',' +
                          str(keyboardkeys["w"]) + ','+str('7')))
                    q.put(str(user+','+'3'+',' +
                          str(keyboardkeys["s"]) + ','+str('7')))
                    # if key_s.value == 1:
                    #togglekeys("s", "0",key_w,key_s)
                    # if key_w.value == 1:
                    #togglekeys("w", "0",key_w,key_s)
                except:
                    pass
                if freez == 1:
                    start = timeit.default_timer()
                    walkbotloop.value = 2
                    print("stop walkbot by aim")
            elif freez >= 1:
                stop = timeit.default_timer()
                #print('Time: ', stop - start)
                if int(stop - start) >= 3:
                    freez = 0
                    if walkbotloop.value == 2 and aimbotloop.value == 1:
                        print("start walkbot")
                        walkbotloop.value = 1


def togglekeys(key, state, key_w, key_s):
    if key == "w":
        if state == "0":
            key_w.value = 0
            q.put(str(user+','+'3'+','+str(keyboardkeys["w"]) + ','+str('7')))
            print("w released")
        else:
            key_w.value = "1"
            q.put(str(user+','+'3'+','+str(keyboardkeys["w"]) + ','+str('6')))
            print("w pressed")
    elif key == "s":
        if state == "0":
            key_s.value = 0
            q.put(str(user+','+'3'+','+str(keyboardkeys["s"]) + ','+str('7')))
            print("s released")
        else:
            key_s.value = 1
            q.put(str(user+','+'3'+','+str(keyboardkeys["s"]) + ','+str('6')))
            print("s pressed")


def keyboardkey(x, y, DeviceEvent, q):
    xx = [char for char in x]
    for i in xx:
        # print(i)
        if i.islower() or i.isdigit():
            q.put(str(user+','+str(inputkeys[DeviceEvent]) +
                      ','+str(keyboardkeys[i]) + ','+str(keystate[y])))
            time.sleep(0.05)
        else:
            q.put(str(user+','+str(inputkeys[DeviceEvent])+',' +
                      str(keyboardkeys["shift"]) + ','+str(keystate["down"])))
            q.put(str(user+','+str(inputkeys[DeviceEvent]) +
                      ','+str(keyboardkeys[i]) + ','+str(keystate[y])))
            q.put(str(user+','+str(inputkeys[DeviceEvent])+',' +
                      str(keyboardkeys["shift"]) + ','+str(keystate["up"])))


def DeviceEvents(DeviceEvent, x, y, q):
    if "m" in DeviceEvent:
        x = int(float(x))
        y = int(float(y))
        q.put(
            str(user+','+str(inputkeys[DeviceEvent])+','+str(x) + ','+str(y)))
        return
    try:
        x = keyboardkeys[x]
    except:
        keyboardkey(x, y, DeviceEvent, q)
        return
    q.put(str(user+','+str(inputkeys[DeviceEvent]
                           )+','+str(x) + ','+str(keystate[y])))


def wasd(text, aimbot, q):
    if text == "start":
        aimbot = 1
        return aimbot
    elif text == "stop":
        print("stop both")
        aimbot = 2
        return aimbot
    elif text == "walkstop":
        aimbot = 3
        return aimbot
    elif text == "aimstop":
        aimbot = 4
        return aimbot
    else:
        nn = text.split(",")
        if len(nn) != 3:
            print(f'wrong:{text}')
        else:
            DeviceEvent = nn[0]
            x = nn[1]
            y = nn[2]
            DeviceEvents(DeviceEvent, x, y, q)
        return aimbot


text1 = 0
aimbot = 0
lastfov = 0
clipboardcommands = True

if __name__ == '__main__':
    q = multiprocessing.Queue()  # aim pope
    qt = multiprocessing.Queue()  # main pipe
    walkmsg = multiprocessing.Queue()  # walks pipe
    aimbotloop = Value('d', 0.0)
    walkbotloop = Value('d', 0.0)
    key_w = Value('d', 0.0)
    key_s = Value('d', 0.0)
    mwalkbot = multiprocessing.Process(
        target=walkbot, args=(walkmsg, walkbotloop, key_w, key_s))
    maimbot = multiprocessing.Process(target=pixel, args=(
        q, boyutlar, ortakare, walkbotloop, aimbotloop, key_w, key_s))
    msenddata = multiprocessing.Process(
        target=senddata, args=(q, walkmsg, walkbotloop, aimbotloop, qt))

    mwalkbot.start()
    maimbot.start()
    msenddata.start()

    '''''
    #366,-111   
    #
    #
    #
    #
    x = 366
    y = -111
    #q.put(str(user+','+'9'+','+str(x) + ','+str(y)))

    data = str(user+','+'9'+','+str(x) + ','+str(y)).encode("utf-8")
    print(data)
    client.sendto(data, addr)
    
    '''''
    config = configparser.ConfigParser()
    config.sections()
    config.read('settings.ini')
    text = 0

    while True:
        if clipboardcommands == True:
            try:
                config.read('settings.ini')
                text = config['logs']['clipboards']
            except:
                pass
            if text != text1:
                print('ahk ' + text)
                text1 = text
                aimbot = wasd(text, aimbot, qt)

        if (aimbot == 1):
            print("aim + walk enabled")
            aimbot = 0
            walkbotloop.value = 1  # ethe 1 krna
            aimbotloop.value = 1
        elif (aimbot == 2):
            aimbotloop.value = 0
            walkbotloop.value = 0
            print("aim + walk stoped")
            aimbot = 0
        elif (aimbot == 3):
            aimbot = 0
            walkbotloop.value = 0
        elif (aimbot == 4):
            aimbot = 0
            aimbotloop.value = 0
