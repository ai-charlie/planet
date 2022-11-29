Project_Path=~/workspace
IMAGE_TAG=

docker run  --gpus all \
-p 8889:8889 \
--shm-size=8gb --ipc=host --ulimit memlock=-1 --ulimit stack=67108864 \
-v $Project_Path:/workspace/code --rm -it $IMAGE_TAG \
jupyter-lab --port=8889 --no-browser --ip 0.0.0.0 --allow-root  