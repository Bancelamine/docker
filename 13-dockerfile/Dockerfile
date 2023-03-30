FROM python:slim-bullseye
LABEL version=v1.0.0
LABEL app=xavki-app
ENV FLASK_APP=app.py
ENV FLASK_ENV=dev
WORKDIR /app
COPY . .
RUN pip3 install -r requirements.txt
COPY index.html .
EXPOSE 5000
CMD ["flask", "run", "--host=0.0.0.0"]
