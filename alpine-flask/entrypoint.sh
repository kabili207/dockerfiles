#!/bin/sh

if [ -e requirements.txt ]; then
	pip install -r requirements.txt
fi
uwsgi --ini /app.ini
