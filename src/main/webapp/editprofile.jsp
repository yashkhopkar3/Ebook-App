<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Profile</title>
<%@include file="All_Component/AllCSS.jsp"%>
<style>
/* Add your CSS styling here */
</style>
</head>
<body>
    <c:if test="${empty userobj}">
        <c:redirect url="login.jsp"></c:redirect>
    </c:if>
    <%@include file="All_Component/Navbar.jsp"%>
    <%
        User u = (User) session.getAttribute("userobj");
    %>
    <div class="container edit-profile-container">
        <div class="row">
            <div class="col-md-4 offset-md-4">
                <div class="card edit-profile-card">
                    <div class="card-body edit-profile-card-body">
                        <h4 class="text-center text-primary">Edit Profile</h4>

                        <c:if test="${not empty SuccMsg}">
                            <p class="text-center text-success">${SuccMsg}</p>
                            <c:remove var="SuccMsg" scope="session"/>
                        </c:if>
                        <c:if test="${not empty failedMsg}">
                            <h5 class="text-center text-danger">${failedMsg}</h5>
                            <c:remove var="failedMsg" scope="session"/>
                        </c:if>

                        <form action="update_profile" method="post">
                            <!-- Full Name -->
                            <input type="hidden" value="${userobj.id}" name="id">
                            <div class="mb-3">
                                <label for="fullName" class="form-label edit-profile-form-label">Enter Full Name</label>
                                <input type="text" class="form-control edit-profile-form-control" id="fullName"
                                    name="fname" value="<%=u.getName()%>" required>
                            </div>

                            <!-- Email -->
                            <div class="mb-3">
                                <label for="email" class="form-label edit-profile-form-label">Email address</label>
                                <input type="email" class="form-control edit-profile-form-control" id="email"
                                    name="email" value="<%=u.getEmail()%>" required>
                            </div>

                            <!-- Phone No -->
                            <div class="mb-3">
                                <label for="phoneNo" class="form-label edit-profile-form-label">Phone No</label>
                                <input type="number" class="form-control edit-profile-form-control" id="phoneNo"
                                    name="phno" value="<%=u.getPhno()%>" required>
                            </div>
                            
                            

                            <!-- Password -->
                            <div class="mb-3">
                                <label for="password" class="form-label edit-profile-form-label">Password</label>
                                <input type="password" class="form-control edit-profile-form-control" id="password"
                                    name="pass" placeholder="Type Correct Password">
                            </div>

                            <!-- Submit Button -->
                            <button type="submit" class="btn btn-primary w-100">Update</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="All_Component/footer.jsp"%>
</body>
</html>