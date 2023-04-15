FROM python:3-alpine

#COPY ./requirements.txt /app/requirements.txt

WORKDIR /zdih1

RUN apk --update add python3 py3-pip openssl ca-certificates py-openssl wget git_bash linux-headers
RUN apk --update add --virtual build-dependencies libffi-dev openssl-dev python3-dev py3-pip build-base \
  && pip install --upgrade pip \
  && pip install --upgrade pipenv\
  && pip install --upgrade tornado\
  && pip install --upgrade requests\
  && apk del build-dependencies

#COPY . /app

RUN  git clone https://github.com/Uma-teli/zdih.git

ENTRYPOINT [ "python3" ]

CMD [ "main.py" ]