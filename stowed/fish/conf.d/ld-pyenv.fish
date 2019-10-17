if not type -fq pyenv; and set -q PYENV_ROOT; and not contains "$PYENV_ROOT/bin" $PATH
  set PATH $PYENV_ROOT/bin $PATH
end

if type -q pyenv
  if command pyenv init - | grep --quiet "function"
    set -gx __PYENV_SUPPORTS_FISH true
    source (pyenv init - | psub)
  else
    if not set -q PYENV_ROOT
      set -x PYENV_ROOT "$HOME/.pyenv"
    end

    if not contains $PYENV_ROOT/shims $PATH
      set PATH $PYENV_ROOT/shims $PATH
    end
  end 
end
