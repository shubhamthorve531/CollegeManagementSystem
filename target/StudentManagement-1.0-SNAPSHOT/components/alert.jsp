<%-- 
    Document   : alert
    Created on : 19-Oct-2020, 10:41:08 AM
    Author     : smasher
--%>

<%
    String messages = (String)session.getAttribute("alert");
    if(messages!=null)
    {
        //out.println(message);
%>
    <div class="alert alert-warning alert-dismissible fade show" role="alert">
  <strong><%=messages%></strong> 
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>




<%
    
        session.removeAttribute("alert");
    }
%>