.PHONY: completions

completions:
	ruby bin/spinpacks completion bash > completions/spinpacks.bash
	ruby bin/spinpacks completion zsh  > completions/_spinpacks
	ruby bin/spinpacks completion fish > completions/spinpacks.fish
