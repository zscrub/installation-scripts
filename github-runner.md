<h3>github runner</h3>
  1. upload SSH key to github for authentication
  2. install runner via repo settings (token expires after **1 hour** when Pressing *Add Runner*)
  3. add `@reboot ~/run.sh` to `crontab -e`
  4. restart

<h3>installation script</h3>
  1. update bot token via portal **or** retrieve from secret-house
  2. store value in STATBOT_TOKEN environment var **or** keep in clipboard for argument prompt 
  3. run install script

