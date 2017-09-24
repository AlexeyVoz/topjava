<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<html>

<head>
    <title>Meals</title>
</head>
<body>
<h3><a href="index.html">Home</a></h3>
<h2>Meals</h2>
<table style=" border-style: solid; border-width:2px; width: 600px; border-collapse: collapse;">

    <thead>
    <tr style="background-color: #128007;">
        <td style="width: 80px;">id</td>
        <td style="width: 80px;">descr</td>
        <td style="width: 80px;">Kcal</td>
        <td style="width: 80px;">is exceeded</td>
        <td style="width: 80px;"></td>

    </tr>
    </thead>
<c:forEach var="meal" items="${meals}">
    <jsp:useBean id="meals" class="java.util.ArrayList" scope="request"/>
    <jsp:useBean id="meal" class="ru.javawebinar.topjava.model.MealWithExceed" scope="request"/>
    <tr>
        <td>${meals.indexOf(meal)+1}</td>
        <td>${meal.description}</td>
        <td>${meal.calories}</td>
        <td><c:if test="${meal.exceed}">+</c:if>
            <c:if test="${!meal.exceed}">-</c:if>
        </td>
        <td>  <a href="/meals">Edit</a>  </td>
        <td>  <a href="/meals?action=del&id=${meals.indexOf(meal)}"> Delete</a>  </td>

    </tr>
</c:forEach>

</table>


<form action="/meals" method="POST">
    <p>Desriotion: <input type="text" name="description"></p>
    <%--<p>Date: <input type="datetime-local" name="date"></p>--%>
    <p>KCal: <input type="number" name="KCal"></p>

    <input type="submit" value="Отправить" />
</form>
</body>
</html>
