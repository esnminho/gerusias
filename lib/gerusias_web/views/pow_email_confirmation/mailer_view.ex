defmodule GerusiasWeb.PowEmailConfirmation.MailerView do
  use GerusiasWeb, :mailer_view

  def subject(:email_confirmation, _assigns), do: "Confirm your email address"
end
