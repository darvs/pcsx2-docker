# pcsx2-docker
A docker container for pcsx2

## Build

run `make` to build the docker image

## Usage

The `run` script will launch the emulator. 

Options:

| Option | What it does |
| ------ | ------- |
| bios   | Directory containing the PS1 BIOS files. |
| config | Directory with the PCSX2 configuration. Will be created if it doesn't exist |
| memcards | Directory with the memory cards for the game |

The last option is the name of the game image.

All filenames and directory names are relative to the image name.

## Examples

```
run --bios ~/ps2/bios --config config/shared --memcards memcards/awesome-game ~/ps2/awesome-game.iso
```


## Troubleshooting

### Unknown server OS
If you receive the following message
```
docker: unknown server OS: .
```
It's probably because the user trying to start the container is not part of the docker group.


## Notes
[PCSX2 Command Line Reference](https://forums.pcsx2.net/Thread-blog-The-return-of-the-Commandline?pid=118520)
