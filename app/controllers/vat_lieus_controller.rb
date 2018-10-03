class VatLieusController < ApplicationController
  def index
    @vat_lieus = VatLieu.all
  end

  def create
    @vat_lieu = VatLieu.new(vat_lieu_params)
    flash[:notice] = t 'app.flash.new_success' if @vat_lieu.save
    render 'share/create', locals: { obj: @vat_lieu, attr_list: VatLieu::SHOW_ATTRS }
  end

  def update
    @vat_lieu = VatLieu.find_by_id(params[:id])
    flash[:notice] = t 'app.flash.update_success' if @vat_lieu.update(vat_lieu_params)
    render 'share/update', locals: { obj: @vat_lieu, attr_list: VatLieu::SHOW_ATTRS }
  end

  def destroy
    if params[:ids]
      VatLieu.where(id: params[:ids]).destroy_all
      data = { destroy_success: 'success' }
      respond_to do |format|
        format.json { render json: data }
      end
    else
      @vat_lieu = VatLieu.find_by_id(params[:id])
      @vat_lieu.destroy if @vat_lieu
      render 'share/destroy', locals: { obj: @vat_lieu }
    end
  end

  private

    def vat_lieu_params
      params.require(:vat_lieu).permit(:ten, :loai, :note)
    end
end
