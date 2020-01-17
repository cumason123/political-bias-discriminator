#include <iostream>
#include "include/twitcurl.h"

int main() {
	twitCurl twit;
	twit.setTwitterUsername(std::getenv("TWITTER_USERNAME"));
	twit.setTwitterPassword(std::getenv("TWITTER_PASSWORD"));
	std::cout << "Set twitter login creds" << std::endl;
}