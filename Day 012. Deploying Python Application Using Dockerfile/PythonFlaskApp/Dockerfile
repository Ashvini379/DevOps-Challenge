FROM python:3.11-alpine
LABEL maintainer="ashii32mahajan@gmail.com"
COPY . /app
WORKDIR /app
RUN pip install -r requirements.txt
EXPOSE 8085
ENTRYPOINT ["python"]
CMD ["src/app.py"]
