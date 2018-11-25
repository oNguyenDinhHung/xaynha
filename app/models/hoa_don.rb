class HoaDon < ApplicationRecord
  include  ActionView::Helpers::NumberHelper
  mount_uploader :file, HoadonUploader
  has_many :hangs, dependent: :destroy
  belongs_to :nha_cung_cap
  NGUOI_KIS = %w(Bố Mẹ Hùng Hân Ông)
  SHOW_ATTRS = %w(id time nha_cung_cap_id nha_cung_cap_ten nguoi_ki tong_tien_v thanh_toan_v so_du_v note)
  validates :nguoi_ki, presence: { message: 'Người kí không thể để trống' }
  validates :nha_cung_cap_id, presence: { message: 'Nhà cung cấp không thể để trống' }
  delegate :ten, to: :nha_cung_cap, prefix: true

  def time
    thoi_gian.try(:strftime, '%Y/%m/%d %H:%M')
  end

  def tinh_tong_tien
    update(tong_tien: Hang.where(hoa_don: self).sum(&:thanh_tien))
  end

  def tinh_so_du
    so_du = 0
    HoaDon.where(nha_cung_cap_id: nha_cung_cap_id). order(:thoi_gian).each do |hd|
      so_du = so_du + (hd.thanh_toan||0) - (hd.tong_tien||0)
      hd.update(so_du: so_du)
    end
  end

  def tong_tien_v
    number_with_delimiter(tong_tien)
  end

  def thanh_toan_v
    number_with_delimiter(thanh_toan)
  end

  def so_du_v
    number_with_delimiter(so_du)
  end
end
