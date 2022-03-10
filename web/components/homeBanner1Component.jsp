<%-- 
    Document   : homeBanner1Component
    Created on : Mar 4, 2022, 1:10:41 PM
    Author     : KhoaHD7621
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="banner">
    <div class="container" style="height: 100%;">
        <div class="banner__body row position-relative" style="height: 100%;">
            <div class="banner__left col-md-6 d-flex justify-content-center flex-column">
                <div class="sub-title">
                    Fresh Flower
                </div>
                <div class="main-title">
                    Find your own happiness
                </div>
                <div class="discount-info">
                    Our Purchase of 50 dollars use coupon code
                </div>
                <div class="discount-code">
                    FLOWER20
                </div>
                <form action="ViewAllController">
                    <button type="submit" class="btn btn-danger btn-shop-now">Shop Now</button>
                </form>
            </div>
            <div
                class="banner__right col-md-6 d-flex justify-content-center align-items-center flex-column position-relative">
                <img class="img-banner" src="images/banner.jpg" alt="Banner Image">
                <div class="crl circle-1 position-absolute"></div>
                <div class="crl circle-2 position-absolute"></div>
            </div>
            <div class="banner__percentage position-absolute">
                SALE UP TO
                <div class="number">
                    50%
                </div>
            </div>
            <div class="banner__more-infor">
                <div class="col-md-3">
                    <div class="row">
                        <div class="icon col-md-3 col-4 d-flex justify-content-end align-items-center">
                            <i class="bi bi-truck"></i>
                        </div>
                        <div class="col-md-9 col-8">
                            <div class="header">Free shipping</div>
                            <div>On all orders over $49.00</div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="row">
                        <div class="icon col-md-3 col-4 d-flex justify-content-end align-items-center">
                            <i class="bi bi-currency-exchange"></i>
                        </div>
                        <div class="col-md-9 col-8">
                            <div class="header">15 days returns</div>
                            <div>Moneyback guarantee</div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="row">
                        <div class="icon col-md-3 col-4 d-flex justify-content-end align-items-center">
                            <i class="bi bi-credit-card-2-back"></i>
                        </div>
                        <div class="col-md-9 col-8">
                            <div class="header">Secure checkout</div>
                            <div>Protected by Paypal</div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="row">
                        <div class="icon col-md-3 col-4 d-flex justify-content-end align-items-center">
                            <i class="bi bi-gift-fill"></i>
                        </div>
                        <div class="col-md-9 col-8">
                            <div class="header">Offer & gift here</div>
                            <div>On all orders over</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>