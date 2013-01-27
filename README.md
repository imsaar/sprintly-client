sprintly-client
===============
Simple Sprint.ly ruby client

To dump all your sprint.ly items to a pipe (|) demlimited text file from command line follow these steps:

* export SPRINTLY_USER="user@domain.com"
* export SPRINTLY_API_KEY="KeyMadeSpeciallyForU"
* export SPRINTLY_PRODUCT_ID="1234"

> ruby -w sprintly_dump.rb > /var/tmp/dump.txt
