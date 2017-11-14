<%@ tag pageEncoding="utf-8" %>
<%@ tag body-content="empty" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="text-danger"></div>

<!-- jQuery 3.1.0 -->
<script src="/js/jquery-3.1.0.min.js"></script>
<script type="text/javascript">
    var images = new Array();

    $(document).ready(function() {
        $("#content").summernote({
            dialogsFade: true,

            lang: 'zh-CN', // default: 'en-US'

            height: 300,                 // set editor height

            minHeight: null,             // set minimum height of editor
            maxHeight: null,             // set maximum height of editor

            focus: false,                // set focus to editable area after initializing summernote

            placeholder: '说点什么吧..',

            callbacks: {
                onImageUpload: function(files) {
                    var data = new FormData();
                    data.append("file", files[0]);
                    data.append("type", "textarea");

                    //var filename = file['name'];
                    //var ext = filename.substr(filename.lastIndexOf("."));
                    //var name = new Date().getTime()+ext.toUpperCase();
                    //https://segmentfault.com/a/1190000004322487
                    var xhr = new XMLHttpRequest();
                    xhr.responseType = "text";
                    xhr.open("POST", "/image/upload", true);
                    xhr.onload = function(e) {
                        $(".text-danger").html("文件上传成功!");
                        setTimeout(function () {
                            $(".text-danger").html("");
                            $(".text-danger").hide();
                        }, 3000);

                        if(this.status == 200||this.status == 304){
                            var json=eval("("+this.responseText+")");
                            if (json.status==0) {
                                var url = URL.createObjectURL(files[0]);
                                $('#content').summernote('insertImage', url, function ($image) {
                                    $image.css('max-width', '100%');
                                    $image.attr('src', json.path);
                                    images.push(json.path);
                                });

                                /*var fileName = files[0].name;
                                 var extension = fileName.substring(fileName.lastIndexOf('.') + 1);
                                 if ($.inArray(extension, ['doc','xls','ppt','docx','xlsx','pptx']) != -1) {
                                 var node = document.createElement('a');
                                 $(node).attr("href", "/image/download?fileName=" + json.path.substring(json.path.lastIndexOf("/")+1));
                                 $(node).text(fileName);
                                 $('#content').summernote('insertNode', node);
                                 }
                                 if ($.inArray(extension, ['mp4']) != -1) {
                                 var node = document.createElement('video');
                                 $(node).attr('controls', '')
                                 .attr('autoplay', '')
                                 .attr('name', 'media')
                                 .wrapInner(function(){
                                 return $("<source>").attr("src", json.path).attr("type", "video/mp4");
                                 });
                                 $('#content').summernote('insertNode', node);
                                 }
                                 if ($.inArray(extension, ['jpg','png','bmp','gif']) != -1) {
                                 var node = document.createElement('img');
                                 $(node).attr('src', json.path);
                                 $('#content').summernote('insertNode', node);
                                 }*/
                            }
                        }
                    };
                    xhr.onprogress = function (e) {
                        $(".text-danger").show();
                        $(".text-danger").html("文件正在上传..");
                    };
                    xhr.onerror = function (e) {
                        $(".text-danger").html("文件上传失败!");
                    }
                    //xhr.ontimeout = function(e) { ... };
                    //xhr.onerror = function(e) { ... };
                    //xhr.upload.onprogress = function(e) { ... };
                    xhr.send(data);
                }
            }
        });

        var markupStr = $('#content').summernote('code');
        markupStr.replace(/<img [^>]*src=['"]([^'"]+)[^>]*>/gi, function (match, capture) {
            images.push(capture);
        });
    });

    $("button[type='submit']").on('click', function(e) {
        var markupStr = $('#content').summernote('code');
        var noMarkupStr=getNoMarkupStr(markupStr);
        var length=noMarkupStr.length;
        if (length==0) {
            alert('至少说点什么吧');
            e.preventDefault();
        }

        $("#summary").val(getSubStr(noMarkupStr));

        markupStr.replace(/<img [^>]*src=['"]([^'"]+)[^>]*>/gi, function (match, capture) {
            images.splice($.inArray(capture, images), 1);
        });
        if (images.length > 0) {
            var data = new FormData();
            data.append("paths", images.join(","));

            //var filename = file['name'];
            //var ext = filename.substr(filename.lastIndexOf("."));
            //var name = new Date().getTime()+ext.toUpperCase();
            //https://segmentfault.com/a/1190000004322487
            var xhr = new XMLHttpRequest();
            xhr.responseType = "text";
            xhr.open("POST", "/image/delete", true);
            xhr.onload = function(e) {
                if(this.status == 200||this.status == 304){
                    var json=eval("("+this.responseText+")");
                    if (json.status==0) {
                        console.log("Remove finish!");
                    }
                }
            };
            //xhr.ontimeout = function(e) { ... };
            //xhr.onerror = function(e) { ... };
            //xhr.upload.onprogress = function(e) { ... };
            xhr.send(data);
        }
    });

    function getNoMarkupStr(markupStr) {
        /* markupStr 源码</> */
        //console.log(markupStr);
        var noMarkupStr=$("<div>").html(markupStr).text();/* 得到可视文本(不含图片),将&nbsp;&lt;&gt;转为空字符串和<和>显示,同时去掉了换行,文本单行显示 */
        //console.log("1--S" + noMarkupStr + "E--");
        noMarkupStr=noMarkupStr.replace(/(\r\n|\n|\r)/gm,"");/* 去掉可视文本中的换行,(没有用,上一步已经自动处理) */
        //console.log("2--S" + noMarkupStr + "E--");
        noMarkupStr=noMarkupStr.replace(/^\s+/g,"");/* 替换开始位置一个或多个空格为一个空字符串 */
        //console.log("3--S" + noMarkupStr + "E--");
        noMarkupStr=noMarkupStr.replace(/\s+$/g,"");/* 替换结束位置一个或多个空格为一个空字符串 */
        //console.log("4--S" + noMarkupStr + "E--");
        noMarkupStr=noMarkupStr.replace(/\s+/g," ");/* 替换中间位置一个或多个空格为一个空格 */
        //console.log("5--S" + noMarkupStr + "E--");
        return noMarkupStr;
    }

    function getSubStr(string) {
        var str='';
        var len = 0;
        for (var i = 0; i < string.length; i++) {
            if (string[i].match(/[^\x00-\xff]/ig) != null) {
                len += 2;
            } else {
                len += 1;
            }
            if (len > 240) {/* 240为要截取的长度 */
                str += '...';
                break;
            }
            str += string[i];
        }
        return str;
    }
</script>

