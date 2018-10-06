# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'turbolinks:load',()->
  create_datatable
    table_id: '#hang'
    new_modal_id: '#hang-new-modal'
    edit_modal_id: '#hang-edit-modal'
    delete_path: '/hangs/id'
    invisible_columns: [0, 2]
    no_sort_columns: [7, 8]
    get_id_from_row_data: (data)->
      return data[0]

  $('#hang-new-modal').on 'show', ()->
    $(this).modal('show')
    $(this).find('#hang_vat_lieu_id').val('')
    $(this).find('#hang_gia').val('')
    $(this).find('#hang_so_luong').val('')
    $(this).find('#hang_note').val('')
    $('.form-group.has-error').each ()->
      $('.help-block', $(this)).html('')
      $(this).removeClass('has-error')

  $('#hang-edit-modal').on 'show', (e, selected_row_data)->
    $(this).modal('show')
    form = $(this).find('form')
    form.attr('action', form.attr('action').replace('0', selected_row_data[0]))
    $(this).find('#hang_hoa_don_id').val(selected_row_data[1])
    $(this).find('#hang_vat_lieu_id').val(selected_row_data[2])
    $(this).find('#hang_gia').val(selected_row_data[4])
    $(this).find('#hang_so_luong').val(selected_row_data[5])
    $(this).find('#hang_note').val(selected_row_data[6])
    $('.form-group.has-error').each ()->
      $('.help-block', $(this)).html('')
      $(this).removeClass('has-error')
