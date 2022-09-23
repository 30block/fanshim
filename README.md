# fanshim
Control your Raspberry PI temperature using Pimoroni's [Fan SHIM](https://shop.pimoroni.com/products/fan-shim).

## Usage

The `fanshim` block is meant to o be used alongside other services, so you will need to create a service in your docker-compose.yml file.

```yaml
version: '2.1'

services:
  fanshim:
    images: bh.cr/gh_pipex/fanshim 
    restart: always
    devices:
      # Required to access gpio 
      - /dev/gpiomem
    labels:
      # Required to access the host /proc directory
      io.balena.features.procfs: '1'
```

This block will only work with Pimoroni's Fan SHIM (which is the one I have).

## Environment variables

| Name             | Description                                                | Default Value |
|------------------|------------------------------------------------------------|---------------|
| FANSHIM_ON_TEMP  | Temperature threshold in degrees C to enable fan           | 65            |
| FANSHIM_OFF_TEMP | Temperature threshold in degrees C to disable fan          | 55            |
| FANSHIM_DELAY    | Delay, in seconds, between temperature readings            | 5             |
| FANSHIM_VERBOSE  |  Output temperature and fan status messages (1 to enable)  | 0             |


## Attributions

- [Fanshim control source](https://github.com/pimoroni/fanshim-python/blob/master/examples/automatic.py)
- [Fan icons created by AmethystDesign - Flaticon](https://www.flaticon.com/free-icons/fan)

