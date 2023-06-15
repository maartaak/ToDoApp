<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="header.jsp" %>

<div class="container">
    <div class="title">
        <h1 class="text-center">Dodawanie osoby</h1>
    </div>
    <div class="row content align-items-center form-page-with-title-center">
        <div class="col-sm-4"></div>
        <div class="col-sm-4">
            <div class="card">
                <div class="card-body text-center">
                    <form action="${pageContext.request.contextPath}/person/add" method="POST" role="form">
                        <div class="form-group">
                            <label for="name">Nazwa osoby</label>
                            <input type="text" class="form-control" id="name" name="name" aria-describedby="personHelp" placeholder="Wpisz nazwę osoby..." required>
                            <small id="personHelp" class="form-text text-muted">Osoba, którą dodasz, będzie mogła być przypisywana do zadań</small>
                        </div>
                        <button type="submit" class="btn btn-success"><i class="fa-regular fa-floppy-disk"></i> Zapisz osobę</button>
                    </form>
                </div>
            </div>
        </div>
        <div class="col-sm-4"></div>
    </div>
    <div class="row content">
        <div class="col-sm-4"></div>
        <div class="col-sm-4">
            <a href="${pageContext.request.contextPath}/person/list" class="btn btn-info btn-block"><i class="fa-solid fa-arrow-left"></i> Powrót do listy osób</a>
        </div>
        <div class="col-sm-4"></div>
    </div>
</div>
<%@ include file="footer.jsp" %>