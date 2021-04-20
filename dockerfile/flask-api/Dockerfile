FROM python:3
LABEL version="0.1"
WORKDIR /usr/src/app
COPY . .
RUN pip install --no-cache-dir -r ./requirements.txt
EXPOSE 10009
CMD [ "python", "api.py"]
