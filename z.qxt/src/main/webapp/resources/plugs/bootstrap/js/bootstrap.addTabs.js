/**
 * Website: http://git.oschina.net/hbbcs/bootStrap-addTabs
 *
 * Version : 1.0
 *
 * Created by joe on 2016-2-4.
 */

$.fn.addtabs = function (options) {
    obj = $(this);
    Addtabs.options = $.extend({
        content: '', 
        close: true, 
        monitor: 'body', 
        iframeUse: true, 
        iframeHeight: $(document).height() - 107, 
        method: 'init',
        callback: function () {
        }
    }, options || {});


    $(Addtabs.options.monitor).on('click', '[data-addtab]', function () {
    	$(".nav").find("li").removeClass("active");
    	$(this).parents("li").addClass("active");
        Addtabs.add({
            id: $(this).attr('data-addtab'),
            title: $(this).attr('title') ? $(this).attr('title') : $(this).html(),
            content: Addtabs.options.content ? Addtabs.options.content : $(this).attr('content'),
            url: $(this).attr('url'),
            ajax: $(this).attr('ajax') ? true : false
        });
    });

    obj.on('click', '.close-tab', function () {
        var id = $(this).prev("a").attr("aria-controls");
        Addtabs.close(id);
    });


    obj.on('mouseover','li',function() {
        $(this).find('.close-tab').show();
    });

    obj.on('mouseleave','li',function() {
        $(this).find('.close-tab').hide();
    });

    $(window).resize(function () {
        obj.find('iframe').attr('height', Addtabs.options.iframeHeight);
        Addtabs.drop();
    });

};
function addContext(opts){
	if (opts.content) {
        return opts.content;
    } else if (Addtabs.options.iframeUse && !opts.ajax) {
           return  $('<iframe>', {
                'class': 'iframeClass',
                'height': Addtabs.options.iframeHeight,
                'frameborder': "no",
                'border': "0",
                'src': opts.url
            });
    } else {
        $.get(opts.url, function (data) {
            return data;
        });
    }
}
window.Addtabs = {
    options:{},
    add: function (opts) {
        var id = 'tab_' + opts.id;
        //obj.find('.active').removeClass('active');
        $('li[role = "presentation"].active').removeClass('active'); 
        $('div[role = "tabpanel"].active').removeClass('active');
        if (!$("#" + id)[0]) {

            var title = $('<li>', {
                'role': 'presentation',
                'id': 'tab_' + id
            }).append(
                $('<a>', {
                    'href': '#' + id,
                    'aria-controls': id,
                    'role': 'tab',
                    'data-toggle': 'tab'
                }).html(opts.title)
            );

            if (Addtabs.options.close) {
                title.append(
                    $('<i>',{'class':'close-tab glyphicon glyphicon-remove'})
                );
            }
            
            var content = $('<div>', {
                'class': 'tab-pane fade in active',
                'id': id,
                'role': 'tabpanel'
            });

            content.append(addContext(opts));
            obj.children('.nav-tabs').append(title);
            obj.children(".tab-content").append(content);
        }else{
        	 $("#" + id).empty();
        	 $("#" + id).append(addContext(opts));
        }
       
        $("#tab_" + id).addClass('active');
        $("#" + id).addClass("active");
        Addtabs.drop();
    },
    close: function (id) {
        if (obj.find("li.active").attr('id') == "tab_" + id) {
            $("#tab_" + id).prev().addClass('active');
            $("#" + id).prev().addClass('active');
        }
        $("#tab_" + id).remove();
        $("#" + id).remove();
        Addtabs.drop();
        Addtabs.options.callback();
    },
    drop: function () {
        element = obj.find('.nav-tabs');
        var dropdown = $('<li>', {
            'class': 'dropdown pull-right hide tabdrop'
        }).append(
            $('<a>', {
                'class': 'dropdown-toggle',
                'data-toggle': 'dropdown',
                'href': '#'
            }).append(
                $('<i>', {'class': "glyphicon glyphicon-align-justify"})
            ).append(
                $('<b>', {'class': 'caret'})
            )
        ).append(
            $('<ul>', {'class': "dropdown-menu"})
        )

        if (!$('.tabdrop').html()) {
            dropdown.prependTo(element);
        } else {
            dropdown = element.find('.tabdrop');
        }
        if (element.parent().is('.tabs-below')) {
            dropdown.addClass('dropup');
        }
        var collection = 0;

        element.append(dropdown.find('li'))
            .find('>li')
            .not('.tabdrop')
            .each(function () {
                if (this.offsetTop > 0 || element.width() - $(this).position().left - $(this).width() < 53) {
                    dropdown.find('ul').append($(this));
                    collection++;
                }
            });

        if (collection > 0) {
            dropdown.removeClass('hide');
            if (dropdown.find('.active').length == 1) {
                dropdown.addClass('active');
            } else {
                dropdown.removeClass('active');
            }
        } else {
            dropdown.addClass('hide');
        }
    }
}