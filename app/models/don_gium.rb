class DonGium < ApplicationRecord
  belongs_to :vat_lieu
  belongs_to :nha_cung_cap
  SHOW_ATTRS = %w(id vat_lieu_id vat_lieu_ten nha_cung_cap_id nha_cung_cap_ten gia donvi note)
  validates :vat_lieu_id, presence: { message: 'Vật liệu không thể để trống' }
  validates :nha_cung_cap_id, presence: { message: 'Nhà cung cấp không thể để trống' }
  delegate :ten, to: :vat_lieu, prefix: true
  delegate :ten, to: :nha_cung_cap, prefix: true
end
