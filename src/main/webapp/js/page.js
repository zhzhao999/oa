/**
 *
 */
var Pager = (function( ) {

    function Pager(ele){
        this.$ele = $(ele);
        this._init();
    }

    $.extend(Pager.prototype, {

        _init: function(){
            var $ele = this.$ele;

            this.$pagesOp = $ele.find('.PageButton');
            this.$ul = $ele.find('ul');
            this.$submit = $ele.find('.submit');

            this._bindEvent();
        },
        _bindEvent: function() {
            var self = this;

            this.$ul.on('click', 'li', function(e){
                var text = $(this).text();
                if (!isNaN(text)){

                    self.trigger('page', {
                        page: parseInt($(this).text())
                    });
                }

            });
            /* 跳转功能*/
            this.$submit.on('click',function(){
                var val = $('input[name="text_box"]').val();
                if (!isNaN(val) && (val !='')){
                    self.trigger('page', {
                        page: parseInt($('input[name="text_box"]').val())
                    });
                }
                //清空跳转页码
                $('input[name="text_box"]').val('');

            });

            this.$pagesOp.on('click', function(){
                var type = $(this).data('val');
                var page;
                if (type === 'prev') {
                    if (self.cur_page >= 2) {
                        page = self.cur_page = self.cur_page - 1;
                        self.trigger('page', {
                            page: page
                        });
                    }
                }else if(type === 'next'){
                    if (self.cur_page < self.total_page) {
                        page = self.cur_page = self.cur_page + 1;
                        self.trigger('page', {
                            page:page
                        });

                    }
                } else {
                    if(page >= 1 && page <= self.total_page ) {
                        self.trigger('page', {
                            page:page
                        });
                    }
                }
            });

        },
        _getLisHtml: function(){

            var cur_page = this.cur_page;
            var total_page = this.total_page;
            var lisHtml = '';
            var i;

            if(total_page > 1) {
                if(cur_page == 1){//当前页为1的时候下一页展示
                    this.$pagesOp.eq(1).css('visibility','visible');  //至少总页数为2，下一页展示
                }else if(cur_page == total_page) {//当前页等于总页数
                    this.$pagesOp.eq(0).css('visibility','visible');//上一页显示
                }else{
                    this.$pagesOp.css('visibility','visible');//当前既不为第一页又不为最后一页，上一页下一页都展示
                }
            }


            //显示的页数小于5时  显示 1 2 3 4 5 ...
            //当显示的当前页大于5小于总页数-3时  保留1 2  中间数字省略 变成 ... 显示当前页 以及前后各两页 剩余页数省略...
            //当显示的当前页大于等于总页数-3时  显示 1 2 中间省略...   1 2  ... 往前 5 页

            if(total_page > 8){//总页数大于8
                if (total_page - cur_page >= 5) {//总页数-当前页大于等于5；前5页
                    var cur_page_num1 = 1;
                    var cur_page_num2 = 2;
                    var cur_page_num3 = 3;
                    var cur_page_num4 = 4;
                    var cur_page_num5 = 5;
                    var cur_page_num6 = 6;

                    //固定的1 2
                    lisHtml = lisHtml + '<li class="" data-val="'+cur_page_num1+'"><a href="javascript:">'+ cur_page_num1+'</a></li>';
                    lisHtml = lisHtml + '<li class="" data-val="'+cur_page_num2+'"><a href="javascript:">'+ cur_page_num2+'</a></li>';
                    lisHtml = lisHtml + '<li class="" data-val="'+cur_page_num3+'"><a href="javascript:">'+ cur_page_num3+'</a></li>';
                    lisHtml = lisHtml + '<li class="" data-val="'+cur_page_num4+'"><a href="javascript:">'+ cur_page_num4+'</a></li>';
                    lisHtml = lisHtml + '<li class="" data-val="'+cur_page_num5+'"><a href="javascript:">'+ cur_page_num5+'</a></li>';
                    lisHtml = lisHtml + '<li class="" data-val="'+cur_page_num6+'"><a href="javascript:">'+ cur_page_num6+'</a></li>';

                    lisHtml = lisHtml + '<li  data-val=""><a>...</a></li>';
                }

                if(cur_page>=5 && cur_page<total_page-3){
                    lisHtml = '';
                    var cur_page_numa = 1;
                    var cur_page_numb = 2;
                    var cur_page_b=cur_page-1;
                    var cur_page_c=cur_page+1;
                    lisHtml = lisHtml + '<li class="" data-val="'+cur_page_numa+'"><a href="javascript:">'+ cur_page_numa+'</a></li>';
                    lisHtml = lisHtml + '<li class="" data-val="'+cur_page_numb+'"><a href="javascript:">'+ cur_page_numb+'</a></li>';
                    lisHtml = lisHtml + '<li  data-val=""><a>...</a></li>';
                    lisHtml = lisHtml + '<li class="" data-val="'+cur_page_b+'"><a href="javascript:">'+ cur_page_b+'</a></li>';
                    lisHtml = lisHtml + '<li class="" data-val="'+cur_page+'"><a href="javascript:">'+ cur_page+'</a></li>';

                    lisHtml = lisHtml + '<li class="" data-val="'+cur_page_c+'"><a href="javascript:">'+ cur_page_c+'</a></li>';
                    lisHtml = lisHtml + '<li  data-val=""><a>...</a></li>';

                }
                //当显示的当前页大于等于总页数-3时  显示 1 2 中间省略...   1 2  ... 往前 5 页
                if(total_page >= 9 && cur_page >= total_page-3  ){
                    var cur_page_numa1 = 1;
                    var cur_page_numb1 = 2;
                    var total_page_b=total_page-4;
                    var total_page_c=total_page-3;
                    var total_page_d=total_page-2;
                    var total_page_e=total_page-1;
                    lisHtml = lisHtml + '<li class="" data-val="'+cur_page_numa1+'"><a href="javascript:">'+ cur_page_numa1+'</a></li>';
                    lisHtml = lisHtml + '<li class="" data-val="'+cur_page_numb1+'"><a href="javascript:">'+ cur_page_numb1+'</a></li>';
                    lisHtml = lisHtml + '<li  data-val=""><a>...</a></li>';
                    lisHtml = lisHtml + '<li class="" data-val="'+total_page_b+'"><a href="javascript:">'+ total_page_b+'</a></li>';
                    lisHtml = lisHtml + '<li class="" data-val="'+total_page_c+'"><a href="javascript:">'+ total_page_c+'</a></li>';
                    lisHtml = lisHtml + '<li class="" data-val="'+total_page_d+'"><a href="javascript:">'+ total_page_d+'</a></li>';
                    lisHtml = lisHtml + '<li class="" data-val="'+total_page_e+'"><a href="javascript:">'+ total_page_e+'</a></li>';
                }

                var total_page_a=total_page-1;
                lisHtml = lisHtml + '<li class="" data-val="'+total_page+'"><a href="javascript:">'+ total_page +'</a></li>';
            }else{//总页数小于=5
                for (i = 1; i <= total_page; i++) {
                    lisHtml = lisHtml + '<li class="" data-val="'+i+'"><a href="javascript:">'+ i +'</a></li>';
                }
            }


            return lisHtml;
        },
        trigger: function(eventname, data){
            this.$ele.trigger('pages:' + eventname, data);
        },
        on: function(eventname, cb){

            this.$ele.on('pages:' + eventname, function(e, data){
                cb.call(undefined, data);
            });

        },
        paint: function(cur_page, total_page){

            this.cur_page = cur_page;
            this.total_page = total_page;

            var html = this._getLisHtml(cur_page, total_page);

            this.$ul.empty().html(html);
            this.$ul.find('li[data-val="'+ cur_page +'"]').addClass('selected');
        },
        hide: function(){
            this.$ele.addClass('hidden');
        },
        show: function(){
            this.$ele.removeClass('hidden');
        }
    });

    return  Pager;
})();

