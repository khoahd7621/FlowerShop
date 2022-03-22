<%-- 
    Document   : shopByCategoryComponents
    Created on : Mar 4, 2022, 1:28:32 PM
    Author     : KhoaHD7621
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<section class="pt-4 shop-by-category text-black">
    <div class="d-flex align-items-center justify-content-center default-cursor fs-1 section-title">
        <hr class="d-inline-block me-3" width="20%" />
        Shop by Category
        <hr class="d-inline-block ms-3" width="20%" />
    </div>
    <div class="container px-4 px-lg-5 mt-4">
        <div class="row content d-flex align-items-center justify-content-center">
            <c:forEach items="${sessionScope.listCategories}" var="cate" begin="0" end="3" step="1" varStatus="count">
                <c:url var="mylink" value="ViewAllController">
                    <c:param name="category" value="${cate.key}"></c:param>
                </c:url>
                <a href="${mylink}" class="col-6 col-lg-3 d-flex align-items-center justify-content-end position-relative">
                    <img src="./images/Category (${count.index + 1}).png" alt="">
                    <div class="title position-absolute">${cate.value}</div>
                    <div class="sub-title position-absolute">
                        <c:choose>
                            <c:when test="${count.index == 0}">
                                Products
                            </c:when>
                            <c:when test="${count.index == 1}">
                                Save 30%
                            </c:when>
                            <c:when test="${count.index == 2}">
                                New 2022
                            </c:when>
                            <c:when test="${count.index == 3}">
                                Flowers
                            </c:when>
                        </c:choose>
                    </div>
                </a>
            </c:forEach>
        </div>
    </div>
</section>
