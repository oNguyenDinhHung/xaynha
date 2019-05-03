class KhoanVaysController < ApplicationController
  before_action :check_admin
  def index
    @khoan_vays = KhoanVay.all
  end
  def create
    @khoan_vay = KhoanVay.new(khoan_vay_params)
    flash[:notice] = t 'app.flash.new_success' if @khoan_vay.save
    redirect_to khoan_vays_path
  end

  def update
    @khoan_vay = KhoanVay.find_by_id(params[:id])
    flash[:notice] = t 'app.flash.update_success' if @khoan_vay.update(khoan_vay_params)
    redirect_to khoan_vays_path
  end

  def destroy
    if params[:ids]
      KhoanVay.where(id: params[:ids]).destroy_all
      data = { destroy_success: 'success' }
      respond_to do |format|
        format.json { render json: data }
      end
    else
      @khoan_vay = KhoanVay.find_by_id(params[:id])
      @khoan_vay.destroy if @khoan_vay
      render 'share/destroy', locals: { obj: @khoan_vay }
    end
  end

  private

    def khoan_vay_params
      params.require(:khoan_vay).permit(:nguoi_cho_vay, :nguoi_vay, :so_tien_vay, :tien_con_no, :note)
    end

    def check_admin
      redirect_to root_path unless current_user.role == 'admin'
    end
end
