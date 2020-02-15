```
cat /proc/sys/fs/inotify/max_user_watches
sudo vim /etc/sysctl.conf
```

```
fs.inotify.max_user_watches=524288
```

*or*

```
echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p
```
