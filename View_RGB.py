import numpy as np
import cv2
from ps5_hdcam_configuration import *

cap = cv2.VideoCapture(devid)

cap.set(cv2.CAP_PROP_FRAME_WIDTH, CAP_W)
cap.set(cv2.CAP_PROP_FRAME_HEIGHT, CAP_H)

def decode(frame):
    left = np.zeros((H,W,3), np.uint8)
    right = np.zeros((H,W,3), np.uint8)
    
    for i in range(H):
        left[i] = frame[i, 0: W] 
        right[i] = frame[i, W: CAP_W] 
    
    return (left, right)

while(True):

    ret, frame = cap.read()
    #cv2.normalize(frame, frame, 0, 255, cv2.NORM_MINMAX)

    left, right = decode(frame)

    cv2.imshow('left',left)
    cv2.imshow('right',right)

    cv2.resizeWindow('left',W,H)

    if cv2.waitKey(1) & 0xFF == ord('q'):
        break

cap.release()
cv2.destroyAllWindows()
