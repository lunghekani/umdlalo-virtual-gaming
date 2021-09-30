
//current_chat state control

//not safe
//var current_chat = { "panel": null, "user_id": null, "course_id": null, "course_name": null, "user_name": null, 'limit': 10, message: null };

//safe string
function _0x3eb7() { var _0x4d7f48 = ['6120570xFmZZP', '27628788yyrGbE', '4REjkjQ', '3185175SdtNan', '5283KOkDns', '1008225gCmUSx', '11HWWRhc', '330npQlil', '4EsuiFZ', '151848MKLauu', '7gRIAWL', '1077128uAXSKS']; _0x3eb7 = function () { return _0x4d7f48; }; return _0x3eb7(); } (function (_0x254f23, _0x12a5e2) { var _0x49fbc8 = _0x4891, _0x1df6da = _0x254f23(); while (!![]) { try { var _0x407285 = parseInt(_0x49fbc8(0x102)) / 0x1 * (parseInt(_0x49fbc8(0xfd)) / 0x2) + -parseInt(_0x49fbc8(0xf9)) / 0x3 * (parseInt(_0x49fbc8(0xfc)) / 0x4) + -parseInt(_0x49fbc8(0xf7)) / 0x5 + -parseInt(_0x49fbc8(0x100)) / 0x6 + -parseInt(_0x49fbc8(0xfe)) / 0x7 * (-parseInt(_0x49fbc8(0xff)) / 0x8) + -parseInt(_0x49fbc8(0xf8)) / 0x9 * (parseInt(_0x49fbc8(0xfb)) / 0xa) + parseInt(_0x49fbc8(0xfa)) / 0xb * (parseInt(_0x49fbc8(0x101)) / 0xc); if (_0x407285 === _0x12a5e2) break; else _0x1df6da['push'](_0x1df6da['shift']()); } catch (_0x1146cd) { _0x1df6da['push'](_0x1df6da['shift']()); } } }(_0x3eb7, 0xb1c60)); function _0x4891(_0x5dcd68, _0x70add1) { var _0x3eb7d2 = _0x3eb7(); return _0x4891 = function (_0x4891bf, _0x28f624) { _0x4891bf = _0x4891bf - 0xf7; var _0x231aba = _0x3eb7d2[_0x4891bf]; return _0x231aba; }, _0x4891(_0x5dcd68, _0x70add1); } var current_chat = { 'panel': null, 'user_id': null, 'course_id': null, 'course_name': null, 'user_name': null, 'limit': 0xa, 'message': null };


function reset_clicked_user_notification(name) {

    $.ajax({
        url: "rest-chat-get",
        method: "POST", //First change type to method here
        data: { ["reset_" + name + "_notification"]: true, "course_id": current_chat.course_id },
        success: function (data, status) {
            console.log(data)

        },
        error: function (e) {
            console.log(e)
            alert("reset chat notification fetch error");
        }

    });
}


function get_notification(name) {

    $("." + name + "_chat_user").each(function (e) {
        var c_id = $(this).attr("data-id");
        var key = "get_" + name + "_notification"
        $.ajax({
            url: "rest-chat-get",
            method: "POST", //First change type to method here
            data: { [key]: true, "course_id": c_id },
            success: function (data, status) {
                console.log(data)

                var notification = data.notification
                var time = data.time
                var no = $("#" + name + "_chat_notification" + c_id);
                var ti = $("#" + name + "_chat_time" + c_id)

                if (time != "" && notification == "") {
                    no.addClass("label-light-success")
                    no.removeClass("label-danger")
                    no.text(notification)
                    ti.text(timeDifference(time))


                } if (time != "" && notification == "0") {
                    no.addClass("label-light-success")
                    no.removeClass("label-danger")
                    no.text(notification)
                    ti.text(timeDifference(time))
                }
                else if (time != "" && notification != "") {
                    no.removeClass("label-light-success")
                    no.addClass("label-danger")
                    no.text(notification)
                    ti.text(timeDifference(time))
                }

            },
            error: function () {
                alert("chat notification fetch error");
            }

        });




    })

}

function fetch_messages(class_id_name, token) {

    $.ajax({
        url: "rest-chat-get",
        method: "POST", //First change type to method here
        data: { "limit": current_chat.limit, "course_id": current_chat.course_id, token: token, "current_chat_id": current_chat.user_id },
        success: function (e, status) {
            console.log(e)
            $("." + class_id_name + "_chat_header").html(current_chat.course_name)//set chat name
            $("." + class_id_name + "_chat_messages_box").html("")//clear the chat

            e.forEach((user, index) => {
                var name = user.user_name
                var time = user.time
                var u_id = user.user_id
                var m = user.message;

                if (e[0].user_id.trim() == current_chat.user_id.trim()) {

                    if (user.user_id == current_chat.user_id) {
                        $("." + class_id_name + "_chat_messages_box").append(left_box(name, m, time))
                    } else {
                        $("." + class_id_name + "_chat_messages_box").append(right_box(name, m, time))
                    }

                } else {
                    if (user.user_id != current_chat.user_id) {
                        $("." + class_id_name + "_chat_messages_box").append(left_box(name, m, time))
                    } else {
                        $("." + class_id_name + "_chat_messages_box").append(right_box(name, m, time))
                    }
                }


            })

        },
        error: function () {
            alert("chat fetch error");
        }

    });

}


//current_time
function timeDifference(previous) {

    var msPerMinute = 60 * 1000;
    var msPerHour = msPerMinute * 60;
    var msPerDay = msPerHour * 24;
    var msPerMonth = msPerDay * 30;
    var msPerYear = msPerDay * 365;

    var elapsed = new Date() - Date.parse(previous);

    if (elapsed < msPerMinute) {
        return Math.round(elapsed / 1000) + ' seconds ago';
    }

    else if (elapsed < msPerHour) {
        return Math.round(elapsed / msPerMinute) + ' minutes ago';
    }

    else if (elapsed < msPerDay) {
        return Math.round(elapsed / msPerHour) + ' hours ago';
    }

    else if (elapsed < msPerMonth) {
        return Math.round(elapsed / msPerDay) + ' days ago';
    }

    else if (elapsed < msPerYear) {
        return Math.round(elapsed / msPerMonth) + ' months ago';
    }

    else {
        return Math.round(elapsed / msPerYear) + ' years ago';
    }
}

//end time



function left_box(name, message, time) {
    var d = timeDifference(time)
    return `
                <!--begin::Message In-->
				<div class="d-flex flex-column mb-5 align-items-start">
					<div class="d-flex align-items-center">
						<div class="symbol symbol-circle symbol-50 mr-3 mt-2  p-5 bg-success text-white font-weight-bold font-size-lg  " style='text-transform: uppercase;'>
                ${name.substring(0, 2)}
						</div>
						<div>
							<a href="#" class="text-dark-75 text-hover-primary font-weight-bold font-size-h6">${name}</a>
							<span class="text-muted font-size-sm">${d}</span>
						</div>
					</div>
					<div class="mt-2 rounded p-5 bg-light-success text-dark-50 font-weight-bold font-size-lg text-left max-w-400px">${message}</div>
				</div>
				<!--end::Message In-->
                `
}


function right_box(name, message, time) {
    var d = timeDifference(time)
    return `
                <!--begin::Message In-->
				<div class="d-flex flex-column mb-5 align-items-end">
					<div class="d-flex align-items-center">
						<div class="symbol symbol-circle symbol-50 mr-3 mt-2  p-5 bg-success text-white font-weight-bold font-size-lg  "  style='text-transform: uppercase;'>
                ${name.substring(0, 2)}
						</div>
						<div>
							<a href="#" class="text-dark-75 text-hover-primary font-weight-bold font-size-h6">${name}</a>
							<span class="text-muted font-size-sm">${d}</span>
						</div>
					</div>
					<div class="mt-2 rounded p-5 bg-light-success text-dark-50 font-weight-bold font-size-lg text-left max-w-400px">${message}</div>
				</div>
				<!--end::Message In-->
                `
}






///this use to change the user chat
function change_user_chat(name, token) {
    $("." + name + "_chat_user").click(e => {
        current_chat.panel = e;

        current_chat.user_id = e.currentTarget.getAttribute("data-user-id");
        current_chat.course_id = e.currentTarget.getAttribute("data-id")
        current_chat.course_name = e.currentTarget.getAttribute("data-course");
        current_chat.user_name = e.currentTarget.getAttribute("data-user-name")

        //when you click a specific chat we clear that chat norification
        fetch_messages(name, token);//get messages
        reset_clicked_user_notification(name)//reset the chat value
        get_notification(name);// update the chat time

    })
}
change_user_chat("group", "get_group_messages")
change_user_chat("group", "get_group_messages")
change_user_chat("private", "get_private_messages")
change_user_chat("private", "get_comment_messages")



//end"


//when the page load , we check for any user assigned and load the first chat panel
function pageLoad(name, token) {
    if ($('.' + name + '_chat_user').length > 0) {

        /// get the first user class and update the current_chat state
        var first_class = $("." + name + "_chat_user").get(0)
        current_chat.panel = first_class;
        current_chat.user_id = first_class.getAttribute("data-user-id");
        current_chat.course_id = first_class.getAttribute("data-id")
        current_chat.course_name = first_class.getAttribute("data-course");
        current_chat.user_name = first_class.getAttribute("data-user-name")

        fetch_messages(name, token);
        get_notification(name);

    }
}
pageLoad("group", "get_group_messages")
pageLoad("group", "get_comment_messages")
pageLoad("private", "get_private_messages")
//end

//disable the button when is empty and on the page load
function chat_textArea(name) {
    $("." + name + "_chat_submit_button").removeClass("btn-primary");
    $("." + name + "_chat_submit_button").addClass("btn-disable");

    $("." + name + "_chat_textarea").on('keyup keydown keypres', e => {

        var value = $("." + name + "_chat_textarea").val();
        current_chat.message = value;
        if (value.trim().length == 0) {

            $("." + name + "_chat_submit_button").removeClass("btn-primary");
            $("." + name + "_chat_submit_button").addClass("btn-disable");

        } else {
            $("." + name + "_chat_submit_button").removeClass("btn-disable");
            $("." + name + "_chat_submit_button").addClass("btn-primary");

        }

    })
}
chat_textArea("group")
chat_textArea("private")
//use to update the chat input and enable or disable the user_button
//end


///sending message
function send_message(name, url, token) {

    $("." + name + "_chat_submit_button").click(e => {
        //alert("send")
        var current_URL = window.location.href.toLowerCase();
        // alert(current_URL);
        //if the current url is contain the run it
        if (current_URL.includes(url)) {
            var message = $("." + name + "_chat_textarea").val();
            if (message.trim().length == 0) return false;// stop excuting when dont have any text

            //clear input
            $("." + name + "_chat_textarea").val("");
            //disable the button
            $("." + name + "_chat_submit_button").removeClass("btn-primary");
            $("." + name + "_chat_submit_button").addClass("btn-disable");

            $.post(url,
                {
                    "user_name": current_chat.user_name,
                    "course_id": current_chat.course_id,
                    "user_id": current_chat.user_id,
                    "time": new Date().toString(),
                    "message": message
                }, (data, status) => {
                    console.log(data)
                    console.log(status)
                    fetch_messages(name, token);
                    get_notification(name);

                });

        }
    })
}
send_message("group", "student-project-chat", "get_comment_messages")

send_message("group", "student-group-view", "get_group_messages")

send_message("private", "student-chat-view", "get_private_messages")
//for the lecturer
send_message("group", "lecturer-group-view", "get_group_messages")
//send_message("private", "lecturer-chat-view", "get_private_messages")
// this is where we send the messages  -> 
send_message("private", "lecture-private-chat", "get_private_messages")



function update_pooling_chat(name, token, time = 7000) {

    if ($('.' + name + '_chat_user').length > 0) {
        setInterval(() => {
            get_notification(name);
            fetch_messages(name, token);
        }, time)
    }
}
update_pooling_chat("group", "get_comment_messages");// update only group chat
update_pooling_chat("group", "get_group_messages");// update only group chat
update_pooling_chat("private", "get_private_messages"); // update only group chat

