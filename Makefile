.PHONY: completions

completions:
	ruby bin/spinpacks completions bash > completions/spinpacks.bash
	ruby bin/spinpacks completions zsh  > completions/_spinpacks
	ruby bin/spinpacks completions fish > completions/spinpacks.fish
