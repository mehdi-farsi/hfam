# HFAM

<b>H</b>idden <b>F</b>iles <b>A</b>re <b>M</b>anageable - Manage, source and reload you dotfiles in a specific directory

1. You create/clone your `dotfiles` directory defined in `$HOME/`. 
2. You edit a `$HOME/dotfiles/.hfamconfig` with its intuitive DSL.
3. You call `hfam`.

The main advantage of this tool is that you can easily move your `dotfiles` from a machine to another one. Then, with only one command, you can configure your environment.

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

###Options

Option `-h --help`

Display usage:

```shell
?> hfam --help

```

Option `-p --path`

```shell
?> hfam --path /Users/zoidberg/Documents/dotfiles
Symlink: ln -s /Users/mehdi/Documents/dotfiles/testpath /Users/zoidberg/Documents/.testpath
```

> The path set by --path option is the default symlink target path.
> use the DSL symlink option `:dest` to override this path.

`hfam` works with a `.hfamconfig` file. This config file provide an intuitive DSL for managing your dotfiles.

> Only the files defined in `.hfamconfig` will be treated.

For the following examples, let's say that the following environment variables are set with the following values:

- `HOME=/Users/zoidberg`
- `SHELL=/bin/zsh`

Now, let's have look to the `.hfamconfig` DSL.

####Symlink

The `symlink` command creates a symlink with the source file passed as argument. The symlink target is created in `$HOME/.target`.

Example:

In `$HOME/dotfiles/.hfamconfig`

```ruby
symlink "gitconfig" # you can add a comment using '#'
```

Then

```shell
?> hfam
Symlink: ln -s /Users/zoidberg/dotfiles/gitconfig /Users/zoidberg/.gitconfig
?> ls -l $HOME/.gitconfig
/Users/zoidberg/.gitconfig -> /Users/zoidberg/dotfiles/gitconfig
```

The `symlink` command accepts another argument to specify the destination's directory. This arguments is named `dest`.

Example:

```ruby
symlink "gitignore", dest: "/Users/zoidberg/apps/my_app/.gitignore"
```

Then

```shell
?> hfam
Symlink: ln -s /Users/mehdi/dotfiles/gitignore /Users/zoidberg/apps/my_app/.gitignore
```

> /!\ If the source file is not a dotfile, the prefix `.` is automatically prepended to the target file
> ```shell
> ?> ls -l $HOME/.gitconfig
> lrwxr-xr-x  1 lol  cat 27B Nov 11 16:35 .gitconfig -> /Users/zoidberg/dotfiles/gitconfig
> ```

####Source

The `source` command creates a symlink using the file passed as argument and source the symlink target. The symlink target file is defined at `$HOME/.target`.

Example:

In `$HOME/dotfiles/.hfamconfig`

```ruby
source "zshrc"
```

Then

```shell
?> hfam
Symlink: ln -s /Users/zoidberg/dotfiles/zshrc /Users/zoidberg/.zshrc
Source: /bin/zsh -c 'source /Users/zoidberg/.zshrc'
?>
```


> /!\ The SHELL env variable is used to defined the current shell.
>     If the default shell is `dash`, then it uses the '.' command to source the file.
>     Else, it uses the `source` command.
>     If the SHELL is a symlink to another shell, then it reach the real shell targeted by the symlink:
>     [for further information](https://wiki.ubuntu.com/DashAsBinSh#My_production_system_has_broken_and_I_just_want_to_get_it_back_up.21)

## Development

After checking out the repo, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mehdi-farsi/activerecord-search.

We have a lot of idea that we put in the issue list. Feel free to have a look to it.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

> Please, feel free to star the project if you like it ! :)
