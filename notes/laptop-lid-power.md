https://askubuntu.com/questions/15520/how-can-i-tell-ubuntu-to-do-nothing-when-i-close-my-laptop-lid

`/etc/systemd/logind.conf`

```
HandleLidSwitch=ignore
HandleLidSwitch=hibernate
```

`sudo service systemd-logind restart`
