$("#login").on("click", function() {
    let username = $("#username").val();
    let password = $("#password").val();
    let token = $("#csrf").html();

    $.post("/login/student?&authenticity_token=" + encodeURIComponent(token), {username: username, password: password}).done(function(data) {
        console.log(data);
    })
});