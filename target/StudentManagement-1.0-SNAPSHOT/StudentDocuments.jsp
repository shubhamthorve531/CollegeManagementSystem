<%-- 
    Document   : StudentDocuments
    Created on : 05-Dec-2020, 4:00:57 pm
    Author     : ADMIN
--%>

<%@page import="javax.swing.text.Document"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.studentmanagement.dao.DocumentDao"%>
<%@page import="com.mycompany.studentmanagement.helper.FactoryProvider"%>
<%@page import="com.mycompany.studentmanagement.entities.Documents"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    DocumentDao ddao = new DocumentDao(FactoryProvider.getFactory());
    List<Documents> dlist = ddao.getAllDocuments();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Student Documents</title>
        <%@include file="components/common_css_js.jsp" %>
        <link rel="stylesheet" href="css/sidebar.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" charset="utf-8"></script>
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
    </head>
    <body>
        <%@include file="components/studNavbar.jsp"%>
        <%@include file="components/StudentSidebar.jsp"%>

        <div class="container-fluid course">
            <div class="row-ml-auto">
                <div class="col-md-10 offset-md-2">
                    <div class="card">
                        <div class="card-header text-center " style="background-color:black">
                            <h3 style="color:white">Documents</h3>
                            <h6>Documents Which you need frequently can be saved and accessed from here!</h6>
                        </div>
                        <div data-toggle="modal" data-target="#add-document-modal">
                            <a href="#" class="btn btn-primary btn-lg btn-block" role="button" aria-pressed="true">Upload Documents</a>
                        </div>
                        <%@include file = "components/message.jsp" %>
                        <%@include file = "components/alert.jsp" %>
                    </div>
                </div>
            </div>

            <!--add document modal-->
            <div class="modal fade" id="add-document-modal" tabindex="-1" aria-labelledby="add-document-modal" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content" >
                        <div class="modal-header text-white" style="background-color:black">
                            <h5 class="modal-title" id="exampleModalLabel">Fill Details!!</h5>
                            <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>


                        <div class="modal-body">

                            <form action="AddDocumentServlet" method="post" enctype="multipart/form-data">
                                <input name="StudentId" type="hidden" value="<%=students.getStudentid()%>">
                                <div class="from-group row">
                                    <label  class="col-sm-4 col-form-label">Name of Document :</label>
                                    <div class="col-sm-8">
                                        <input name="DocumentName" type="text" class="form-control"  placeholder="Enter the name of document" required>
                                    </div>
                                </div>
                                <div class="from-group row mt-3">
                                    <label class="col-sm-6 col-form-label" for="exampleFormControlFile1">Upload Document:</label>
                                    <div class="col-sm-6">
                                        <input name="DocumentFile" type="file" class="form-control-file" required>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-4 col-form-label">Select Type:</label>
                                    <div class="col-sm-8">
                                        <select name="DocumentType" class="form-control " >
                                            <option value="" selected disabled hidden><---Select Type---></option>
                                            <option>Image</option>
                                            <option>PDF</option>
                                        </select> 
                                    </div>
                                </div> 
                                <div class="from-group row mt-3">
                                    <label  class="col-sm-4 col-form-label">Today's Date :</label>
                                    <div class="col-sm-6">
                                        <input name="DocumentDate" type="date" class="form-control" id="today" disabled>
                                    </div>
                                </div>

                                <div class="container text-center mt-3">
                                    <button class="btn btn-outline-success">Add</button>
                                    <button class="btn btn-outline-warning"  data-dismiss="modal">close</button>
                                </div>

                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-10 offset-md-3">
                <!--row-->
                <div class="row mt-4">
                    <div class="card-columns">
                        <!--traversing documents-->
                        <%
                            int items = 0;
                            for (Documents D : dlist) {
                                if (students.getStudentid() == D.getStudentid()) {
                                    items++;
                        %> 

                        <!--document Card-->
                        <div class="card documents-card">
                            <div class="container text-center">
                                <%
                                    if (D.getDocumentType().trim().equalsIgnoreCase("Image")) {
                                %>
                                <img src="img/Documents/<%=D.getDocumentfile()%>" style="max-height:200px; max-width: 100%; width: auto; " class="card-img-top m-2" alt="...">
                                <%
                                } else {
                                %>
                                <embed src="img/Documents/<%=D.getDocumentfile()%>" style="max-height:200px; max-width: 100%; width: auto; " class="card-img-top m-2" alt="...">
                                <%
                                    }
                                %>
                            </div>
                            <div class="card-body text-center">
                                <h5 class="card-title"><%=D.getDocumentid()%>)&nbsp; <%=D.getDocumentname()%> </h5>
                                <h6>Uploaded at <%=D.getDocumentUploadedDate()%> <a  href="img/Documents/<%=D.getDocumentfile()%>" target="_blank">View</a></h6>
                            </div>
                        </div>
                        <%
                                }
                            }
                            if (items == 0) {
                                out.println("<h4>No Documents Available<h4>");
                            }
                        %>  
                    </div>

                </div>    
            </div>

        </div>
        <script>
            document.querySelector("#today").valueAsDate = new Date();
        </script>
    </body>
</html>
