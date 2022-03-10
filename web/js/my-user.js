$('document').ready(function () {
    let update_profiler_input_phone_error = $('#update-profile-input-phone-error');

    function isVietnamesePhoneNumber(number) {
        return /(03|05|07|08|09|01[2|6|8|9])+([0-9]{8})\b/.test(number);
    }

    $('#update-profile-input-phone').keyup(function () {
        let phoneValue = this.value;
        if (!isVietnamesePhoneNumber(phoneValue)) {
            update_profiler_input_phone_error.html('Invalid phone number!');
        } else {
            update_profiler_input_phone_error.html('');
        }
    });

    let updateBtn = $('#update-profile-btn');
    let updateForm = $('#update-form');

    updateBtn.click(function () {

        if ($.trim($("#update-profile-input-phone-error").html()) === '') {
            $('#update-profile-error').html('');
            updateForm.attr('onsubmit', 'return true');
        } else {
            $('#update-profile-error').html('Please correct all errors before perform update information!');
            updateForm.attr('onsubmit', 'return false');
        }
    });

    let new_psw_input = $('#new-psw-input');
    let rp_new_psw_input = $('#rp-new-psw-input');

    let new_psw_input_error = $('#new-psw-input-error');
    let rp_new_psw_input_error = $('#rp-new-psw-input-error');

    new_psw_input.keyup(function () {
        let lengthPsw = new_psw_input.val().length;
        if (lengthPsw < 6) {
            new_psw_input_error.html('Password must at least 6 characters and less than 50 characters!');
        } else {
            new_psw_input_error.html('');
        }
    });

    new_psw_input.focusout(function () {
        let lengthRpPsw = rp_new_psw_input.val().length;
        if (lengthRpPsw !== 0) {
            if (!(new_psw_input.val() === rp_new_psw_input.val())) {
                rp_new_psw_input_error.html('Repeat password must match New Password!');
            } else {
                rp_new_psw_input_error.html('');
            }
        }
    });

    rp_new_psw_input.keyup(function () {
        if (!(rp_new_psw_input.val() === new_psw_input.val())) {
            rp_new_psw_input_error.html('Repeat password must match New Password!');
        } else {
            rp_new_psw_input_error.html('');
        }
    });

    let changePswBtn = $('#change-psw-btn');
    let changePswForm = $('#change-psw-form');

    changePswBtn.click(function () {
        if (($.trim($("#new-psw-input-error").html()) === '') && $.trim($("#rp-new-psw-input-error").html()) === '') {
            $('#change-psw-error').html('');
            changePswForm.attr('onsubmit', 'return true');
        } else {
            $('#change-psw-error').html('Please correct all errors before perform registration!');
            changePswForm.attr('onsubmit', 'return false');
        }
    });
});