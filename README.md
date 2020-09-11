# Setup

To put everything up and running you need to have docker and docker-compose installed in your machine. Then run:

* make install
* make clean_db
* make start

# Using the app

Yo go to `localhost:3000` (you can configure the port setting up the env constant `FOLLOW_ME_PORT`). There you can go to `/users/d2c71a50-ee22-43a1-b3e7-c8430aa9d3af/followers` that is an example of how it works

# Aviable endpoint

There's also an URL available with the code running (clusb branch) `http://ec2-63-34-177-187.eu-west-1.compute.amazonaws.com:5501` the example URL to get the followers of a user `http://ec2-63-34-177-187.eu-west-1.compute.amazonaws.com:5501/users/d2c71a50-ee22-43a1-b3e7-c8430aa9d3af/followers`

# Follow up questions

* What are potential pitfalls when expanding on your solution.
  * One of the main problems is that with a big a amount of users following one each other the payload to send in the call can be so big that you can not send all the information at once. To solve this problem you need to paginate the information so it's divided, one of the params to send could be the `page_size` and the `page`
  * Also another problem could be retrieving all that data from the data base, so to avoid it a solution is to cache tha data after being requested. The cached data needs to be invalidated after some time or if the followers/followed change.
* How big would your solution scale to, and what would you do at that point?
  * It can scalate more or less to 100 follwers, after that the pagination solution should be implemented.
* How would you modify your implementation to support other types of followers than
just Users?

  * Imagine you could also be followed by a Club
  * You don't have to code it, just explain on high level what you would change to
make support for it

    * It's implemented in `clubs` branch.

# Notes

* To avoid incremental id's I have used UUID's.
* I have included a seed for the data base so once running the setup steps you can have the app up and running and test it.
* Available make tasks:
  * make install: Installs all gems and dependences.
  * make clean_db: Drops, creates, migrates and seeds the database.
  * make test: Runs the test battery.
  * make start: Runs the application
  * make rubocop: Runs rubocop on the project
* I have included the endpoint also for `followed` for users in master, and for both, users and clubs in the branch `clubs`
