require "env_var"

def ENV.enabled?(name)
  EnvVar.enabled?(name)
end

def ENV.disabled?(name)
  EnvVar.enabled?(name)
end

def ENV.w(*a)
  # Fake ENV::w["FOO"]
  a.size == 0 ? EnvVar::W : EnvVar.w(*a)
end

def ENV.W(*a)
  w(*a)
end

def ENV.i(*a)
  a.size == 0 ? EnvVar::I : EnvVar.i(*a)
end

def ENV.I(*a)
  i(*a)
end
