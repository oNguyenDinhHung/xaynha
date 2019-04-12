class TraNosController < ApplicationController
  def index
    @tra_nos = TraNo.where(khoan_vay_id: params[:khoan_vay_id])
  end

  def new
    @khoan_vay = KhoanVay.find_by_id(params[:khoan_vay_id])
    if @khoan_vay
      @tra_no = @khoan_vay.tra_nos.build
    else
      redirect_to khoan_vays_path
    end
  end

  def create
    @tra_no = TraNo.new(tra_no_params)
    flash[:notice] = t 'app.flash.new_success' if @tra_no.save
    khoan_vay = @tra_no.khoan_vay
    khoan_vay.update_tien_con_no
    khoan_vay.save
    redirect_to khoan_vays_path
  end

  def destroy
     tra_no = TraNo.find_by_id(params[:id])
    if tra_no
      khoan_vay = tra_no.khoan_vay
      tra_no.destroy
    end
    if khoan_vay
      khoan_vay.update_tien_con_no
      khoan_vay.save
      redirect_to tra_nos_path(khoan_vay_id: khoan_vay.id)
    else
      redirect_to :back
    end
  end

  private

    def tra_no_params
      params.require(:tra_no).permit(:khoan_vay_id, :so_tien, :note)
    end
end
