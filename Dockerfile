FROM fpco/stack-build

WORKDIR /app
ADD . /app/
RUN stack config set system-ghc --global true
RUN stack build

CMD stack exec yesod-heroku
