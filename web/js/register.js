$('document').ready(function() {
    let register_input_psw = $('#register-input-psw');
    let register_input_rp_psw = $('#register-input-rp-psw');

    let register_input_psw_error = $('#register-input-psw-error');
    let register_input_rp_psw_error = $('#register-input-rp-psw-error');
    let register_mail_input_error = $('#register-mail-input-error');
    let register_input_phone_error = $('#register-input-phone-error');
    let register_privacy_radio_error = $('#register-privacy-radio-error');

    $("#register-mail-input").keyup(function () {
        var VAL = this.value;

        var email = new RegExp(/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/);

        if (email.test(VAL)) {
            register_mail_input_error.html('');
        } else {
            register_mail_input_error.html('Invalid email! Please follow sample: example@company.com');
        }
    });

    function isVietnamesePhoneNumber(number) {
        return /(03|05|07|08|09|01[2|6|8|9])+([0-9]{8})\b/.test(number);
    }

    $('#register-input-phone').keyup(function() {
        let phoneValue = this.value;
        if (!isVietnamesePhoneNumber(phoneValue)) {
            register_input_phone_error.html('Invalid phone number!');
        } else {
            register_input_phone_error.html('');
        }
    });

    register_input_psw.keyup(function() {
        let lengthPsw = register_input_psw.val().length;
        if (lengthPsw < 6) {
            register_input_psw_error.html('Password must at least 6 characters and less than 50 characters!');
        } else {
            register_input_psw_error.html('');
        }
    });

    register_input_psw.focusout(function() {
        let lengthRpPsw = register_input_rp_psw.val().length;
        if (lengthRpPsw != 0) {
            if (!(register_input_psw.val() == register_input_rp_psw.val())) {
                register_input_rp_psw_error.html('Repeat password must match New Password!');
            } else {
                register_input_rp_psw_error.html('');
            }
        }
    });

    register_input_rp_psw.keyup(function() {
        if (!(register_input_rp_psw.val() === register_input_psw.val())) {
            register_input_rp_psw_error.html('Repeat password must match New Password!');
        } else {
            register_input_rp_psw_error.html('');
        }
    });

    let registerBtn = $('#register-btn');
    let registerForm = $('#register-form');

    registerBtn.click(function() {
        let isChecked = $('#register-privacy-radio').prop('checked');
        if (isChecked) {
            register_privacy_radio_error.html('');
        } else {
            register_privacy_radio_error.html('Please tick to agree to the Terms of service');
        }

        if ($('#register-mail-input-error').is(':empty') &&
            $('#register-input-phone-error').is(':empty') &&
            $('#register-input-psw-error').is(':empty') && 
            $('#register-input-rp-psw-error').is(':empty') &&
            $('#register-privacy-radio-error').is(':empty')) {
            $('#register-error').html('');
            registerForm.attr('onsubmit', 'return true');
        } else {
            $('#register-error').html('Please correct all errors before perform registration!');
            registerForm.attr('onsubmit', 'return false');
        }
    });
});