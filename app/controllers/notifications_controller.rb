class NotificationsController < ApplicationController
  respond_to :json

  def index
  end

  def create
    @notification = Notification.create(notification_params)

    respond_to do |format|
      if @notification.save
        format.json { render json: @notificaton, action: 'show', status: :created } 
      else
        format.json { render json: @notificaton.errors, status: :unprocessable_entity } 
      end
        
    end
  end

  def show
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
