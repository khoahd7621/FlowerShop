<%-- 
    Document   : blogdetail
    Created on : Mar 20, 2022, 5:27:40 PM
    Author     : KhoaHD7621
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Blog</title>
        <!-- Favicon -->
        <link rel="icon" type="image/x-icon" href="./images/favicon.png"/>
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        <link href="css/my-styles.css" rel="stylesheet">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="fonts/linearicons-v1.0.0/icon-font.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
        <!--===============================================================================================-->	
        <link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/perfect-scrollbar/perfect-scrollbar.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="css/util.css">
        <link rel="stylesheet" type="text/css" href="css/main.css">
        <!--===============================================================================================-->
    </head>
    <body class="animsition">
        <!-- Home Menu -->
        <%@include file="components/headerComponent.jsp" %>
        <!-- Toast MSG -->
        <div id="toast"></div>

        <!-- breadcrumb -->
        <div class="container">
            <div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
                <a href="HomeController" class="stext-109 cl8 hov-cl1 trans-04 text-decoration-none">
                    Home
                    <i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
                </a>

                <a href="blog" class="stext-109 cl8 hov-cl1 trans-04 text-decoration-none">
                    Blog
                    <i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
                </a>

                <span class="stext-109 cl4">
                    ${requestScope.blog.title}
                </span>
            </div>
        </div>


        <!-- Content page -->
        <section class="bg0 p-t-52 p-b-20">
            <div class="container">
                <div class="row">
                    <div class="col-md-8 col-lg-9 p-b-80">
                        <div class="p-r-45 p-r-0-lg">
                            <!--  -->
                            <div class="wrap-pic-w how-pos5-parent">
                                <img src="${requestScope.blog.mainImgPath}" alt="IMG-BLOG">

                                <div class="flex-col-c-m size-123 bg9 how-pos5">
                                    <span class="ltext-107 cl2 txt-center">
                                        <fmt:formatDate value="${requestScope.blog.createdDate}" pattern="d"/>
                                    </span>
                                    <span class="stext-109 cl3 txt-center">
                                        <fmt:formatDate value="${requestScope.blog.createdDate}" pattern="M"/> <fmt:formatDate value="${requestScope.blog.createdDate}" pattern="y"/>
                                    </span>
                                </div>
                            </div>

                            <div class="p-t-32">
                                <span class="flex-w flex-m stext-111 cl2 p-b-19">
                                    <span>
                                        <span class="cl4">By</span> ${requestScope.blog.account.fullName} 
                                        <span class="cl12 m-l-4 m-r-6">|</span>
                                    </span>

                                    <span>
                                        <fmt:formatDate value="${requestScope.blog.createdDate}" type="date"/>
                                        <span class="cl12 m-l-4 m-r-6">|</span>
                                    </span>

                                    <span>
                                        ${sessionScope.listBlogCategories.get(requestScope.blog.cateId)}
                                        <span class="cl12 m-l-4 m-r-6">|</span>
                                    </span>

                                    <span>
                                        ${requestScope.blog.comment.size()} Comments
                                    </span>
                                </span>

                                <h4 class="ltext-109 cl2 p-b-28">
                                    ${requestScope.blog.title}
                                </h4>

                                <p class="stext-117 cl6 p-b-26">
                                    ${requestScope.blog.content}
                                </p>

                                <p class="stext-117 cl6 p-b-26">
                                    Praesent vel mi bibendum, finibus leo ac, condimentum arcu. Pellentesque sem ex, tristique sit amet suscipit in, mattis imperdiet enim. Integer tempus justo nec velit fringilla, eget eleifend neque blandit. Sed tempor magna sed congue auctor. Mauris eu turpis eget tortor ultricies elementum. Phasellus vel placerat orci, a venenatis justo. Phasellus faucibus venenatis nisl vitae vestibulum. Praesent id nibh arcu. Vivamus sagittis accumsan felis, quis vulputate
                                </p>
                            </div>

                            <div class="flex-w flex-t p-t-16">
                                <span class="size-216 stext-116 cl8 p-t-4">
                                    Tags
                                </span>
                                <div class="flex-w size-217">
                                    <c:forEach items="${requestScope.blog.tags}" var="LT">
                                        <a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5 text-decoration-none">
                                            ${LT.name}
                                        </a>
                                    </c:forEach>
                                </div>
                            </div>
                            
                            <!-- Comment -->
                            <div class="p-t-40">
                                <h5 class="mtext-113 cl2 p-b-12">
                                    Comments
                                </h5>

                                <p class="stext-107 cl6 p-b-40">
                                    かわいいですね！
                                </p>
                            </div>
                            <!-- Write Comment -->
                            <div class="p-t-40">
                                <h5 class="mtext-113 cl2 p-b-12">
                                    Leave a Comment
                                </h5>

                                <p class="stext-107 cl6 p-b-40">
                                    Your email address will not be published. Required fields are marked *
                                </p>

                                <form>
                                    <div class="bor19 m-b-20">
                                        <textarea class="stext-111 cl2 plh3 size-124 p-lr-18 p-tb-15" name="cmt" placeholder="Comment..."></textarea>
                                    </div>

                                    <div class="bor19 size-218 m-b-20">
                                        <input class="stext-111 cl2 plh3 size-116 p-lr-18" type="text" name="name" placeholder="Name *">
                                    </div>

                                    <div class="bor19 size-218 m-b-20">
                                        <input class="stext-111 cl2 plh3 size-116 p-lr-18" type="text" name="email" placeholder="Email *">
                                    </div>

                                    <button class="flex-c-m stext-101 cl0 size-125 bg3 bor2 hov-btn3 p-lr-15 trans-04">
                                        Post Comment
                                    </button>
                                </form>
                            </div>
                        </div>
                    </div>

                    <!-- Side Menu -->
                    <%@include file="components/sideMenuBlogComponent.jsp" %>
                </div>
            </div>
        </section>

        <c:if test="${empty sessionScope.LOGIN_USER}">
            <!-- Subscribe News Letter -->
            <%@include file="components/subscribeNewsLetterComponent.jsp" %>
        </c:if>
        <!-- Footer -->
        <%@include file="components/footerComponent.jsp" %>
        <!-- Back to top -->
        <div class="btn-back-to-top" id="myBtn">
            <span class="symbol-btn-back-to-top">
                <i class="zmdi zmdi-chevron-up"></i>
            </span>
        </div>
        <!-- Bootstrap core JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Jquery -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <!-- Toast Alert script -->
        <script src="js/toast-alert.js"></script>
        <!-- Axios Async -->
        <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
        <!-- Add-to-cart async script -->
        <script src="js/add-to-cart-async.js"></script>
        <!-- Load-more script -->
        <script src="js/load-more.js"></script>
        <!-- Subscribe News Letter script -->
        <script src="js/subscribe-newsletter.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/animsition/js/animsition.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/bootstrap/js/popper.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/select2/select2.min.js"></script>
        <script>
            $(".js-select2").each(function () {
                $(this).select2({
                    minimumResultsForSearch: 20,
                    dropdownParent: $(this).next('.dropDownSelect2')
                });
            })
        </script>
        <!--===============================================================================================-->
        <script src="vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
        <script>
            $('.js-pscroll').each(function () {
                $(this).css('position', 'relative');
                $(this).css('overflow', 'hidden');
                var ps = new PerfectScrollbar(this, {
                    wheelSpeed: 1,
                    scrollingThreshold: 1000,
                    wheelPropagation: false,
                });

                $(window).on('resize', function () {
                    ps.update();
                })
            });
        </script>
        <!--===============================================================================================-->
        <script src="js/main.js"></script>

    </body>
</html>
