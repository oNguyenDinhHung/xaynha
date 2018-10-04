class NhaCungCap < ApplicationRecord
  SHOW_ATTRS = %w(id ten sodienthoai note)
  has_many :don_giums, dependent: :destroy
  validates :ten, presence: { message: 'Tên không thể để trống' }
end
