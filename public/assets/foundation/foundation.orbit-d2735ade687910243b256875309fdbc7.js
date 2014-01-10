!function(t,e,i,a){"use strict";var s=function(){},n=function(s,n){if(s.hasClass(n.slides_container_class))return this;var c,d,_,u,p,m,g=this,h=s,f=0,v=!1;h.children().first().addClass(n.active_slide_class),g.update_slide_number=function(e){n.slide_number&&(d.find("span:first").text(parseInt(e)+1),d.find("span:last").text(h.children().length)),n.bullets&&(_.children().removeClass(n.bullets_active_class),t(_.children().get(e)).addClass(n.bullets_active_class))},g.update_active_link=function(e){var i=t('a[data-orbit-link="'+h.children().eq(e).attr("data-orbit-slide")+'"]');i.parents("ul").find("[data-orbit-link]").removeClass(n.bullets_active_class),i.addClass(n.bullets_active_class)},g.build_markup=function(){h.wrap('<div class="'+n.container_class+'"></div>'),c=h.parent(),h.addClass(n.slides_container_class),n.navigation_arrows&&(c.append(t('<a href="#"><span></span></a>').addClass(n.prev_class)),c.append(t('<a href="#"><span></span></a>').addClass(n.next_class))),n.timer&&(u=t("<div>").addClass(n.timer_container_class),u.append("<span>"),u.append(t("<div>").addClass(n.timer_progress_class)),u.addClass(n.timer_paused_class),c.append(u)),n.slide_number&&(d=t("<div>").addClass(n.slide_number_class),d.append("<span></span> "+n.slide_number_text+" <span></span>"),c.append(d)),n.bullets&&(_=t("<ol>").addClass(n.bullets_container_class),c.append(_),_.wrap('<div class="orbit-bullets-container"></div>'),h.children().each(function(e){var i=t("<li>").attr("data-orbit-slide",e);_.append(i)})),n.stack_on_small&&c.addClass(n.stack_on_small_class),g.update_slide_number(0),g.update_active_link(0)},g._goto=function(e,i){if(e===f)return!1;"object"==typeof m&&m.restart();var a=h.children(),s="next";v=!0,f>e&&(s="prev"),e>=a.length?e=0:0>e&&(e=a.length-1);var r=t(a.get(f)),o=t(a.get(e));r.css("zIndex",2),r.removeClass(n.active_slide_class),o.css("zIndex",4).addClass(n.active_slide_class),h.trigger("before-slide-change.fndtn.orbit"),n.before_slide_change(),g.update_active_link(e);var l=function(){var t=function(){f=e,v=!1,i===!0&&(m=g.create_timer(),m.start()),g.update_slide_number(f),h.trigger("after-slide-change.fndtn.orbit",[{slide_number:f,total_slides:a.length}]),n.after_slide_change(f,a.length)};h.height()!=o.height()&&n.variable_height?h.animate({height:o.height()},250,"linear",t):t()};if(1===a.length)return l(),!1;var c=function(){"next"===s&&p.next(r,o,l),"prev"===s&&p.prev(r,o,l)};o.height()>h.height()&&n.variable_height?h.animate({height:o.height()},250,"linear",c):c()},g.next=function(t){t.stopImmediatePropagation(),t.preventDefault(),g._goto(f+1)},g.prev=function(t){t.stopImmediatePropagation(),t.preventDefault(),g._goto(f-1)},g.link_custom=function(e){e.preventDefault();var i=t(this).attr("data-orbit-link");if("string"==typeof i&&""!=(i=t.trim(i))){var a=c.find("[data-orbit-slide="+i+"]");-1!=a.index()&&g._goto(a.index())}},g.link_bullet=function(){var e=t(this).attr("data-orbit-slide");"string"==typeof e&&""!=(e=t.trim(e))&&g._goto(parseInt(e))},g.timer_callback=function(){g._goto(f+1,!0)},g.compute_dimensions=function(){var e=t(h.children().get(f)),i=e.height();n.variable_height||h.children().each(function(){t(this).height()>i&&(i=t(this).height())}),h.height(i)},g.create_timer=function(){var t=new r(c.find("."+n.timer_container_class),n,g.timer_callback);return t},g.stop_timer=function(){"object"==typeof m&&m.stop()},g.toggle_timer=function(){var t=c.find("."+n.timer_container_class);t.hasClass(n.timer_paused_class)?("undefined"==typeof m&&(m=g.create_timer()),m.start()):"object"==typeof m&&m.stop()},g.init=function(){g.build_markup(),n.timer&&(m=g.create_timer(),m.start()),p=new l(n,h),"slide"===n.animation&&(p=new o(n,h)),c.on("click","."+n.next_class,g.next),c.on("click","."+n.prev_class,g.prev),c.on("click","[data-orbit-slide]",g.link_bullet),c.on("click",g.toggle_timer),n.swipe&&c.on("touchstart.fndtn.orbit",function(t){t.touches||(t=t.originalEvent);var e={start_page_x:t.touches[0].pageX,start_page_y:t.touches[0].pageY,start_time:(new Date).getTime(),delta_x:0,is_scrolling:a};c.data("swipe-transition",e),t.stopPropagation()}).on("touchmove.fndtn.orbit",function(t){if(t.touches||(t=t.originalEvent),!(t.touches.length>1||t.scale&&1!==t.scale)){var e=c.data("swipe-transition");if("undefined"==typeof e&&(e={}),e.delta_x=t.touches[0].pageX-e.start_page_x,"undefined"==typeof e.is_scrolling&&(e.is_scrolling=!!(e.is_scrolling||Math.abs(e.delta_x)<Math.abs(t.touches[0].pageY-e.start_page_y))),!e.is_scrolling&&!e.active){t.preventDefault();var i=e.delta_x<0?f+1:f-1;e.active=!0,g._goto(i)}}}).on("touchend.fndtn.orbit",function(t){c.data("swipe-transition",{}),t.stopPropagation()}),c.on("mouseenter.fndtn.orbit",function(){n.timer&&n.pause_on_hover&&g.stop_timer()}).on("mouseleave.fndtn.orbit",function(){n.timer&&n.resume_on_mouseout&&m.start()}),t(i).on("click","[data-orbit-link]",g.link_custom),t(e).on("resize",g.compute_dimensions),t(e).on("load",g.compute_dimensions),t(e).on("load",function(){c.prev(".preloader").css("display","none")}),h.trigger("ready.fndtn.orbit")},g.init()},r=function(t,e,i){var a,s,n=this,r=e.timer_speed,o=t.find("."+e.timer_progress_class),l=-1;this.update_progress=function(t){var e=o.clone();e.attr("style",""),e.css("width",t+"%"),o.replaceWith(e),o=e},this.restart=function(){clearTimeout(s),t.addClass(e.timer_paused_class),l=-1,n.update_progress(0)},this.start=function(){return t.hasClass(e.timer_paused_class)?(l=-1===l?r:l,t.removeClass(e.timer_paused_class),a=(new Date).getTime(),o.animate({width:"100%"},l,"linear"),s=setTimeout(function(){n.restart(),i()},l),t.trigger("timer-started.fndtn.orbit"),void 0):!0},this.stop=function(){if(t.hasClass(e.timer_paused_class))return!0;clearTimeout(s),t.addClass(e.timer_paused_class);var i=(new Date).getTime();l-=i-a;var o=100-l/r*100;n.update_progress(o),t.trigger("timer-stopped.fndtn.orbit")}},o=function(e){var i=e.animation_speed,a=1===t("html[dir=rtl]").length,s=a?"marginRight":"marginLeft",n={};n[s]="0%",this.next=function(t,e,a){t.animate({marginLeft:"-100%"},i),e.animate(n,i,function(){t.css(s,"100%"),a()})},this.prev=function(t,e,a){t.animate({marginLeft:"100%"},i),e.css(s,"-100%"),e.animate(n,i,function(){t.css(s,"100%"),a()})}},l=function(e){{var i=e.animation_speed;1===t("html[dir=rtl]").length}this.next=function(t,e,a){e.css({margin:"0%",opacity:"0.01"}),e.animate({opacity:"1"},i,"linear",function(){t.css("margin","100%"),a()})},this.prev=function(t,e,a){e.css({margin:"0%",opacity:"0.01"}),e.animate({opacity:"1"},i,"linear",function(){t.css("margin","100%"),a()})}};Foundation.libs=Foundation.libs||{},Foundation.libs.orbit={name:"orbit",version:"5.0.0",settings:{animation:"slide",timer_speed:1e4,pause_on_hover:!0,resume_on_mouseout:!1,animation_speed:500,stack_on_small:!1,navigation_arrows:!0,slide_number:!0,slide_number_text:"of",container_class:"orbit-container",stack_on_small_class:"orbit-stack-on-small",next_class:"orbit-next",prev_class:"orbit-prev",timer_container_class:"orbit-timer",timer_paused_class:"paused",timer_progress_class:"orbit-progress",slides_container_class:"orbit-slides-container",bullets_container_class:"orbit-bullets",bullets_active_class:"active",slide_number_class:"orbit-slide-number",caption_class:"orbit-caption",active_slide_class:"active",orbit_transition_class:"orbit-transitioning",bullets:!0,timer:!0,variable_height:!1,swipe:!0,before_slide_change:s,after_slide_change:s},init:function(e,i){var a=this;if("object"==typeof i&&t.extend(!0,a.settings,i),t(e).is("[data-orbit]")){var s=t(e),r=a.data_options(s);new n(s,t.extend({},a.settings,r))}t("[data-orbit]",e).each(function(e,i){var s=t(i),r=a.data_options(s);new n(s,t.extend({},a.settings,r))})}}}(jQuery,this,this.document);