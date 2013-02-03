// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require kindeditor

/**
 * 使用ajax提交数据
 */
function ajaxPost(url, param, successCallback) {
    $.ajax({
        type:'POST',
        cache:false,
        url:url,
        data:param,
        success:successCallback,
        error:function (html) {
            alert("提交数据失败，代码:" + html.status + "，请稍候再试");
        }
    });
}

function popup(url) {
    ajaxPost(url, "", function (data) {
        $.fancybox(data);
    });
}
