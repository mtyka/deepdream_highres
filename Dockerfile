FROM tensorflow/tensorflow

RUN mkdir /app
WORKDIR /app
COPY . /app
RUN curl https://storage.googleapis.com/download.tensorflow.org/models/inception5h.zip -o inception5h.zip
RUN unzip -u inception5h.zip

CMD ["python", "deepdream.py", \
    "--input", "dir/input.jpg", \
    "--output", "dir/output.jpg", \
    "--layer", "import/mixed5a_5x5_pre_relu", \
    "--frames", "7", \
    "--octaves", "10", \
    "--iterations", "10"\
]