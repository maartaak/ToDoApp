<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="header.jsp" %>
<div class="container">
    <div class="row">
        <div class="col-sm-2"></div>
        <div class="col-sm-8">
            <div class="title">
                <h1 class="text-center">Edytujesz listę zadań "${todoList.name}"</h1>
            </div>
        </div>
        <div class="col-sm-2">
            <a href="${pageContext.request.contextPath}/task/creator?todoListId=${todoList.id}" class="btn btn-sm btn-success add-right-top-corner-button"><i class="fa-solid fa-square-plus"></i> Dodaj nowe zadanie</a>
        </div>
    </div>
    <div class="row content cards-center">
            <div class="col-sm-12 todolist">
                <div class="card">
                    <div class="card-body text-center">
                        <h5 class="card-title">Lista zadań</h5>
                        <c:if test="${empty todoList.tasks}">
                            <b>Brak zadań na liście</b>
                        </c:if>
                        <c:forEach var="task"
                                    items="${todoList.tasks}">
                            <div class="row">
                                <div class="col-sm-8">
                                    <li class="${task.status == 'DONE' ? 'task-done' : ''}">
                                        <b>${task.name}</b> | Status: <b>${task.status == 'TODO' ? 'Do zrobienia' : task.status == 'IN_PROGRESS' ? 'W trakcie' : 'Zrobione'}</b> | Przypisana osoba: <b>${task.person.name != null ? task.person.name : 'Brak'}</b>
                                    </li>
                                </div>
                                <div class="col-sm-2">
                                    <form action="${pageContext.request.contextPath}/task/edit" method="GET" role="form">
                                        <input type="hidden" id="taskId2" name="taskId" value=${task.id}>
                                        <input type="hidden" id="todoListId2" name="todoListId" value=${todoList.id}>
                                        <button type="submit" class="btn btn-sm btn-primary"><i class="fa-solid fa-pen-to-square"></i> Edytuj zadanie</button>
                                    </form>
                                </div>
                                <div class="col-sm-2">
                                        <form action="${pageContext.request.contextPath}/task/delete" method="POST" role="form">
                                            <input type="hidden" id="taskId" name="taskId" value=${task.id}>
                                            <input type="hidden" id="todoListId" name="todoListId" value=${todoList.id}>
                                            <button type="submit" class="btn btn-sm btn-danger"><i class="fa-solid fa-trash-can"></i> Usuń zadanie</button>
                                        </form>
                                </div>
                            </div>
                        </c:forEach>
                        <hr>
                    </div>
                </div>
            </div>
    </div>
    <div class="row content">
        <div class="col-sm-4"></div>
        <div class="col-sm-4">
            <a href="${pageContext.request.contextPath}/todolist/list" class="btn btn-info btn-block"><i class="fa-solid fa-arrow-left"></i> Powrót do Todo List</a>
        </div>
        <div class="col-sm-4"></div>
    </div>
</div>
<%@ include file="footer.jsp" %>