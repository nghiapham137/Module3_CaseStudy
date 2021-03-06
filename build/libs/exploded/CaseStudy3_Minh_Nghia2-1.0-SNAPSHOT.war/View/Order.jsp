<%--
  Created by IntelliJ IDEA.
  User: phama
  Date: 9/26/2020
  Time: 11:44 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <title>Order Page</title>

    <link rel="stylesheet" href="../Style/HomeStyle.css">
</head>
<body>
<div class="container">
    <div class="row" id="header">
        <nav class="navbar navbar-expand-lg " id="nav-bar">
            <a class="navbar-brand" href="/index">Bakery</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="/index">Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true" >Order</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Contact</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">About us</a>
                    </li>

                </ul>
                <form class="form-inline my-2 my-lg-0">
                    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                </form>
            </div>
        </nav>
    </div>
    <h3>Product Menu</h3>
    <div class="row" id="content">
        <div class="col-8">
            <ul class="nav nav-tabs">
                <li class="nav-item">
                    <a class="nav-link active" href="#banhngot">Bánh ngọt</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#banhman">Bánh mặn</a>
                </li>
            </ul>
            <%--        tab panel--%>
            <div class="tab-content">
                <div id="banhngot" class="container tab-pane active">
                    <div class="row">
                        <c:forEach var="product" items="${productList}">
                            <c:if test="${product.category.getCategoryId() == 1}">
                                <div class="card" style="width: 18rem;">
                                    <img src="<c:out value="${product.thumbnail}"/>" class="card-img-top" alt="...">
                                    <div class="card-body">
                                        <h5 class="card-title"><c:out value="${product.productName}"/> </h5>
                                        <p class="card-text"><c:out value="${product.price}"/>VND</p>
                                        <p class="card-text"><c:out value="${product.description}"/></p>
                                        <p class="card-text"><c:out value="${product.category.getCategoryName()}"/></p>
                                        <a href="/user?action=addToCart&productId=${product.getProductId()}" class="btn btn-primary">Go to cart</a>
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>
                </div>

                <div id="banhman" class="container tab-pane fade">
                    <div class="row">
                        <c:forEach var="product" items="${productList}">
                            <c:if test="${product.category.getCategoryId() == 2}">
                                <div class="card" style="width: 18rem;">
                                    <img src="<c:out value="${product.thumbnail}"/>" class="card-img-top" alt="...">
                                    <div class="card-body">
                                        <h5 class="card-title"><c:out value="${product.productName}"/> </h5>
                                        <p class="card-text"><c:out value="${product.price}"/>VND</p>
                                        <p class="card-text"><c:out value="${product.description}"/></p>
                                            <%--                                    <p class="card-text"><c:out value="${product.category.getCategoryName()}"/></p>--%>
                                        <a href="/user?action=addToCart&productId=${product.getProductId()}" class="btn btn-primary">Go to cart</a>
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>

                </div>
            </div>

        </div>
        <div class="col-4" id="cart-box" style="border: 1px solid black">
            <div class="row" style="border: 1px solid black">
                <h4>My Cart</h4>
                <p><c:out value="${cart.getTotalItemInCard()}"/> </p>
            </div>
            <div class="row">
                <table>
                    <c:forEach items="${cart.getCart()}" var="list">
                        <tr>
                            <td><c:out value="${list.getProduct().getProductName()}"/></td>
                            <td><c:out value="${list.getAmount()}"/></td>
                            <td><c:out value="${list.getUnitPrice()}"/></td>
                            <td><a href="/user?action=addToCart&productId=${list.getProduct().getProductId()}">+</a> </td>
                            <td><a href="/user?action=deleteFromCart&productId=${list.getProduct().getProductId()}">-</a> </td>
                        </tr>
                    </c:forEach>

                </table>
                <div>
                    <h4><c:out value="${cart.getTotalPrice()}"/> </h4>
                    <button value="Checkout">Check Out</button>
                </div>

            </div>

        </div>
    </div>
</div>
</body>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
<%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>--%>
<%--<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>--%>
<%--<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>--%>
<script>
    $(document).ready(function(){
        $(".nav-tabs a").click(function(){
            $(this).tab('show');
        });
    });
</script>
</html>
