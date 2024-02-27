# Use latest nginx image as base image.
FROM nginx:latest

# Install wget and unzip
RUN apt-get update -y && \
    apt-get install wget -y && \
    apt-get install unzip -y


# Change Directory to the path that host nginx default website
WORKDIR /usr/share/nginx/html

# Download source code from a website
RUN wget https://www.free-css.com/assets/files/free-css-templates/download/page296/mediplus-lite.zip


# Unzip folder
RUN unzip mediplus-lite.zip

# Copy files into nginx html directory
RUN cp -r mediplus-lite/. .

# Delete unwanted files
RUN rm -rf mediplus-lite mediplus-lite.zip

# Expose container port
EXPOSE 80
