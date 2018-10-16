class NotificationsController < ApplicationController

  def index
    render plain: 'ok'
  end

  def create
    @notification = Notification.new(notification_params)

    respond_to do |format|
      if @notification.save
        format.json { render json: @notification, action: 'show', status: :created } 
      else
        format.json { render json: @notification.errors, status: :unprocessable_entity } 
      end 
    end
  end

  def show
    @notification = Notification.find(params[:id])
    render json: @notification
  end

  def update
  end

  def destroy
  end

  private

  def notification_params
    params.require(:notification).permit(:phone, :body, :source_app)
  end
end
