# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'turbolinks:load',()->
  create_datatable
    table_id: '#hoa_don'
    new_modal_id: '#hoa_don-new-modal'
    edit_modal_id: '#hoa_don-edit-modal'
    delete_path: '/hoa_dons/id'
    invisible_columns: [0, 2]
    no_sort_columns: [8, 9, 10]
    get_id_from_row_data: (data)->
      return data[0]

  $('#hoa_don-new-modal').on 'show', ()->
    $(this).modal('show')
    $(this).find('#hoa_don_ngay').val('')
    $(this).find('#hoa_don_nha_cung_cap_id').val('')
    $(this).find('#hoa_don_nguoi_ki').val('')
    $(this).find('#hoa_don_thanh_toan').val('')
    $(this).find('#hoa_don_so_du').val('')
    $(this).find('#hoa_don_note').val('')
    $('.form-group.has-error').each ()->
      $('.help-block', $(this)).html('')
      $(this).removeClass('has-error')

  $('#hoa_don-edit-modal').on 'show', (e, selected_row_data)->
    $(this).modal('show')
    form = $(this).find('form')
    form.attr('action', form.attr('action').replace('0', selected_row_data[0]))
    $(this).find('#hoa_don_ngay').val(selected_row_data[1])
    $(this).find('#hoa_don_nha_cung_cap_id').val(selected_row_data[2])
    $(this).find('#hoa_don_nguoi_ki').val(selected_row_data[4])
    $(this).find('#hoa_don_thanh_toan').val(selected_row_data[5])
    $(this).find('#hoa_don_so_du').val(selected_row_data[6])
    $(this).find('#hoa_don_note').val(selected_row_data[7])
    $('.form-group.has-error').each ()->
      $('.help-block', $(this)).html('')
      $(this).removeClass('has-error')

  $('#button_anh').click ->
    $('#picture').toggle()