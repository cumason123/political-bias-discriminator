make:
	g++ model.cpp -I./include -ltwitcurl -ltensorflow -o model
image:
	docker build -f Dockerfile .
container:
	docker run -i -t $(image) /bin/bash
clean:
	rm *.o
	rm *.a