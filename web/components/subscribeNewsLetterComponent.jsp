<%-- 
    Document   : subscribeNewsLetterComponent
    Created on : Mar 14, 2022, 5:40:07 PM
    Author     : KhoaHD7621
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="subcribe-receive-email">
    <div class="layer">
        <div class="container">
            <form id="form-subscribe" class="text-center pt-5 pb-5" onsubmit="return false">
                <div class="text-uppercase title default-cursor">Our newsletter</div>
                <div class="mt-4 mb-4 label default-cursor">Enter Your Email Address To Join Our Mailing List And
                    Keep Yourself
                    Update</div>
                <div class="mb-3">
                    <input id="emailSubscribe" name="email" type="email" placeholder="Enter your email..." value="" required/>
                </div>
                <button onclick="subscribeNewsLetter()" id="subscribeEmail" class="btn-subs" type="submit" value="subscribeEmail" >Subscribe</button>
            </form>
        </div>
    </div>
</div>