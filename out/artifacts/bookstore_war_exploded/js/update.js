var validator;
$(document).ready(function () {
    $.validator.setDefaults({
    });

    validator = $("#Form").validate({
        rules: {
            uname: {
                required: true
            },
            phone: {
                required: true,
                minlength: 11,
                maxlength: 11
            },
            email: {
                required: true,
                email:true
            },
            address: {
                required: true
            }
        },
        messages: {
            uname: {
                required: "必须填写用户名"
            },
            phone: {
                required: "必须填写电话",
                minlength: "电话号码长度不正确",
                maxlength: "电话号码长度不正确"
            },
            email: {
                required: "必须填写邮箱",
                email:"邮箱格式有误"
            },
            address: {
                required: "必须填写送货地址"
            }
        }
    });

});