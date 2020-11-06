$("#login").on("click", function() {
    let password = $("#password").val();
    let token = $("#csrf").html();

    $.ajax({
        type: "POST",
        url: `/admin?&authenticity_token=${encodeURIComponent(token)}&password=${password}`,
        success: function(data) {
            if (!!data.msg) {
                console.log(data.msg);
                $("#errormsg").html(data.msg);
                $("#error").css("display", "block");
            }
        },
        error: function() {
            console.log("error");
        }
    })
});

$("#errorclose").on("click", function() {
    $("#error").css("display", "none");
})