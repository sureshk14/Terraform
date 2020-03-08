sudo file -s /dev/xvdg
sudo mkfs -t xfs /dev/xvdg
sudo mkdir /data
sudo mount /dev/xvdg /data
echo /dev/xvdg  /data xfs defaults,nofail 0 2 >> /etc/fstab
