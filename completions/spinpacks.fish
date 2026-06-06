function __spinpacks_packs
  spinpacks list 2>/dev/null
end

function __spinpacks_no_subcommand
  not __fish_seen_subcommand_from list ls install add uninstall remove update status mode sample info show search doctor version completion help
end

complete -c spinpacks -f -n __spinpacks_no_subcommand -a list       -d 'List available packs'
complete -c spinpacks -f -n __spinpacks_no_subcommand -a ls         -d 'List available packs'
complete -c spinpacks -f -n __spinpacks_no_subcommand -a install    -d 'Install a pack'
complete -c spinpacks -f -n __spinpacks_no_subcommand -a add        -d 'Install a pack (alias for install)'
complete -c spinpacks -f -n __spinpacks_no_subcommand -a uninstall  -d 'Remove a pack'
complete -c spinpacks -f -n __spinpacks_no_subcommand -a remove     -d 'Remove a pack (alias for uninstall)'
complete -c spinpacks -f -n __spinpacks_no_subcommand -a update     -d 'Reinstall packs'
complete -c spinpacks -f -n __spinpacks_no_subcommand -a status     -d 'Show status'
complete -c spinpacks -f -n __spinpacks_no_subcommand -a mode       -d 'Get or set mode'
complete -c spinpacks -f -n __spinpacks_no_subcommand -a sample     -d 'Sample random verbs from a pack'
complete -c spinpacks -f -n __spinpacks_no_subcommand -a info       -d 'Show pack details'
complete -c spinpacks -f -n __spinpacks_no_subcommand -a show       -d 'Show pack details (alias for info)'
complete -c spinpacks -f -n __spinpacks_no_subcommand -a search     -d 'Search packs'
complete -c spinpacks -f -n __spinpacks_no_subcommand -a doctor     -d 'Check for problems'
complete -c spinpacks -f -n __spinpacks_no_subcommand -a version    -d 'Print version'
complete -c spinpacks -f -n __spinpacks_no_subcommand -a completion -d 'Generate shell completion'
complete -c spinpacks -f -n __spinpacks_no_subcommand -a help       -d 'Show help'

complete -c spinpacks -f -n '__fish_seen_subcommand_from install add uninstall remove sample info show update' \
  -a '(__spinpacks_packs)'
complete -c spinpacks -f -n '__fish_seen_subcommand_from mode'       -a 'replace append'
complete -c spinpacks -f -n '__fish_seen_subcommand_from completion' -a 'bash zsh fish'

complete -c spinpacks -l scope        -d 'Target scope' -r -a 'user project local managed'
complete -c spinpacks -l force        -d 'Skip safety guards'
complete -c spinpacks -l all          -d 'Operate on all tracked packs or show all scopes'
complete -c spinpacks -l installed    -d 'Show only installed packs (list/ls)'
complete -c spinpacks -l dry-run      -d 'Show what would change without writing'
complete -c spinpacks -s v -l verbose -d 'Show detailed output'
complete -c spinpacks -s q -l quiet   -d 'Suppress non-error output'
complete -c spinpacks -s n -l count   -d 'Number of verbs to sample' -r
complete -c spinpacks -l json         -d 'Output as JSON'
complete -c spinpacks -l no-color     -d 'Disable color output'
complete -c spinpacks -s V -l version -d 'Print version'
complete -c spinpacks -s h -l help    -d 'Show help'
