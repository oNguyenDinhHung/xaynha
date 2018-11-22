class HangsController < ApplicationController
	def index
    @hangs = Hang.all
  end

  def create
    @hang = Hang.new(hang_params)
    @hang.save
    @hoa_don = @hang.hoa_don
    if @hoa_don
      @hoa_don.tinh_tong_tien
      @hoa_don.tinh_so_du
    end
    redirect_back(fallback_location: hangs_path)
    # render 'share/create', locals: { obj: @hang, attr_list: Hang::SHOW_ATTRS }
  end

  def update
    @hang = Hang.find_by_id(params[:id])
    @hang.update(hang_params.delete_if{|k, v| %w(gia so_luong).include?(k) && v.blank?})
    @hoa_don = @hang.hoa_don
    if @hoa_don
      @hoa_don.tinh_tong_tien
      @hoa_don.tinh_so_du
    end
    redirect_back(fallback_location: hangs_path)
    # render 'share/update', locals: { obj: @hang, attr_list: Hang::SHOW_ATTRS }
  end

  def destroy
    @hang = Hang.find_by_id(params[:id])
    @hoa_don = @hang.hoa_don
    @hang.destroy if @hang
    if @hoa_don.save
      @hoa_don.tinh_tong_tien
      @hoa_don.tinh_so_du
    end
    redirect_back(fallback_location: hangs_path)
    # render 'share/destroy', locals: { obj: @hang }
  end

  private

    def hang_params
      params.require(:hang).permit(:hoa_don_id, :vat_lieu_id, :gia, :so_luong, :note)
    end
end
