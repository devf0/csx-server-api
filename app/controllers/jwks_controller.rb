require 'jose'
class JwksController < ApplicationController
  respond_to :json

  def index
    key = JOSE::JWK.new
    jwks = JOSE::JWK.new([key])
    render json: jwks.to_json
  end
end