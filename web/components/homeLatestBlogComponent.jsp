<%-- 
    Document   : homeLatestBlogComponent
    Created on : Mar 4, 2022, 1:24:29 PM
    Author     : KhoaHD7621
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<section class="pt-1 pb-5 latest-blog text-black" style="background-color: #f3f3f3;">
    <div class="d-flex align-items-center default-cursor justify-content-center fs-1 section-title pt-4">
        <hr class="d-inline-block me-3" width="20%" />
        Latest Blog
        <hr class="d-inline-block ms-3" width="20%" />
    </div>
    <div class="container px-4 px-lg-5 mt-4">
        <div class="row d-flex align-items-center justify-content-center">
            <c:forEach items="${requestScope.listBlogs}" var="BL">
                <!-- Blog post-->
                <div class="col-6 col-lg-4 ps-3 pe-3">
                    <c:url var="linkDetail" value="blogDetail">
                        <c:param name="bid" value="${BL.id}"></c:param>
                    </c:url>
                    <a href="${linkDetail}"><img class="card-img-top" src="${BL.coverImgPath}" alt="..." /></a>
                    <div class="card-body">
                        <div class="small text-muted default-cursor"></div>
                        <h2 class="card-title h4 default-cursor">${BL.title}</h2>
                        <p class="card-text default-cursor">${BL.description}</p>
                        <a class="btn btn-primary fs-14px mt-3" href="${linkDetail}">Read more →</a>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</section>
