# Send and receive data from motors

The two printed circuit boards connect all
Herkulex DRS-0101 on NanoPi serial port `/dev/ttyS4`.

To ease development, `ser2net` can be used to publish
this TTY to a TCP socket.
```bash
sudo apt install ser2net
sudo systemctl enable ser2net
```

Then edit `/etc/ser2net.conf` and replace the last lines with
```ini
2000:raw:600:/dev/ttyS4:115200 8DATABITS NONE 1STOPBIT
```

Now, you may restart the service with `sudo systemctl restart ser2net`.

