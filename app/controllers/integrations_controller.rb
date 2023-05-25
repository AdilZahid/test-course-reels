class IntegrationsController < ApplicationController
  require 'httparty'
  include Integration

  def index

    if check_session
      @status = "connected"
    end
  end

  def create
    if check_session
      redirect_to auth_facebook_callback_path
    else
      login_url = FacebookService.login
      redirect_to login_url, allow_other_host: true
    end
  end

  def facebook_callback
    fetch_data = FacebookService.new({code: params[:code], token: session[:token]})
    if check_session
      token = session[:token]
    else
      token = fetch_data.get_token
      session[:token] = token
    end
    @data = fetch_data.facebook_call(token)
  end


  def post_content
    post_data = FacebookService.new({id: params[:id], token: session[:token]})
    selected_value = params[:id].split(',')
    type = selected_value[1]
    if type == 'GROUPS'
      post_data.delay.publish_video_on_group
    elsif type == 'PAGES'
      post_data.delay.publish_video_on_page
    end
    redirect_to integrations_path, notice: 'Video Uploaded successfully.'
  end

  def destroy_session
    session[:token] = nil
    redirect_to integrations_path
  end

end