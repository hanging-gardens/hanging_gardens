# Hanging Gardens — CommonJS for Sprockets

## Usage

in your **Gemfile**:

```ruby
gem 'hanging_gardens'
```

after setting up your Sprockets environment:

```ruby
HangingGardens.register(env)
```

add your first CommonJS file 'app/assets/index.common':

```js
var window = require('browser/window');
console.log(window);
```
