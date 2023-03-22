FROM continuumio/miniconda3
RUN apt-get update && apt-get install -y libgl1-mesa-glx
RUN mkdir /code

WORKDIR /code

COPY . /code/

RUN conda install -n base -c anaconda -c conda-forge -c fastai -c akode --file /code/requirements.txt && \
    pip install opencv-contrib-python-headless && \
    pip install --no-deps mediapipe && \
    conda clean --all --yes

RUN echo "conda activate base" >> ~/.bashrc
