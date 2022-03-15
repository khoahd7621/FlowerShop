function subscribeNewsLetter() {
    axios.get('SendEmailController', {
        params: {
            email: document.getElementById("emailSubscribe").value,
            action: document.getElementById("subscribeEmail").value
        },
    }).then((response) => {
        toast({
            title: 'Success',
            message: 'Thank you for signing up to receive information from us!',
            type: 'success',
            duration: 5000
        });
    }).catch ((exception) => {
        toast({
            title: 'Error',
            message: 'An error has occurred! Please contact admin!',
            type: 'error',
            duration: 5000
        });
    });
    return false;
}



