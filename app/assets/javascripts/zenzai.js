$(document).ready(function(){
  $('#jewels-datatable').dataTable({
    bJQueryUI: true,
    bProcessing: true,
    bServerSide: true,
    sAjaxSource: $('#jewels').data('source')
  });

  $('#users-datatable').dataTable();
});
        
