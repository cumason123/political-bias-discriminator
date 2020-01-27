make:
	g++ model.cpp -I./include -ltwitcurl -ltensorflow -o model
image:
	docker build -t classifier .
container:
	docker run \
	-v "/Users/curtismason/workspace/political-bias-discriminator/model.cpp:/usr/src/political-bias-discriminator/model.cpp" \
	--env-file .env \
	-i -t $(image) /bin/bash
clean:
	rm *.o
	rm *.a