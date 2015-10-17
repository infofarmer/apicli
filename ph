#!/bin/sh

. ~/.phrc

args=-H 

case $1 in
	delete|put|get|post)
		method=`echo $1 | tr '[:lower:]' '[:upper:]'`
		shift
		;;
esac

curl \
	-# \
	-H "Authorization: Bearer $key" \
	-X ${method:-GET} \
	"https://api.producthunt.com/v1/`echo $* | tr -s ' ' '/'`" | jq ''
