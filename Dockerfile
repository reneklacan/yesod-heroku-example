FROM fpco/stack-build

WORKDIR /app
ADD . /app/
RUN stack build

CMD stack exec yesod-heroku
