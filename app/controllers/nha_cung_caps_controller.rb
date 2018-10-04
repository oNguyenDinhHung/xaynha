class NhaCungCapsController < ApplicationController
	def index
    @nha_cung_caps = NhaCungCap.all
  end

  def create
    @nha_cung_cap = NhaCungCap.new(nha_cung_cap_params)
    flash[:notice] = t 'app.flash.new_success' if @nha_cung_cap.save
    render 'share/create', locals: { obj: @nha_cung_cap, attr_list: NhaCungCap::SHOW_ATTRS }
  end

  def update
    @nha_cung_cap = NhaCungCap.find_by_id(params[:id])
    flash[:notice] = t 'app.flash.update_success' if @nha_cung_cap.update(nha_cung_cap_params)
    render 'share/update', locals: { obj: @nha_cung_cap, attr_list: NhaCungCap::SHOW_ATTRS }
  end

  def destroy
    if params[:ids]
      NhaCungCap.where(id: params[:ids]).destroy_all
      data = { destroy_success: 'success' }
      respond_to do |format|
        format.json { render json: data }
      end
    else
      @nha_cung_cap = NhaCungCap.find_by_id(params[:id])
      @nha_cung_cap.destroy if @nha_cung_cap
      render 'share/destroy', locals: { obj: @nha_cung_cap }
    end
  end

  private

    def nha_cung_cap_params
      params.require(:nha_cung_cap).permit(:ten, :sodienthoai, :note)
    end
end
