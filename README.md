# docker-pmwiki
![license](https://img.shields.io/github/license/sesceu/docker-pmwiki.svg "license")
![stars](https://img.shields.io/docker/stars/sesceu/pmwiki.svg "stars")
![pulls](https://img.shields.io/docker/pulls/sesceu/pmwiki.svg "pulls")

A docker build context for [PmWiki](http://www.pmwiki.org/wiki).

This container hosts an nginx instance configured to serve pmwiki website.

It does NOT include pmwiki itself.  That is expected to be provided (along with the site)
in a volume mounted to /var/www/html.
