$(function(){
    $("body").delegate(".timePush", "click", function(){
        $('#timePush_div').remove();
        var hourOpts = '', minuteOpts='';
        for (i=0;i<24;i++) hourOpts += '<option>'+i+'</option>';
        for (i=0;i<60;i++) minuteOpts += '<option>'+i+'</option>';
         
        var html = $('<div id="timePush_div"><select id="timePush_a">'+hourOpts+
            '</select>:<select id="timePush_b">'+minuteOpts+
            '</select><input type="button" style="width:40px;" value="确定" id="timePush_btn" /></div>')
            .css({
                "position": "absolute",
                "z-index": "999",
                "margin-left":"10px",
                "padding": "5px",
                "border": "1px solid #AAA",
                "background-color": "#FFF",
                "box-shadow": "1px 1px 3px rgba(0,0,0,.4)"
            })
            .click(function(){return false});
        // 如果文本框有值
        var v = $(this).val();
        if (v) {
            v = v.split(/:|-/);
            html.find('#timePush_a').val(v[0]);
            html.find('#timePush_b').val(v[1]);
            
        }
        // 点击确定的时候
        var pObj = $(this);
        html.find('#timePush_btn').click(function(){
            var str = html.find('#timePush_a').val()+':'
                +html.find('#timePush_b').val();
            pObj.val(str);
            $('#timePush_div').remove();
        });
         
        $(this).after(html);
        return false;
    });
    $(document).click(function(){
        $('#timePush_div').remove();
    });
});