class GuestBookController < ApplicationController
  GUEST_LIMIT = 200

  def index
    @guests = Guest.all.limit(50).order(created_at: :desc)
    @guest  = Guest.new if Guest.count < GUEST_LIMIT
  end

  def sign
    if Guest.count >= GUEST_LIMIT
      flash[:error] = 'Guest count too large'
      redirect_to(root_path)
    end

    @guest = Guest.new(permitted_params)
    if @guest.save
      flash[:success] = "#{@guest.name} created successfully"
    else
      flash[:error] = 'Sorry, something went wrong'
    end
    redirect_to(root_path)
  end

  def destroy
    @guest = Guest.find_by(id: params[:id])
    if @guest&.delete
      flash[:success] = 'Guest successfully removed'
    else
      flash[:error] = 'Guest could not be removed'
    end
    redirect_to(root_path)
  end

  def wipe
    Guest.destroy_all
    redirect_to(root_path)
  end

  private

  def permitted_params
    params.require(:guest).permit(:name)
  end
end
