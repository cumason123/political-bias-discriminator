make:
	g++ model.cpp -I./include -ltwitcurl -ltensorflow -o model
image:
	docker build -f Dockerfile .
container:
	docker run \
	-v "~/workspace/political-bias-discriminator/model.cpp:/usr/src/political-bias-discriminator/model.cpp" \
	-i -t $(image) /bin/bash
clean:
	rm *.o
	rm *.a