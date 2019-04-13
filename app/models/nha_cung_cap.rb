class NhaCungCap < ApplicationRecord
  SHOW_ATTRS = %w(id ten sodienthoai note)
  has_many :hoa_dons, dependent: :destroy
  has_many :hangs, through: :hoa_dons
  validates :ten, presence: { message: 'Tên không thể để trống' }
end
