#include <twitcurl.h>
#include <tensorflow.>
#include <stdio.h>
int main() {
	twitCurl twit;
	twit.setTwitterUsername(std::getenv("TWITTER_USERNAME"));
	twit.setTwitterPassword(std::getenv("TWITTER_PASSWORD"));
	printf("Twitcurl Setup Complete\n");
	printf("Hello from TensorFlow C library version %s\n", TF_Version());

}