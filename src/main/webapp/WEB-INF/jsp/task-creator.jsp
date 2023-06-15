<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="header.jsp" %>
<div class="container">
    <div class="title">
        <h1 class="text-center">Dodawanie zadania dla listy "${todoList.name}"</h1>
    </div>
    <div class="row content align-items-center form-page-with-title-center">
        <div class="col-sm-4"></div>
        <div class="col-sm-4">
            <div class="card">
                <div class="card-body text-center">
                    <form action="${pageContext.request.contextPath}/task/add" method="POST" role="form">
                        <input type="hidden" id="todoListId" name="todoListId" value="${todoList.id}">
                        <div class="form-group">
                            <label for="name">Nazwa zadania</label>
                            <input type="text" class="form-control" id="name" name="name" aria-describedby="taskHelp" placeholder="Wpisz nazwę nowego zadania..." required>
                            <small id="taskHelp" class="form-text text-muted">Tak będzie nazywać się nowe zadanie</small>
                        </div>
                        <div class="form-group">
                            <label for="name">Osoba dla zadania</label>
                            <select class="custom-select" aria-describedby="personHelp" id="personIdInput" name="personId" required>
                                <option value="" selected>Wybierz osobę...</option>
                                <c:forEach var="person"
                                           items="${persons}">
                                    <option value="${person.id}">${person.name}</option>
                                </c:forEach>
                            </select>
                            <small id="personHelp" class="form-text text-muted">Ta osoba będzie przypisana do zadania</small>
                        </div>
                        <button type="submit" id="submitTaskButton" class="btn btn-success" ><i class="fa-regular fa-floppy-disk"></i> Zapisz zadanie</button>
                    </form>
                </div>
            </div>
        </div>
        <div class="col-sm-4"></div>
    </div>
    <div class="row content">
        <div class="col-sm-4"></div>
        <div class="col-sm-4">
            <a href="${pageContext.request.contextPath}/todolist/editor?todoListId=${todoList.id}" class="btn btn-info btn-block"><i class="fa-solid fa-arrow-left"></i> Anuluj i wróć do listy zadań</a>
        </div>
        <div class="col-sm-4"></div>
    </div>
</div>
<%@ include file="footer.jsp" %>