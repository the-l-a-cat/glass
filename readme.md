
A vision of web page styling.
========================================

* I will use inline block A tags exclusively.
We attempt to expand clickable areas.

* I will use complex effects as the style keystone.
Every clickable or otherwise important element will respond to hovers impressively.

* I will use thinly framed rectangular blocks exclusively.

* Nothing moves. Nothing changes color.
I will use fade, transparency and shadow. To move something, fade it out first.

TODO:
-----

* No scroll.
* No flow.
* No selection on active elements.


A note on CORS
====================

Naturally, WikiMedia Foundation API only shares its resources with WikiMedia Foundation origins.
So remember to become one! Proceed as follows:

* Include the following simple Unbound configuration:
local-zone: "kindrom.wikiversity.org." static
local-data: "kindrom.wikiversity.org. 60 IN A 127.0.0.1"
* Open your pages as http://kindrom.wikiversity.org/html/

Surely you may pick any domain from the list:
https://git.wikimedia.org/raw/operations%2fmediawiki%2dconfig.git/HEAD/wmf%2dconfig%2fCommonSettings%2ephp#l764

* Make sure origin global variable is set to the domain you choose.
