# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'turbolinks:load',()->
  create_datatable
    table_id: '#nha_cung_cap'
    new_modal_id: '#nha_cung_cap-new-modal'
    edit_modal_id: '#nha_cung_cap-edit-modal'
    delete_path: '/nha_cung_caps/id'
    invisible_columns: [0]
    no_sort_columns: [4, 5]
    get_id_from_row_data: (data)->
      return data[0]

  $('#nha_cung_cap-new-modal').on 'show', ()->
    $(this).modal('show')
    $(this).find('#nha_cung_cap_ten').val('')
    $(this).find('#nha_cung_cap_sodienthoai').val('')
    $(this).find('#nha_cung_cap_note').val('')
    $('.form-group.has-error').each ()->
      $('.help-block', $(this)).html('')
      $(this).removeClass('has-error')

  $('#nha_cung_cap-edit-modal').on 'show', (e, selected_row_data)->
    $(this).modal('show')
    form = $(this).find('form')
    form.attr('action', form.attr('action').replace('0', selected_row_data[0]))
    $(this).find('#nha_cung_cap_ten').val(selected_row_data[1])
    $(this).find('#nha_cung_cap_sodienthoai').val(selected_row_data[2])
    $(this).find('#nha_cung_cap_note').val(selected_row_data[3])
    $('.form-group.has-error').each ()->
      $('.help-block', $(this)).html('')
      $(this).removeClass('has-error')
