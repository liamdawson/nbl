function pyenv
  if set -q __PYENV_SUPPORTS_FISH
    command pyenv $argv
  else
    set command $argv[1]
    set -e argv[1]

    switch "$command"
    case rehash shell
      eval (pyenv "sh-$command" $argv)
    case '*'
      command pyenv "$command" $argv
    end
  end
end
