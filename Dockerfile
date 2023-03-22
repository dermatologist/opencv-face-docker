FROM continuumio/miniconda3

RUN mkdir /code

WORKDIR /code

COPY . /code/

RUN conda install -n base -c anaconda -c conda-forge -c fastai -c akode --file /code/requirements.txt && \
	pip install mediapipe && \
    conda clean --all --yes

RUN echo "conda activate base" >> ~/.bashrc
