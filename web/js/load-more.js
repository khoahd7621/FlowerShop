function loadMore(action, elem) {
    let amount = document.getElementsByClassName("product-all").length;
    axios.get('LoadMoreController', {
        params: {
            action: action,
            exists: amount,
            cateId: elem.value
        }
    }).then((response) => {
        if (action === "loadMoreOurProduct") {
            let home_all_product = document.getElementById("home-all-product");
            let plants = response.data[1];
            for (let i = 0; i < plants.length; i++) {
                home_all_product.innerHTML += `<!-- Product -->
                        <div class="col mb-5 product-all">
                            <div class="card h-100">
                                <!-- Sale badge-->
                                <div class="position-absolute bg-black text-white default-cursor"
                                     style="padding: 5px 15px; left: 15px; top: 15px;">
                                    ${plants[i]['status'] == 1 ? "Available" : "Unavailable"}
                                </div>
                                <!-- Product image-->
                                <a href="PlantDetailController?pid=${plants[i]['id']}" class="img-h-350"><img src="${plants[i]['imgPath']}" alt="Plant IMG"/></a>
                                <!-- Product details-->
                                <div class="card-body p-2">
                                    <div class="text-center product-info">
                                        <div class="category ms-3 mt-3 text-start">
                                            ${response.data[0][plants[i]['categoryId']]}
                                        </div>
                                        <!-- Product name-->
                                        <div class="name">
                                            <a href="PlantDetailController?pid=${plants[i]['id']}" class="text-decoration-none text-black">
                                                ${plants[i]['name']}
                                            </a>
                                        </div>
                                        <!-- Product reviews-->
                                        <div class="d-flex justify-content-center small text-warning mb-2">
                                            <div class="bi-star-fill"></div>
                                            <div class="bi-star-fill"></div>
                                            <div class="bi-star-fill"></div>
                                            <div class="bi-star-fill"></div>
                                            <div class="bi-star-fill"></div>
                                        </div>
                                        <!-- Product price-->
                                        <div class="price text-center fs-4 fw-bold default-cursor">
                                            <span class="text-muted text-decoration-line-through">$20</span>
                                            $${plants[i]['price']}
                                        </div>
                                    </div>
                                </div>
                                <!-- Product actions-->
                                <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                    <div class="text-center">
                                        <a onclick="addToCartAsync(${plants[i]['id']})" class="btn btn-outline-dark mt-auto w-50"><i
                                                class="bi bi-cart-plus-fill"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>`;
            }
        } else if (action === "loadProductsById") {
            let home_best_seller = document.getElementById("home-best-seller");
            let plants = response.data[1];
            home_best_seller.innerHTML = '';
            for (let i = 0; i < plants.length; i++) {
                home_best_seller.innerHTML += `<!-- Product -->
                        <div class="col mb-5 product-all">
                            <div class="card h-100">
                                <!-- Sale badge-->
                                <div class="position-absolute bg-black text-white default-cursor"
                                     style="padding: 5px 15px; left: 15px; top: 15px;">
                                    ${plants[i]['status'] == 1 ? "Available" : "Unavailable"}
                                </div>
                                <!-- Product image-->
                                <a href="PlantDetailController?pid=${plants[i]['id']}" class="img-h-350"><img src="${plants[i]['imgPath']}" alt="Plant IMG"/></a>
                                <!-- Product details-->
                                <div class="card-body p-2">
                                    <div class="text-center product-info">
                                        <div class="category ms-3 mt-3 text-start">
                                            ${response.data[0][plants[i]['categoryId']]}
                                        </div>
                                        <!-- Product name-->
                                        <div class="name">
                                            <a href="PlantDetailController?pid=${plants[i]['id']}" class="text-decoration-none text-black">
                                                ${plants[i]['name']}
                                            </a>
                                        </div>
                                        <!-- Product reviews-->
                                        <div class="d-flex justify-content-center small text-warning mb-2">
                                            <div class="bi-star-fill"></div>
                                            <div class="bi-star-fill"></div>
                                            <div class="bi-star-fill"></div>
                                            <div class="bi-star-fill"></div>
                                            <div class="bi-star-fill"></div>
                                        </div>
                                        <!-- Product price-->
                                        <div class="price text-center fs-4 fw-bold default-cursor">
                                            <span class="text-muted text-decoration-line-through">$20</span>
                                            $${plants[i]['price']}
                                        </div>
                                    </div>
                                </div>
                                <!-- Product actions-->
                                <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                    <div class="text-center">
                                        <a onclick="addToCartAsync(${plants[i]['id']})" class="btn btn-outline-dark mt-auto w-50"><i
                                                class="bi bi-cart-plus-fill"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>`;
            }
        }
    });
}


