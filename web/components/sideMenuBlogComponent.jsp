<%-- 
    Document   : sideMenuBlogComponent
    Created on : Mar 20, 2022, 11:23:39 PM
    Author     : KhoaHD7621
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="col-md-4 col-lg-3 p-b-80">
    <div class="side-menu">
        <div class="bor17 of-hidden pos-relative">
            <input class="stext-103 cl2 plh4 size-116 p-l-28 p-r-55" type="text" name="search" placeholder="Search">

            <button class="flex-c-m size-122 ab-t-r fs-18 cl4 hov-cl1 trans-04">
                <i class="bi bi-search"></i>
            </button>
        </div>

        <div class="p-t-55">
            <h4 class="mtext-112 cl2 p-b-33">
                Categories
            </h4>

            <ul class="p-0">
                <c:forEach items="${sessionScope.listBlogCategories}" var="C">
                    <li class="bor18">
                        <a href="#" class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4 text-decoration-none">
                            ${C.value}
                        </a>
                    </li>
                </c:forEach>
            </ul>
        </div>
        <!-- Product -->
        <div class="p-t-65">
            <h4 class="mtext-112 cl2 p-b-33">
                Featured Products
            </h4>
            <ul class="p-0">
                <c:forEach items="${requestScope.listPlants}" var="P">
                    <li class="flex-w flex-t p-b-30">
                    <c:url var="linkImg" value="PlantDetailController">
                        <c:param name="pid" value="${P.id}"></c:param>
                    </c:url>
                    <a href="${linkImg}" class="wrao-pic-w size-214 hov-ovelay1 m-r-20 text-decoration-none">
                        <img src="${P.imgPath}" alt="PRODUCT" style="width: 100%;">
                    </a>

                    <div class="size-215 flex-col-t p-t-8">
                        <c:url var="linkName" value="PlantDetailController">
                            <c:param name="pid" value="${P.id}"></c:param>
                        </c:url>
                        <a href="${linkName}" class="stext-116 cl8 hov-cl1 trans-04 text-decoration-none">
                            ${P.name}
                        </a>

                        <span class="stext-116 cl6 p-t-20">
                            $${P.price}
                        </span>
                    </div>
                    </li>
                </c:forEach>
            </ul>
        </div>

        <div class="p-t-55">
            <h4 class="mtext-112 cl2 p-b-20">
                Archive
            </h4>

            <ul class="p-0">
                <li class="p-b-7">
                    <a href="#" class="flex-w flex-sb-m stext-115 cl6 hov-cl1 trans-04 p-tb-2 text-decoration-none">
                        <span>March 2022</span><span>(1)</span>
                    </a>
                </li>
                <li class="p-b-7">
                    <a href="#" class="flex-w flex-sb-m stext-115 cl6 hov-cl1 trans-04 p-tb-2 text-decoration-none">
                        <span>February 2022</span><span>(2)</span>
                    </a>
                </li>
                <li class="p-b-7">
                    <a href="#" class="flex-w flex-sb-m stext-115 cl6 hov-cl1 trans-04 p-tb-2 text-decoration-none">
                        <span>January 2022</span><span>(0)</span>
                    </a>
                </li>
            </ul>
        </div>

        <div class="p-t-50">
            <h4 class="mtext-112 cl2 p-b-27">
                Tags
            </h4>
            <div class="flex-w m-r--5">
                <c:forEach items="${sessionScope.listBlogTags}" var="T">
                    <a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5 text-decoration-none">
                        ${T.value}
                    </a>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
