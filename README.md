# ActionDispatch::Http::ContentDisposition

Are you having trouble about garbled filename in `send_file` or `send_data`?

[Rails 6 will have the fix!](https://github.com/rails/rails/pull/33829)

This gem contains a back port for old rails (4.2 ~ 5.2).

## Usage

Just add this gem to your Gemfile:

```ruby
gem 'action_dispatch-http-content_disposition'
```

This gem applies monkey patch automatically.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[mtsmfm]/action_dispatch-http-content_disposition.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
