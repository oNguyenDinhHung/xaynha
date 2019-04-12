class KhoanVay < ApplicationRecord
  SHOW_ATTRS = %w(id nguoi_cho_vay nguoi_vay so_tien_vay tien_con_no note)
  validates :nguoi_cho_vay, :nguoi_vay, :so_tien_vay, presence: { message: ' không thể để trống' }
  has_many :tra_nos, dependent: :destroy

  before_save :update_tien_con_no
  def update_tien_con_no
    self.tien_con_no = so_tien_vay - tra_nos.sum(:so_tien)
  end
end
