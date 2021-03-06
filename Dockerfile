FROM starefossen/ruby-node

# Set the workdir inside the container
WORKDIR /usr/src/app

# Set the gemfile and install
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copy the main application.
COPY . ./
VOLUME /log

# Expose port 3000 to the Docker host, so we can access it
# from the outside.
RUN ["chmod", "755", "./entrypoint.sh"]
ENTRYPOINT ["./entrypoint.sh"]
EXPOSE 3000

# The main command to run when the container starts. Also
# tell the Rails dev server to bind to all interfaces by
# default.
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
