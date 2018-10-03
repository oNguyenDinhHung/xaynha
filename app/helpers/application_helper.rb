module ApplicationHelper
  def link_to_edit(edit_path)
    link_to 'Sửa', edit_path, class: 'edit text-warning'
  end

  def link_to_delete(object)
    link_to 'Xóa', object, method: :delete, remote: true, data: { confirm: 'Chắc chắn xóa chứ ?' }, class: 'delete text-danger'
  end

  def render_object(obj, attr_list, edit_path = nil, obj_id = nil)
    s = ''
    s << "<tr id='#{obj.class.name.underscore}_#{obj_id || obj.id}'>"
    attr_list.each { |attr| s << "<td>#{obj.send(attr)}</td>" }
    s << "<td>#{link_to_edit(edit_path)}</td>" if edit_path.present?
    s << "<td>#{link_to_delete(obj)}</td></tr>"
    s.html_safe
  end
end
