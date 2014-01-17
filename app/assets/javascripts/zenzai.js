$(document).ready(function(){
//  $('#jewels-datatable').dataTable({
//    bJQueryUI: true,
//    bProcessing: true,
//    bServerSide: true,
//    sAjaxSource: $('#jewels').data('source')
//  });
//
//  $('#users-datatable').dataTable({
//    bJQueryUI: true,
//    bProcessing: true,
//    bServerSide: true,
//    sAjaxSource: $('#users').data('source')
//  });
    initializeDataTable('jewels');
    initializeDataTable('users');
});

function initializeDataTable(tablename){
  $('#' + tablename + '-datatable').dataTable({
    bJQueryUI: true,
    bProcessing: true,
    bServerSide: true,
    sAjaxSource: $('#' + tablename).data('source')
  });
}
