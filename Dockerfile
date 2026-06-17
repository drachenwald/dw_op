FROM python:3.13-slim-bookworm

WORKDIR /usr/local/app

COPY requirements.txt ./ 

RUN pip install --no-cache-dir -r requirements.txt

COPY . ./

EXPOSE 5000

RUN useradd app
USER app

ENV FLASK_APP=viewer.py

CMD ["flask", "run", "--host", "0.0.0.0"]
