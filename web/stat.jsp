<%@ page import="com.mycompany.model.User" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Statistic</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        .users {
            font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
            border-collapse: collapse;
            width: 100%;
        }

        .users td, .users th {
            border: 1px solid #ddd;
            padding: 8px;
        }

        .users tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .users tr:hover {
            background-color: #ddd;
        }

        .users th {
            padding-top: 12px;
            padding-bottom: 12px;
            text-align: left;
            background-color: #4CAF50;
            color: white;
        }
    </style>
</head>
<body>
<% String logged = (String) session.getAttribute("logged");
    List<User> usersList = (List<User>) session.getAttribute("users");
    if (logged == null || "".equals(logged) || logged.equals("false")) {
%>

<div class="container">
    <h1>User's statistic</h1>
    <table class="users">
        <thead>
        <tr>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Age</th>
            <th><%= usersList.get(usersList.size() - 1).getQuestions().get(0).getBody()%>
            </th>
            <th><%= usersList.get(usersList.size() - 1).getQuestions().get(1).getBody()%>
            </th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td><%= usersList.get(usersList.size() - 1).getFirstName()%>
            </td>
            <td><%= usersList.get(usersList.size() - 1).getLastName()%>
            </td>
            <td><%= usersList.get(usersList.size() - 1).getAge()%>
            </td>
            <td><%=  usersList.get(usersList.size() - 1).getQuestions().get(0).getAnswer()%>
            </td>
            <td><%=  usersList.get(usersList.size() - 1).getQuestions().get(1).getAnswer()%>
            </td>
        </tr>
        </tbody>
    </table>
    <br/><label>Click this link to</label> <a href="/question">log in</a>
</div>
<% } else {%>

<div class="container">
    <h1>Full statistic</h1>
    <table class="users">
        <thead>
        <tr>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Age</th>
            <th><%= usersList.get(usersList.size() - 1).getQuestions().get(0).getBody()%>
            </th>
            <th><%= usersList.get(usersList.size() - 1).getQuestions().get(1).getBody()%>
            </th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${users}" var="user">
            <tr>
                <td><c:out value="${user.firstName}"/></td>
                <td><c:out value="${user.lastName}"/></td>
                <td><c:out value="${user.age}"/></td>
                <td><c:out value="${user.questions[0].answer}"/></td>
                <td><c:out value="${user.questions[1].answer}"/></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <br/><label>Click this link to</label> <a href="/question?action=exit">log out</a>
</div>
<% } %>
</body>
</html>
