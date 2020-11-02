$("#login").on("click", function() {
    let username = $("#username").val()
    let password = $("#password").val();
    let token = $("#csrf").html();

    $.ajax({
        type: "POST",
        url: "/login/student?&authenticity_token=" + encodeURIComponent(token),
        data: {username: username, password: password},
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