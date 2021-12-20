## Mental health coaching
#### Prerequisites

The setups steps expect following tools installed on the system.

- Github
- Ruby [3.0.0p0](https://www.ruby-lang.org/en/)
- Rails [6.1.4.1](https://guides.rubyonrails.org/getting_started.html)

##### 1. Check out the repository

```bash
git clone https://github.com/lizbethzepesch/ruby-practice
```

##### 2. Install gems

Going to the `Task2` folder run the following command

```bash
bundler install
```

##### 3. Create and setup the database

Run the following commands to create and migrate the database.

```ruby
rake db:create
rake db:migrate
rails db:seed
```

##### 4. Start the Rails server

You can start the rails server using the command given below.

```ruby
rails server
```

And now you can visit the site with the URL http://localhost:3000
