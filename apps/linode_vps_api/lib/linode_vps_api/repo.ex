defmodule LinodeVpsApi.Repo do
  use Ecto.Repo,
    otp_app: :linode_vps_api,
    adapter: Ecto.Adapters.Postgres
end
