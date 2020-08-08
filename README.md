# EnvVar

[![Build Status](https://travis-ci.org/sshaw/env_var.svg?branch=master)](https://travis-ci.org/sshaw/env_var)

Check if an environment variable is set to an enabled or disabled value.
Fetch an environment variable as an Array of `String`s or `Symbol`s.

## Usage

### `enabled?`/`disabled?`

Set an environment variable:
```
export VARIABLE_NAME=1     # enabled
export VARIABLE_NAME=true  # enabled
export VARIABLE_NAME=0     # disabled
export VARIABLE_NAME=false # disabled
```

And check if it's enabled or disabled:
```rb
require "$ENV"

enable_foo if $ENV.enabled?("VARIABLE_NAME")
disable_foo if $ENV.disabled?("VARIABLE_NAME")
```

Note that if the environment variable **is not set** `enabled?` and `disabled?` **can both be `false`**.
If something is not enabled that does not mean it was explicitly disabled.

Don't do this:
```rb
if !$ENV.enabled?("VARIABLE_NAME")
if !$ENV.disabled?("VARIABLE_NAME")
```

Do this:
```rb
if $ENV.disabled?("VARIABLE_NAME")
if $ENV.enabled?("VARIABLE_NAME")
```

### `$ENV::W`

Return an environment variable's value as an `Array` of words (`String`s):


```
export VARIABLE_NAME="a,b,c"
export ANOTHER_VARIABLE=
```

Then in Ruby:

```rb
$ENV::W["VARIABLE_NAME"]     # ["a", "b", "c"]
$ENV::W["ANOTHER_VARIABLE"]  # []

# Or
$ENV.W("VARIABLE_NAME")      # ["a", "b", "c"]
$ENV.w("VARIABLE_NAME")      # ["a", "b", "c"]
```

Mnemonic `%w(a b c)`.

### `$ENV::I`

Return an environment variable's value as an `Array` of `Symbol`s:

```rb
$ENV::I["VARIABLE_NAME"]  # [:a, :b, :c]

# Or
$ENV.I("VARIABLE_NAME")   # [:a, :b, :c]
$ENV.i("VARIABLE_NAME")   # [:a, :b, :c]
```

Mnemonic `%i(a b c)`.

### Otherwise, Use it Like You Would `ENV`

```rb
p $ENV["VARIABLE_NAME"]
p $ENV.delete("VARIABLE_NAME")
$ENV.each { |name, value| ... }
```

## Without `$ENV`

```rb
require "env_var"

enable_foo if EnvVar.enabled?("VARIABLE_NAME")
disable_foo if EnvVar.disabled?("VARIABLE_NAME")
p EnvVar["VARIABLE_NAME"]
p EnvVar.delete("VARIABLE_NAME")
EnvVar.each { |name, value| ... }
```

## Monkey Patch

```rb
require "env_var/env"

enable_foo if ENV.enabled?("VARIABLE_NAME")
disable_bar if ENV.disabled?("VARIABLE_NAME")
p ENV::i["VARIABLE_NAME"]
p ENV::w["VARIABLE_NAME"]

# ENV::W, ENV::I do not work
```

## Why?

Got tired of writing this over and over in various applications:

```rb
enable_foo if %w[true 1 on].include?(ENV["ENABLE_FOO"])
```

## See Also

- [Envied](https://github.com/eval/envied) - Ensures presence and type of your app's ENV-variables

## Author

Skye Shaw (skye DOT shaw AT gmail )

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
