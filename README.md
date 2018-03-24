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


## Using Docker

You don't need to install and manage python deps on your native system, just run the whole thing in a container!

1. Install Docker for [Mac](https://www.docker.com/docker-mac) / [Linux](https://docs.docker.com/install/) / [Windows 10](https://docs.docker.com/docker-for-windows/install/#download-docker-for-windows)
2. Start docker

### Option 1: Get source and build it
3. Clone project
4. Build Docker image
```bash
docker build -t deepdream .
```
5. Place image in the `images` directory (in below examples, we create `images/input.jpg`)
6. Run app in Docker
```bash
# deepdream
docker run --rm -i -v $(pwd)/images:/app/images -t deepdream python deepdream.py --input images/input.jpg --output images/output.jpg --layer import/mixed5a_5x5_pre_relu --frames 7 --octaves 10 --iterations 10

# zoom-in series
docker run --rm -i -v $(pwd)/images:/app/images -t deepdream python deepdream.py --input images/input.jpg --output images/output.jpg --layer import/mixed4d_3x3 --frames 100 --frame_scale 1.4 --frame_crop --octaves 4  --iterations  10
```

## Option 2: Run from prebuilt image
https://hub.docker.com/r/atomantic/deepdream/

same as option 1, but reference `-t atomantic/deepdream` and run:
```bash
# deepdream
docker run --rm -i -v $(pwd)/images:/app/images -t atomantic/deepdream python deepdream.py --input images/input.jpg --output images/output.jpg --layer import/mixed5a_5x5_pre_relu --frames 7 --octaves 10 --iterations 10
```