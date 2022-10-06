class ApplicationController < ActionController::Base
  layout 'main'

  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token

  def index; end
end
