FROM python:3.7-alpine

WORKDIR /code

# Copy the python script and set enviroment
COPY app.py . 
ENV FLASK_APP=app.py 

ENV FLASK_RUN_HOST=0.0.0.0
ENV FLASK_RUN_PORT=80
ENV CUSTOM_HEADER='My Default Containerized Webapp'
ENV BG_COLOR=white
ENV FONT_COLOR=black

# Upload and use the custom photo
COPY devops-journey-banner.png .
ENV CUSTOM_PHOTO=devops-journey-banner.png
# ENV CUSTOM_PHOTO='https://github.com/dannydsouza0908/helm-example/blob/main/devops-journey-banner.png'

RUN apk add --no-cache gcc musl-dev linux-headers

# Install all the required packages from the requirements.txt
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

RUN apk add --no-cache curl

EXPOSE 80

CMD ["flask", "run"]
