@echo off
REM docker build -t tnb:latest . --build-arg BASE_CONTAINER=jupyter/tensorflow-notebook
docker build -t tnb:latest .

docker run -it --rm -p 8888:8888 -e JUPYTER_ENABLE_LAB=yes -v %cd%/notebooks:/home/jovyan/work tnb:latest