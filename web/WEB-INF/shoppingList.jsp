<%-- 
    Document   : shoppingList
    Created on : 16-Oct-2022, 9:00:27 AM
    Author     : Keith
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shopping List</title>
    </head>
    <body>
        <h1>Shopping List</h1>
        <p>Hello, ${username} <a href="ShoppingList?action=logout">Logout</a></p>

        <form action="" method="POST">
            <h2>List:</h2>

            <label>Add item:</label>
            <input type="text" name="item" value="">
            <input type="submit" value="Add">
            <input type="hidden" name="action" value="add">
        </form>
        <c:if test="${not empty items}">
            <form action="ShoppingList" method="POST">
                <c:forEach var="items" items="${items}">
                    <input type="radio" name="itemSelected" value="${items}">
                    ${items}
                    <br>
                </c:forEach>
                <input type="submit" value="Delete">
                <input type="hidden" name="action" value="delete">            
            </form>
        </c:if>
    </body>
</html>
