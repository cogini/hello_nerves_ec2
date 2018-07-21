defmodule HelloNervesEc2.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  @target Mix.Project.config()[:target]

  use Application

  def start(_type, _args) do
    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: HelloNervesEc2.Supervisor]
    Supervisor.start_link(children(@target), opts)
  end

  # List all child processes to be supervised
  def children("host") do
    [
      # Starts a worker by calling: HelloNervesEc2.Worker.start_link(arg)
      # {HelloNervesEc2.Worker, arg},
    ]
  end

  def children(_target) do
    [
      # Starts a worker by calling: HelloNervesEc2.Worker.start_link(arg)
      # {HelloNervesEc2.Worker, arg},
    ]
  end
end
