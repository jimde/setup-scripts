https://communities.vmware.com/t5/VMware-Workstation-Pro/could-no-connect-ethernet-0-to-virtual-network-dev-vmnet0-arch/td-p/1382337

- sudo systemctl enable --now vmware-networks.service
- sudo systemctl enable --now vmware-usbarbitrator.service
- sudo systemctl enable --now vmware-hostd.service

https://dnetc.net/how-to-enable-hardware-acceleration-in-vmware-on-linux/
- add `mks.gl.allowBlacklistedDrivers = "TRUE"` to `~/.vmware/preferences`
