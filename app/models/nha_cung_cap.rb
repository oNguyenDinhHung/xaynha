class NhaCungCap < ApplicationRecord
	SHOW_ATTRS = %w(id ten sodienthoai note)
  validates :ten, presence: { message: 'Tên không thể để trống' }
end
