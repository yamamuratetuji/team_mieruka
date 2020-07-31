FROM python:3.7-slim

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /

COPY Pipfile Pipfile.lock /
RUN pip install pipenv && pipenv install --system

COPY . /

EXPOSE 8000

ENTRYPOINT ["python", "manage.py", "runserver", "0.0.0.0:8000"]