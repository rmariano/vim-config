Vim Configuration
=================

Vim configuration.
This is an ongoing project of developing Plug-ins for Vim and setting
a particular configuration for improved productivity.

The goal is to develop a good configuration for the Vim editor, tailored
for Python development.

#Installation

##Instant
Copy and paste the following command in your terminal:

```bash
	$wget -O /tmp/deploy.sh https://raw.github.com/rmariano/vim-config/master/deploy.sh && sh /tmp/deploy.sh
```

##Automatic
Use the included [deploy.sh](deploy.sh) script which downloads and replaces the files on
their latest versions. Bear in mind that it requires ``wget`` which comes
installed in most of the distributions.

```bash
    $sh deploy.sh
```

Or

```bash
    $chmod +x deploy.sh
    $./deploy.sh
```


##Manual

For setting this configuration, you should copy the configuration files to
the Vim directory, or create symlinks if you want to update the configuration
by git.

```bash
    cp .vimrc ~/.vimrc
```

If there are any colour schemes you would like to install, I suggest to copy
them to ~/.vim/colors (create the directory if it does not exist).
Again, configuration can be made by copying the files or by creating symlinks.


```bash
    cp colors/<colorscheme>.vim ~/.vim/colors/
```

# Colour scheme Plug-in

The colour scheme requires the terminal to support 256 colours. Most of the
terminals already support this, but some terminal multiplexers like `tmux`
might require to be run as: ``tmux -2`` in order to support this.

In addition, just the command-line classic Vim version is supported, so no
support for ``Gvim`` or graphical versions is included for the colour scheme
although pull requests are accepted.

------

Enjoy!
