class VatLieu < ApplicationRecord
  SHOW_ATTRS = %w(id ten loai note)
  has_many :don_giums, dependent: :destroy
  validates :ten, presence: { message: 'Tên không thể để trống' }
end
