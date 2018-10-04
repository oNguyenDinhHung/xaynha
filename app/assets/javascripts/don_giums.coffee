# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'turbolinks:load',()->
  create_datatable
    table_id: '#don_gium'
    new_modal_id: '#don_gium-new-modal'
    edit_modal_id: '#don_gium-edit-modal'
    delete_path: '/don_giums/id'
    invisible_columns: [0, 1, 3]
    no_sort_columns: [8, 9]
    get_id_from_row_data: (data)->
      return data[0]

  $('#don_gium-new-modal').on 'show', ()->
    $(this).modal('show')
    $(this).find('#don_gium_vat_lieu_id').val('')
    $(this).find('#don_gium_nha_cung_cap_id').val('')
    $(this).find('#don_gium_gia').val('')
    $(this).find('#don_gium_donvi').val('')
    $(this).find('#don_gium_note').val('')
    $('.form-group.has-error').each ()->
      $('.help-block', $(this)).html('')
      $(this).removeClass('has-error')

  $('#don_gium-edit-modal').on 'show', (e, selected_row_data)->
    $(this).modal('show')
    form = $(this).find('form')
    form.attr('action', form.attr('action').replace('0', selected_row_data[0]))
    $(this).find('#don_gium_vat_lieu_id').val(selected_row_data[1])
    $(this).find('#don_gium_nha_cung_cap_id').val(selected_row_data[3])
    $(this).find('#don_gium_gia').val(selected_row_data[5])
    $(this).find('#don_gium_donvi').val(selected_row_data[6])
    $(this).find('#don_gium_note').val(selected_row_data[7])
    $('.form-group.has-error').each ()->
      $('.help-block', $(this)).html('')
      $(this).removeClass('has-error')
