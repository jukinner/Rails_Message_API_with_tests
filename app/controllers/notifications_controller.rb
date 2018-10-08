class NotificationsController < ApplicationController
  respond_to :json, :html

  def create
    @notification = Notification.create(params.permit(:phone, :body, :source_app))

    respond_to do |format|
      format.json { render json: @notificaton.to_json, action: 'show', status: :created, location: @notification }   
    end
  end

  def show
  end
end
