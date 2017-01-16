# Highres Deepdream 

Lots of people have complained about the size/resolution limitation of the original deepdream Caffe implementation. 
This little python app is based directly on the [offical Google Deepdream example that comes with Tensorflow](https://github.com/tensorflow/tensorflow/blob/master/tensorflow/examples/tutorials/deepdream/deepdream.ipynb) by Alex Mordvintsev, which doesnt suffer from those limitations.

Install Requirements:

- Python 2.7
- TensorFlow (>=r0.7)
- NumPy

Download pretrained Inception V5 from here:
https://storage.googleapis.com/download.tensorflow.org/models/inception5h.zip

Run deepdream like this:
 python deepdream.py --input mymegapixelimage.jpg --tilesize 2048

For help & options:
 python deepdream.py --help
