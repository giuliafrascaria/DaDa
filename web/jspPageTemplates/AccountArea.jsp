<div class="site-branding-area" style="display: block">
    <div class="container">
        <div class="row">

            <div class="col-sm-6">
                <div class="logo">
                    <%--<h1><a href="index.jsp"><span>DaDa</span></a></h1>--%>
                    <h1><a href="home.jsp"></a></h1>
                    <img src="img/DaDalogo.png" style="width:150px;height:150px; padding:10px">
                </div>
            </div>




            <%--<div class="col-sm-6">
                <div class="shopping-item2">
                    <span class="cart-amunt"> Account: <jsp:getProperty name="UserBean" property="name"/> </span> <img class="img-circle" src="img/slide-2.jpg">
                </div>

            </div>--%>

            <div class="user-menu">
                <ul>

                    <li><a href="registrationSummary.jsp"><i class="fa fa-user"></i>Ciao, <jsp:getProperty name="UserBean" property="name"/></a></li>
                    <li><a href="login.jsp"><i class="fa fa-user"></i>Logout</a></li>
                </ul>
            </div>


        </div>
    </div>
</div><!-- End site branding area -->
