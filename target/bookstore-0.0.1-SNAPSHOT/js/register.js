var validator;
$(document).ready(function () {
    $.validator.setDefaults({
        //debug: true
    });

    validator = $("#regForm").validate({
        rules: {
            userName: {
                required: true
            },
            passWord: {
                required: true
            },
            rePassWord: {
                required: true,
                equalTo: "#passWord"
            }
        },
        messages: {
            userName: {
                required: "必须填写用户名"
            },
            passWord: {
                required: "必须填写密码"
            },
            rePassWord: {
                required: "必须填写确认密码",
                equalTo: "两次输入的密码不一致"
            }
        }
    });
});
$(document).ready(function(){
    $("#submit").click(function(){
        $.post("userReg.do",{
                userName:$("#userName").val(),
                passWord:$("#passWord").val()
            },
            function(data){
                if(data=='success'){
                    alert("注册成功，请登陆。");
                    window.location.href="login.do";
                }
                if(data=='false'){
                    alert("用户名已存在");
                }
            });
    });
});