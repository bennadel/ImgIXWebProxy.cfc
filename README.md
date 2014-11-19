
# A ColdFusion Wrapper For The ImgIX Web Proxy API

by [Ben Nadel][bennadel] (on [Google+][googleplus])

[ImgIX][imgix] is a Software as a Service (SaaS) that bills itself as "Dynamic Imaging at Web Scale". 
It's basically a web proxy that sits between your servers and your users and serves up augmented
images, on-demand, based on URL structure. This includes, but is not limited to, resizing, tinting, 
cropping, water-marking, and adding text.

This project offers a way to generate ImgIX urls for their Web Proxy source, which essentially allows
any URL to be piped through their image processing, including pre-signed Amazon S3 URLs. 


[bennadel]: http://www.bennadel.com
[googleplus]: https://plus.google.com/108976367067760160494?rel=author
[imgix]: http://www.imgix.com