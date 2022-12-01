Project_Path=~/workspace
IMAGE_NAME=tensorrt:trt8.5.1-cu11.3-ubuntu2004
CONTAINER_NAME=tensorrt-py38

docker run  --gpus all \
--name $CONTAINER_NAME \
-p 20351:8888 \
--shm-size=8gb --ipc=host --ulimit memlock=-1 --ulimit stack=67108864 \
-v $Project_Path:/workspace/ -it $IMAGE_NAME \
# jupyter-lab --port=8888 --no-browser --ip 0.0.0.0 --allow-root  