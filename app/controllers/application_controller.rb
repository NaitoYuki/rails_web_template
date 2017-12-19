class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # https://github.com/charliesome/better_errors/issues/341
  before_action :better_errors_hack, if: -> { Rails.env.development? }

  private

  def better_errors_hack
    request.env['puma.config'].options.user_options.delete :app
  end
end
