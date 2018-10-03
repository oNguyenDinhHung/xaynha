class VatLieu < ApplicationRecord
  SHOW_ATTRS = %w(id ten loai note)
  validates :ten, presence: { message: 'Tên không thể để trống' }
end
