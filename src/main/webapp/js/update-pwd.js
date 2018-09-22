var validator;
$(document).ready(function () {
    $.validator.setDefaults({
        //debug: true
    });

    validator = $("#Form").validate({
        rules: {
            password: {
                required: true,
            },
            newPassword: {
                required: true,
            },
            rePassword: {
                required: true,
                equalTo: "#newPassword"
            }
        },
        messages: {
            password: {
                required: "必须填写旧密码",
            },
            newPassword: {
                required: "必须填写密码",
            },
            rePassword: {
                required: "必须填写确认密码",
                equalTo: "两次输入的密码不一致"
            }
        }
    });
});
$(document).ready(function(){
    $("#submit").click(function(){
        $.post("updatePwd.do",{
                uid:$("#uid").val(),
                password:$("#password").val(),
                newPassword:$("#newPassword").val()
            },
            function(data){
                if(data=='success'){
                    alert("修改密码成功");
                }
                if(data=='false'){
                    alert("旧密码输入有误");
                }
                if(data=='pwdEmpty'){
                    alert("密码不能为空");
                }
                if(data=='newEmpty'){
                    alert("确认密码不能为空");
                }
            });
    });
});