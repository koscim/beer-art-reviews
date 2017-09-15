# Beer Art Reviews

Beer Art Reviews is a site where the love of beer and art intersect. Upload your favorite beer art for the world to see and review. As a user, you can post reviews for the beer art as well as upvote or downvote others' reviews.

#Built With
## Production
* [Ruby 2.4.1](https://www.ruby-lang.org/en/documentation/)
* [Rails 5.1.2](https://rubygems.org/gems/rails/versions/5.1.2)
* [React 15.6.1](https://github.com/facebook/react/releases)
* [React-Router 3.0.5](https://github.com/ReactTraining/react-router)
* [AWS](https://aws.amazon.com/)

## Testing
* [Rspec-Rails 3.5](https://relishapp.com/rspec/rspec-rails/v/3-5/docs)
* [Capybara](https://github.com/teamcapybara/capybara)
* [Faker](https://github.com/stympy/faker)
* [Database Cleaner](https://github.com/DatabaseCleaner/database_cleaner)
* [Enzyme 2.9.1](https://github.com/airbnb/enzyme)
* [Jasmine-Enzyme 3.4.0](https://github.com/blainekasten/enzyme-matchers/blob/master/packages/jasmine-enzyme/README.md)
* [Karma 0.13.22](https://github.com/karma-runner/karma)

## Installation

1. Go to our repo at <https://github.com/koscim/beer-art-reviews>
2. Click the Clone or download button,
```bash
$ gem install markdown_explorer
```


## Usage

Run the executable in a folder with markdown files.

```bash
$ mdexplore
```

Then, navigate to <http://localhost:8080> in your browser

![MarkdownExplorer](image.png)


## Development

```bash
$ cd markdown_explorer
$ ./bin/setup      # install dependencies
$ rake spec        # run the test suite
$ ./bin/console    # open the interactive prompt
$ ./exe/mdexplore  # run the application
$ rake -T          # view rake commands
```

Other commands:

```bash
$ rake install:local  # install gem locally
$ rake release        # release to RubyGems.org (bump version.rb, first)
```


## TODO

* Create markdown files in browser
* Edit/update markdown files in the browser
* Delete markdown files from the browser
* Create a better navigation system (tree view)


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/LaunchAcademy/markdown_explorer. Use the [fork-and-branch](http://blog.scottlowe.org/2015/01/27/using-fork-branch-git-workflow/) workflow to contribute.

This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

![Build Status](https://codeship.com/projects/d1fac080-7471-0135-298f-6261ba794a34/status?branch=master)
![Code Climate](https://codeclimate.com/github/koscim/beer-art-reviews.png)
![Coverage Status](https://coveralls.io/repos/koscim/beer-art-reviews/badge.png)
