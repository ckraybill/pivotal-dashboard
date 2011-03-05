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
This project requires a config/database.yml. You can copy the example provided:

    cp config/database.yml.example config/database.yml

After the yml file is created you can setup the schemas

    rake db:setup
    rake db:migrate    # just to be safe

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

To get started you'll want to grab a snapshot of stories and projects from Pivotal Tracker.

    rake pivotal:update

Enjoy.
