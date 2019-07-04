defmodule BaseApi.Email do
  use Bamboo.Phoenix, view: BaseApi.EmailView

  def hello_email(email, token) do
    body = """
    メール確認して！
    http://localhost:4000/api/confirm_email/#{token}
    """
    new_email
    |> to(email)
    |> from("my@gmail.com")
    |> subject("Welcome!")
    |> text_body(body)
  end
end
