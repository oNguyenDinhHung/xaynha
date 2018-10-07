class HoaDon < ApplicationRecord
  mount_uploader :file, HoadonUploader
  has_many :hangs, dependent: :destroy
  belongs_to :nha_cung_cap
  NGUOI_KIS = %w(Bố Mẹ Hùng Hân Ông)
  SHOW_ATTRS = %w(id time nha_cung_cap_id nha_cung_cap_ten nguoi_ki tong_tien thanh_toan so_du note)
  validates :nguoi_ki, presence: { message: 'Người kí không thể để trống' }
  validates :nha_cung_cap_id, presence: { message: 'Nhà cung cấp không thể để trống' }
  delegate :ten, to: :nha_cung_cap, prefix: true

  def time
    thoi_gian.try(:strftime, '%d/%m/%Y %H:%M')
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
end
