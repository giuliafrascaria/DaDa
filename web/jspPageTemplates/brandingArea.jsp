<jsp:useBean id="UserBean" scope="session" class="javabean.UserBean"/>

<style>
    .navlist
    {
        display: table;
        padding: 20px;
    }

    .navlist li
    {
        display: table-cell;
        padding-right: 30px;
        white-space: nowrap;
    }

    .navlist li:last-child
    {
        padding-right: 60px;
    }

    .navlist li.span-full
    {
        width: 100%;
    }

</style>

<%
    if (UserBean.getEmail() == null) {
%>


<div>
    <ul class="navlist">
        <li class="span-full"><img src="img/DaDalogo.png" style="width:150px;height:150px"></li>
        <li><a href="registrationForm.jsp"><i class="fa fa-user"></i>Registrati come privato</a></li>
        <li><a href="registrationFormAzienda.jsp"><i class="fa fa-user"></i>Registrati come azienda</a></li>
        <li><a href="login.jsp"><i class="fa fa-user"></i>Login</a></li>
    </ul>
</div>



<%
}
else
{
%>



<div>
    <ul class="navlist">
        <li style="width:80%"><img src="img/DaDalogo.png" style="width:150px;height:150px"></li>
        <li><a href="logout.jsp"><i class="fa fa-user"></i>Logout</a></li>
        <li ><span class="cart-amunt"> Account: <jsp:getProperty name="UserBean" property="email"/> </span></li>
        <li style="width:20%"><img class="img-circle" src="img/martinapala.jpg"></li>

    </ul>
</div>









<%--
<div class="site-branding-area" style="display: block">
    <div class="container">
        <div class="row">
            <div class="col-sm-6">
                <div class="logo">
                    &lt;%&ndash;<h1><a href="home.jsp"></a></h1>&ndash;%&gt;
                    <img src="img/DaDalogo.png" style="width:150px;height:150px; padding:10px">
                </div>
            </div>
            <div class="col-sm-6">
                <div class="shopping-item2">
                    <span class="cart-amunt"> Account: <jsp:getProperty name="UserBean" property="email"/> </span>
                    <img class="img-circle" src="img/martinapala.jpg">
                </div>
            </div>
            <div class="user-menu">
                <ul>
                    <li><a href="registrationSummary.jsp"><i class="fa fa-user"></i>Ciao, <jsp:getProperty name="UserBean" property="name"/></a></li>
                    <li><a href="logout.jsp"><i class="fa fa-user"></i>Logout</a></li>
                </ul>
            </div>
        </div>
    </div>
</div><!-- End site branding area -->--%>
<%
    }
%>