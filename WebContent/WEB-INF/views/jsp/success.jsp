<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="false" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>



<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


<table class="table dataTable my-0" id="dataTable">
                                    <thead>
                                        <tr>
                                        	<th>Id</th>
                                            <th>Name</th>
                                            <th>Gender</th>
                                            <th>blood Group</th>
                                            <th>Phone Number</th>
                                            <th>D.O.B.</th>
                                            <th>address</th>
                                            <th>District</th>
                                            <th>State</th>
                                        </tr>
                                    </thead>
                                    <tbody>
				<c:forEach items="${patient}" var="user">
                                        
                                         <tr>
                                            <td><c:out value="${user.patientId}"/></td>
                                            <td><c:out value="${user.patientName}"/></td>
                                            <td><c:out value="${user.gender}"/></td>
                                            <td><c:out value="${user.bloodGroup}"/></td>
                                            <td><c:out value="${user.phoneNo}"/></td>
                                            <td><c:out value="${user.dob}"/></td>
                                            <td><c:out value="${user.address}"/></td>
                                            <td><c:out value="${user.district}"/></td>
                                            <td><c:out value="${user.state}"/></td>
                                        </tr>
			</c:forEach>                                        
                                    </tbody>
                                   
                                </table>

<a href="/SpringDBMS/logout" ><button>Logout</button></a>
</body>
</html>