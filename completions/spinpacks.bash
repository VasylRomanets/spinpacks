_spinpacks() {
  local cur prev
  cur="${COMP_WORDS[COMP_CWORD]}"
  prev="${COMP_WORDS[COMP_CWORD-1]}"

  local commands="list ls apply install remove uninstall update status mode sample info search doctor version completions help"

  case "$prev" in
    spinpacks) COMPREPLY=($(compgen -W "$commands" -- "$cur")); return ;;
    apply|install|remove|uninstall|sample|info|update)
      COMPREPLY=($(compgen -W "$(spinpacks list 2>/dev/null)" -- "$cur")); return ;;
    completions) COMPREPLY=($(compgen -W "bash zsh fish" -- "$cur")); return ;;
    mode)    COMPREPLY=($(compgen -W "replace append" -- "$cur")); return ;;
    --scope)     COMPREPLY=($(compgen -W "user project local system" -- "$cur")); return ;;
  esac

  if [[ "$cur" == -* ]]; then
    COMPREPLY=($(compgen -W "--scope --overwrite --force --all --applied --dry-run -v --verbose -q --quiet --json --no-color -V --version -h --help" -- "$cur"))
  fi
}

complete -F _spinpacks spinpacks
