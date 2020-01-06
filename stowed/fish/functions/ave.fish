if command -v aws-vault >/dev/null
  function ave
    set -l aws_profile $argv[1]
    set -e argv[1]

    aws-vault exec $aws_profile -- $argv
  end

  function __fish_aws_vault_complete_second_token_onwards
    set -l current_line (commandline --current-process --cut-at-cursor)
    set -l tokens (commandline --current-process --tokenize)

    set -l parts (string split --max 1 $tokens[2] -- $current_line)

    complete "-C$parts[2]"
  end

  complete -ec 'ave'

  complete -c ave -n '__fish_is_first_arg' -xa '(aws-vault list --profiles)'
  complete -c ave -n 'not __fish_is_first_arg' -xa '(__fish_aws_vault_complete_second_token_onwards)'
end
