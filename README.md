cloudforecast Cookbook
===============
cloudforecastの設定を行います

Attributes
----------

#### cloudforecast::default

- `node[:cloudforecast][:user]` - cloudforecast user
- `node[:cloudforecast][:group]` - cloudforecast user
- `node[:cloudforecast][:install_dir]` - Install directory
- `node[:cloudforecast][:git_repository]` - git repository
- `node[:cloudforecast][:git_revision]` - git branch
- `node[:cloudforecast][:log_path]` - path to log file
- `node[:cloudforecast][:lock_path]` - path to lock file create
- `node[:cloudforecast][:web_port]` - cloudforecast web server port
- `node[:cloudforecast][:debug]` - Set `1` for debug
