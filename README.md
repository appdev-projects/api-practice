# Building APIs Intro

## Starting point

### Template

This project was freshly created using [the `vanilla-rails` template](https://github.com/appdev-projects/vanilla-rails).

### Scaffolds

Then, I added the Devise gem and ran the following generators:

```
rails g devise user username:string sent_follow_requests_count:integer received_follow_requests_count:integer own_photos_count:integer
```

```
rails g scaffold photo caption:string image:string owner:references  comments_count:integer
```

```
rails g scaffold like fan:references photo:references
```

```
rails g scaffold follow_request sender:references recipient:references
```

```
rails g scaffold comment body:string author:references photo:references
```

### Sample data => `dev:prime`

I also added a sample data task. I called it `dev:prime` rather than our usual `sample_data`, following the convention of [thoughtbot](https://thoughtbot.com/blog/priming-the-pump).

### Rubocop for code style

I also added the [StandardRB gem](https://www.fastruby.io/blog/ruby/code-quality/how-we-use-rubocop-and-standardrb.html) and ran `rubocop -A` to give myself nicely consistent code styling. The linked blog post doesn't mention that you need to make [this change](https://github.com/firstdraft/rails_application_template/blob/821c0c25cd13775eff33401f76192d8bcfba73f1/template.rb#L143) in `bin/bundle` in order for things to work after running `rubocop -A` for the first time (otherwise all of your `bundle` commands will break).

---

That's it for the starter code!

## Tools for API development

There are several handy tools that help explore APIs and test to make sure you're putting together your URLs and parameters correctly:

 - [Postman app](https://www.postman.com/) — widely used in industry.
 - [Hoppscotch](https://hoppscotch.io/) — web-based, free version of Postman.
 - [cURL](https://en.wikipedia.org/wiki/CURL) — a command-line tool; developed by a single developer, but so widely used and installed that it's almost an official standard at this point.

## Endpoints for sign-up/sign-in

Devise will provide these JSON endpoints out-of-the-box at the same URLs that we're familiar with for HTML:

 - `POST /users` (to sign up)
 - `POST /users/sign_in` (to sign in)
 - etc

We're going to focus on signing in in this demo. We must POST the email and password to `/users/sign_in` as follows in the body of the request:

```json
{
  "user": {
    "email": "alice@example.com",
    "password": "password"
  }
}
```

If you try this out with cURL (remember to swap in your own domain):

```
curl --location --request POST 'https://your-domain.com/users/sign_in' \
--header 'Content-Type: application/json' \
--header 'Accept: application/json' \
--data-raw '{
  "user": {
    "email": "alice@example.com",
    "password": "password"
  }
}'
```

You'll get a forgery protection error. In a real app, we might want to keep forgery protection on (but then we have to figure out how to generate authenticity tokens from within our client, e.g. a React app). For now, let's disable forgery protection globally (not a good idea in general):

```ruby
# In ApplicationController

skip_forgery_protection
```

If you try cURL again, you'll see that it works, but you get back HTML. We need to opt-in to responding to JSON requests from our Devise controller. Again, a quick-and-dirty solution:

```ruby
# In ApplicationController

respond_to :html, :json
```

Now, the endpoint should work properly and return a JSON object containing the details of the user that signed in.

## as_json

https://api.rubyonrails.org/classes/ActiveModel/Serializers/JSON.html

## Jbuilder

https://github.com/rails/jbuilder

## Addressing N+1s with `includes`/`eager_load`

https://levelup.gitconnected.com/how-to-use-includes-in-rails-7-643b5e1451c4

## Caching

https://guides.rubyonrails.org/caching_with_rails.html

## Further improvements

 - Use something like [devise-jwt](https://github.com/waiting-for-dev/devise-jwt) to create access tokens, rather than passing the api user's ID in each request (easily spoofed).
 - Use `before_action`s or [Pundit](https://github.com/varvet/pundit) to control access to resources properly.
 - Use something like [Graphiti](https://github.com/graphiti-api/graphiti) to create a more flexible API, especially if you're offering/selling the API to 3rd parties.
