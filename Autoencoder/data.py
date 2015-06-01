import os
from PIL import Image
import numpy as np

def load_data():

	data = np.empty((464,1,480, 720),dtype="float32")
	label = np.empty((464,),dtype="uint8")

	imgs = os.listdir("./close_gray")
	num = len(imgs)
	for i in xrange(num):
	    img = Image.open("./close_gray/" + imgs[i])
	    arr = np.asarray(img, dtype="float32")
	    data[i,:,:,:] = arr
	    label[i] = int(0)

	imgs = os.listdir("./open_gray")
	num = len(imgs)
	for i in xrange(num):
	    img = Image.open("./open_gray/" + imgs[i])
	    arr = np.asarray(img, dtype="float32")
	    data[i+232,:,:,:] = arr
	    label[i+232] = int(1)

	'''
	data = np.empty((451,1,32,32),dtype="float32")
	label = np.empty((451,),dtype="uint8")

	imgs = os.listdir("./train")
	num = len(imgs)
	for i in xrange(num):
	    img = Image.open("./train/" + imgs[i])
	    arr = np.asarray(img, dtype="float32")
	    data[i,:,:,:] = arr
	    if i < 204:
	        label[i] = int(1)
	    else:
	    	label[i] = int(0)
	'''
	scale = np.max(data)
	data /= scale
	mean = np.std(data)
	data -= mean
	return data