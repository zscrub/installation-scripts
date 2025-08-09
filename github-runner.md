<h3>github runner</h3>
  <li> 1. upload SSH key to github for authentication</li>
  <li> 2. install runner via repo settings (token expires after **1 hour** when Pressing *Add Runner*)</li>
  <li> 3. add `@reboot ~/run.sh` to `crontab -e`</li>
  <li> 4. restart</li>

<h3>installation script</h3>
  <li> 1. update bot token via portal **or** retrieve from secret-house</li>
  <li> 2. store value in STATBOT_TOKEN environment var **or** keep in clipboard for argument prompt</li>
  <li> 3. run install script</li>

