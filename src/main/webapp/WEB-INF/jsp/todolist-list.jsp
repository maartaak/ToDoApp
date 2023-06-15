<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="header.jsp" %>
<div class="container">
    <div class="row">
        <div class="col-sm-2"></div>
        <div class="col-sm-8">
            <div class="title">
                <h1 class="text-center">Zbiór list zadań</h1>
            </div>
        </div>
        <div class="col-sm-2">
            <a href="${pageContext.request.contextPath}/todolist/creator" class="btn btn-sm btn-success add-right-top-corner-button"><i class="fa-solid fa-square-plus"></i> Dodaj nową listę</a>
        </div>
    </div>
    <div class="row content cards-center">
        <c:if test="${empty todoLists}">
            <div class="col-sm-12 text-center">
                <b>Brak list zadań</b>
            </div>
        </c:if>
        <c:forEach var="todoList"
                   items="${todoLists}"
                   varStatus="loop">
            <div class="col-sm-12 todolist">
                <div class="card">
                    <div class="card-body text-center">
                        <h5 class="card-title">Lista #${loop.index} - ${todoList.name}</h5>
                        <c:if test="${empty todoList.tasks}">
                            <b>Brak zadań na liście</b>
                        </c:if>
                        <c:forEach var="task"
                                   items="${todoList.tasks}">
                            <li class="${task.status == 'DONE' ? 'task-done' : ''}">
                                <b>${task.name}</b> | Status: <b>${task.status == 'TODO' ? 'Do zrobienia' : task.status == 'IN_PROGRESS' ? 'W trakcie' : 'Zrobione'}</b> | Przypisana osoba: <b>${task.person.name != null ? task.person.name : 'Brak'}</b>
                            </li>
                        </c:forEach>
                        <hr>
                        <div class="row">
                            <div class="col-sm-4"></div>
                            <div class="col-sm-2">
                                <form action="${pageContext.request.contextPath}/todolist/editor" method="GET" role="form">
                                    <input type="hidden" id="todoListId2" name="todoListId" value=${todoList.id}>
                                    <button type="submit" class="btn btn-sm btn-block btn-primary"><i class="fa-solid fa-pen-to-square"></i> Edytuj listę zadań</button>
                                </form>
                            </div>
                            <div class="col-sm-2">
                                <form action="${pageContext.request.contextPath}/todolist/delete" method="POST" role="form">
                                    <input type="hidden" id="todoListId" name="todoListId" value=${todoList.id}>
                                    <button type="submit" class="btn btn-sm btn-block btn-danger"><i class="fa-solid fa-trash-can"></i> Usuń listę</button>
                                </form>
                            </div>
                            <div class="col-sm-4"></div>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
<%@ include file="footer.jsp" %>