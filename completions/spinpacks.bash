_spinpacks() {
  local cur prev
  cur="${COMP_WORDS[COMP_CWORD]}"
  prev="${COMP_WORDS[COMP_CWORD-1]}"

  local commands="list ls install add uninstall remove update status mode sample info show search doctor version completion help"

  case "$prev" in
    spinpacks) COMPREPLY=($(compgen -W "$commands" -- "$cur")); return ;;
    install|add|uninstall|remove|sample|info|show|update)
      COMPREPLY=($(compgen -W "$(spinpacks list 2>/dev/null)" -- "$cur")); return ;;
    completion) COMPREPLY=($(compgen -W "bash zsh fish" -- "$cur")); return ;;
    mode)    COMPREPLY=($(compgen -W "replace append" -- "$cur")); return ;;
    --scope)     COMPREPLY=($(compgen -W "user project local managed" -- "$cur")); return ;;
  esac

  if [[ "$cur" == -* ]]; then
    COMPREPLY=($(compgen -W "--scope --force --all --installed --dry-run -v --verbose -q --quiet --json --no-color -n --count -V --version -h --help" -- "$cur"))
  fi
}

complete -F _spinpacks spinpacks
