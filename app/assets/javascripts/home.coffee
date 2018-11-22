# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $.fn.modal_success = ()->
    this.modal('hide')
    #clear form input elements
    #note: handle textarea, select, etc
    this.find('form input[type="text"]').val('')
    #clear error state
    this.clear_previous_errors()
  $.fn.render_form_errors = (model, errors)->
    this_form = this
    $.each JSON.parse(errors), (attr, messages)->
      form_group = this_form.find('.' + model + '_' + attr)
      form_group.addClass('has-error')
      help_block = form_group.find('.help-block')
      $.each messages, (index, mess)->
        help_block.append(mess + '<br>')
  $.fn.clear_previous_errors = ()->
    $('.form-group.has-error', this).each ()->
      $('.help-block', $(this)).html('')
      $(this).removeClass('has-error')
  window.create_sentaku_modal = (args)->
    data_table = args.table.DataTable
      retrieve: true
      pagingType: 'full_numbers'
      aoColumnDefs: [
        {
          aTargets: args.no_sort_columns
          bSortable: false
        }
        {
          aTargets: args.invisible_columns
          bVisible: false
        }
        {
          aTargets: args.no_search_columns
          bSearchable: false
        }
      ]
      order: args.order_columns
    args.modal.on 'show', (e, code)->
      row_can_tim = data_table.row (idx, data, node)->
        if data[0] == code then true else false
      if row_can_tim.length > 0
        data_table.$('tr.selected').removeClass('selected')
        $(row_can_tim.node()).addClass('selected')
        data_table.page.jumpToData(code, 0)
        args.ok_button.attr('disabled', false)
        args.clear_button.attr('disabled', false)
      $(this).modal('show')

    args.table.on 'click', 'tbody>tr', ()->
      if $(this).hasClass('selected')
        $(this).removeClass('selected')
        args.ok_button.attr('disabled', true)
        args.clear_button.attr('disabled', true)
      else
        data_table.$('tr.selected').removeClass('selected')
        $(this).addClass('selected')
        args.ok_button.attr('disabled', false)
        args.clear_button.attr('disabled', false)

    args.table.on 'dblclick', 'tbody>tr', ()->
      $(this).addClass('selected')
      selected_data = data_table.row('tr.selected').data()
      args.table.trigger args.trigger_name, [selected_data]
      args.modal.modal('hide')

    args.clear_button.click ()->
      data_table.$('tr.selected').removeClass('selected')
      args.ok_button.attr('disabled', true)
      args.clear_button.attr('disabled', true)

    args.ok_button.click ()->
      selected_data = data_table.row('tr.selected').data()
      args.table.trigger args.trigger_name, [selected_data]

  window.create_datatable = (args)->
    oTable = $(args.table_id).DataTable({
      dom: "<'row'<'col-md-6'l><'col-md-6'f>><'row'<'col-md-7'B><'col-md-5'p>><'row'<'col-md-12'tr>><'row'<'col-md-12'i>>"
      scrollX: true
      pagingType: "full_numbers"
      language:
        lengthMenu: "Hiển thi _MENU_ dòng trên một trang"
        zeroRecords: "Không tìm thấy dữ liệu"
        info: "Hiển thị trang _PAGE_ trong số _PAGES_ trang"
        infoEmpty: "Không có dữ liệu"
        infoFiltered: "(đã lọc từ tổng cộng _MAX_ dòng)"
        search: "Tìm kiếm:"
        processing: "Đang xử lí..."
        paginate:
          first: "Đầu tiên"
          previous: "Trước"
          next: "Tiếp"
          last: "Cuối cùng"
      aoColumnDefs: [
        {
          aTargets: args.no_sort_columns
          bSortable: false
        }
        {
          aTargets: args.invisible_columns
          bVisible: false
        }
        {
          aTargets: args.no_search_columns
          bSearchable: false
        }
      ]
      oSearch:
        sSearch: args.search_params
      scrollCollapse: true
      pageLength: args.page_length
      buttons: [
        {
          extend: 'copyHtml5',
          text: '<i class="fa fa-files-o"></i>',
          titleAttr: 'Copy'
        },
        {
          extend: 'excelHtml5',
          text: '<i class="fa fa-file-excel-o"></i>',
          titleAttr: 'Excel'
        },
        {
          extend: 'csvHtml5',
          text: '<i class="fa fa-file-text-o"></i>',
          titleAttr: 'CSV'
          exportOptions:
            columns: args.csv_export_columns
        },
        {
          text: 'Tạo mới'
          attr:
            id: 'new'
          action: (e, dt, node, config)->
            if args.new_path != undefined
              window.location = args.new_path
            else
              $(args.new_modal_id).trigger 'show', []
        }
      ],
      order: args.order_columns
      select: {
        style: 'single'
      }
    })

    $(args.table_id).on 'click', 'tbody tr', (e)->
      # neu click vao nut edit
      if $(e.target).hasClass('edit')
        oTable.rows('tr.selected').deselect()
        $(this).addClass('selected')
        data_of_selected_row = oTable.row('tr.selected').data()
        if args.edit_path != undefined
          window.location = args.edit_path.replace('/id/', "/#{args.get_id_from_row_data(data_of_selected_row)}/")
        else
          e.preventDefault()
          $(args.edit_modal_id).trigger 'show', [data_of_selected_row]
      # neu khong click vao nut delete
      else if !$(e.target).hasClass('delete')
        $(this).toggleClass('selected')
        selects = oTable.rows('tr.selected').data()
        if selects.length == 0
          $("#edit").addClass("disabled")
          # $("#delete").addClass("disabled")
          # $(".buttons-select-none").addClass('disabled')
        else
          # $("#delete").removeClass("disabled");
          # $(".buttons-select-none").removeClass('disabled')
          if selects.length == 1
            $("#edit").removeClass("disabled")
          else
            $("#edit").addClass("disabled")
  vltt_table = $('#vltt').DataTable({
    scrollX: true
    pagingType: "full_numbers"
    language:
      lengthMenu: "Hiển thi _MENU_ dòng trên một trang"
      zeroRecords: "Không tìm thấy dữ liệu"
      info: "Hiển thị trang _PAGE_ trong số _PAGES_ trang"
      infoEmpty: "Không có dữ liệu"
      infoFiltered: "(đã lọc từ tổng cộng _MAX_ dòng)"
      search: "Tìm kiếm:"
      processing: "Đang xử lí..."
      paginate:
        first: "Đầu tiên"
        previous: "Trước"
        next: "Tiếp"
        last: "Cuối cùng"
    scrollCollapse: true
    pageLength: 100
    order: 0
    select: {
      style: 'single'
    }
    drawCallback: (settings)->
      sum = 0
      $('#vltt > tbody > tr').each (index, value)->
        text = $(this).find('td:eq(2)').html()
        if text != undefined
          sum += parseFloat(text.replace(/,/g, ''))
      $('#tongtien').html('Tổng ' + sum.toLocaleString('en') + 'VND')
  })
