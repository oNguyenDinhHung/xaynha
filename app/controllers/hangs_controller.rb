class HangsController < ApplicationController
	def index
    @hangs = Hang.all
  end

  def create
    @hang = Hang.new(hang_params)
    flash[:notice] = t 'app.flash.new_success' if @hang.save
    render 'share/create', locals: { obj: @hang, attr_list: Hang::SHOW_ATTRS, hoa_don: @hang.hoa_don }
  end

  def update
    @hang = Hang.find_by_id(params[:id])
    flash[:notice] = t 'app.flash.update_success' if @hang.update(hang_params)
    render 'share/update', locals: { obj: @hang, attr_list: Hang::SHOW_ATTRS, hoa_don: @hang.hoa_don }
  end

  def destroy
    if params[:ids]
      Hang.where(id: params[:ids]).destroy_all
      data = { destroy_success: 'success' }
      respond_to do |format|
        format.json { render json: data }
      end
    else
      @hang = Hang.find_by_id(params[:id])
      @hoa_don = @hang.hoa_don
      @hang.destroy if @hang
      render 'share/destroy', locals: { obj: @hang, hoa_don: @hoa_don }
    end
  end

  private

    def hang_params
      params.require(:hang).permit(:hoa_don_id, :vat_lieu_id, :gia, :so_luong, :note)
    end
end
