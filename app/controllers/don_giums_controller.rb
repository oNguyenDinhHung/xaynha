class DonGiumsController < ApplicationController
	def index
    @don_giums = DonGium.all
  end

  def create
    @don_gium = DonGium.new(don_gium_params)
    flash[:notice] = t 'app.flash.new_success' if @don_gium.save
    render 'share/create', locals: { obj: @don_gium, attr_list: DonGium::SHOW_ATTRS }
  end

  def update
    @don_gium = DonGium.find_by_id(params[:id])
    flash[:notice] = t 'app.flash.update_success' if @don_gium.update(don_gium_params)
    render 'share/update', locals: { obj: @don_gium, attr_list: DonGium::SHOW_ATTRS }
  end

  def destroy
    if params[:ids]
      DonGium.where(id: params[:ids]).destroy_all
      data = { destroy_success: 'success' }
      respond_to do |format|
        format.json { render json: data }
      end
    else
      @don_gium = DonGium.find_by_id(params[:id])
      @don_gium.destroy if @don_gium
      render 'share/destroy', locals: { obj: @don_gium }
    end
  end

  private

    def don_gium_params
      params.require(:don_gium).permit(:vat_lieu_id, :nha_cung_cap_id, :gia, :donvi, :note)
    end
end
