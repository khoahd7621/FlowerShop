function addToCartAsync(pid) {
    axios.get('AddToCartAsyncController', {
        params: {
            pid: pid
        },
        responseType: 'json'
    }).then((response) => {
        // Update number plant in carts
        document.getElementById("cartNumPC").setAttribute('data-notify', response.data.length);
        document.getElementById("cartNumMB").setAttribute('data-notify', response.data.length);
        document.getElementById("cartBox").innerHTML = `
                    <div class="header-cart-content flex-w js-pscroll">
                        <ul id="cartBoxBody" class="header-cart-wrapitem w-full p-0">
                        </ul>
                    </div>`;
        let cartBoxBody = document.getElementById("cartBoxBody");
        let plants = response.data;
        for (let i = 0; i < plants.length; i++) {
            cartBoxBody.innerHTML += `<li class="header-cart-item flex-w flex-t m-b-12">
                                            <div class="header-cart-item-img">
                                                <img src="${plants[i]['imgPath']}" alt="IMG">
                                            </div>
                                            <div class="header-cart-item-txt p-t-8">
                                                <a href="PlantDetailController?pid=" class="header-cart-item-name m-b-18 hov-cl1 trans-04 text-decoration-none">
                                                    ${plants[i]['name']}
                                                </a>
                                                <span class="header-cart-item-info">
                                                    $${plants[i]['price']}
                                                </span>
                                            </div>
                                      </li>`;
        }
        document.getElementById("cartBarBtn").innerHTML = `
                            <a href="CartController" class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-r-8 m-b-10 text-decoration-none">
                                View Cart
                            </a>
                            <a href="CheckOutController" class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-b-10 text-decoration-none">
                                Check Out
                            </a>`;

        toast({
            title: 'Success',
            message: 'Add product to cart successfully',
            type: 'success',
            duration: 3000
        });

    })
}
