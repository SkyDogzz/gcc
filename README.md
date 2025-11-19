# Simple dockers to be able to build using old version of gcc

## Why this exist ?

Since fedora is under gcc15 and we cant compile the 42 minilibx (mlx) using gcc15.
This project just exist to have a simple way to compile projects that use mlx.

## How to use

### gcc 12 bookworm

```bash
docker run -it \
-v "$(pwd)":/workspace \
-e HOST_UID="$(id -u)" \
-e HOST_GID="$(id -g)" \
-e HOST_USER="$(whoami)" \
skydogzzz/gcc:12-bookworm
```

### gcc 13 bookworm

```bash
docker run -it \
-v "$(pwd)":/workspace \
-e HOST_UID="$(id -u)" \
-e HOST_GID="$(id -g)" \
-e HOST_USER="$(whoami)" \
skydogzzz/gcc:13-bookworm
```

Run these in the same folder as your project or change the $(pwd) to your project path.

### Tips

Consider creating aliases in your shell rc file

```bash
alias gcc12='docker run -it -v "$(pwd)":/workspace -e HOST_UID="$(id -u)" -e HOST_GID="$(id -g)" -e HOST_USER="$(whoami)" skydogzzz/gcc:12-bookworm'
alias gcc13='docker run -it -v "$(pwd)":/workspace -e HOST_UID="$(id -u)" -e HOST_GID="$(id -g)" -e HOST_USER="$(whoami)" skydogzzz/gcc:13-bookworm'
```

Then just use them as follow:

```bash
gcc12
gcc13
```

### Warning

Don't touch HOST_UID / HOST_GID / HOST_USER unless you know what you're doing
These are used to keep have both the same right on your file than on the container
You could lost right if changed without care.
