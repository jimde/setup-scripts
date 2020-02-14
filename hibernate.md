# Enable Hibernate in Ubuntu 18

https://xpro.se/2019/09/12/enable-hibernate-in-ubuntu-18-04/

Make sure your `/swapfile` is at least the size of your RAM

Note the UUID of the partition containing your `/swapfile`:

`sudo findmnt -no SOURCE,UUID -T /swapfile`

Example output: `/dev/nvme0n1p5 20562a02-cfa6-42e0-bb9f-5e936ea763d0`

Reconfigure the package uswsusp in order to correctly use the swapfile:

```
sudo dpkg-reconfigure -pmedium uswsusp
# Answer "Yes" to continue without swap space
# Select "/dev/disk/by-uuid/20562a02-cfa6-42e0-bb9f-5e936ea763d0" replace the UUID with the result from the previous findmnt command
# Encrypt: "No"
```

Edit the SystemD hibernate service using sudo systemctl edit systemd-hibernate.service and fill it with the following content:

```
[Service]
ExecStart=
ExecStartPre=-/bin/run-parts -v -a pre /lib/systemd/system-sleep
ExecStart=/usr/sbin/s2disk
ExecStartPost=-/bin/run-parts -v --reverse -a post /lib/systemd/system-sleep
```

Note the resume offset of your /swapfile:

```
sudo swap-offset /swapfile
resume offset = 34818
```

Configure Grub to resume from the swapfile by editing /etc/default/grub and modify the following line:

`GRUB_CMDLINE_LINUX_DEFAULT="resume=UUID=20562a02-cfa6-42e0-bb9f-5e936ea763d0 resume_offset=34818 quiet splash"`

Update Grub:

`sudo update-grub`

Update initramfs: `sudo update-initramfs -u -k all`

Create the following `/etc/initramfs-tools/conf.d/resume`:

```
RESUME=UUID=20562a02-cfa6-42e0-bb9e-5e936ea763d0 resume_offset=34816
# Resume from /swapfile
```

Update initramfs:

`sudo update-initramfs -u -k all`

Now you can hibernate with sudo systemctl hibernate.

## Add ‘Hibernate’ Option in Power Menu in Ubuntu 18.04

http://ubuntuhandbook.org/index.php/2018/05/add-hibernate-option-ubuntu-18-04/

`sudo vim /etc/polkit-1/localauthority/50-local.d/com.ubuntu.enable-hibernate.pkla`

```
[Re-enable hibernate by default in upower]
Identity=unix-user:*
Action=org.freedesktop.upower.hibernate
ResultActive=yes

[Re-enable hibernate by default in logind]
Identity=unix-user:*
Action=org.freedesktop.login1.hibernate;org.freedesktop.login1.handle-hibernate-key;org.freedesktop.login1;org.freedesktop.login1.hibernate-multiple-sessions;org.freedesktop.login1.hibernate-ignore-inhibit
ResultActive=yes
```

`sudo apt-get install chrome-gnome-shell`

Open Firefox, press CTRL+SHIFT+a, and install the “GNOME Shell integration” Add-On. Link to the add-on: https://addons.mozilla.org/en-US/firefox/addon/gnome-shell-integration/?src=search

Go to https://extensions.gnome.org/ and search for “Hibernate Status Button“, or click this link: https://extensions.gnome.org/extension/755/hibernate-status-button/. Turn “ON” the extension in the upper right corner.

Restart your computer and enjoy the new hibernate-button in the shut-down dialog!
