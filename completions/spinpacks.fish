function __spinpacks_packs
  spinpacks list 2>/dev/null
end

function __spinpacks_no_subcommand
  not __fish_seen_subcommand_from list ls apply install remove uninstall update status mode sample info search doctor version completions help
end

complete -c spinpacks -f -n __spinpacks_no_subcommand -a list        -d 'List available packs'
complete -c spinpacks -f -n __spinpacks_no_subcommand -a ls          -d 'List available packs'
complete -c spinpacks -f -n __spinpacks_no_subcommand -a apply       -d 'Apply a pack'
complete -c spinpacks -f -n __spinpacks_no_subcommand -a install     -d 'Apply a pack (alias for apply)'
complete -c spinpacks -f -n __spinpacks_no_subcommand -a remove      -d 'Remove a pack'
complete -c spinpacks -f -n __spinpacks_no_subcommand -a update      -d 'Re-apply packs'
complete -c spinpacks -f -n __spinpacks_no_subcommand -a status      -d 'Show status'
complete -c spinpacks -f -n __spinpacks_no_subcommand -a mode        -d 'Get or set mode'
complete -c spinpacks -f -n __spinpacks_no_subcommand -a sample      -d 'Sample random verbs from a pack'
complete -c spinpacks -f -n __spinpacks_no_subcommand -a info        -d 'Show pack details'
complete -c spinpacks -f -n __spinpacks_no_subcommand -a search      -d 'Search packs'
complete -c spinpacks -f -n __spinpacks_no_subcommand -a doctor      -d 'Check for problems'
complete -c spinpacks -f -n __spinpacks_no_subcommand -a version     -d 'Print version'
complete -c spinpacks -f -n __spinpacks_no_subcommand -a completions -d 'Generate shell completions'
complete -c spinpacks -f -n __spinpacks_no_subcommand -a uninstall   -d 'Remove a pack (alias for remove)'
complete -c spinpacks -f -n __spinpacks_no_subcommand -a help        -d 'Show help'

complete -c spinpacks -f -n '__fish_seen_subcommand_from apply remove uninstall sample info update' \
  -a '(__spinpacks_packs)'
complete -c spinpacks -f -n '__fish_seen_subcommand_from mode'    -a 'replace append'
complete -c spinpacks -f -n '__fish_seen_subcommand_from completions' -a 'bash zsh fish'

complete -c spinpacks -l scope        -d 'Target scope' -r -a 'user project local system'
complete -c spinpacks -l overwrite    -d 'Replace existing verbs instead of appending'
complete -c spinpacks -l force        -d 'Skip safety guards'
complete -c spinpacks -l all          -d 'Operate on all tracked packs or show all scopes'
complete -c spinpacks -l applied      -d 'Show only applied packs (list/ls)'
complete -c spinpacks -l dry-run      -d 'Show what would change without writing'
complete -c spinpacks -s v -l verbose -d 'Show detailed output'
complete -c spinpacks -s q -l quiet   -d 'Suppress non-error output'
complete -c spinpacks -l json         -d 'Output as JSON'
complete -c spinpacks -l no-color     -d 'Disable color output'
complete -c spinpacks -s V -l version -d 'Print version'
complete -c spinpacks -s h -l help    -d 'Show help'
