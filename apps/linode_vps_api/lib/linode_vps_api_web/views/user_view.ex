defmodule LinodeVpsApiWeb.UserView do
  use LinodeVpsApiWeb, :view
  alias LinodeVpsApiWeb.UserView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      name: user.name,
      uuid: user.uuid,
      email: user.email,
      encrypted_password: user.encrypted_password}
  end
end
