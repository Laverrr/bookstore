var validator;
$(document).ready(function () {
    // $.validator.setDefaults({
    //     //debug: true
    // });

    validator = $("#loginForm").validate({
        rules: {
            userName: {
                required: true
            },
            passWord: {
                required: true
            }
        },
        messages: {
            userName: {
                required: "必须填写用户名"
            },
            passWord: {
                required: "必须填写密码"

            }
        }
    });
});
// $(document).ready(function(){
//     $("#submit").click(function(){
//         $.post("loginCheck.do",{
//                 userName:$("#userName").val(),
//                 passWord:$("#passWord").val()
//             },
//             function(data){
//                 if(data=='success'){
//                     window.location.href="index.do";
//                 }
//                 if(data=='false'){
//                     alert("账号或密码不正确");
//                 }
//                 if(data=='nameEmpty'){
//                     alert("账号不能为空");
//                 }
//                 if(data=='pwdEmpty'){
//                     alert("密码不能为空");
//                 }
//             });
//     });
// });
$(document).ready(function(){
    $("#submit").click(function(){
        $.ajax({
            type: "post",
            url: "loginCheck.do",
            data: {
                userName:$("#userName").val(),
                passWord:$("#passWord").val()
            },
            dataType: "text",
            success: function(result){
                if(result=='success'){
                    window.location.href="index.do";
                }
                if(result=='false'){
                    alert("账号或密码不正确");
                }
                if(result=='nameEmpty'){
                    alert("账号不能为空");
                }
                if(result=='pwdEmpty'){
                    alert("密码不能为空");
                }
            },
            error: function() {
                alert("登陆失败");
            }
        });
    });
});