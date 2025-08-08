For github runner:
  1. upload SSH key to github for authentication
  2. install runner via repo settings (token expires after **1 hour** when Pressing *Add Runner*)
  3. add `@reboot ~/run.sh` to `crontab -e`
  4. restart

