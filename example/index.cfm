<cfscript>

	// This reads in a JSON configuration file that contains my secure token (so that I
	// don't have to have the credentials in the repository). This file contains a hash:
	// --
	// { "domain": "http://my_source_domain", "token": "my_source_token" }
	// --
	config = deserializeJson( fileRead( expandPath( "./config.json" ) ) );

	// Create an instance of our ImgIX Web Proxy component.
	imgIx = new lib.ImgIXWebProxy( config.domain, config.token );


	// ------------------------------------------------------ //
	// ------------------------------------------------------ //


	// Generate a Web Proxy URL using a hash of commands.
	proxyUrl = imgIx.getWebProxyUrl( 
		"https://s3.amazonaws.com/testing.bennadel.com/pluploads/global-upload/upload-1416317055972/goose-duck.jpg?AWSAccessKeyId=AKIAJEWTQBA6QCGG6FSA&Expires=1447853055&Signature=0wwPREdvA6PtRPRGN1CW7%2F0oFrI%3D",
		{
			w = 500,
			h = 500,
			mono = "FF33CC"
		}
	);

	writeOutput( proxyUrl );

	
	// ------------------------------------------------------ //
	writeOutput( "<br /><br />" );
	// ------------------------------------------------------ //
	

	// Generate a Web Proxy URL using a string of commands.
	proxyUrl = imgIx.getWebProxyUrl( 
		"https://s3.amazonaws.com/testing.bennadel.com/pluploads/global-upload/upload-1416317055972/goose-duck.jpg?AWSAccessKeyId=AKIAJEWTQBA6QCGG6FSA&Expires=1447853055&Signature=0wwPREdvA6PtRPRGN1CW7%2F0oFrI%3D",
		"w=300&h=300&mono=ff33cc"
	);

	writeOutput( proxyUrl );


	// ------------------------------------------------------ //
	writeOutput( "<br /><br />" );
	// ------------------------------------------------------ //
	

	// Generate a Web Proxy URL using a much more simple URL.
	proxyUrl = imgIx.getWebProxyUrl( 
		"http://www.bennadel.com/images/header/ye_wang_simon_free_spencer_strickland.jpg",
		{
			w = 300,
			h = 300
		}
	);

	writeOutput( proxyUrl );

</cfscript>
