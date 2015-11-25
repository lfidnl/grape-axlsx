# Grape::Axlsx

Use [Axlsx](https://github.com/randym/axlsx) templates in [Grape](https://github.com/ruby-grape/grape)

Based on [grape-jbuilder](https://github.com/milkcocoa/grape-jbuilder) and [axlsx-rails](https://github.com/straydogstudio/axlsx_rails)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'grape-axlsx'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install grape-axlsx

## Usage

### Setup view root directory

```ruby
use Rack::Config do |env|
  env['api.tilt.root'] = '/path/to/view/root/directory'
end
```

### Setup Axlsx Formatter for xlsx api format

```ruby
class API < Grape::API
  content_type :xlsx, "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
  format :xlsx
  formatter :xlsx, Grape::Formatter::Axlsx
end
```

### Specify axlsx template path

```ruby
resources :users do
  get axlsx: 'users/user.xlsx.axlsx' do
    @users = User.all
  end
end

# or you can omit .axlsx extension

...
get axlsx: 'users/user.xlsx' do
...
```

### Example of axlsx template

```ruby
# NOTE: xlsx_package is predefined instance of Axlsx::Package
wb = xlsx_package.workbook
wb.add_worksheet(name: "Users list") do |sheet|
  sheet.add_row ["id", "First name", "Last name", "Middle name"]
  @users.each do |user|
    sheet.add_row [user.id, user.first_name, user.last_name, user.middle_name]
  end
end
```

## Contributing

1. Fork it ( https://github.com/lfidnl/grape-axlsx/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
