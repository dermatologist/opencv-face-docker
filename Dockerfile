FROM continuumio/miniconda3

RUN mkdir /code

WORKDIR /code

COPY . /code/

RUN conda install -n base -c anaconda -c conda-forge -c akode --file /code/requirements.txt && \
	pip install --no-deps face_recognition && \
    conda clean --all --yes

RUN echo "conda activate base" >> ~/.bashrc
