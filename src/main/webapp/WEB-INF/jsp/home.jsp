<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="header.jsp" %>
    <div class="row content align-items-center cards-center">
        <div class="col-sm-6">
            <div class="card">
                <div class="card-body text-center">
                    <h5 class="card-title">Listy zadań</h5>
                    <p class="card-text">Sprawdź jakie listy zadań posiadasz oraz zarządzaj nimi</p>
                    <a href="${pageContext.request.contextPath}/todolist/list" class="btn btn-primary">Wyświetl listę zadań</a>
                </div>
            </div>
        </div>
        <div class="col-sm-6">
            <div class="card">
                <div class="card-body text-center">
                    <h5 class="card-title">Osoby</h5>
                    <p class="card-text">Wyświetl oraz zarządzaj osobami korzystającymi z aplikacji</p>
                    <a href="${pageContext.request.contextPath}/person/list" class="btn btn-primary">Wyświetl listę osób</a>
                </div>
            </div>
        </div>
    </div>
<%@ include file="footer.jsp" %>
