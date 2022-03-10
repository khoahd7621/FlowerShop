function loadMore(action, elem) {
    let amount = document.getElementsByClassName("product-all").length;
    $.ajax({
        url: "/FlowerShop/LoadMoreController",
        type: 'GET',
        data: {
            action: action,
            exists: amount,
            cateId: elem.value
        },
        success: function (data) {
            if (action === "loadMoreOurProduct") {
                let row = document.getElementById("home-all-product");
                row.innerHTML += data;
            } else if (action === "loadProductsById") {
                let row = document.getElementById("home-best-seller");
                row.innerHTML = data;
            }
        }
    });
}

$("#success-alert").hide();

$('#form-subscribe').submit(function (event) {

    let formData = {
        email: $('#emailSubscribe').val(),
        action: $('#subscribeEmail').val()
    };

    $.ajax({
        url: "/FlowerShop/SendEmailController",
        type: 'POST',
        data: formData,
        success: function (data) {
            console.log("Success");
        }
    });

    event.preventDefault();
});

$("#subscribeEmail").click(function showAlert() {
    $("#success-alert").fadeTo(4000, 500).slideUp(500, function () {
        $("#success-alert").slideUp(500);
    });
});