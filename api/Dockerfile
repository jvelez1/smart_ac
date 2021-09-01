FROM ruby:3.0.0

WORKDIR /api
COPY . /api
RUN bundle install --jobs 2
EXPOSE 4567
CMD ["/bin/bash"]