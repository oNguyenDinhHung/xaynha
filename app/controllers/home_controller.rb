class HomeController < ApplicationController
  def index
    @vls = {}
    if params[:nha_cung_cap_id]
      nha_cung_cap = NhaCungCap.find_by_id(params[:nha_cung_cap_id])
    end
    if nha_cung_cap
      hangs = nha_cung_cap.hangs
    else
      hangs = Hang.all
    end
    hangs.includes(:vat_lieu).group_by(&:vat_lieu).each do |k, v|
      @vls.merge!("#{k.ten} #{k.loai}" => { sl: v.sum(&:so_luong), dv: k.donvi, tt: v.sum(&:thanh_tien) })
    end
  end
end
