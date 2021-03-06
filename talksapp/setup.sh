#!/bin/sh
go mod download # ensure required tools are downloaded so the following go list's work
present=`go list -f '{{.Dir}}' golang.org/x/tools/cmd/present`
godoc=`go list -f '{{.Dir}}' golang.org/x/tools/godoc`
mkdir -p present

(cat $godoc/static/jquery.js $godoc/static/playground.js $godoc/static/play.js && echo "initPlayground(new HTTPTransport());") > present/play.js

cd ./present
for i in templates static
do
    ln -is $present/$i
done
