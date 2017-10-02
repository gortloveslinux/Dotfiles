. ~/.config/fish/git_aliases.fish
. ~/.config/fish/general_aliases.fish

set -gx fish_greeting 'Hello :)'
set -x EDITOR vim

if test -d ~/projects/go
  set -x GOPATH ~/projects/go
else if test -d ~/Projects/go
  set -x GOPATH ~/Projects/go
else if test -d ~/Projects/GO
  set -x GOPATH ~/Projects/GO
end

if test -d /usr/local/go/bin
  set -gx PATH $PATH /usr/local/go/bin
end
set -gx PATH $PATH $GOPATH/bin

set fish_key_bindings fish_vi_key_bindings

# START git prompt
set normal (set_color normal)
set magenta (set_color magenta)
set yellow (set_color yellow)
set green (set_color green)
set red (set_color red)
set gray (set_color -o black)

set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch yellow
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind red

set __fish_git_prompt_char_dirtystate '⚡'
set __fish_git_prompt_char_stagedstate '→'
set __fish_git_prompt_char_untrackedfiles '☡'
set __fish_git_prompt_char_stashstate '↩'
set __fish_git_prompt_char_upstream_ahead '+'
set __fish_git_prompt_char_upstream_behind '-'


function fish_prompt
  set last_status $status

  set_color $fish_color_cwd
  printf '%s' (prompt_pwd)
  set_color normal

  printf '%s ' (__fish_git_prompt)

  set_color normal
end
# END git prompt
