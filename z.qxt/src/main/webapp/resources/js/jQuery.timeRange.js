$(function(){
    $("body").delegate(".timeRange", "click", function(){
        $('#timeRange_div').remove();
        var hourOpts = '', minuteOpts='';
        for (i=0;i<24;i++) hourOpts += '<option>'+i+'</option>';
        for (i=0;i<60;i++) minuteOpts += '<option>'+i+'</option>';
         
        var html = $('<div id="timeRange_div"><select id="timeRange_a">'+hourOpts+
            '</select>:<select id="timeRange_b">'+minuteOpts+
            '</select>-<select id="timeRange_c">'+hourOpts+
            '</select>:<select id="timeRange_d">'+minuteOpts+
            '</select><input type="button" style="width:40px;" value="确定" id="timeRange_btn" /><input type="button" style="width:40px;" value="取消" id="timePush_clear_btn" /></div>')
            .css({
                "position": "absolute",
                "z-index": "999",
                "padding": "5px",
                "width":"270px",
                "border": "1px solid #AAA",
                "background-color": "#FFF",
                "box-shadow": "1px 1px 3px rgba(0,0,0,.4)"
            })
            .click(function(){return false});
        // 如果文本框有值
        var v = $(this).val();
        if (v) {
            v = v.split(/:|-/);
            html.find('#timeRange_a').val(v[0]);
            html.find('#timeRange_b').val(v[1]);
            html.find('#timeRange_c').val(v[2]);
            html.find('#timeRange_d').val(v[3]);
        }
        // 点击确定的时候
        var pObj = $(this);
        html.find('#timeRange_btn').click(function(){
            var str = html.find('#timeRange_a').val()+':'
                +html.find('#timeRange_b').val()+'-'
                +html.find('#timeRange_c').val()+':'
                +html.find('#timeRange_d').val();
            pObj.val(str);
            $('#timeRange_div').remove();
        });
        
        // 点击取消的时候
        var cObj = $(this);
        html.find('#timePush_clear_btn').click(function(){
            cObj.val('');
            $('#timeRange_div').remove();
        });
         
        $(this).after(html);
        return false;
    });
    $(document).click(function(){
        $('#timeRange_div').remove();
    });
});