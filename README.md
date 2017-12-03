# Highres Deepdream 

The size/resolution limitation of the original deepdream Caffe implementation made deep dreaming large photos tricky. However, the [offical Google Deepdream example that comes with Tensorflow](https://github.com/tensorflow/tensorflow/blob/master/tensorflow/examples/tutorials/deepdream/deepdream.ipynb) by Alex Mordvintsev, doesnt suffer from those limitations. However it only came as a IPython notebook, so here's a little commandline app based on Alex's notebook for just applying deepdream to large images in bulk. 

Install Requirements:

- Python 2.7
- TensorFlow (>=r0.7)
- NumPy

Download pretrained Inception V5 from here:
https://storage.googleapis.com/download.tensorflow.org/models/inception5h.zip

Run deepdream like this:
 python deepdream.py --input mymegapixelimage.jpg --output output.jpg --layer import/mixed5a_5x5_pre_relu --frames  7  --octaves 10 --iterations  10

Or create a zoom-in series like so:

python deepdream.py --input mystart.jpg --output output.jpg --layer import/mixed4d_3x3 --frames 100 --frame_scale 1.4 --frame_crop --octaves 4  --iterations  10

For help & options:
 python deepdream.py --help
