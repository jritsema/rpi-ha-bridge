### rpi-ha-bridge

Raspberry Pi compatible docker image that emulates philips hue api to other home automation gateways.

Based on https://github.com/bwssytems/ha-bridge


#### usage

```
$ docker run -it --rm -v /home/pi/habridge:/habridge/data --net=host jritsema/rpi-ha-bridge:3.5.1
```

or optionally to default default config file location...
```
$ docker run -it --rm -v /home/pi/habridge:/habridge/data --net=host jritsema/rpi-ha-bridge:3.5.1 -Dconfig.file /habride/data/habridge.config
```

or using compose...
```
$ docker-compose up -d
```
