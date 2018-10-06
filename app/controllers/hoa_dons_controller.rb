class HoaDonsController < ApplicationController
  def index
    @hoa_dons = HoaDon.all
  end

  def create
    @hoa_don = HoaDon.new(hoa_don_params)
    flash[:notice] = t 'app.flash.new_success' if @hoa_don.save
    render 'share/create', locals: { obj: @hoa_don, attr_list: HoaDon::SHOW_ATTRS, show_link: true }
  end

  def update
    @hoa_don = HoaDon.find_by_id(params[:id])
    flash[:notice] = t 'app.flash.update_success' if @hoa_don.update(hoa_don_params)
    render 'share/update', locals: { obj: @hoa_don, attr_list: HoaDon::SHOW_ATTRS, show_link: true }
  end

  def destroy
    if params[:ids]
      HoaDon.where(id: params[:ids]).destroy_all
      data = { destroy_success: 'success' }
      respond_to do |format|
        format.json { render json: data }
      end
    else
      @hoa_don = HoaDon.find_by_id(params[:id])
      @hoa_don.destroy if @hoa_don
      render 'share/destroy', locals: { obj: @hoa_don }
    end
  end

  def show
    @hoa_don = HoaDon.find(params[:id])
  end

  private

    def hoa_don_params
      params.require(:hoa_don).permit(:ngay, :nha_cung_cap_id, :nguoi_ki, :thanh_toan, :so_du, :note)
    end
end
