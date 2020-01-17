make:
	g++ model.cpp -o model -ltwitcurl
image:
	docker build -f Dockerfile .
container:
	docker run -i -t $(image) /bin/bash
clean:
	rm *.o
	rm *.a