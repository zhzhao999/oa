var common = {};
common.debug = true;

common.log = function(msg){
	if (window.console && window.console.log && common.debug) {
		window.console.log(msg);
	}
}

common.hideModal = function(mId, callback) {
	if( callback && typeof callback === 'function' ) {
		$(mId).on('hidden.bs.modal', function() {
			callback();
			$(mId).off('hidden.bs.modal');
		});
	}
	$(mId).modal('hide');
}
var box_left;
common.shake = function(o){
    var $panel = o;
    if(!box_left){
    	box_left =$panel.position().left;
    }
    for(var i=1; 4>=i; i++){
        $panel.animate({left:box_left-(40-10*i)},50);
        $panel.animate({left:box_left+2*(40-10*i)},50);
    }
}

common.showModal = function(mId, _backdrop) {
	var _backdrop = (typeof _backdrop != 'undefined')? _backdrop : 'static';
	/*$(mId).modal({backdrop:_backdrop});*/
}

//验证反馈时间
common.testDeadLine = function(str){
	//当天最大时间  
	//str格式  yyyy/MM/dd
	if (str.length > 10){
		str = str.substring(0,10);
	}
	var deadline = new Date(str.replace(/-/g,'/')+' 23:59:59');
	if(new Date().getTime()<=deadline.getTime()){
		return true;
	}
	return false;
}

/**
 * jGrowl 1.2.12
 *
 * Dual licensed under the MIT (http://www.opensource.org/licenses/mit-license.php)
 * and GPL (http://www.opensource.org/licenses/gpl-license.php) licenses.
 *
 * Written by Stan Lemon <stosh1985@gmail.com>
 * Last updated: 2013.02.14
 *
 * jGrowl is a jQuery plugin implementing unobtrusive userland notifications.  These
 * notifications function similarly to the Growl Framework available for
 * Mac OS X (http://growl.info).
 *
 **/
!function(e){var t=function(){return!1===e.support.boxModel&&e.support.objectAll&&e.support.leadingWhitespace}();e.jGrowl=function(t,i){0==e("#jGrowl").size()&&e('<div id="jGrowl"></div>').addClass(i&&i.position?i.position:e.jGrowl.defaults.position).appendTo("body"),e("#jGrowl").jGrowl(t,i)},e.fn.jGrowl=function(t,i){if(e.isFunction(this.each)){var o=arguments;return this.each(function(){void 0==e(this).data("jGrowl.instance")&&(e(this).data("jGrowl.instance",e.extend(new e.fn.jGrowl,{notifications:[],element:null,interval:null})),e(this).data("jGrowl.instance").startup(this)),e.isFunction(e(this).data("jGrowl.instance")[t])?e(this).data("jGrowl.instance")[t].apply(e(this).data("jGrowl.instance"),e.makeArray(o).slice(1)):e(this).data("jGrowl.instance").create(t,i)})}},e.extend(e.fn.jGrowl.prototype,{defaults:{pool:0,header:"",group:"",sticky:!1,position:"top-right",glue:"after",theme:"default",themeState:"highlight",corners:"10px",check:250,life:3e3,closeDuration:"normal",openDuration:"normal",easing:"swing",closer:!0,closeTemplate:"<i class='glyphicon glyphicon-remove'></i>",closerTemplate:"<div>[ 全部关闭 ]</div>",log:function(){},beforeOpen:function(){},afterOpen:function(){},open:function(){},beforeClose:function(){},close:function(){},animateOpen:{opacity:"show"},animateClose:{opacity:"hide"}},notifications:[],element:null,interval:null,create:function(t,i){var i=e.extend({},this.defaults,i);i.speed!==void 0&&(i.openDuration=i.speed,i.closeDuration=i.speed),this.notifications.push({message:t,options:i}),i.log.apply(this.element,[this.element,t,i])},render:function(t){var i=this,o=t.message,n=t.options;n.themeState=""==n.themeState?"":"ui-state-"+n.themeState;var t=e("<div/>").addClass("jGrowl-notification "+n.themeState+" ui-corner-all"+(void 0!=n.group&&""!=n.group?" "+n.group:"")).append(e("<div/>").addClass("jGrowl-close").html(n.closeTemplate)).append(e("<div/>").addClass("jGrowl-header").html(n.header)).append(e("<div/>").addClass("jGrowl-message").html(o)).data("jGrowl",n).addClass(n.theme).children("div.jGrowl-close").bind("click.jGrowl",function(){e(this).parent().trigger("jGrowl.beforeClose")}).parent();e(t).bind("mouseover.jGrowl",function(){e("div.jGrowl-notification",i.element).data("jGrowl.pause",!0)}).bind("mouseout.jGrowl",function(){e("div.jGrowl-notification",i.element).data("jGrowl.pause",!1)}).bind("jGrowl.beforeOpen",function(){n.beforeOpen.apply(t,[t,o,n,i.element])!==!1&&e(this).trigger("jGrowl.open")}).bind("jGrowl.open",function(){n.open.apply(t,[t,o,n,i.element])!==!1&&("after"==n.glue?e("div.jGrowl-notification:last",i.element).after(t):e("div.jGrowl-notification:first",i.element).before(t),e(this).animate(n.animateOpen,n.openDuration,n.easing,function(){e.support.opacity===!1&&this.style.removeAttribute("filter"),null!==e(this).data("jGrowl")&&(e(this).data("jGrowl").created=new Date),e(this).trigger("jGrowl.afterOpen")}))}).bind("jGrowl.afterOpen",function(){n.afterOpen.apply(t,[t,o,n,i.element])}).bind("jGrowl.beforeClose",function(){n.beforeClose.apply(t,[t,o,n,i.element])!==!1&&e(this).trigger("jGrowl.close")}).bind("jGrowl.close",function(){e(this).data("jGrowl.pause",!0),e(this).animate(n.animateClose,n.closeDuration,n.easing,function(){e.isFunction(n.close)?n.close.apply(t,[t,o,n,i.element])!==!1&&e(this).remove():e(this).remove()})}).trigger("jGrowl.beforeOpen"),""!=n.corners&&void 0!=e.fn.corner&&e(t).corner(n.corners),e("div.jGrowl-notification:parent",i.element).size()>1&&0==e("div.jGrowl-closer",i.element).size()&&this.defaults.closer!==!1&&e(this.defaults.closerTemplate).addClass("jGrowl-closer "+this.defaults.themeState+" ui-corner-all").addClass(this.defaults.theme).appendTo(i.element).animate(this.defaults.animateOpen,this.defaults.speed,this.defaults.easing).bind("click.jGrowl",function(){e(this).siblings().trigger("jGrowl.beforeClose"),e.isFunction(i.defaults.closer)&&i.defaults.closer.apply(e(this).parent()[0],[e(this).parent()[0]])})},update:function(){e(this.element).find("div.jGrowl-notification:parent").each(function(){void 0!=e(this).data("jGrowl")&&void 0!==e(this).data("jGrowl").created&&e(this).data("jGrowl").created.getTime()+parseInt(e(this).data("jGrowl").life)<(new Date).getTime()&&e(this).data("jGrowl").sticky!==!0&&(void 0==e(this).data("jGrowl.pause")||e(this).data("jGrowl.pause")!==!0)&&e(this).trigger("jGrowl.beforeClose")}),this.notifications.length>0&&(0==this.defaults.pool||e(this.element).find("div.jGrowl-notification:parent").size()<this.defaults.pool)&&this.render(this.notifications.shift()),2>e(this.element).find("div.jGrowl-notification:parent").size()&&e(this.element).find("div.jGrowl-closer").animate(this.defaults.animateClose,this.defaults.speed,this.defaults.easing,function(){e(this).remove()})},startup:function(i){this.element=e(i).addClass("jGrowl").append('<div class="jGrowl-notification"></div>'),this.interval=setInterval(function(){e(i).data("jGrowl.instance").update()},parseInt(this.defaults.check)),t&&e(this.element).addClass("ie6")},shutdown:function(){e(this.element).removeClass("jGrowl").find("div.jGrowl-notification").trigger("jGrowl.close").parent().empty(),clearInterval(this.interval)},close:function(){e(this.element).find("div.jGrowl-notification").each(function(){e(this).trigger("jGrowl.beforeClose")})}}),e.jGrowl.defaults=e.fn.jGrowl.prototype.defaults}(jQuery);

common.showMessage = function(msg, opt) {
	var opts = {life: 10000};
	if (opt && $.isPlainObject(opt)) {
		$.extend(true, opts, opt);
	} else {		
		if (opt && 'warn' === opt) {
			opts.theme = 'warning';
		}
	}
	$.jGrowl(msg, opts);
}

common.loading = function(msg) {
	//TODO
};

common.unloading = function() {
	//TODO
};


/*
 * bootbox defaults
 */
/*bootbox.setDefaults({
	*//**
	* @optional String
	* @default: en
	* which locale settings to use to translate the three
	* standard button labels: OK, CONFIRM, CANCEL
	*//*
	locale: "zh_CN",
	*//**
	* @optional Boolean
	* @default: true
	* whether the dialog should be shown immediately
	*//*
	show: true,
	*//**
	* @optional Boolean
	* @default: true
	* whether the dialog should be have a backdrop or not
	*//*
	backdrop: true,
	*//**
	* @optional Boolean
	* @default: true
	* show a close button
	*//*
	closeButton: true,
	*//**
	* @optional Boolean
	* @default: true
	* animate the dialog in and out (not supported in < IE 10)
	*//*
	animate: true,
	*//**
	* @optional String
	* @default: null
	* an additional class to apply to the dialog wrapper
	*//*
	className: "my-modal"
});*/

common.confirm = function(title, message, callback) {
	$('body').modalmanager('loading');
	
	var baseOptions = {
		   title: '<span class="glyphicon glyphicon-alert"></span> 请确认!',
		 message: '',
			size: '',
			 ok: function(){},
		okClass: 'btn-primary btn-addstyle',
		 cancel: function(){},
		cancelClass: 'btn-default btn-stylecancel',
	};
	
	if( arguments.length == 1 && $.isPlainObject(arguments[0]) ) {
		$.extend(true, baseOptions, arguments[0]);
	} else {
		baseOptions.ok = callback;
		baseOptions.title = title;
		baseOptions.message = message;
	}
	
	var options = {
		buttons: {
	      
          cancel: {
                label: "取消",
            className: baseOptions.cancelClass,
             callback: baseOptions.cancel
          },
          ok: {
	          label: "确定",
	          className: baseOptions.okClass,
	          callback: baseOptions.ok
	      }
        }
	};
	$.extend(true, options, baseOptions);
	
    return bootbox.dialog(options);
};

common.alert = function() {
	//common.log(arguments);
	$('body').modalmanager('loading');
	bootbox.alert(arguments[0]);
};

common.custalert = function(title, message, callback) {
	$('body').modalmanager('loading');
	
	var baseOptions = {
			   title: '<span class="glyphicon glyphicon-alert"></span> 请确认!',
			 message: '',
				size: '',
				 ok: function(){},
			okClass: 'btn-primary btn-addstyle'
		};
	
	if( arguments.length == 1 && $.isPlainObject(arguments[0]) ) {
		bootbox.alert(arguments[0]);
	}else{
		baseOptions.ok = callback;
		baseOptions.title = '<span class="glyphicon glyphicon-alert"></span> ' + title;
		baseOptions.message = message;
	}
	var options = {
			buttons: {
	          ok: {
	                label: "确定",
	            className: baseOptions.okClass,
	             callback: baseOptions.ok
	          }
	        }
		};
	$.extend(true, options, baseOptions);
	 return bootbox.dialog(options);
};
/**
 * 转换源字符串中的换行符.
 * 
 * @param dir 转换方向 
 * 	'b-n': <br> 转换成 \n
 * 	'n-b': \n 转换成 <br>
 */
common.convertbr = function(src, dir) {
	var regx, rep;
	dir = dir ? dir : 'n-b';
	if ('n-b' ===  dir) {
		regx = /\n/g;
		rep = '<br>';
	} else {
		regx = /<br>/g;
		rep = '\n';
	}
	return src.replace(regx, rep);
};

/*
 * 为页面元素增加 disabled 属性.
 */
common.disabled = function(dom) {
	$(dom).attr({disabled: true});
	$(dom).addClass("disabled");
};

/*
 * 取消页面元素的 disabled 属性.
 */
common.enabled = function(dom) {
	$(dom).removeAttr("disabled");
	$(dom).removeClass("disabled");
};
/**
 * 查看计划单详情
 */
common.showInviteReq =  function(className){
	$(className).click(function() {
		$('#inviteReq-view').loadModal(ctx+'/member/invite/view/?ajax', {
			id : $(this).attr("data-id")
		});
	});
};
/**
查看需求详情
*/
common.showRequirement =  function(className){
	$(className).click(function() {
	$('#requirement-view').loadModal(ctx+'/member/req/deal/view/?ajax', {
		id : $(this).attr("data-id")
	});
	});
};

common.showRequirementNow =  function(className, parent){
	$(className).click(function() {
		$('#requirement-view').loadModalNow(ctx+'/member/req/deal/view/?ajax', {
			id : $(this).attr("data-id")
		}, parent);
	});
};

/**
查看媒体详情
*/
common.showMedia =  function(className){
	$(className).click(function() {
		$('#media-view').loadModal(ctx+'/member/media/view/?ajax', {
			id : $(this).attr("data-id")
		});
	});
};

common.showMediaNow =  function(className, parent){
	$(className).click(function() {
		$('#media-view').loadModalNow(ctx+'/member/media/view/?ajax', {
			id : $(this).attr("data-id")
		}, parent);
	});
};

/*
 * jquery插件方法：
 * 模板文本格式化方法.
 * 定义模板的方法:
 * <script type="text/template" id="sample">
 * <li>{foo}-{bar}</li>
 * </script>
 * 例如: 
 * var data = {foo: 'hello', bar: 'world'};
 * var html = $('#sample').format(data);// html = '<li>hello-world</li>'
 * 
 */
(function($) {
	$.fn.format = function(data, options) {
		var format = {
			name: function(x) {
				return x;
			}
		};
		if( options ) {		
			$.extend(format, options);
		}
		return this.html().replace(/{(\w+)}/g, function(m1, m2) {
	        if (!m2)  
	            return '';  
	        return (format && format[m2]) ? format[m2](data[m2]) : data[m2];
	    });
	}
})(jQuery);

/*
 * jquery插件方法： 
 * ajax 加载对话框
 * 
 * */
(function($) {
	$.fn.loadModal = function(url, data, callback) {
		var $modal = this;
		$('body').modalmanager('loading');
		setTimeout(
			function() {
				$modal.load(url, data, function() {
					if( callback && $.isFunction(callback) ) {				
						callback();
					}
					$modal.modal('show');
				});
			}, 100);
	}
})(jQuery);
/*
 * jquery插件方法： 
 * ajax 加载对话框无延迟（用于加载完后的弹窗中再次弹出）
 * 
 * */
(function($) {
	$.fn.loadModalNow = function(url, data, parent, callback) {
		var $modalNow = this;
		$modalNow.load(url, data, function() {
			if( callback && $.isFunction(callback) ) {				
				callback();
			}
			$modalNow.modal({backdrop: 'static'});
			$modalNow.on('hide.bs.modal', function () {
				parent.modal('show');
			});
		});
	}
})(jQuery);

/* 显示对话框　*/
(function($) {
	$.fn.showModal = function() {
		$('body').modalmanager('loading');
		var $modal = this;
		setTimeout(function() {
			$modal.modal('show');
			}, 100);
	}
})(jQuery);

/* 关闭对话框　*/
(function($) {
	$.fn.hideModal = function() {
		this.modal('hide');
	}
})(jQuery);

/* 使　spinner 兼容 bootstrap3+*/
/*$.fn.modal.defaults.spinner = $.fn.modalmanager.defaults.spinner = 
    '<div class="loading-spinner" style="width: 200px; margin-left: -100px;">' +
        '<div class="progress progress-striped active">' +
            '<div class="progress-bar" style="width: 100%;"></div>' +
        '</div>' +
    '</div>';*/
/*$.fn.modalmanager.defaults.resize = true;*/

common.modalLoading = function() {
	$('body').modalmanager('loading');
};

/*
 * 为String类添加模板文本格式化原型方法.
 * @data 必须是纯object。
 * @options 可选项，可定义格式化方法。
 * 
 * 使用方法，例如: 
 * var temp = "Hello {foo}, I am {bar}!";
 * var data = {foo: "jack", bar: "jean"};
 * temp = temp.format(data);// temp = "Hello jack, I am jean!";
 */
String.prototype.format = function(data, options) {
	var format = {};
	if( options ) {
		$.extend(format, options);
	}
	return this.replace(/{(\w+)}/g, function(m1, m2) {
        if (!m2)  
            return '';  
        return (format[m2]) ? format[m2](data[m2]) : data[m2];
    });
};

/**
 * select-modal 插件
 * 用法：$(selector).selectModal();
 */
!function($) {
	
	var fieldTemp = ''
	    + '<div class="input-group">'
		+ '   <input type="text" class="form-control" value="" readonly="readonly" />'
		+ '    <span class="input-group-btn">'
		+ '        <button type="button" class="btn btn-default"><i class="fa fa-chevron-down"></i></button>'
		+ '    </span>'
		+ '</div>';
		
	var modalTemp = '<div class="modal fade" tabindex="-1" role="dialog" data-backdrop="static"></div>';
	
	var headerTemp = ''
			+ ' <div class="modal-header">'
			+ ' 	<button type="button" class="close" data-dismiss="modal" aria-label="Close"></button>'
			+ ' 	<h4 class="modal-title">请选择</h4>'
			+ ' </div>	';
		
	var bodyTemp = ''
			+'<div class="modal-body">'
			+' 	<div class="multiple fit-width">'
			+'      <ul class="list-inline"></ul>'
			+'  </div>'
			+'</div>';
			
	var footerTemp = ''
			+ '<div class="modal-footer"> '
			+ '    <button type="button" class="formbtn formbtnblue ok">确定</button>'
			+ '    <button type="button" class="formbtn" data-dismiss="modal">取消</button>'
			+ '</div>';
	
	var li = '<li><label class="{type}-inline"><input type="{type}" name="item" value="{value}" />{label}</label></li>';
	
	var SelectModal = function(element, options) {
		this.init(element, options)
	};
	
	var p = 'placeholder';
	var c = 'checked';
	var d = 'disabled';
	var multChoose = ' <small class="color-blue">(可多选)</small>';
	
	var defaults = {
		width: 640,
		clazz: 'multiple-md'
	};
	
	SelectModal.prototype = {
		constructor: SelectModal,
		init: function(element, options) {
			this.$element = $(element);
			
			this.settings = $.extend({}, defaults, options);
			var width = this.$element.data('width');
			if( width ) this.settings.width = width;
			var clazz = this.$element.data('class');
			if( clazz ) this.settings.clazz = clazz;
			
			this.id = (this.$element.attr('id') ? this.$element.attr('id') : this.$element.attr('name'));
			this.placeholder = this.$element.data(p) ? this.$element.data(p) : '请选择...';
			this.title = this.$element.data('title') ? this.$element.data('title') : '';
			this.multiple = this.$element.attr('multiple') ? true : false;
			this.setField();
		},
		initItems: function() {
			var that = this;
			this.map = {};
			this.items = [];
			this.selectedItems = [];
			this.$element.find('option').each(function() {
				var opt = {value: this.value, label: this.text || this.label};
				that.items.push(opt);
				that.map[opt.value] = opt;
				if( this.selected ) {
					that.selectedItems.push(opt);
				}
			});
		},
		setField: function() {
			this.$element.addClass('hide');
			this.initItems();
			this.$field = $(fieldTemp);
	
			var $input = this.$field.find('input');
			$input.val(this.getSelectedLabels());
			$input.attr(p, this.placeholder);
			$input.attr('name', this.id + '-input');
			this.$element.after(this.$field);
			
			var that = this;
			this.$field.click(function() {
				that.show();
			});
		},
		getSelectedLabels: function() {
			var labels = [];
			if( this.selectedItems.length > 0 ) {
				for( var i in this.selectedItems ) {
					labels.push(this.selectedItems[i].label);
				}
			}
			return labels.join(', ');
		},
		checked: function(option) {
			for( var i in this.selectedItems ) {
				if(this.selectedItems[i].value == option.value)
					return true;
			}
			return false;
		},
		setSelected: function() {
			var that = this;
			this.$element.find('option').each(function() {
				if(that.checked(this))
					this.selected = true;
				else
					this.selected = false;
			});
			this.$field.find('input').val(this.getSelectedLabels());
		},
		clickAll: function(input) {
			var $li = $(input).closest('li');
			var checked = input.checked;
			$li.siblings('li').each(function() {
				$(this).removeClass(c);
				if ( checked )
					$(this).find('input').removeAttr(c).attr(d, d);
				else
					$(this).find('input').removeAttr(d);
			});
		},
		show: function() {
			this.initItems();
			var mid = this.id + '-select-modal';
			var $modal = $('#' + mid);
			if( $modal.length == 0 ) {
				$modal = $(modalTemp);
				$modal.attr('id', mid);
				$modal.data('width', this.settings.width);
				
				var $header = $(headerTemp);
				$header.find('.modal-title').html(this.title+ multChoose);
				$modal.append($header);
				
				var that = this;
				var $body = $(bodyTemp);
				$body.find('.multiple').addClass(this.settings.clazz);
				$body.find('ul').delegate('li input', 'click', function() {
					var $li = $(this).closest('li');
					var checked = this.checked;
					if ( $(this).attr('type') == 'radio' ) {
						$li.siblings('li').removeClass(c);
					} else if( this.value == 'ALL' ) {
						that.clickAll(this);
					}
					$li.toggleClass(c, this.checked);
				});
				$modal.append($body);
				
				var $footer = $(footerTemp);
				var that = this;
				//点击确定事件
				$footer.find('button.ok').click(function() {
					that.selectedItems = [];
					$body.find('input').each(function(){
						if(this.checked) {
							that.selectedItems.push(that.map[this.value]);
						}
					});
					
					that.setSelected();
					$modal.hideModal();
					that.$element.click();
				});
				
				$modal.append($footer);
				$('body').append($modal);
			}
			
			var $ul = $modal.find('.modal-body ul').empty();
			var checkAll = false;
			for(var i in this.items) {
				var o = this.items[i];
				if ( this.multiple ) {
					o.type = 'checkbox';
				} else {
					o.type = 'radio';
				}
				var $li = $(li.format(o));
				if ( this.checked(o) ) {
					$li.addClass(c);
					$li.find('input').attr(c, c);
					if( 'ALL' == o.value ) {
						checkAll = true;
					}
				}
				if( checkAll && 'ALL' != o.value ) {
					$li.find('input').attr(d, d);
				}
				$ul.append($li);
			}
			
			$modal.showModal();
		}
	};
	
	$.fn.selectModal = function(options) {
		this.each(function() {
			var modal = $(this).data('modal');
			if( modal == null ) {
				modal = new SelectModal(this, options);
				$(this).data('modal', modal);
			}
		});
	};
}(window.jQuery);

/**
 * region-modal 插件
 * 用法：$(selector).regionModal();
 */
!function($) {
	
	var modalTemp = '<div class="modal fade regions-modal" data-width="800"></div>';

	var fieldTemp = ''
	    + '<div class="input-group">'
		+ '   <input type="text" class="form-control" value="" readonly="readonly" />'
		+ '    <span class="input-group-btn">'
		+ '        <button type="button" class="btn btn-default"><i class="fa fa-chevron-down"></i></button>'
		+ '    </span>'
		+ '</div>';
	
	var option = '<option value="{value}" selected="selected">{label}</option>';
	var button = '<button type="button" class="btn-u btn-u-sm btn-u-orange" data-value="{value}">{label}<i class="fa fa-times"></i></button>';
	
	var p = 'placeholder';
	var m = 'multiple';
	var c = 'checked ';
	var d = 'disabled';
	
	var defaults = {};
	
	var RegionModal = function(element, options) {
		this.$modal = null;
		this.loaded = false;
		this.checkedMap = {};
		this.init(element, options);
	};
	
	RegionModal.prototype = {
		constructor: RegionModal,
		init: function(element, options) {
			this.$element = $(element);
			if ( !this.$element[0].multiple ) {
				this.$element.attr(m, m);
			}
			this.settings = $.extend({}, defaults, options);
			this.id = (this.$element.attr('id') ? this.$element.attr('id') : this.$element.attr('name'));
			this.placeholder = this.$element.data(p) ? this.$element.data(p) : '请选择...';
			
			this.initItems();
			this.setField();
		},
		
		initItems: function() {
			this.checkedMap = {};
			var that = this;
			this.$element.find('option').each(function() {
				var opt = {value: this.value, label: this.innerHTML};
				if( this.selected ) {
					that.checkedMap[opt.value] = opt;
				}
			});
		},
		setField: function() {
			this.$element.addClass('hide');
			
			this.$field = $(fieldTemp);
			var $input = this.$field.find('input');
			$input.val(this.getSelectedLabels());
			$input.attr(p, this.placeholder);
			$input.attr('name', this.id + '-input');
			this.$element.after(this.$field);
			
			var that = this;
			this.$field.click(function() {
				that.show();
			});
		},
		getSelectedLabels: function() {
			var labels = [];
			for( var i in this.checkedMap ) {
				labels.push(this.checkedMap[i].label);
			}
			return labels.join(', ');
		},
		setSelected: function() { //设置隐藏的select元素的option选项
			this.$element.empty();
			for( var i in this.checkedMap ) {
				this.$element.append(option.format(this.checkedMap[i]));
			}
			this.$field.find('input').val(this.getSelectedLabels());
		},
		isSelected: function(value) {
			//common.log(value + ' -> ' + this.checkedMap[value]);
			return this.checkedMap[value];
		},
		initStatus: function() { //初始化地区的选中状态
			
			this.$modal.find('.multiple-results button').remove();
			
			var that = this;
			this.$modal.find('li input').each(function() {
				var $li = $(this).closest('li');
				var value = $(this).val();
				if ( that.isSelected(value) ) {
					$li.addClass(c);
					this.checked = true;
					that.checked(this);
					return false;
				} else {
					$li.removeClass(c);
					$(this).removeAttr(c).removeAttr(d);
				}
			});
			
			this.flushResults();
		},
		flushResults: function() { //刷新选中结果
			var $results = this.$modal.find('.multiple-results');
			$results.find('button').remove();
			for( var i in this.checkedMap ) {
				$results.append(button.format(this.checkedMap[i]));
			}
			this.$modal.modal('layout');
		},
		checked: function(input) { // 选中地区
			var $input = $(input);
			var $li = $input.closest('li');
			var $this = this;
			var o = {value: $input.val(), label: $input.data('label')};
			if( 'ALL' == o.value ) { //全国
				for(var i in this.checkedMap ) {
					delete this.checkedMap[i];
				}
				this.$modal.find('li:has(input)').not($li[0]).each(function() {
					$(this).removeClass(c);
					$(this).find('input').removeAttr(c).attr(d, d);
				});
			} else if( $li.hasClass('regionsbor') ) { //选择大区
				var that = this;
				var $index=$li.index();
				$('.tab-content .tab-pane').eq($index).find('li').each(function() {
					var input = $(this).find('input');
					delete that.checkedMap[input.val()];
					input.removeAttr(c).attr(d, d);
					$(this).removeClass(c);
					//选择省份后，禁用热门城市中该省的城市
					$this.$modal.find('.list-inline:eq(0) li').each(function(){
						if(input.val()==$(this).find('input').val()){
							$(this).find('input')[0].checked =false;
							$(this).find('input').attr(d,d);
							$(this).removeClass(c);
						}
					});
				});
			} else if( $li.hasClass('header') ) { //选择省份，禁用该省的城市
				var that = this;
				$li.siblings('li.city-' + o.value).each(function() {
					var input = $(this).find('input');
					delete that.checkedMap[input.val()];
					input.removeAttr(c).attr(d, d);
					$(this).removeClass(c);
					//选择省份后，禁用热门城市中该省的城市
					$this.$modal.find('.list-inline:eq(0) li').each(function(){
						if(input.val()==$(this).find('input').val()){
							$(this).find('input')[0].checked =false;
							$(this).find('input').attr(d,d);
							$(this).removeClass(c);
						}
					});
				});
			}
			//选中地区后遍历modle，相同地市也勾选
			$this.$modal.find('li:has(input)').not($li[0]).each(function() {
				if($(this).find('input').val()==$input.val()){
					$(this).find('input')[0].checked =true;
					$(this).addClass(c);
				}
			});
			this.checkedMap[o.value] = o;
			this.flushResults();
		},
		unchecked: function(input) { //取消选中地区
			var value = $(input).val();
			var $li = $(input).closest('li');
			var $this = this;
			delete this.checkedMap[value];
			if( 'ALL' == value) { //全国
				this.$modal.find('li:has(input)').not($li[0]).each(function() {
					$(this).find('input').removeAttr(d);
				});
			} else if( $li.is('.regionsbor') ) {//大区
				var $index=$li.index();
				$('.tab-content .tab-pane').eq($index).find('li').each(function() {
					var input = $(this).find('input');
					$(this).find('input').removeAttr(d);
					//取消选择省份后，去除热门中该省的城市的禁用
					$this.$modal.find('.list-inline:eq(0) li').each(function(){
						if(input.val()==$(this).find('input').val()){
							$(this).find('input').removeAttr(d);
						}
					});
				});
			} else if( $li.is('.header') ) {//省
				$li.siblings('li.city-' + value).each(function() {
					var input = $(this).find('input');
					$(this).find('input').removeAttr(d);
					//取消选择省份后，去除热门中该省的城市的禁用
					$this.$modal.find('.list-inline:eq(0) li').each(function(){
						if(input.val()==$(this).find('input').val()){
							$(this).find('input').removeAttr(d);
						}
					});
				});
			}
			//取消选择地区后遍历modle，相同地市去掉勾选
			$this.$modal.find('li:has(input)').not($li[0]).each(function() {
				if($(this).find('input').val()==value){
					$(this).find('input')[0].checked =false;
					$(this).removeClass(c);
				}
			});
			this.flushResults();
		},
		delegate: function() {
			var that = this;
			//点击地区
			this.$modal.delegate('li input', 'click', function() {
				$(this).closest('li').toggleClass(c, this.checked);
				if( this.checked ) {
					that.checked(this);
				} else {
					that.unchecked(this);
				}
			});
			//点击"已选择"的地区按钮
			this.$modal.delegate('.multiple-results button', 'click', function() {
				var value = $(this).data('value');
				$(this).remove();
				
				that.$modal.find('li input').each(function() {
					var $input = $(this);
					if( $input.val() == value) {
						$input.closest('li').removeClass(c);
						$input.removeAttr(c);
						that.unchecked(this);
					}
				});
			});
			//确定
			this.$modal.delegate('button#btn-ok', 'click', function() {
				that.setSelected();
				that.$element.trigger('click');
				that.$modal.hideModal();
			});
		},
		initModal: function($modal) {
			var mid = this.id + '-regions-modal';
			$modal.attr('id', mid);
			$('body').append($modal);
			this.$modal = $modal;
			this.delegate();
		},
		show: function() {
			this.initItems();
			
			if( this.$modal == null ) {
				var modal = $('.regions-modal');
				if ( modal.length == 0 ) {
					modal = $(modalTemp);
					this.initModal(modal);
					var that = this;
					this.$modal.loadModal(ctx + '/common/selectRegionsModal?ajax', null, function() {
						that.initStatus();
					});
				} else {
					modal = modal.clone();
					this.initModal(modal);
					this.initStatus();
					this.$modal.showModal();
				}
			} else {
				this.initStatus();
				this.$modal.showModal();
			}
		}
	};
	
	$.fn.regionModal = function(options) {
		this.each(function() {
			var modal = $(this).data('modal');
			if( modal == null ) {
				modal = new RegionModal(this, options);
				$(this).data('modal', modal);
			}
		});
	};
}(window.jQuery);

/**
 * radio-region-modal 插件
 * 用法：$(selector).radioRegionModal();
 */
!function($) {
	
	var modalTemp = '<div class="modal fade regions-modal" data-width="800"></div>';
	
	var fieldTemp = ''
		+ '<a href="javascript:void(0)" id="more" data-value="">更多<i class="fa fa-caret-down"></i></a>';
	
	var button = '<button type="button" class="btn-u btn-u-sm btn-u-orange" data-value="{value}">{label}<i class="fa fa-times"></i></button>';
	var activeClose='<i class="fa fa-close activeClose"></i>';
	var p = 'placeholder';
	var m = 'multiple';
	var c = 'selected';
	var d = 'disabled';
	
	var defaults = {};
	
	var RegionModal = function(element, options) {
		this.$modal = null;
		this.loaded = false;
		this.checkedMap = {};
		this.init(element, options);
	};
	
	RegionModal.prototype = {
		constructor: RegionModal,
		init: function(element, options) {
			this.$element = $(element);
			this.settings = $.extend({}, defaults, options);
			this.id = (this.$element.attr('id') ? this.$element.attr('id') : this.$element.attr('name'));
			
			this.initItems();
			this.setField();
		},
		
		
		initItems: function() {
			this.checkedValue = null;
			var that = this;
			var ck = this.$element.find('a');
			if (ck != null) {
				var opt = {value: ck.data('value'), label: ck.val()};
				that.checkedValue = opt;
			}
		},
		setField: function() {
			this.$element.addClass('hide');
			this.$field = $(fieldTemp);
			this.$element.after(this.$field);
			var that = this;
			this.$field.click(function() {
				that.show();
			});
		},
		
		setSelected: function() { //设置隐藏的select元素的option选项
			this.$element.empty();
			this.$element.parent().find('.add').remove();
			for( var i in this.checkedMap ) {
				var $dataValue = this.checkedMap[i].value;
				var $dataLabel = this.checkedMap[i].label;
				if ($dataValue != null && (typeof $dataValue) != 'undefined' && 
						$dataLabel != null && (typeof $dataLabel) != 'undefined') {
					var mediaTab = this.$element.data('tab') + 'Regions';
					//alert(mediaTab);
					var stats = false;
					this.$element.parent().children('a').each(function(index,element){
						var vas = $(element).data('value');
						if (vas == $dataValue) {
							if (!$(element).hasClass('active')) {								
								$(element).click();
							}
							stats = true;
							return false;
						}
					});
					if (stats) {
						continue;
					}
					var a = $('<a href="javascript:void(0)" class="media regions" data-value="'+ $dataValue + '">' + $dataLabel + '</a>');
					this.$element.before(a);
					a.click();
				}
			}
		},
		isSelected: function(value) {
			//common.log(value + ' -> ' + this.checkedMap[value]);
			return this.checkedMap[value];
		},
		
		
		initStatus: function() { //初始化地区的选中状态
			var that = this;
			this.$modal.find('li a').each(function() {
				var $li = $(this).closest('li');
				var value = $(this).data("value");
				$li.removeClass(c);
				if ( that.isSelected(value) ) {
					$li.addClass(c);
					this.checkedValue = true;
					if( 'ALL' == value ) { //全国
						that.checked(this);
						return false;
					}
				} else {
					$li.removeClass(c);
					$(this).removeAttr(c).removeAttr(d);
				}
			});
			
			this.flushResults();
		},
		flushResults: function() { //刷新选中结果
			this.$modal.modal('layout');
		},
		checked: function(input) { // 选中地区
			var $input = $(input);
			var $li = $input.closest('li');
			var $this = this;
			var o = {value: $input.val(), label: $input.data('label')};
			if( 'ALL' == o.value ) { //全国
				for(var i in this.checkedMap ) {
					delete this.checkedMap[i];
				}
				this.$modal.find('li:has(input)').not($li[0]).each(function() {
					$(this).removeClass(c);
					$(this).find('input').removeAttr(c).attr(d, d);
				});
			} else if( $li.hasClass('regionsbor') ) { //选择大区
				var that = this;
				var $index=$li.index();
				$('.regions-modal .tab-content .tab-pane').eq($index).find('li').each(function() {
					var input = $(this).find('input');
					delete that.checkedMap[input.val()];
					input.removeAttr(c).attr(d, d);
					$(this).removeClass(c);
					//选择省份后，禁用热门城市中该省的城市
					$this.$modal.find('.list-inline:eq(0) li').each(function(){
						/*if(input.val()==$(this).find('input').val()){
							$(this).find('input')[0].checked =false;
							$(this).find('input').attr(d,d);
							$(this).removeClass(c);
						}*/
						$li.siblings('li.city-' + o.value).each(function() {
							var input = $(this).find('input');
							delete that.checkedMap[input.val()];
							input.removeAttr(c).attr(d, d);
							$(this).removeClass(c);
							//选择省份后，禁用热门城市中该省的城市
							$this.$modal.find('.list-inline:eq(0) li').each(function(){
								if(input.val()==$(this).find('input').val()){
									$(this).find('input')[0].checked =false;
									$(this).find('input').attr(d,d);
									$(this).removeClass(c);
								}
							});
						});
					});
				});
			}else if( $li.hasClass('header') ) { //选择省份，禁用该省的城市
				var that = this;
				$li.siblings('li.city-' + o.value).each(function() {
					var input = $(this).find('input');
					delete that.checkedMap[input.val()];
					input.removeAttr(c).attr(d, d);
					$(this).removeClass(c);
					//选择省份后，禁用热门城市中该省的城市
					$this.$modal.find('.list-inline:eq(0) li').each(function(){
						if(input.val()==$(this).find('input').val()){
							$(this).find('input')[0].checked =false;
							$(this).find('input').attr(d,d);
							$(this).removeClass(c);
						}
					});
				});
			}
			//选中地区后遍历modle，相同地市也勾选
			$this.$modal.find('li:has(input)').not($li[0]).each(function() {
				if($(this).find('input').val()==$input.val()){
					$(this).find('input')[0].checked =true;
					$(this).addClass(c);
				}
			});
			this.checkedMap[o.value] = o;
			this.flushResults();
		},
		unchecked: function(input) { //取消选中地区
			var value = $(input).val();
			var $li = $(input).closest('li');
			var $this = this;
			delete this.checkedMap[value];
			if( 'ALL' == value) { //全国
				this.$modal.find('li:has(input)').not($li[0]).each(function() {
					$(this).find('input').removeAttr(d);
				});
			} else if( $li.hasClass('regionsbor') ) {//大区
				var $index=$li.index();
				$('.regions-modal .tab-content .tab-pane').eq($index).find('li').each(function() {
					var input = $(this).find('input');
					$(this).find('input').removeAttr(d);
					//取消选择省份后，去除热门中该省的城市的禁用
					$this.$modal.find('.list-inline:eq(0) li').each(function(){
						if(input.val()==$(this).find('input').val()){
							$(this).find('input').removeAttr(d);
						}
					});
				});
			}else if( $li.hasClass('header') ) {
				$li.siblings('li.city-' + value).each(function() {
					var input = $(this).find('input');
					$(this).find('input').removeAttr(d);
					//取消选择省份后，去除热门中该省的城市的禁用
					$this.$modal.find('.list-inline:eq(0) li').each(function(){
						if(input.val()==$(this).find('input').val()){
							$(this).find('input').removeAttr(d);
						}
					});
				});
			}
			//取消选择地区后遍历modle，相同地市去掉勾选
			$this.$modal.find('li:has(input)').not($li[0]).each(function() {
				if($(this).find('input').val()==value){
					$(this).find('input')[0].checked =false;
					$(this).removeClass(c);
				}
			});
			this.flushResults();
		},
		delegate: function() {
			var that = this;
			//点击地区
			this.$modal.delegate('li input', 'click', function() {
				$(this).closest('li').toggleClass(c, this.checked);
				if( this.checked ) {
					that.checked(this);
				} else {
					that.unchecked(this);
				}
			});
			
			
			//确定
			this.$modal.delegate('button#btn-ok', 'click', function() {
				that.setSelected();
				that.$element.trigger('click');
				that.$modal.hideModal();
			});
		},
		initModal: function($modal) {
			var mid = this.id + '-regions-modal';
			$modal.attr('id', mid);
			$('body').append($modal);
			this.$modal = $modal;
			this.delegate();
		},
		show: function() {
			this.initItems();
			
			if( this.$modal == null ) {
				var modal = $('.regions-modal');
				if ( modal.length == 0 ) {
					modal = $(modalTemp);
					this.initModal(modal);
					var that = this;
					this.$modal.loadModal(ctx + '/common/selectRegionModal?ajax', null, function() {
						that.initStatus();
					});
				} else {
					modal = modal.clone();
					this.initModal(modal);
					this.initStatus();
					this.$modal.showModal();
				}
			} else {
				this.initStatus();
				this.$modal.showModal();
			}
		}
	};
	
	$.fn.radioRegionModal = function(options) {
		this.each(function() {
			var modal = $(this).data('modal');
			if( modal == null ) {
				modal = new RegionModal(this, options);
				$(this).data('modal', modal);
			}
		});
	};
}(window.jQuery);

/** 
 * 创建Map前端对象
 * @author wang.xiaoxiang
 * 用于实现页面 Map 对象，Key只能是String，对象随意 
 */  

var Map = function(){  
    this._entrys = new Array();  
      
    this.getIndex=function(key){  
        if (key == null || key == undefined) {  
            return -1;  
        }  
        var _length = this._entrys.length;  
        for (var i = 0; i < _length; i++) {  
            var entry = this._entrys[i];  
            if (entry == null || entry == undefined) {  
                continue;  
            }  
            if (entry.key === key) {//equal  
                return i;  
            }  
        }  
        return -1;  
    };  
    this.put = function(key, value){  
        if (key == null || key == undefined) {  
            return;  
        }  
        var index = this.getIndex(key);  
        if (index == -1) {  
            var entry = new Object();  
            entry.key = key;  
            entry.value = value;  
            this._entrys[this._entrys.length] = entry;  
        }else{  
            this._entrys[index].value = value;  
        }          
    }; 
    this.get = function(key){  
    	if (key == null || key == undefined) {  
    		return null;
    	}
        var index = this.getIndex(key);  
        return (index != -1) ? this._entrys[index].value : null;  
    };
    this.remove = function(key){  
    	if (key != null && key != undefined) {  
    		var index = this.getIndex(key);  
    		if (index != -1) {  
    			this._entrys.splice(index, 1);  
    		}  
    	}
    };
    this.clear = function(){  
        this._entrys =new Array();  
    }; 
    this.contains = function(key){  
    	if (key == null || key == undefined) {  
    		return null;
    	}
        var index = this.getIndex(key);  
        return (index != -1) ? true : false;  
    };
    this.getCount = function(){  
        return this._entrys.length;  
    };
    this.getEntrys =  function(){  
        return this._entrys;  
    };
}; 

var MATCHING_EQ = 0;
var MATCHING_NE = 1;
var MATCHING_GT = 2;
var MATCHING_GE = 3;
var MATCHING_LT = 4;
var MATCHING_LE = 5;
var MATCHING_LIKE = 6;
var MATCHING_IN = 13;
var MATCHING_AND = 14;
var MATCHING_OR = 15;


var QueryConfig = function(){
	this.offset=0;
	this.limit=0;
	this.restrictions = new Array();
	
	this.setOffset=function(offset) {
		this.offset=offset;
	};
	
	this.setLimit=function(limit) {
		this.limit = limit;
	};
	this.addRestriction=function(conditionName,conditionValue,matchingType){
		if (this.restrictions == null || this.restrictions == undefined) {
			this.restrictions = new Array();
		}
		var item = new Object();
		item.conditionName = conditionName;
		item.conditionValue = conditionValue;
		item.matchingType = matchingType;
		this.restrictions.push(item);
	};
	
};
/**
 * region-modal 插件
 * 用法：$(selector).regionsCheckModal();
 */
!function($) {
	
	var modalTemp = '<div class="modal fade regions-modal" data-width="800"></div>';

	var fieldTemp = ''
		+ '<a href="javascript:void(0);" class="color-blue" data-toggle="modal" data-target="#location">其他城市&gt;</a>';
	
	
	var button = '<button type="button" class="btn-u btn-u-sm btn-u-orange" data-value="{value}">{label}<i class="fa fa-times"></i></button>';
	
	var p = 'placeholder';
	var m = 'multiple';
	var c = 'checked ';
	var d = 'disabled';
	
	var defaults = {};
	
	var RegionsCheckModal = function(element, options) {
		this.$modal = null;
		this.loaded = false;
		this.checkedMap = {};
		this.init(element, options);
	};
	
	RegionsCheckModal.prototype = {
		constructor: RegionsCheckModal,
		init: function(element, options) {
			this.$element = $(element);
			if ( !this.$element[0].multiple ) {
				this.$element.attr(m, m);
			}
			this.settings = $.extend({}, defaults, options);
			this.id = (this.$element.attr('id') ? this.$element.attr('id') : this.$element.attr('name'));
			
			this.initItems();
			this.setField();
		},
		
		initItems: function() {
			this.checkedMap = {};
			var that = this;
			var ck = this.$element.find('a');
			if (ck != null) {
				var opt = {value: ck.data('value'), label: ck.val()};
				that.checkedValue = opt;
			};
		},
		setField: function() {
			this.$element.addClass('hide');
			
			this.$field = $(fieldTemp);
			this.$element.after(this.$field);
			
			var that = this;
			this.$field.click(function() {
				that.show();
			});
		},
		setSelected: function() { //设置隐藏的select元素的option选项
			this.$element.empty();
			this.$element.parent().find('.add').remove();
			var checked = this.$element.parent().find('#ALLRegions')[0].checked;
			for( var i in this.checkedMap ) {
				var $dataValue = this.checkedMap[i].value;
				var $dataLabel = this.checkedMap[i].label;
				if ($dataValue != null && (typeof $dataValue) != 'undefined' && 
						$dataLabel != null && (typeof $dataLabel) != 'undefined') {
					if (checked) {
						var a = $('<div class="custom-checkbox add"><input type="checkbox" disabled="disabled" name="citys" id="'+$dataValue+'" value="'+$dataLabel+'"><label for="'+$dataValue+'" class="">'+$dataLabel+'</label></div>');
						this.$element.before(a);
						a.children("input").customInput();
						$('#'+$dataValue).click();
					} else {
						var a = $('<div class="custom-checkbox add"><input type="checkbox" name="citys" id="'+$dataValue+'" value="'+$dataLabel+'"><label for="'+$dataValue+'" class="">'+$dataLabel+'</label></div>');
						this.$element.before(a);
						a.children("input").customInput();
						$('#'+$dataValue).click();
					}
				}
			}
		},
		isSelected: function(value) {
			//common.log(value + ' -> ' + this.checkedMap[value]);
			return this.checkedMap[value];
		},
		initStatus: function() { //初始化地区的选中状态
			
			var that = this;
			this.$modal.find('li input').each(function() {
				var $li = $(this).closest('li');
				var value = $(this).val();
				if ( that.isSelected(value) ) {
					$li.addClass(c);
					this.checked = true;
					if( 'ALL' == value ) { //全国
						that.checked(this);
						return false;
					}
				} else {
					$li.removeClass(c);
					$(this).removeAttr(c).removeAttr(d);
				}
			});
			
			this.flushResults();
		},
		flushResults: function() { //刷新选中结果
			this.$modal.modal('layout');
		},
		checked: function(input) { // 选中地区
			var $input = $(input);
			var $li = $input.closest('li');
			var $this = this;
			var o = {value: $input.val(), label: $input.data('label')};
			if( 'ALL' == o.value ) { //全国
				for(var i in this.checkedMap ) {
					delete this.checkedMap[i];
				}
				this.$modal.find('li:has(input)').not($li[0]).each(function() {
					$(this).removeClass(c);
					$(this).find('input').removeAttr(c).attr(d, d);
				});
			} else if( $li.hasClass('regionsbor') ) {
				 //选择大区
				var that = this;
				var $index=$li.index();
				$('.regions-modal .tab-content .tab-pane').eq($index).find('li').each(function() {
					var input = $(this).find('input');
					delete that.checkedMap[input.val()];
					input.removeAttr(c).attr(d, d);
					$(this).removeClass(c);
					//选择省份后，禁用热门城市中该省的城市
					$this.$modal.find('.list-inline:eq(0) li').each(function(){
						/*if(input.val()==$(this).find('input').val()){
							$(this).find('input')[0].checked =false;
							$(this).find('input').attr(d,d);
							$(this).removeClass(c);
						}*/
						$li.siblings('li.city-' + o.value).each(function() {
							var input = $(this).find('input');
							delete that.checkedMap[input.val()];
							input.removeAttr(c).attr(d, d);
							$(this).removeClass(c);
							//选择省份后，禁用热门城市中该省的城市
							$this.$modal.find('.list-inline:eq(0) li').each(function(){
								if(input.val()==$(this).find('input').val()){
									$(this).find('input')[0].checked =false;
									$(this).find('input').attr(d,d);
									$(this).removeClass(c);
								}
							});
						});
					});
				});
			}else if( $li.hasClass('header') ) { //选择省份，禁用该省的城市
				var that = this;
				$li.siblings('li.city-' + o.value).each(function() {
					var input = $(this).find('input');
					delete that.checkedMap[input.val()];
					input.removeAttr(c).attr(d, d);
					$(this).removeClass(c);
					//选择省份后，禁用热门城市中该省的城市
					$this.$modal.find('.list-inline:eq(0) li').each(function(){
						if(input.val()==$(this).find('input').val()){
							$(this).find('input')[0].checked =false;
							$(this).find('input').attr(d,d);
							$(this).removeClass(c);
						}
					});
				});
			}
			//选中地区后遍历modle，相同地市也勾选
			$this.$modal.find('li:has(input)').not($li[0]).each(function() {
				if($(this).find('input').val()==$input.val()){
					$(this).find('input')[0].checked =true;
					$(this).addClass(c);
				}
			});
			this.checkedMap[o.value] = o;
			this.flushResults();
		},
		unchecked: function(input) { //取消选中地区
			var value = $(input).val();
			var $li = $(input).closest('li');
			var $this = this;
			delete this.checkedMap[value];
			if( 'ALL' == value) { //全国
				this.$modal.find('li:has(input)').not($li[0]).each(function() {
					$(this).find('input').removeAttr(d);
				});
			} else if( $li.is('.regionsbor') ) {//大区
				var $index=$li.index();
				$('.tab-content .tab-pane').eq($index).find('li').each(function() {
					var input = $(this).find('input');
					$(this).find('input').removeAttr(d);
					//取消选择省份后，去除热门中该省的城市的禁用
					$this.$modal.find('.list-inline:eq(0) li').each(function(){
						if(input.val()==$(this).find('input').val()){
							$(this).find('input').removeAttr(d);
						}
					});
				});
			}else if( $li.is('.header') ) {
				$li.siblings('li.city-' + value).each(function() {
					var input = $(this).find('input');
					$(this).find('input').removeAttr(d);
					//取消选择省份后，去除热门中该省的城市的禁用
					$this.$modal.find('.list-inline:eq(0) li').each(function(){
						if(input.val()==$(this).find('input').val()){
							$(this).find('input').removeAttr(d);
						}
					});
				});
			}
			//取消选择地区后遍历modle，相同地市去掉勾选
			$this.$modal.find('li:has(input)').not($li[0]).each(function() {
				if($(this).find('input').val()==value){
					$(this).find('input')[0].checked =false;
					$(this).removeClass(c);
				}
			});
			this.flushResults();
		},
		delegate: function() {
			var that = this;
			//点击地区
			this.$modal.delegate('li input', 'click', function() {
				$(this).closest('li').toggleClass(c, this.checked);
				if( this.checked ) {
					that.checked(this);
				} else {
					that.unchecked(this);
				}
			});
			//确定
			this.$modal.delegate('button#btn-ok', 'click', function() {
				that.setSelected();
				that.$element.trigger('click');
				that.$modal.hideModal();
			});
		},
		initModal: function($modal) {
			var mid = this.id + '-regions-modal';
			$modal.attr('id', mid);
			$('body').append($modal);
			this.$modal = $modal;
			this.delegate();
		},
		show: function() {
			this.initItems();
			
			if( this.$modal == null ) {
				var modal = $('.regions-modal');
				if ( modal.length == 0 ) {
					modal = $(modalTemp);
					this.initModal(modal);
					var that = this;
					this.$modal.loadModal(ctx + '/common/regionsCheckModal?ajax', null, function() {
						that.initStatus();
					});
				} else {
					modal = modal.clone();
					this.initModal(modal);
					this.initStatus();
					this.$modal.showModal();
				}
			} else {
				this.initStatus();
				this.$modal.showModal();
			}
		}
	};
	
	$.fn.regionsCheckModal = function(options) {
		this.each(function() {
			var modal = $(this).data('modal');
			if( modal == null ) {
				modal = new RegionsCheckModal(this, options);
				$(this).data('modal', modal);
			}
		});
	};
}(window.jQuery);
$.ajaxSetup({
	  cache: false
	});
//=======================================================
/**
 * region-modal 插件
 * 用法：$(selector).regionsMoreModal();
 */
!function($) {
	
	var modalTemp = '<div class="modal fade regions-modal" data-width="800"></div>';
	
	var fieldTemp = ''
		+ '<a href="javascript:void(0)" id="more" data-value="">更多<i class="fa fa-caret-down"></i></a>';
	
	var button = '<button type="button" class="btn-u btn-u-sm btn-u-orange" data-value="{value}">{label}<i class="fa fa-times"></i></button>';
	var activeClose='<i class="activeClose">X</i>';
	var p = 'placeholder';
	var m = 'multiple';
	var c = 'selected';
	var d = 'disabled';
	
	var defaults = {};
	
	var RegionMoreModal = function(element, options) {
		this.$modal = null;
		this.loaded = false;
		this.checkedMap = {};
		this.init(element, options);
	};
	
	RegionMoreModal.prototype = {
		constructor: RegionMoreModal,
		init: function(element, options) {
			this.$element = $(element);
			this.settings = $.extend({}, defaults, options);
			this.id = (this.$element.attr('id') ? this.$element.attr('id') : this.$element.attr('name'));
			
			this.initItems();
			this.setField();
		},
		
		
		initItems: function() {
			this.checkedValue = null;
			var that = this;
			var ck = this.$element.find('a');
			if (ck != null) {
				var opt = {value: ck.data('value'), label: ck.val()};
				that.checkedValue = opt;
			}
		},
		setField: function() {
			this.$element.addClass('hide');
			this.$field = $(fieldTemp);
			this.$element.after(this.$field);
			var that = this;
			this.$field.click(function() {
				that.show();
			});
		},
		
		
		setSelected: function() { //设置隐藏的select元素的option选项
			this.$element.empty();
			this.$element.parent().find('.add').remove();
			for( var i in this.checkedMap ) {
				var $dataValue = this.checkedMap[i].value;
				var $dataLabel = this.checkedMap[i].label;
				if ($dataValue != null && (typeof $dataValue) != 'undefined' && 
						$dataLabel != null && (typeof $dataLabel) != 'undefined') {
					var mediaTab = this.$element.data('tab') + 'Regions';
					//alert(mediaTab);
					var stats = false;
					this.$element.parent().children('a').each(function(index,element){
						var vas = $(element).data('value');
						if (vas == $dataValue) {
							if (!$(element).hasClass('active')) {								
								$(element).click();
							}
							stats = true;
							return false;
						}
					});
					if (stats) {
						continue;
					}
					var a = $('<a href="javascript:void(0)" class="regions add" data-value="'+ $dataValue + '">' + $dataLabel + '</a>');
					this.$element.before(a);
					a.click();
				}
			}
		},
		isSelected: function(value) {
			//common.log(value + ' -> ' + this.checkedMap[value]);
			return this.checkedMap[value];
		},
		
		
		initStatus: function() { //初始化地区的选中状态
			var that = this;
			this.$modal.find('li a').each(function() {
				var $li = $(this).closest('li');
				var value = $(this).data("value");
				$li.removeClass(c);
				if ( that.isSelected(value) ) {
					$li.addClass(c);
					this.checkedValue = true;
					if( 'ALL' == value ) { //全国
						that.checked(this);
						return false;
					}
				} else {
					$li.removeClass(c);
					$(this).removeAttr(c).removeAttr(d);
				}
			});
			
			this.flushResults();
		},
		flushResults: function() { //刷新选中结果
			this.$modal.modal('layout');
		},
		checked: function(input) { // 选中地区
			var $input = $(input);
			var $li = $input.closest('li');
			var $this = this;
			var o = {value: $input.val(), label: $input.data('label')};
			if( 'ALL' == o.value ) { //全国
				for(var i in this.checkedMap ) {
					delete this.checkedMap[i];
				}
				this.$modal.find('li:has(input)').not($li[0]).each(function() {
					$(this).removeClass(c);
					$(this).find('input').removeAttr(c).attr(d, d);
				});
			} else if( $li.hasClass('regionsbor') ) { //选择大区
				var that = this;
				var $index=$li.index();
				$('.regions-modal .tab-content .tab-pane').eq($index).find('li').each(function() {
					var input = $(this).find('input');
					delete that.checkedMap[input.val()];
					input.removeAttr(c).attr(d, d);
					$(this).removeClass(c);
					//选择省份后，禁用热门城市中该省的城市
					$this.$modal.find('.list-inline:eq(0) li').each(function(){
						/*if(input.val()==$(this).find('input').val()){
							$(this).find('input')[0].checked =false;
							$(this).find('input').attr(d,d);
							$(this).removeClass(c);
						}*/
						$li.siblings('li.city-' + o.value).each(function() {
							var input = $(this).find('input');
							delete that.checkedMap[input.val()];
							input.removeAttr(c).attr(d, d);
							$(this).removeClass(c);
							//选择省份后，禁用热门城市中该省的城市
							$this.$modal.find('.list-inline:eq(0) li').each(function(){
								if(input.val()==$(this).find('input').val()){
									$(this).find('input')[0].checked =false;
									$(this).find('input').attr(d,d);
									$(this).removeClass(c);
								}
							});
						});
					});
				});
			}else if( $li.hasClass('header') ) { //选择省份，禁用该省的城市
				var that = this;
				$li.siblings('li.city-' + o.value).each(function() {
					var input = $(this).find('input');
					delete that.checkedMap[input.val()];
					input.removeAttr(c).attr(d, d);
					$(this).removeClass(c);
					//选择省份后，禁用热门城市中该省的城市
					$this.$modal.find('.list-inline:eq(0) li').each(function(){
						if(input.val()==$(this).find('input').val()){
							$(this).find('input')[0].checked =false;
							$(this).find('input').attr(d,d);
							$(this).removeClass(c);
						}
					});
				});
			}
			//选中地区后遍历modle，相同地市也勾选
			$this.$modal.find('li:has(input)').not($li[0]).each(function() {
				if($(this).find('input').val()==$input.val()){
					$(this).find('input')[0].checked =true;
					$(this).addClass(c);
				}
			});
			this.checkedMap[o.value] = o;
			this.flushResults();
		},
		unchecked: function(input) { //取消选中地区
			var value = $(input).val();
			var $li = $(input).closest('li');
			var $this = this;
			delete this.checkedMap[value];
			if( 'ALL' == value) { //全国
				this.$modal.find('li:has(input)').not($li[0]).each(function() {
					$(this).find('input').removeAttr(d);
				});
			} else if( $li.hasClass('regionsbor') ) {//大区
				var $index=$li.index();
				$('.regions-modal .tab-content .tab-pane').eq($index).find('li').each(function() {
					var input = $(this).find('input');
					$(this).find('input').removeAttr(d);
					//取消选择省份后，去除热门中该省的城市的禁用
					$this.$modal.find('.list-inline:eq(0) li').each(function(){
						if(input.val()==$(this).find('input').val()){
							$(this).find('input').removeAttr(d);
						}
					});
				});
			}else if( $li.hasClass('header') ) {
				$li.siblings('li.city-' + value).each(function() {
					var input = $(this).find('input');
					$(this).find('input').removeAttr(d);
					//取消选择省份后，去除热门中该省的城市的禁用
					$this.$modal.find('.list-inline:eq(0) li').each(function(){
						if(input.val()==$(this).find('input').val()){
							$(this).find('input').removeAttr(d);
						}
					});
				});
			}
			//取消选择地区后遍历modle，相同地市去掉勾选
			$this.$modal.find('li:has(input)').not($li[0]).each(function() {
				if($(this).find('input').val()==value){
					$(this).find('input')[0].checked =false;
					$(this).removeClass(c);
				}
			});
			this.flushResults();
		},
		delegate: function() {
			var that = this;
			//点击地区
			this.$modal.delegate('li input', 'click', function() {
				$(this).closest('li').toggleClass(c, this.checked);
				if( this.checked ) {
					that.checked(this);
				} else {
					that.unchecked(this);
				}
			});
			//确定
			this.$modal.delegate('button#btn-ok', 'click', function() {
				that.setSelected();
				that.$element.trigger('click');
				that.$modal.hideModal();
			});
		},
		initModal: function($modal) {
			var mid = this.id + '-regions-modal';
			$modal.attr('id', mid);
			$('body').append($modal);
			this.$modal = $modal;
			this.delegate();
		},
		show: function() {
			this.initItems();
			
			if( this.$modal == null ) {
				var modal = $('.regions-modal');
				if ( modal.length == 0 ) {
					modal = $(modalTemp);
					this.initModal(modal);
					var that = this;
					this.$modal.loadModal(ctx + '/common/regionsMoreModal?ajax', null, function() {
						that.initStatus();
					});
				} else {
					modal = modal.clone();
					this.initModal(modal);
					this.initStatus();
					this.$modal.showModal();
				}
			} else {
				this.initStatus();
				this.$modal.showModal();
			}
		}
	};
	
	$.fn.regionsMoreModal = function(options) {
		this.each(function() {
			var modal = $(this).data('modal');
			if( modal == null ) {
				modal = new RegionMoreModal(this, options);
				$(this).data('modal', modal);
			}
		});
	};
}(window.jQuery);
/* common JS 16.4 */
$(function(){
	  /* search */
	  $('.headerSearch span').click(function(){
		$(this).addClass('activeBot');  
		$(this).siblings('span').removeClass('activeBot');
		var $val=$(this).html();
		$('.searchText').attr('placeholder',$val+'...');
		var searchParam = $(this).data('value');
		$('#data-type').val(searchParam);
	  });

	  /* login */
	  $('.loginL').hover(function(){
	    $('.loginFrame').show();
		$(this).addClass('active');
	  },function(){
		$('.loginFrame').hide();
		$(this).removeClass('active');  
	  });
	  /* footer */
	  /*$('#footerFix').hover(function(){
		$(this).siblings('.footerMain').show();  
	  },function(){
		$(this).siblings('.footerMain').hide();    
	  });
	  $('.footerMain').hover(function(){
		$(this).show();  
	  },function(){
		$(this).hide();    
	  });*/
	});

/*$(function(){
	// details
	var ocheck='<div class="color-wechat detail-check"><div class="detail-checksub">保证三日内发稿！</div></div>';
	$('.check-btn').click(function(){
		if(!$('.detail-check').length>0){
			$('body').append(ocheck);
		}
		$('.detail-check').animate(600,function(){
			$(this).css('transform','rotateX(0)')
		});
	});
	$('.check-btn').mouseout(function(){
		$('.detail-check').remove();
		//$('.detail-check').animate({'tranform':'rotateX(180deg)','display':'none'},1000);
	});
});*/
/**
 * 设置未来(全局)的AJAX请求默认选项
 * 主要设置了AJAX请求遇到Session过期的情况
 *//*
$(function () {
	var statusP = false;
	var statusS = false;

 	function getTopWinow(){
 		var p = window;
 		while(p != p.parent){
 			p = p.parent;
 		}
 		return p;
 	}

 $.ajaxSetup({
		contentType:'application/x-www-form-urlencoded;charset=utf-8',
		complete:function(xhr,textStatus){
			var sessionstatus=xhr.getResponseHeader('sessionstatus'); //通过xhr取得响应头:sessionstatus
			if (sessionstatus=='timeout') {
				if (statusS) {
					return;
				}
				//如果超时就处理 ，指定要跳转的页面
				if (!statusP) {
					alert("当前登录已超时, 请重新登录系统!");
					getTopWinow().location.replace(ctx+"/login");
					statusS = true;
					statusP = true;
					return;
				}
			}
			if(xhr.responseText.indexOf('您没有足够的权限执行该操作!') != -1 && xhr.responseText.indexOf('var') == -1) {
				if (statusP) {
					return;
				}
				if (!statusS) {
					alert("您没有足够的权限执行当前操作,请尝试重新登录!");
					getTopWinow().location.replace(ctx+"/login");
					statusP = true;
					statusS = true;
					return;
				}

			} else if(xhr.responseText.indexOf('loginSession') != -1 && xhr.responseText.indexOf('var') == -1) {
				if (statusP || statusS) {
					return;
				}
				alert("当前登录已超时, 请重新登录系统!");
				getTopWinow().location.replace(ctx+"/login");
				return;
			}
		}
	});
	$('.regcheck-btn').click(function () {
        $.post(ctx+'/common/checkRegIp?ajax', function(data) {
            data = $.parseJSON(data);
            if( data.result == true ) {
            	//通过
				getTopWinow().location.replace(ctx+"/register");
            } else {
            	//屏蔽
				var oid = ''+data.data.mobphone;
				$('#register-modal').loadModal(ctx+'/common/regRemind?ajax', {
					id : oid
				});
            }
        });
		getTopWinow().location.replace(ctx+"/register");
	});
});*/


