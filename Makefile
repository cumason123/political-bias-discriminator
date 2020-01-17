make:
	g++ -c model.cpp -o model.o
	g++ -o model model.o -L./lib -ltwitcurl
	./model
image:
	docker build -f Dockerfile .
container:
	docker run -i -t $(image) /bin/bash
clean:
	rm *.o
	rm *.a