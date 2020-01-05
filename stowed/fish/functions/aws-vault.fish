if command -v aws-vault >/dev/null
  complete -ec aws-vault

  # switch based on seeing a `--`
  complete -c aws-vault -n 'not __fish_aws_vault_is_commandline' -xa '(__fish_aws_vault_complete_arg)'
  complete -c aws-vault -n '__fish_aws_vault_is_commandline' -xa '(__fish_aws_vault_complete_commandline)'

  function __fish_aws_vault_is_commandline
    string match -q -r '^--$' -- (commandline -opc)
  end

  function __fish_aws_vault_complete_arg
    set -l parts (commandline -opc)
    set -e parts[1]

    aws-vault --completion-bash $parts
  end

  function __fish_aws_vault_complete_commandline
    set -l parts (string split --max 1 '--' -- (commandline -pc))

    complete "-C$parts[2]"
  end
end

if command -v aws-vault >/dev/null
  function ave
    set -l aws_profile $argv[1]
    set -e argv[1]

    aws-vault exec $aws_profile -- $argv
  end

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

  complete -ec 'ave'
  complete -ec 'avl'

  complete -c ave -n '__fish_is_first_arg' -xa '(aws-vault list --profiles)'
  complete -c avl -n '__fish_is_first_arg' -xa '(aws-vault list --profiles)'
  complete -c ave -n 'not __fish_is_first_arg' -xa '(__fish_aws_vault_complete_second_token_onwards)'
  complete -c avl -n 'not __fish_is_first_arg' -xa '(__fish_aws_vault_complete_second_token_onwards)'
end
