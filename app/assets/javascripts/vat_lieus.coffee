# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'turbolinks:load',()->
  create_datatable
    table_id: '#vat_lieu'
    new_modal_id: '#vat_lieu-new-modal'
    edit_modal_id: '#vat_lieu-edit-modal'
    delete_path: '/vat_lieus/id'
    invisible_columns: [0]
    no_sort_columns: [5, 6]
    get_id_from_row_data: (data)->
      return data[0]

  $('#vat_lieu-new-modal').on 'show', ()->
    $(this).modal('show')
    $(this).find('#vat_lieu_ten').val('')
    $(this).find('#vat_lieu_loai').val('')
    $(this).find('#vat_lieu_donvi').val('')
    $(this).find('#vat_lieu_note').val('')
    $('.form-group.has-error').each ()->
      $('.help-block', $(this)).html('')
      $(this).removeClass('has-error')

  $('#vat_lieu-edit-modal').on 'show', (e, selected_row_data)->
    $(this).modal('show')
    form = $(this).find('form')
    form.attr('action', form.attr('action').replace('0', selected_row_data[0]))
    $(this).find('#vat_lieu_ten').val(selected_row_data[1])
    $(this).find('#vat_lieu_loai').val(selected_row_data[2])
    $(this).find('#vat_lieu_donvi').val(selected_row_data[3])
    $(this).find('#vat_lieu_note').val(selected_row_data[4])
    $('.form-group.has-error').each ()->
      $('.help-block', $(this)).html('')
      $(this).removeClass('has-error')
