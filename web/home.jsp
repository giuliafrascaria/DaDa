<%--
  Created by IntelliJ IDEA.
  User: giogge
  Date: 23/01/17
  Time: 16:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="UserBean" scope="session" class="javabean.UserBean"/>
<html>
<head>
    <title>DaDa - HOMEPAGE </title>
    <jsp:include page="jspPageTemplates/head.jsp" flush="true" />


</head>
<body>
<jsp:include page="jspPageTemplates/headerArea.jsp" flush="true" />

<jsp:include page="jspPageTemplates/brandingArea.jsp" flush="true"/>

<jsp:include page="jspPageTemplates/mainMenu.jsp" flush="true" />
<div style="text-align: center">
    <div class='slider'>
        <div class='slide1'></div>
        <div class='slide2'></div>
        <div class='slide3'></div>
    </div>
</div>
<%--

<div class="slider-area">
    <div class="zigzag-bottom"></div>
    <div id="slide-list" class="carousel carousel-fade slide" data-ride="carousel">

        <div class="slide-bulletz">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <ol class="carousel-indicators slide-indicators">
                            <li data-target="#slide-list" data-slide-to="0" class="active"></li>
                            <li data-target="#slide-list" data-slide-to="1"></li>
                            <li data-target="#slide-list" data-slide-to="2"></li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>

        <div class="carousel-inner" role="listbox">
            <div class="item active">
                <div class="single-slide">
                    <div class="slide-bg slide-one"></div>
                    <div class="slide-text-wrapper">
                        <div class="slide-text">
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-6 col-md-offset-6">
                                        <div class="slide-content">
                                            <h2>We are awesome</h2>
                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consequuntur, dolorem, excepturi. Dolore aliquam quibusdam ut quae iure vero exercitationem ratione!</p>
                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Modi ab molestiae minus reiciendis! Pariatur ab rerum, sapiente ex nostrum laudantium.</p>
                                            <a href="" class="readmore">Learn more</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="single-slide">
                    <div class="slide-bg slide-two"></div>
                    <div class="slide-text-wrapper">
                        <div class="slide-text">
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-6 col-md-offset-6">
                                        <div class="slide-content">
                                            <h2>We are great</h2>
                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Saepe aspernatur, dolorum harum molestias tempora deserunt voluptas possimus quos eveniet, vitae voluptatem accusantium atque deleniti inventore. Enim quam placeat expedita! Quibusdam!</p>
                                            <a href="" class="readmore">Learn more</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="single-slide">
                    <div class="slide-bg slide-three"></div>
                    <div class="slide-text-wrapper">
                        <div class="slide-text">
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-6 col-md-offset-6">
                                        <div class="slide-content">
                                            <h2>We are superb</h2>
                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolores, eius?</p>
                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Deleniti voluptates necessitatibus dicta recusandae quae amet nobis sapiente explicabo voluptatibus rerum nihil quas saepe, tempore error odio quam obcaecati suscipit sequi.</p>
                                            <a href="" class="readmore">Learn more</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div> <!-- End slider area -->
--%>





<script>
    var myIndex = 0;
    carousel();

    function carousel() {
        var i;
        var x = document.getElementsByClassName("mySlides");
        for (i = 0; i < x.length; i++) {
            x[i].style.display = "none";
        }
        myIndex++;
        if (myIndex > x.length) {myIndex = 1}
        x[myIndex-1].style.display = "block";
        setTimeout(carousel, 2000); // Change image every 2 seconds
    }
</script>

<jsp:include page="jspPageTemplates/footerArea.jsp" flush="true" />
<script src="jspPageTemplates/js/sliderImages.js"></script>
</body>
</html>
