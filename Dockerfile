
FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y build-essential
RUN git clone https://github.com/CVirus/hipchat-exporter.git
WORKDIR /hipchat-exporter
RUN bundle install --path vendor/bundle

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
CMD /entrypoint.sh
