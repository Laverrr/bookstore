$(document).ready(function () {
    $("#submit").click(function () {
        $.get("checkStore.do", "utf-8",
            function (data) {
                if (data == 'success') {
                    window.location.href = "oderPage.do";
                } else {
                    alert(data);
                }
            });
    });
});