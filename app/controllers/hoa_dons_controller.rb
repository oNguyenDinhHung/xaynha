class HoaDonsController < ApplicationController
  def index
    @hoa_dons = HoaDon.includes(:nha_cung_cap)
    @search_params = params[:search_params]
  end

  def create
    @hoa_don = HoaDon.new(hoa_don_params)
    if @hoa_don.save
      @hoa_don.tinh_tong_tien
      @hoa_don.tinh_so_du
    end
    redirect_to hoa_dons_path
    # render 'share/create', locals: { obj: @hoa_don.reload, attr_list: HoaDon::SHOW_ATTRS, show_link: true }
  end

  def update
    @hoa_don = HoaDon.find_by_id(params[:id])
    if @hoa_don.update(hoa_don_params)
      @hoa_don.tinh_tong_tien
      @hoa_don.tinh_so_du
    end
    redirect_to hoa_dons_path
    # render 'share/update', locals: { obj: @hoa_don.reload, attr_list: HoaDon::SHOW_ATTRS, show_link: true }
  end

  def destroy
    @hoa_don = HoaDon.find_by_id(params[:id])
    if @hoa_don
      @hoa_don.destroy
      @hoa_don.tinh_so_du
    end
    redirect_to hoa_dons_path
    # render 'share/destroy', locals: { obj: @hoa_don }
  end

  def show
    @hoa_don = HoaDon.find(params[:id])
  end

  private

    def hoa_don_params
      params.require(:hoa_don).permit(:thoi_gian, :nha_cung_cap_id, :nguoi_ki, :thanh_toan, :note, :file)
    end
end
