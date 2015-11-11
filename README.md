# HFAM

<b>H</b>idden <b>F</b>iles <b>A</b>re <b>M</b>anageable - Manage, source and reload you dotfiles in a specific directory

1. You create/clone your `dotfiles` directory defined in `$HOME/`. 
2. You edit a `$HOME/dotfiles/.hfamconfig` with its provided DSL.
3. You call `hfam`.

The advantage is that you can easily move your `dotfiles` to any servers. Then, with only one command, you can configure your environment.

###Prerequisites

you need to install `ruby`:

```shell
?> \curl -sSL https://get.rvm.io | bash -s stable
?> rvm install ruby-head
```

Check if `ruby` is installed:

```shell
?> ruby --version
```

###Install

```shell
?> gem install hfam
```

I recommend you to put all your `dotfiles` in a Git repository named `dotfiles`.

clone your repo and add a file named `.hfamconfig`.

###Usage

Example

```asciidoc
~/
  |- dotfiles/
     |- gitconfig
     |- zshrc
     |- .hfamconfig
```


`hfam` is provided with a .hfamconfig file. This config file permits to execute a set of commands for each dotfile.
Only the files defined in `.hfamconfig` will be treated.

Now, let's have look to the `.hfamconfig` syntax.

####Symlink

The `symlink` command creates a symlink with the source file passed as argument. the symlink target file is defined at `$HOME/.target`

In `$HOME/dotfiles/.hfamconfig`

```ruby
symlink "gitconfig" # you can add a comment using '#'
```

And then

```shell
?> hfam
Symlink: ln -s /Users/zoidberg/dotfiles/gitconfig /Users/zoidberg/.gitconfig
?> ls -l $HOME/.gitconfig
/Users/zoidberg/.gitconfig -> /Users/zoidberg/dotfiles/gitconfig
```

> /!\ If the source file is not a dotfile, the prefix `.` is automatically prepended to the target file
> ```shell
> ?> ls -l $HOME/.target
> lrwxr-xr-x  1 zoidberg  thousand_sunny 27B Nov 11 16:35 .test2 -> /Users/zoidberg/dotfiles/test2
> ```

###Source

