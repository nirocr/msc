1. Stop LGTM before you move the data:

sudo lgtm-down

2. Backup the LGTM data:

cd /var/lib
sudo tar -cf /usr/pic1/lgtm-backup.tar lgtm

3. Restore the lgtm data:

cd /usr/pic1
sudo tar -xf lgtm-backup.tar

4. Edit the configuration to change the paths:

sudo emacs /usr/pic1/state/lgtm-cluster-config.yml
Edit temp_path so that it points to /usr/pic1/lgtm-worker-builds
Edit data_path so that it points to /usr/pic1/lgtm

Make sure that the data_path points to the directory that you created when you restored the LGTM data in step 3. But the name of the temp_path directory is your choice.

5. Regenerate the LGTM configuration files:

cd /usr/pic1/lgtm-1.19.0
sudo java ‑jar lgtm/lgtm‑config‑gen.jar generate ‑‑input ../state/lgtm‑cluster‑config.yml ‑‑overwrite

6. Install the new configuration:

sudo /usr/pic1/lgtm-1.19.0/generated/tealflyer.gld.dreamworks.net/install-machine.sh

At this point, LGTM should be back up and running.
