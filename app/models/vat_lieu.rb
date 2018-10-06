class VatLieu < ApplicationRecord
  SHOW_ATTRS = %w(id ten loai donvi note)
  has_many :hangs, dependent: :destroy
  validates :ten, presence: { message: 'Tên không thể để trống' }
end
