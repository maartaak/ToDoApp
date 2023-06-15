<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="header.jsp" %>
<div class="container">
    <div class="row">
        <div class="col-sm-2"></div>
        <div class="col-sm-8">
            <div class="title">
                <h1 class="text-center">Lista osób</h1>
            </div>
        </div>
        <div class="col-sm-2">
            <a class="btn btn-sm btn-success add-right-top-corner-button" href="${pageContext.request.contextPath}/person/creator" role="button"><i class="fa-solid fa-square-plus"></i> Dodaj nową osobę</a>
        </div>
    </div>
    <div class="row">
        <table class="table table-hover">
            <thead>
            <tr>
                <th scope="col">#</th>
                <th scope="col">ID osoby</th>
                <th scope="col">Nazwa osoby</th>
                <th scope="col">Akcje</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="person"
                       items="${persons}"
                       varStatus="loop">
                <tr>
                    <th scope="row">#${loop.index + 1}</th>
                    <td>${person.id}</td>
                    <td>${person.name}</td>
                    <td>
                        <form action="${pageContext.request.contextPath}/person/delete" method="POST" role="form">
                            <input type="hidden" id="personId" name="personId" value=${person.id}>
                            <button type="submit" class="btn btn-sm btn-danger"><i class="fa-solid fa-trash-can"></i> Usuń osobę</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<%@ include file="footer.jsp" %>