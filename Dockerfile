# Get the GCC preinstalled image from Docker Hub
FROM gcc:4.9
 
# Copy the current folder which contains C++ source code to the Docker image under /usr/src
COPY . /usr/src/political-bias-discriminator
 
# Specify the working directory
WORKDIR /usr/src/political-bias-discriminator

# Define Environment Variables
ENV TWITTER_PASSWORD=$TWITTER_PASSWORD
ENV TWITTER_USERNAME=$TWITTER_USERNAME

# Build libtwitcurl Libraries
RUN git clone https://github.com/swatkat/twitcurl
RUN cd twitcurl/libtwitcurl && make && cd ~
RUN cp twitcurl/libtwitcurl/libtwitcurl.so.1.0 /usr/lib/libtwitcurl.so.1
RUN rm -r twitcurl
RUN ln -s /usr/lib/libtwitcurl.so.1 /usr/lib/libtwitcurl.so

# Install tools and export paths
RUN apt-get update
RUN apt-get install nano -y
RUN export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib
RUN make

# Execute
CMD ["./model"]