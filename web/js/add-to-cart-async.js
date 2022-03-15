function addToCartAsync(pid) {
    axios.get('AddToCartAsyncController', {
        params: {
            pid: pid
        },
        responseType: 'json'
    }).then((response) => {
        // Update number plant in carts
        document.getElementById("cartNum").innerHTML = response.data.length;
        document.getElementById("cartBox").innerHTML = `<div class="unempty-cart">
                                                            <div class="text-start ms-4">New products added</div>
                                                            <div id="cartBoxBody"></div>
                                                            <div class="text-end pt-3 pe-3">
                                                                <a href="CartController" class="btn btn-danger pe-3">View cart</a>
                                                            </div>
                                                        </div>`;
        let cartBoxBody = document.getElementById("cartBoxBody");
        let plants = response.data;
        for (let i = 0; i < plants.length; i++) {
            cartBoxBody.innerHTML += `<div class="product row mt-2 w-100 m-0">
                                        <div class="col-3">
                                            <img class="img-fluid border border-1" src="${plants[i]['imgPath']}" alt="Product Images">
                                        </div>
                                        <div class="col-6 default-cursor">
                                            ${plants[i]['name']}
                                        </div>
                                        <div class="col-3 default-cursor text-danger">
                                            $${plants[i]['price']}
                                        </div>
                                    </div>`;
        }

        toast({
            title: 'Success',
            message: 'Add product to cart successfully',
            type: 'success',
            duration: 3000
        });

    })
}
