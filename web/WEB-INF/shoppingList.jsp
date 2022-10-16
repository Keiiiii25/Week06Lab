<%-- 
    Document   : shoppingList
    Created on : 16-Oct-2022, 9:00:27 AM
    Author     : Keith
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shopping List</title>
    </head>
    <body>
        <h1>Shopping List</h1>
        <p>Hello ${username}</p>
        <p><a href="ShoppingList?action=logout">Logout</a></p>
        
        <form action="" method="POST">
            <h2>Add Item:</h2>
            <input type="text" name="item" value="">
            <input type="submit" value="Add Item">
            <input type="hidden" name="action" value="add">
        </form>
        
        <form action="ShoppingList" method="POST">
            <c:forEach var="items" items="${items}">
                <input type="radio" name="itemSelected" value="${items}">
                ${items}
                <br>
            </c:foreach>
            <input type="submit" value="Delete">
            <input type="hidden" name="action" value="delete">            
        </form>
    </body>
</html>
