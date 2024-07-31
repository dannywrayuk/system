# If this module depends on an external Tmux plugin, say so in a comment.
# E.g.: Requires https://github.com/aaronpowell/tmux-weather

show_git_branch() { # This function name must match the module name!
  local index icon color text module

  index=$1 # This variable is used internally by the module loader in order to know the position of this module
  branch="#(git -C #{pane_current_path} branch --show-current 2> /dev/null || echo "-")"

  icon="$(  get_tmux_option "@catppuccin_git_branch_icon"  ""          )"
  color="$( get_tmux_option "@catppuccin_git_branch_color" "$thm_orange" )"
  text="$(  get_tmux_option "@catppuccin_git_branch_text"  "$branch" )"

  module=$( build_status_module "$index" "$icon" "$color" "$text" )

  echo "$module"
}
