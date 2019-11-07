defmodule LinodeVpsApi.ServerManager.ServerUsageInfo do
  use Ecto.Schema
  import Ecto.Changeset

  schema "server_usage_info" do
    field :extra_data, :map
    field :host_ip, :string
    field :host_name, :string
    field :server_name, :string
    field :start_time, :utc_datetime
    field :uuid, :string
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(server_usage_info, attrs) do
    server_usage_info
    |> cast(attrs, [:uuid, :host_ip, :start_time, :server_name, :extra_data, :host_name])
    |> validate_required([:uuid, :host_ip, :start_time, :server_name, :extra_data, :host_name])
  end
end
