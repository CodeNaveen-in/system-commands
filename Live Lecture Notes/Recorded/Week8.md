# Automating Scripts
- The aim of using scripts is to utilisating them in automation
- `cron` helps in making it possible.
- `at`, `crontab` etc
- **Job definition**
  - `min hour day month day username task `
  - `5 2 * * 1-5 root cd /home/scripts/backup && .mkbackup.sh`
- **Startup scripts**
  - `/etc/init` has all the codes and scripts that run on their own.

## Stream Editor sed
- Language for processing text streams.
- sed is abbr for stream editor
- sed preceedes awk
- `sed -e 's/hello/world/g' input.txt`
- `sed -e "" sample.txt` - will give everything as it's natural behaviour of it.
- `sed -n -e "" sample.txt` - will reverse the default behaviour.
- `sed -E -e '/text/,/video/s/^L[[: digit :]]+ //g' sample.txt`