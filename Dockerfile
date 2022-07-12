FROM node:lts
MAINTAINER helios main dev <heliosmaindev@gmail.com>
WORKDIR /var/www/html
ENV DEBIAN_FRONTEND noninteractive
ENV TZ=UTC
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
COPY ./ /var/www/html
RUN chmod +x -R /var/www/html
# Run without cache below
ARG CACHEBUST=1
RUN npm install
RUN chown -R node:node /var/www/html/node_modules
EXPOSE 3000
CMD ["npm", "start"]
