FROM python

ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1

WORKDIR /app 
COPY . /app/

RUN pip install --upgrade pip && \
    pip install -r requirements.txt &&\
    pip install Pillow

RUN python manage.py collectstatic --noinput
EXPOSE 8000
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
