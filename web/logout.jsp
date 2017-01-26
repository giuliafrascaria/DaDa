<%--
  Created by IntelliJ IDEA.
  User: giogge
  Date: 26/01/17
  Time: 11:56
  To change this template use File | Settings | File Templates.
--%>
<%

    request.getSession().invalidate();
    response.sendRedirect("home.jsp");
    return;
%>
