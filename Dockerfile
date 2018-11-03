FROM alpine:latest

MAINTAINER Rhys Botfield <rhys@sproutdesk.co.uk>

RUN apk add --no-cache varnish

ADD default.vcl /etc/varnish/default.vcl

CMD varnishd -f /etc/varnish/default.vcl -a :8888 -s malloc,128m && varnishlog -w /var/log/varnish/varnish.log -A
