# Refresh

## Motivation
Refresh started as a way to kill the routine, the daily grind, the same old, same old. This simple project is meant to update your desktop background with a randomized photo from a selection of randomized wallpapers. Refresh has the same motivation as the team over at [Momentum](https://momentumdash.com/) - provide inspiration, focus, and productivity.

---

## Setup
It's easy. First, grab yourself a copy of the repo.
```
$ cd ~
$ git clone https://github.com/brhawtho/refresh.git
$ cd refresh
```

Add our .bash_profile contents to yours.
```
$ cat .bash_profile >> ~/.bash_profile
```

Now you will have access to two new commands, `go` and `refresh`.

### $ go <dir>
Go is an alias Bryce set up that will do some quick navigation for users. Simply type `go <dir>` and `go` will do the rest. It will perform a `find` search from your home directory and navigate to the found directory with the shortest path. Use `go --help` for more information

### $ refresh
Refresh is the alias that makes it all happen. It uses `go` to navigate to the _refresh_ directory you copied during setup, sets the background, and returns to your home directory, clearing up a cluttered terminal in the process.

---

## Credit
### [Bryce Hawthorne](https://github.com/brhawtho)
A newbie to Software Engineering, he decided to start working with Chrome extensions and bash scripts. Given enough time and boredom, he came up with `go`, a simple alias that enhances the `cd` command. From there, it was only up - eventually leading him to `refresh`.

### [Momentum](https://momentumdash.com/)
All credit for these images goes to the Momentum team, and the respective owners. I'm just adding them to this directory so I can work with them a bit easier! Updates to come.