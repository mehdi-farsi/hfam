module HFAM
  BLANKSLATE_WHITELISTED_METHODS = [:allocate, :eval, :__id__, :object_id, :__send__]

  HOME                 = "#{ENV['HOME']}"
  DEFAULT_DOTFILE_PATH = "#{ENV['HOME']}/dotfiles"
  HFAMCONFIG_PATH      = "#{DEFAULT_DOTFILE_PATH}/.hfamconfig"

  HELP = <<-SHELL
HFAM - Hidden Files Are Manageable

USAGE:

hfam [-a[ll]]
    [--pick FILE1,FILE2,... [-p[ath] PATH_TO_DOTFILES]]
    [-p[ath] PATH_TO_DOTFILES]
    [-e[dit] EDITOR=YOUR_EDITOR [-p[ath] PATH_TO_DOTFILES]]

OPTIONS:

-a --all  # execute the right command for each dotfile [DEFAULT OPTION]
--pick    # execute the command for the selected files
-p --path # custom dotfiles path
-e --edit # open the dotfiles directory with the editor set in $EDITOR. It work with --path option
SHELL
end