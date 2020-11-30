var global_students = null;

$("#logout").on("click", function() {
    $.ajax({
        type: "GET",
        url: "/logoutredirect",
        success: function() {
            document.location = "/";
        },
        error: function() {
            document.location = "/";
        }
    })
})


// Process search
$("#search").on("click", function() {
    let times = $("#time").val();
    let location = $("#location").val().trim().toLowerCase();
    let grad = $("#date").val().trim().toLowerCase();

    // Get a list of all students
    let students = [...global_students];
    // Filter the array
    students = students.filter(function(s) {
        if ((s.availability == null || s.availability == "Part time") && times == "full") {
            return false;
        }
        if ((s.availability == null || s.availability == "Full time") && times == "part") {
            return false;
        }
        // Check location preferences
        if (location.length > 0) {
            let found = false;
            if (s.locationPreference1 && s.locationPreference1.toLowerCase().includes(location)) {
                found = true;
            }
            if (s.locationPreference2 && s.locationPreference2.toLowerCase().includes(location)) {
                found = true;
            }
            if (s.locationPreference3 && s.locationPreference3.toLowerCase().includes(location)) {
                found = true;
            }
            if (!found) {
                return false;
            }
        }
        // Check graduation time
        if (grad.length > 0) {
            let gtime = "";
            // Add month if there, add year if there and fit to what it looks like in DB
            if (s.graduationMonth) {
                gtime += s.graduationMonth.toLowerCase();
            }
            if (s.graduationYear) {
                if (gtime.length > 0) {
                    gtime += " ";
                }
                gtime += s.graduationYear;
            }
            if (!gtime.includes(grad)) {
                return false;
            }
        }
        return true;
    });
    // Build cards
    populate(students);
});

// Build card
function buildCard(student) {
    let biotext = "";
    // Shorten biotext if too long
    if (!!student.bioText) {
        biotext = student.bioText;
        if (biotext.length > 200) {
            biotext = biotext.substr(0, 200);
            biotext += "..."
        }
    }

    let card = `
    <div class="level-item">
        <div class="card">
            <div class="card-content">
                <div class="content">
                    <div>
                        <p class="title is-4">${student.firstName || ""} ${student.lastName || ""}</p>
                        <p class="subtitle is-6">${student.graduationMonth || ""} ${student.graduationYear || ""}
                    </div>
                    ${biotext}
                </div>
            </div>
            <footer class="card-footer">
                <a href="/students/${student.id}" class="button is-white">More Details</a>
            </footer>
        </div>
    </div>
    `

    return card;
}

// Figure out dimensions and build cards and append to dom tree
function populate(students) {
    $("#cards").html("");
    let width = $(document).width();
    let count = Math.floor(width / 300);
    for (let i = 0; i < students.length; i += count) {
        let output = `<div class="level">`
        for (let j = 0; j < count; j++) {
            if (!!students[i + j]) {
                output += buildCard(students[i + j]);
            }
        }
        output += "</div>";
        $("#cards").append(output);
    }
}

$(function() {
    $.ajax({
        type: "GET",
        url: "/dashboard/all",
        success: function(data) {
            global_students = data.students;
            populate(data.students);
        },
        error: function() {
            console.log("error");
        }
    })
});
