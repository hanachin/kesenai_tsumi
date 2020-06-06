FROM rubylang/ruby:2.7.1-bionic

RUN apt-get update -qq && \
  apt-get install -y curl gnupg && \
  bash -c 'curl -fsSL https://deb.nodesource.com/setup_14.x | bash -' && \
  bash -c 'curl -fsSL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -' && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list && \
  apt-get update -qq && \
  apt-get install -y nodejs postgresql-client build-essential libpq-dev yarn && \
  groupadd --non-unique --gid 1000 app && \
  useradd --system --non-unique --create-home --uid 1000 --gid 1000 app && \
  mkdir -p /app/.bundle && \
  mkdir -p /app/node_modules && chown -R app:app /app

COPY entrypoint.sh /usr/bin
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
USER app

WORKDIR /app
ENV PATH /app/bin:$PATH
EXPOSE 3000
CMD ["rails", "server", "--binding", "0.0.0.0", "--port", "3000"]
