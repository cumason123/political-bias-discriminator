#include <twitcurl.h>
#include <tensorflow/c/c_api.h>
#include <stdio.h>
#include <iostream>
twitCurl *oAuthFlow() {
	twitCurl twit;

	std::string replyMsg;
	std::string myOAuthAccessTokenKey("");
	std::string myOAuthAccessTokenSecret("");

	char tmpBuf[1024];
	memset( tmpBuf, 0, 1024 );

	twit.setTwitterUsername(std::getenv("TWITTER_USERNAME"));
	twit.setTwitterPassword(std::getenv("TWITTER_PASSWORD"));

	/* OAuth flow begins */
	/* Step 0: Set OAuth related params. These are got by registering your app at twitter.com */
	printf("Beginning auth with %s, %s\n", std::getenv("TWITTER_API_KEY"), std::getenv("TWITTER_API_SECRET"));
	printf("Beginning auth with %s, %s\n", std::getenv("TWITTER_API_KEY"), std::getenv("TWITTER_API_SECRET"));
	twit.getOAuth().setConsumerKey(std::getenv("TWITTER_API_KEY"));
	twit.getOAuth().setConsumerSecret(std::getenv("TWITTER_API_SECRET"));

	/* Step 2: Get request token key and secret */
	std::string authUrl;
    twit.oAuthRequestToken( authUrl );
	printf("Cool\n");

	/* Step 3: Get PIN  */
	// twit.oAuthHandlePIN(authUrl);

	/* Step 4: Exchange request token with access token */
	// twit.oAuthAccessToken();

	// /* Step 5: Now, save this access token key and secret for future use without PIN */
	// twit.getOAuth().getOAuthTokenKey(myOAuthAccessTokenKey);
	// twit.getOAuth().getOAuthTokenSecret(myOAuthAccessTokenSecret);
	// /* Check reply */
	// /* Account credentials verification */
	// if(twit.accountVerifyCredGet()) { 
	// 	twit.getLastWebResponse(replyMsg);
	// 	printf("\nmodel::twitCurl::accountVerifyCredGet web response:\n%s\n", replyMsg.c_str());
	// }
	// else {
	// 	twit.getLastCurlError(replyMsg);
	// 	printf("\nmodel::twitCurl::accountVerifyCredGet error:\n%s\n", replyMsg.c_str());
	// }
	return NULL;
}

int main() {
	FILE *env = fopen(".env", "r");
	if (env == NULL) {
		printf("Please store the following environment variables in a .env file!\n");
		printf("[TWITTER_USERNAME, TWITTER_PASSWORD, TWITTER_API_KEY, TWITTER_API_SECRET]\n");
		exit(1);
	}
	twitCurl* twit = oAuthFlow();
	printf("Hello from TensorFlow C library version %s\n", TF_Version());
}
