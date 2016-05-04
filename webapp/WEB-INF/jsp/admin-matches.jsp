<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/taglib.jsp"%>

<style>
tr {
	text-align: center;
	vertical-align: middle;
}

tr th {
	text-align: center;
	vertical-align: middle;
}
</style>

<div style="float: left; width: 49%; margin-right: 1%;">
	<h1>
		<b> Potwierdzony przez jedną</b>
	</h1>
	<br>
	<table class="table table-bordered table-hover table-striped display">
		<thead>
			<tr>
				<th style="width: 25%;">Zawodnik</th>
				<th style="width: 25%;">Zawodnik</th>
				<th style="width: 50%;">Data i miejsce</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${oneAccepted}" var="match">
				<tr>
					<c:choose>
						<c:when test="${match.firstName eq principalName }">
							<td style="color: red; font-size: 105%;"><b>${match.firstName}</b></td>
						</c:when>
						<c:otherwise>
							<td><a
								href='<spring:url value="/users/find/${match.firstName}.html" />'>${match.firstName}</a></td>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${match.secondName eq principalName }">
							<td style="color: red; font-size: 105%;"><b>${match.secondName}</b></td>
						</c:when>
						<c:otherwise>
							<td><a
								href='<spring:url value="/users/find/${match.secondName}.html" />'>${match.secondName}</a></td>
						</c:otherwise>
					</c:choose>
					<td><b><fmt:formatDate value="${match.matchDate}"
								pattern="dd.MM.yyyy HH:mm" /></b> ${match.matchPlace}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<div style="float: right; width: 49%;">
	<h1>
		<b> Potwierdzony przez żadną</b>
	</h1>
	<br>
	<table class="table table-bordered table-hover table-striped display">
		<thead>
			<tr>
				<th>Zawodnik</th>
				<th class="score-header">Wynik</th>
				<th>Zawodnik</th>
				<th>Data i miejsce</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${noAccepted}" var="match">
				<tr>
					<c:choose>
						<c:when test="${match.firstName eq principalName }">
							<td style="color: red; font-size: 105%;"><b>${match.firstName}</b></td>
						</c:when>
						<c:otherwise>
							<td><a
								href='<spring:url value="/users/find/${match.firstName}.html" />'>${match.firstName}</a></td>
						</c:otherwise>
					</c:choose>
					<td><b>${match.firstPoints}:${match.secondPoints}</b>&nbsp;</td>
					<c:choose>
						<c:when test="${match.secondName eq principalName }">
							<td style="color: red; font-size: 105%;"><b>${match.secondName}</b></td>
						</c:when>
						<c:otherwise>
							<td><a
								href='<spring:url value="/users/find/${match.secondName}.html" />'>${match.secondName}</a></td>
						</c:otherwise>
					</c:choose>
					<td><b><fmt:formatDate value="${match.matchDate}"
								pattern="dd.MM.yyyy HH:mm" /></b> ${match.matchPlace}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<p style="clear: both;"></p>

<script>
	$(document)
			.ready(
					function() {
						$('table.display')
								.dataTable(
										{
											"scrollY" : "290px",
											"scrollCollapse" : true,
											"paging" : false,
											"language" : {
												processing : "Przetwarzanie...",
												search : "Szukaj:",
												lengthMenu : "Pokaż _MENU_ pozycji",
												info : "",
												infoEmpty : "Pozycji 0 z 0 dostępnych",
												infoFiltered : "(filtrowanie spośród _MAX_ dostępnych pozycji)",
												infoPostFix : "",
												loadingRecords : "Wczytywanie...",
												zeroRecords : "Nie znaleziono pasujących pozycji",
												emptyTable : "Brak danych",
											}
										});
					});
</script>

