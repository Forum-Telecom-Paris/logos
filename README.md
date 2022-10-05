# Logos

## Note

Never use the `logo_base.template` because it use a special font and it is a template ! You need to convert the logo to a formatted svg file (where the `text` is transformed to `path`).

## Create logos


### Solution 1 - on your computer

1. Install the font `Montserrat SemiBold`

- [https://fr.ffonts.net/Montserrat-SemiBold.font](https://fr.ffonts.net/Montserrat-SemiBold.font)
- [https://github.com/JulietaUla/Montserrat](https://github.com/JulietaUla/Montserrat)
- [Available in the current repo](Montserrat-SemiBold.ttf)

2. Have `python3`, `inkscape` and `convert` installed.

3. Run command :

```sh
make
```

> If you want, change size of the logo in the Makefile.

### Solution 2 - with docker

```
docker build -t docker-forum . && docker run -v "$(pwd)":/app docker-forum
```

### Solution 3 - with Github Actions

- After each push, logos are built and are available as an artifact in the last action executed  [https://github.com/Forum-Telecom-Paris/logos/actions](https://github.com/Forum-Telecom-Paris/logos/actions)

## LICENSE

Note that the [Montserrat-SemiBold.ttf](Montserrat-SemiBold.ttf) has it own license
