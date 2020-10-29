$("#login").on("click", function() {
    let password = $("#password").val();
    let token = $("#csrf").html();

    $.post("/login/employer?&authenticity_token=" + encodeURIComponent(token), {password: password}).done(function(data) {
        console.log(data);
    })
});