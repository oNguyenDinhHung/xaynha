class HomeController < ApplicationController
  def index
    @vls = {}
    Hang.includes(:vat_lieu).group_by(&:vat_lieu).each do |k, v|
      @vls.merge!("#{k.ten} #{k.loai}" => { sl: v.sum(&:so_luong), dv: k.donvi, tt: v.sum(&:thanh_tien) })
    end
  end
end
