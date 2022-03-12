<%-- 
    Document   : cartComponent
    Created on : Mar 11, 2022, 3:47:16 PM
    Author     : KhoaHD7621
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="unempty-cart">
    <div class="text-start ms-4">New products added</div>
    <c:forEach items="${sessionScope.carts}" var="C">
        <div class="product row mt-2 w-100 m-0">
            <div class="col-3">
                <img class="img-fluid border border-1"
                     src="${C.value.plant.imgPath}"
                     alt="Product Images">
            </div>
            <div class="col-6 default-cursor">
                ${C.value.plant.name}
            </div>
            <div class="col-3 default-cursor text-danger">
                $${C.value.plant.price}
            </div>
        </div>
    </c:forEach>
    <div class="text-end pt-3 pe-3">
        <c:url var="viewCartLink" value="CartController"></c:url>
        <a href="${viewCartLink}" class="btn btn-danger pe-3">View cart</a>
    </div>
</div>
