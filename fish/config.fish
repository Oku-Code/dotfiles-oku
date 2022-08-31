if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting
alias sudo='doas'

# For deno
export DENO_INSTALL="/home/oku/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
