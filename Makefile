make:
	g++ model.cpp -I./include -ltwitcurl -ltensorflow -o model
image:
	docker build -f Dockerfile .
container:
	docker run \
	-e TWITTER_PASSWORD= ${TWITTER_PASSWORD} \
	-e TWITTER_USERNAME=${TWITTER_USERNAME} \
	-e TWITTER_API_KEY=${TWITTER_API_KEY} \
	-e TWITTER_API_SECRET=${TWITTER_API_SECRET} \
	-v ~/workspace/political-bias-discriminator/model.cpp:/usr/src/political-bias-discriminator/model.cpp \
	-i -t $(image) /bin/bash
clean:
	rm *.o
	rm *.a