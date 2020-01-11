complete -ec nbl

complete -c nbl -n '__fish_is_token_n 2' -xa "(ls $HOME/.nbl/plugins/)"
complete -c nbl -n '__fish_seen_subcommand_from use-case; and __fish_is_token_n 3' -xa "(find $HOME/.nbl/uses/ -name '*.sh' -executable -type f | sed -Ee 's,$HOME/\.nbl/uses/(.*)\.sh,\1,')"
