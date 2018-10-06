class HoaDon < ApplicationRecord
  mount_uploader :file, HoadonUploader
	has_many :hangs, dependent: :destroy
  belongs_to :nha_cung_cap
  NGUOI_KIS = %w(Bố Mẹ Hùng Hân Ông)
  SHOW_ATTRS = %w(id day nha_cung_cap_id nha_cung_cap_ten nguoi_ki thanh_toan so_du note)
  validates :nguoi_ki, presence: { message: 'Người kí không thể để trống' }
  validates :nha_cung_cap_id, presence: { message: 'Nhà cung cấp không thể để trống' }
  delegate :ten, to: :nha_cung_cap, prefix: true

  def day
    ngay.strftime('%d/%m/%Y')
  end
end
