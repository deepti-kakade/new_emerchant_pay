# README

This README would normally document whatever steps are necessary to get the
application up and running.

## Installation

1. Clone repo to local

```
git clone https://github.com/deepti-kakade/new_emerchant_pay.git
```

2. Install [rvm](https://rvm.io/) and
   [nvm](https://github.com/nvm-sh/nvm#installing-and-updating)

   (**Tip**: To allow `nvm` to automatically detect and change node versions for
   your project as you `cd` into the directory follow
   [this](https://github.com/nvm-sh/nvm#deeper-shell-integration))

3. Install ruby 3.0.2

```
rvm install $(cat .ruby-version)
```

4. Install Node(can be skipped if you followed the tip mentioned in (2)
   above)

5. Install Redis

```
brew install redis
```

6. Install Yarn
```
npm install yarn
```

7. Bundle Install
```
bundle install
```
8. Database setup
```
rails db:create
```
```
rake db:migrate
```
```
rake db:seed
```

9. Run the test suite
```
bundle exec rspec
```

10. Satrt server
```
bin/dev
```

* Execute rake task, pass file path as an argument
```
rake import:import_users[file]
```
For example `rake import:import_users[lib/tasks/import_users.csv]`

* DeleteTransactionJob will execute every 1 hour. Entry is added in the schedule.yml file.
