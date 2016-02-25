<%@ include file="../layout/taglib.jsp"%>


<table class="table table-bordered table-hover table-striped">
	<thead>
		<tr>
			<th>Nazwa_Uzytkownika</th>
			<th class="center">Zaakceptuj</th>
			<th class="center">Usun</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${users}" var="user">
			<c:forEach items="${user.roles}" var="role">
				<c:if test="${role.name != 'ROLE_ADMIN' }">
					<tr>
						<td><a
							href=" <spring:url value="/users/${user.login}.html" />">
								${user.login }</a></td>
						<td class="center"><c:choose>
								<c:when test="${role.name == 'ROLE_AWAIT' }">
									<a href=" <spring:url value="/users/update/${user.login}.html" />"
										class="btn btn-success"> Zaakceptuj </a>
								</c:when>
								<c:otherwise>
								Aktywny
							</c:otherwise>
							</c:choose></td>

						<td class="center"><a
							href=" <spring:url value="/users/remove/${user.login}.html" />"
							class="btn btn-danger">Usun</a></td>
					</tr>
				</c:if>
			</c:forEach>
		</c:forEach>
	</tbody>
</table>
