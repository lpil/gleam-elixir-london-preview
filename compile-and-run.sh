#!/bin/sh

gleamc compile src/web_app.gleam
echo ":gleam_web_app.start_link()" | iex -pa src -S mix
