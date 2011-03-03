Getting Started
===============
To get started pull the source repository and build a local db. This assumes you have RVM and Bundler.

Installation
------------
First, checkout the repository

    git clone git@github.com:g5search/pivotal-dashboard.git

Now go ahead and grab the required gems:

    bundle install

Setup
-----
This project requires a config/database.yml. I assume MySQL is installed. Here's a sample config/database.yml to get you started:

		development:
		  adapter: mysql
		  username: root
		  password:
		  database: pivotal_dashboard_development

		test:
		  adapter: mysql
		  username: root
		  password:
		  database: pivotal_dashboard_test

TODO: create a config/database.yml.example

After the yml file is created:

    rake db:setup
    rake db:prepare

Testing
-------
Yes, this actually has a test or two.

To initialize your test database

    rake db:test:prepare

Afterwards you can just

    rake spec

Watch the pretty green dots.

Running
-------
I'm starting to become a fan of webrick (again).

    rails server     # or rails s, for short

First time you should point your browser at the rebuild URL, so that Story(ies) get populated in your local DB:

    http://localhost:3000/welcome/rebuild

Enjoy.