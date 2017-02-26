class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      flash[:notice] = "Success login with Google."
      sign_in_and_redirect @user, event: :authentication
    else
      session["devise.google_data"] = request.env["omniauth.auth"].except(:extra)
      flash[:fail] = @user.errors.full_messages.join("\n")
      redirect_to new_user_registration_path
    end
  end
end