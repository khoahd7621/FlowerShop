<%-- 
    Document   : cartBarComponent
    Created on : Mar 21, 2022, 9:24:15 AM
    Author     : KhoaHD7621
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="wrap-header-cart js-panel-cart">
    <div class="s-full js-hide-cart"></div>
    <div class="header-cart flex-col-l p-l-35 p-r-25">
        <div class="header-cart-title flex-w flex-sb-m p-b-8">
            <span class="mtext-103 cl2">
                Your Cart
            </span>
            <div class="fs-35 lh-10 cl2 p-lr-5 pointer hov-cl1 trans-04 js-hide-cart">
                <i class="zmdi zmdi-close"></i>
            </div>
        </div>
        <div id="cartBox">
            <c:choose>
                <c:when test="${(sessionScope.carts == null) || (sessionScope.carts.size() == 0)}">
                    <div class="empty-cart text-center">
                        <img class="img-fluid" src="images/empty-cart.png" alt="Empty Cart Image">
                        <div class="header-cart-total mt-3">Your cart is empty</div>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="header-cart-content flex-w js-pscroll">
                        <ul id="cartBoxBody" class="header-cart-wrapitem w-full p-0">
                            <c:forEach items="${sessionScope.carts}" var="C">
                                <li class="header-cart-item flex-w flex-t m-b-12">
                                    <div class="header-cart-item-img">
                                        <img src="${C.value.plant.imgPath}" alt="IMG">
                                    </div>

                                    <div class="header-cart-item-txt p-t-8">
                                        <c:url var="detailLink" value="PlantDetailController">
                                            <c:param name="pid" value="${C.value.plant.id}"></c:param>
                                        </c:url>
                                        <a href="${detailLink}" class="header-cart-item-name m-b-18 hov-cl1 trans-04 text-decoration-none">
                                            ${C.value.plant.name}
                                        </a>

                                        <span class="header-cart-item-info">
                                            $${C.value.plant.price}
                                        </span>
                                    </div>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
        <div class="w-full mt-5">
            <div id="cartBarBtn" class="header-cart-buttons flex-w w-full">
                <c:url var="viewCartLink" value="CartController"></c:url>
                <a href="${viewCartLink}" class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-r-8 m-b-10 text-decoration-none">
                    View Cart
                </a>
                <c:if test="${(sessionScope.carts != null) && (sessionScope.carts.size() > 0)}">
                    <a href="CheckOutController" class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-b-10 text-decoration-none">
                        Check Out
                    </a>
                </c:if>
            </div>
        </div>
    </div>
</div>
