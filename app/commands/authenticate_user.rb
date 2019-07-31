class AuthenticateUser
  prepend SimpleCommand
  attr_accessor :email, :parsed_user

  def initialize(email, password)
    @email = email
    @password = password
    @current_user = nil
  end

  def call
    Utils::JsonWebToken.encode({
      user_id: user.id,
      email: user.email,
      signed_in: Time.now.to_i * 1000
    }) if user
  end

  def parsed_user
    @current_user
  end

  private

  attr_accessor :password

  def user
    user = User.find_by_email(email)
    #user = User.where("email = :email", { email: email }).take

    if user && user.authenticate(password)
      @current_user = user
      return user
    else
      errors.add :authentication, 'Error con las credenciales, verifique email y contraseña'
      nil
    end
  end
end
