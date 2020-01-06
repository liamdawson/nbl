if command -v aws-vault >/dev/null
  function avl
    set -l aws_profile $argv[1]
    set -e argv[1]

    aws-vault login $aws_profile
  end

  function __fish_aws_vault_complete_second_token_onwards
    set -l current_line (commandline --current-process --cut-at-cursor)
    set -l tokens (commandline --current-process --tokenize)

    set -l parts (string split --max 1 $tokens[2] -- $current_line)

    complete "-C$parts[2]"
  end

  complete -ec 'avl'

  complete -c avl -n '__fish_is_first_arg' -xa '(aws-vault list --profiles)'
  complete -c avl -n 'not __fish_is_first_arg' -xa ''
end
