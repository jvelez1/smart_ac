FROM ruby:3.0.0

WORKDIR /api
COPY . /api
RUN bundle install --jobs 2

RUN chmod +x /api/bin/setup.sh

EXPOSE 4567
CMD ["/bin/bash"]