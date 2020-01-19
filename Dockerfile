# Get the GCC preinstalled image from Docker Hub
FROM gcc:4.9
 
# Copy the current folder which contains C++ source code to the Docker image under /usr/src
COPY . /usr/src/political-bias-discriminator
 
# Specify the working directory
WORKDIR /usr/src/political-bias-discriminator

# Define Environment Variables
ENV TWITTER_PASSWORD=$TWITTER_PASSWORD
ENV TWITTER_USERNAME=$TWITTER_USERNAME
ENV TWITTER_API_KEY=$TWITTER_API_KEY
ENV TWITTER_API_SECRET=$TWITTER_API_SECRET

# Build libtwitcurl Libraries
RUN git clone https://github.com/swatkat/twitcurl
RUN cd twitcurl/libtwitcurl && make && cd ~
RUN cp twitcurl/libtwitcurl/libtwitcurl.so.1.0 /usr/lib/libtwitcurl.so.1
RUN rm -r twitcurl
RUN ln -s /usr/lib/libtwitcurl.so.1 /usr/lib/libtwitcurl.so

# Setup Tensorflow CPU support
RUN wget https://storage.googleapis.com/tensorflow/libtensorflow/libtensorflow-cpu-linux-x86_64-1.15.0.tar.gz
RUN tar xvzf libtensorflow-cpu-linux-x86_64-1.15.0.tar.gz
RUN cp -r lib/* /usr/lib && ldconfig
RUN rm -r THIRD_PARTY_TF_C_LICENSES LICENSE lib libtensorflow-cpu-linux-x86_64-1.15.0.tar.gz

# Download IBC
RUN mkdir ibc && cd ibc && wget https://people.cs.umass.edu/~miyyer/data/sample_ibc.tar.gz
RUN tar xvzf sample_ibc.tar.gz && rm sample_ibc.tar.gz && cd ..
# Install tools and export paths
RUN apt-get update
RUN apt-get install nano -y
RUN export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib
RUN make

# Execute
CMD ["./model"]
