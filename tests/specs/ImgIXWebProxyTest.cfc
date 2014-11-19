component
	extends = "TestCase"
	output = false
	hint = "I test the Base32 component."
	{

	// ---
	// TEST METHODS.
	// ---


	public void function testSignatures() {

		var testDomain = "https://bennadel.imgix.net";
		var testToken = "1234567890";

		var imgIx = new lib.ImgIXWebProxy( testDomain, testToken );

		// Generate a Web Proxy URL using a hash of commands.
		var proxyUrl = imgIx.getWebProxyUrl( 
			"https://s3.amazonaws.com/testing.bennadel.com/pluploads/global-upload/upload-1416317055972/goose-duck.jpg?AWSAccessKeyId=AKIAJEWTQBA6QCGG6FSA&Expires=1447853055&Signature=0wwPREdvA6PtRPRGN1CW7%2F0oFrI%3D",
			{
				w = 500,
				h = 500,
				mono = "FF33CC"
			}
		);

		assert( proxyUrl == "#testDomain#/https%3A//s3.amazonaws.com/testing.bennadel.com/pluploads/global-upload/upload-1416317055972/goose-duck.jpg%3FAWSAccessKeyId%3DAKIAJEWTQBA6QCGG6FSA%26Expires%3D1447853055%26Signature%3D0wwPREdvA6PtRPRGN1CW7%252F0oFrI%253D?w=500&mono=FF33CC&h=500&s=342cecf9f67f2ebe0bb39a5c84bae814" );

		
		// Generate a Web Proxy URL using a string of commands.
		var proxyUrl = imgIx.getWebProxyUrl( 
			"https://s3.amazonaws.com/testing.bennadel.com/pluploads/global-upload/upload-1416317055972/goose-duck.jpg?AWSAccessKeyId=AKIAJEWTQBA6QCGG6FSA&Expires=1447853055&Signature=0wwPREdvA6PtRPRGN1CW7%2F0oFrI%3D",
			"w=300&h=300&mono=ff33cc"
		);

		assert( proxyUrl == "#testDomain#/https%3A//s3.amazonaws.com/testing.bennadel.com/pluploads/global-upload/upload-1416317055972/goose-duck.jpg%3FAWSAccessKeyId%3DAKIAJEWTQBA6QCGG6FSA%26Expires%3D1447853055%26Signature%3D0wwPREdvA6PtRPRGN1CW7%252F0oFrI%253D?w=300&h=300&mono=ff33cc&s=dddaf655678c42070819836edac5c81d" );


		// Generate a Web Proxy URL using a more simple URL.
		var proxyUrl = imgIx.getWebProxyUrl( 
			"http://www.bennadel.com/images/header/ye_wang_simon_free_spencer_strickland.jpg",
			"w=300&h=300"
		);

		assert( proxyUrl == "#testDomain#/http%3A//www.bennadel.com/images/header/ye_wang_simon_free_spencer_strickland.jpg?w=300&h=300&s=01c76e271ad279e8df5cab386657840b" );


		// Generate a Web Proxy URL using a URL with more special characters.
		var proxyUrl = imgIx.getWebProxyUrl( 
			"https://s3.amazonaws.com/testing.bennadel.com/pluploads/global-upload/upload-1416396506299/Ben%2Bjune+%28groovy%29%21.png?AWSAccessKeyId=AKIAJEWTQBA6QCGG6FSA&Expires=1447932506&Signature=wm0TDqjJO%2BEPnjff1Tc95oUWqsY%3D",
			{
				w = 300,
				h = 300
			}
		);

		assert( proxyUrl == "#testDomain#/https%3A//s3.amazonaws.com/testing.bennadel.com/pluploads/global-upload/upload-1416396506299/Ben%252Bjune%2B%2528groovy%2529%2521.png%3FAWSAccessKeyId%3DAKIAJEWTQBA6QCGG6FSA%26Expires%3D1447932506%26Signature%3Dwm0TDqjJO%252BEPnjff1Tc95oUWqsY%253D?w=300&h=300&s=fbb15bdb95e3bee246a0e905f461c9ae" );
		
	}

}