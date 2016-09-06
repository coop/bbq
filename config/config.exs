# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Import target specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
# Uncomment to use target specific configurations

# import_config "#{Mix.Project.config[:target]}.exs"

config :nerves, :firmware,
  fwup_conf: "config/fwup.conf",
  rootfs_additions: "config/rootfs-additions"

config :bbq, :wlan0,
  ssid: System.get_env("WIFI_SSID"),
  key_mgmt: :"WPA-PSK",
  psk: System.get_env("WIFI_PASSWORD")
