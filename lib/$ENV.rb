require "env_var"
raise LoadError, "error: variable $ENV has been defined elsewhere" if defined?($ENV) && $ENV != EnvVar
$ENV = EnvVar
