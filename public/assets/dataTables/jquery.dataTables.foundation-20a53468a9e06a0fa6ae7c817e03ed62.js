$.extend(!0,$.fn.dataTable.defaults,{sDom:"<'row'<'large-6 columns'l><'large-6 columns'f>r>t<'row'<'large-6 columns'i><'large-6 columns'p>>",sPaginationType:"bootstrap",oLanguage:{sLengthMenu:"_MENU_ records per page"}}),$.fn.dataTableExt.oApi.fnPagingInfo=function(a){return{iStart:a._iDisplayStart,iEnd:a.fnDisplayEnd(),iLength:a._iDisplayLength,iTotal:a.fnRecordsTotal(),iFilteredTotal:a.fnRecordsDisplay(),iPage:-1===a._iDisplayLength?0:Math.ceil(a._iDisplayStart/a._iDisplayLength),iTotalPages:-1===a._iDisplayLength?0:Math.ceil(a.fnRecordsDisplay()/a._iDisplayLength)}},$.extend($.fn.dataTableExt.oPagination,{bootstrap:{fnInit:function(a,e,i){a.oLanguage.oPaginate;var l=function(e){e.preventDefault(),a.oApi._fnPageChange(a,e.data.action)&&i(a)};$(e).append('<ul class="pagination"><li class="prev arrow unavailable"><a href="">&laquo;</a></li><li class="next arrow unavailable"><a href="">&raquo;</a></li></ul>');var n=$("a",e);$(n[0]).bind("click.DT",{action:"previous"},l),$(n[1]).bind("click.DT",{action:"next"},l)},fnUpdate:function(a,e){var i,l,n,t,o=a.oInstance.fnPagingInfo(),s=a.aanFeatures.p,r=[];if(o.iTotalPages<=6)for(i=0;i<o.iTotalPages;i++)r.push(i);else{r.push(o.iPage);var g=o.iPage+2>=o.iTotalPages?o.iTotalPages:o.iPage+2;for(i=o.iPage+1;g>i;i++)r.push(i);g<o.iTotalPages-2&&r.push(null),-1===$.inArray(o.iTotalPages-2,r)&&o.iPage<o.iTotalPages-2&&r.push(o.iTotalPages-2),-1===$.inArray(o.iTotalPages-1,r)&&r.push(o.iTotalPages-1);var u=o.iPage-2>0?o.iPage-2:0;for(i=o.iPage-1;i>u;i--)r.unshift(i);u>1&&r.unshift(null),-1===$.inArray(1,r)&&o.iTotalPages>1&&r.unshift(1),-1===$.inArray(0,r)&&r.unshift(0)}for(i=0,l=s.length;l>i;i++)t=s[i],$("li:gt(0)",t).filter(":not(:last)").remove(),$.each(r,function(i,l){n=null===l?"unavailable":l===o.iPage?"current":"",$('<li class="'+n+'"><a href="">'+(null===l?"&hellip;":l+1)+"</a></li>").insertBefore($("li:last",t)).bind("click",function(i){i.preventDefault(),a._iDisplayStart=(parseInt($("a",this).text(),10)-1)*o.iLength,e(a)})}),0===o.iPage?$("li:first",t).addClass("unavailable"):$("li:first",t).removeClass("unavailable"),o.iPage===o.iTotalPages-1||0===o.iTotalPages?$("li:last",t).addClass("unavailable"):$("li:last",t).removeClass("unavailable")}}}),$.fn.DataTable.TableTools&&($.extend(!0,$.fn.DataTable.TableTools.classes,{container:"DTTT button-group",buttons:{normal:"button",disabled:"disabled"},collection:{container:"DTTT_dropdown dropdown-menu",buttons:{normal:"",disabled:"disabled"}},select:{row:"active"}}),$.extend(!0,$.fn.DataTable.TableTools.DEFAULTS.oTags,{collection:{container:"ul",button:"li",liner:"a"}}));