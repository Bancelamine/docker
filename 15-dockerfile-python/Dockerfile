FROM python@sha256:2659ee0e84fab5bd62a4d9cbe5b6750285e79d6d6ec00d8e128352dad956f096

# Labels
LABEL version=v1.0.0
LABEL owner=xavki-app

# Env vars
ENV FLASK_APP=app.py
ENV FLASK_ENV=dev

ARG APP_USER=xavki

# Create a dedicated user

RUN adduser -D ${APP_USER}

# Directory
WORKDIR /app

# Copy & install requirements
RUN apk add --no-cache curl=8.0.1-r0

USER ${APP_USER}:${APP_USER}
COPY --chown=xavki  requirements.txt requirements.txt
RUN pip3 install --no-cache-dir -r requirements.txt

# Copy all files
COPY --chown=xavki . .

# Expose port
EXPOSE 5000

CMD ["python", "-m", "flask", "run", "--host=0.0.0.0"]
