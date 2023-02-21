module Utilities
  class Jwt
    attr_accessor :user, :expire_at

    def self.generate(user:, expire_at: nil)
      @user = user
      @expire_at = expire_at || 7.days.from_now

      payload = {
        id: user.id,
        email: user.email,
        first_name: user.first_name,
        last_name: user.last_name,
        full_name: ActiveDecorator::Decorator.instance.decorate(user).full_name,
        expire_at: expire_at
      }

      JWT.encode(payload, ENV['SECRETS_KEY'])
    end

    def self.validate_expiration(token)
      decoded_token = JWT.decode(token, ENV['SECRETS_KEY'])
    end
  end
end