$(document).ready(function(){
    initializeDataTable('jewels');
    initializeDataTable('users');
});

function initializeDataTable(tablename){
  $('#' + tablename + '-datatable').dataTable({
    bJQueryUI: true,
    bProcessing: true,
    bServerSide: true,
    bDestroy: true,
    sAjaxSource: $('#' + tablename).data('source')
  });
}
