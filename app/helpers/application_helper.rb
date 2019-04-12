module ApplicationHelper
  def link_to_edit(edit_path)
    link_to 'Sửa', edit_path, class: 'edit text-warning'
  end

  def link_to_delete(object)
    link_to 'Xóa', object, method: :delete, remote: true, data: { confirm: 'Chắc chắn xóa chứ ?' }, class: 'delete text-danger'
  end

  def link_to_view(object)
    link_to 'Xem', object, class: 'text-info'
  end

  def render_object(obj, attr_list, edit_path = nil, obj_id = nil, link_to_show = false, more_columns = {})
    s = ''
    s << "<tr id='#{obj.class.name.underscore}_#{obj_id || obj.id}'>"
    attr_list.each { |attr| s << "<td>#{obj.send(attr)}</td>" }
    s << "<td>#{link_to_view(obj)}</td>" if link_to_show
    s << "<td>#{link_to_edit(edit_path)}</td>" if edit_path.present?
    s << "<td>#{link_to_delete(obj)}</td>"
    more_columns.each do |k,v|
      s << "<td>#{link_to k.to_s,v}</td>"
    end
    s << "</tr>"
    s.html_safe
  end
end
