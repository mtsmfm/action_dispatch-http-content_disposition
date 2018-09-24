$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "minitest/autorun"

require "action_controller/railtie"
require "pry-byebug"
class TestApp < Rails::Application
  config.secret_key_base = 'secret'
end

Rails.application.configure do
  config.logger = ActiveSupport::Logger.new(STDOUT)
end

require "action_dispatch/http/content_disposition"

Rails.application.initialize!

Rails.application.routes.draw do
  get :via_send_data, controller: :download
  get :via_send_file, controller: :download
  get :via_send_data_api, controller: :download_api
  get :via_send_file_api, controller: :download_api
end

class DownloadController < ActionController::Base
  def via_send_data
    send_data '', filename: Thread.current[:filename]
  end

  def via_send_file
    send_file Tempfile.new.path, filename: Thread.current[:filename]
  end
end

class DownloadApiController < ActionController::API
  def via_send_data_api
    send_data '', filename: Thread.current[:filename]
  end

  def via_send_file_api
    send_file Tempfile.new.path, filename: Thread.current[:filename]
  end
end if defined? ActionController::API

require "capybara/rails"
