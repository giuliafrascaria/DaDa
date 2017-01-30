
<%
    request.getSession().invalidate();
    response.sendRedirect("home.jsp");
%>
