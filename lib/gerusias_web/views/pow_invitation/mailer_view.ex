defmodule GerusiasWeb.PowInvitation.MailerView do
  use GerusiasWeb, :mailer_view

  def subject(:invitation, _assigns), do: "You've been invited"
end
