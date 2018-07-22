# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Customize non-Elixir parts of the firmware.  See
# https://hexdocs.pm/nerves/advanced-configuration.html for details.
config :nerves, :firmware, rootfs_overlay: "rootfs_overlay"

# Use shoehorn to start the main application. See the shoehorn
# docs for separating out critical OTP applications such as those
# involved with firmware updates.
config :shoehorn,
  init: [:nerves_runtime, :nerves_config_ec2, :nerves_init_gadget],
  app: Mix.Project.config()[:app]

# config :nerves_firmware_ssh,
#   authorized_keys: [
#     File.read!(Path.join(System.user_home!, ".ssh/authorized_keys"))
#   ]

config :nerves_init_gadget,
  ifname: "eth0",
  address_method: :dhcp,
  mdns_domain: nil,
  node_name: nil,
  # node_name: "hello_nerves_ec2",
  node_host: :ip,
  ssh_console_port: 22

# Import target specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
# Uncomment to use target specific configurations

# import_config "#{Mix.Project.config[:target]}.exs"
