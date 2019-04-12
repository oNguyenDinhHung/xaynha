# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'turbolinks:load',()->
  create_datatable
    table_id: '#khoan_vay'
    new_modal_id: '#khoan_vay-new-modal'
    edit_modal_id: '#khoan_vay-edit-modal'
    delete_path: '/khoan_vays/id'
    invisible_columns: [0]
    no_sort_columns: [6, 7, 8, 9]
    get_id_from_row_data: (data)->
      return data[0]

  $('#khoan_vay-new-modal').on 'show', ()->
    $(this).modal('show')
    $(this).find('#khoan_vay_nguoi_cho_vay').val('')
    $(this).find('#khoan_vay_nguoi_vay').val('')
    $(this).find('#khoan_vay_so_tien_vay').val('')
    $(this).find('#khoan_vay_tien_con_no').val('')
    $(this).find('#khoan_vay_note').val('')
    $('.form-group.has-error').each ()->
      $('.help-block', $(this)).html('')
      $(this).removeClass('has-error')

  $('#khoan_vay-edit-modal').on 'show', (e, selected_row_data)->
    $(this).modal('show')
    form = $(this).find('form')
    form.attr('action', form.attr('action').replace('0', selected_row_data[0]))
    $(this).find('#khoan_vay_nguoi_cho_vay').val(selected_row_data[1])
    $(this).find('#khoan_vay_nguoi_vay').val(selected_row_data[2])
    $(this).find('#khoan_vay_so_tien_vay').val(selected_row_data[3])
    $(this).find('#khoan_vay_tien_con_no').val(selected_row_data[4])
    $(this).find('#khoan_vay_note').val(selected_row_data[5])
    $('.form-group.has-error').each ()->
      $('.help-block', $(this)).html('')
      $(this).removeClass('has-error')
