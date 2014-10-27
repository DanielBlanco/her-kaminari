# Her::Kaminari

Makes [Her](https://github.com/remiprev/her "ORM that maps REST resources to Ruby objects") aware of APIs that return pagination headers like [grape-kaminari](https://github.com/monterail/grape-kaminari "kaminari paginator integration for grape API framework") gem.

Her models can now query these APIs like any other kaminari model:

```ruby
  User.page(1).per(10)
```

## Gem Dependencies

* [Her](https://github.com/remiprev/her "ORM that maps REST resources to Ruby objects")
* [Kaminari](https://github.com/amatsuda/kaminari "Paginator for Rails")

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'her-kaminari'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install her-kaminari

## Usage

First include Her::Kaminari::HeaderParser in your Her setup like this:

```ruby
Her::API.setup url: 'https://api.example.com' do |c|

  #...

  # Response
  c.use Her::Kaminari::HeaderParser

  # ...
```

HeaderParser expects that the API request returns the following headers:

```
X-Total: 42
X-Page: 3
X-Per-Page: 10
X-Offset: 10 (optional)
```

**IMPORTANT:** Pagination is done by the API not by this gem, this gem just parses
the response data and creates a Kaminari compatible collection that you can use in
your views.


Then include Her::Kaminari::Collection in your Her model like this:

```ruby
class User
  include Her::Model
  include Her::Kaminari::Collection
end
```

Now you can use your Her model like any other Kaminari model.

## History

After reading [How to pass pagination headers with Kaminari, Her and Grape?](http://aenain.github.io/2014/05/27/how-to-pass-pagination-headers-with-kaminari-her-and-grape.html) post by [Artur Hebda](http://aenain.github.io) I decided that it was a good idea to create a gem with his code.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/her-kaminari/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
