<%-- 
    Document   : footerComponent
    Created on : Mar 4, 2022, 1:10:09 PM
    Author     : KhoaHD7621
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="subcribe-receive-email">
    <div class="layer">
        <div class="container">
            <form id="form-subscribe" class="text-center pt-5 pb-5">
                <div class="text-uppercase title default-cursor">Our newsletter</div>
                <div class="mt-4 mb-4 label default-cursor">Enter Your Email Address To Join Our Mailing List And
                    Keep Yourself
                    Update</div>
                <div class="mb-3">
                    <input id="emailSubscribe" name="email" type="email" placeholder="Enter your email..." required/>
                </div>
                <button id="subscribeEmail" class="btn-subs" type="submit" value="subscribeEmail" >Subscribe</button>
            </form>
            <div id="success-alert" class="row justify-content-center" style="margin-top: -30px">
                <div class="alert alert-success col-md-7" >
                    <h4 class="alert-heading">Well done!</h4>
                    <p>Thank you for signing up to receive information from us. You will receive an email from us soon!</p>
                </div>
            </div>
        </div>

    </div>
</div>
<footer class="py-3">
    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <img class="logo" src="images/logo.png" alt="Shop Logo">
                <p class="default-cursor">Duis aute irure dolor in reprehendenderit in voluptate velit esse cillum
                    dolore eu fugiat nulla pariatuur.</p>
            </div>
            <div id="quick-link" class="col-lg-6">
                <div class="title default-cursor">Quick Links</div>
                <table>
                    <tr>
                        <td>
                            <ul class="quick-ul">
                                <li type="square"><a href="#">Shop Flowers</a></li>
                                <li type="square"><a href="#">Shop Plants</a></li>
                                <li type="square"><a href="#">Weddings</a></li>
                                <li type="square"><a href="#">Funeral</a></li>
                            </ul>
                        </td>
                        <td>
                            <ul class="quick-ul">
                                <li type="square"><a href="#">Flower</a></li>
                                <li type="square"><a href="#">Delivery</a></li>
                                <li type="square"><a href="#">Contact Us</a></li>
                                <li type="square"><a href="#">Terms and Conditions</a></li>
                            </ul>
                        </td>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="col-lg-3 mailing-address">
                <div class="title default-cursor">Mailing Address</div>
                <div class="default-cursor"><i class="bi bi-building"></i> 11700 183 Rd St, Artesia, CA 90701
                </div>
                <div class="default-cursor"><i class="bi bi-phone"></i> +84 123456789</div>
                <div class="default-cursor"><i class="bi bi-envelope"></i> info@myflower.com</div>
            </div>
        </div>
        <p class="copyright text-center default-cursor">© Copy right 2022 flower. | All Right Reserved.</p>
    </div>
</footer>
