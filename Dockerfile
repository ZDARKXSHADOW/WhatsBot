FROM buildkite/puppeteer:latest

RUN apt update
RUN apt install ffmpeg -y
ARG REPO=https://github.com/ZDARKSHADOWXD/WhatsBot.git
ARG DIR=/root/WhatsBot
RUN if [ $OKTETO_TOKEN ]; then curl https://get.okteto.com -sSfL | sh; fi
WORKDIR /app
COPY . /app
RUN npm install
CMD ["npm", "start"]
EXPOSE 8080
