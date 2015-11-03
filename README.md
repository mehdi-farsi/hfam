# HFAM (WIP)

Hidden files Are Manageable - Manage and reload you dotfiles in a specific directory

###SPECS

all dotfiles have to be in a ~/dotfiles directory 

```shell
$> hfam --help
dotfile-manager options:

hfam [-a[ll]]
    [--pick FILE1,FILE2,... [-p[ath] PATH_TO_DOTFILES]]
    [-p[ath] PATH_TO_DOTFILES]
    [-e[dit] EDITOR=YOUR_EDITOR [-p[ath] PATH_TO_DOTFILES]]

-a --all  # execute the right command for each dotfile [DEFAULT OPTION]
--pick    # execute the command for the selected files
-p --path # custom dotfiles path
-e --edit # open the dotfiles directory with the editor set in $EDITOR. It work with --path option
```
