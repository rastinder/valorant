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

sct = mss()
mid = 0
ortakare = 200
fovlimit = 200
breadth = 960
length = 540

boyutlar = sct.monitors[1]
boyutlar['left'] = int(breadth - (ortakare*3.2))
boyutlar['top'] = int(length - ortakare)
boyutlar['width'] = int(ortakare*6.4)
boyutlar['height'] = int(ortakare*2)

lower = np.array([145,208,0]) 
upper = np.array([150,255,255])


def pixel():
    lastfov = 200
    freez = 0
    last = 0
    start = -8888
    x_last = 78
    y_last = 56
    break_now = 0
    while True:
        #if aimbotloop.value == 1:
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
            hsv = cv2.cvtColor(img, cv2.COLOR_BGR2HSV)
            mask = cv2.inRange(hsv, lower, upper)
            kernel = np.ones((3, 3), np.uint8)
            dilated = cv2.dilate(mask, kernel, iterations=5)
            thresh = cv2.threshold(dilated, 60, 255, cv2.THRESH_BINARY)[1]
            # print(thresh)
            #cv2.imshow("thresh", thresh)
            contours, hierarchy = cv2.findContours(
                thresh, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_NONE)
            time.sleep(0.005)
            cv2.imshow("Open", img)
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
                if ((timeit.default_timer() - last) < 0.550):
                    # try:
                    #time.sleep(0.014 - (timeit.default_timer() - last))
                    pass
                else:  # except:
                    #print(timeit.default_timer() - last)
                    #q.put(str(user+','+'9'+','+str(x) + ','+str(y) + ',aim'))
                    last = timeit.default_timer()
                # print("shoot")
                freez = freez + 1
                # print(freez)
                if freez == 1:
                    start = timeit.default_timer()
                    #try:
                    #    q.put(str(user+','+'3'+',' +
                   #           str(keyboardkeys["w"]) + ','+str('7')))
                    #    q.put(str(user+','+'3'+',' +
                    #          str(keyboardkeys["s"]) + ','+str('7')))
                        # if key_s.value == 1:
                        #togglekeys("s", "0",key_w,key_s)
                        # if key_w.value == 1:
                        #togglekeys("w", "0",key_w,key_s)
                    #    walkbotloop.value = 2
                    #except:
                   #     pass
                #print(start - timeit.default_timer())
            elif freez >= 1:
                stop = timeit.default_timer()
                #print('Time: ', stop - start)
                break_now = 0
                if int(stop - start) >= 2:
                    freez = 0
           #         if walkbotloop.value == 2 and aimbotloop.value == 1:
                    print("start walkbot")
            #            walkbotloop.value = 1

pixel()