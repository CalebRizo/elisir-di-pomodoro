defmodule ElisirDiPomodoroWeb.UserView do
  use ElisirDiPomodoroWeb, :view
  
  def display_email(email) do
    "correo: #{email}"
  end
end
