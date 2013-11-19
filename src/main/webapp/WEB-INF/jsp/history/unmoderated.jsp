<fmt:message key="metas.unmoderated.title" var="title"/>
<fmt:message key="metas.generic.title" var="genericTitle" />
<tags:header title="${genericTitle} - ${title}"/>

<tags:moderationTabs />

<ul class="pending-questions">
	<c:forEach var="entry" items="${pending.entrySet}">
		<li class="pending">
			<c:if test="${type eq 'pergunta'}">
				<h3 class="title item-title">
					<a href="${linkTo[HistoryController].similarQuestions(entry.key.id)}">
						<c:out value="${entry.key.title}" escapeXml="true" />
					</a>
				</h3>
				<p class="moderator-text">Quantidade de edi��es : ${entry.value.size()}</p>
				<tags:tagsFor taggable="${entry.key}"></tags:tagsFor>
			</c:if>
			<c:if test="${type eq 'resposta'}">
				<h3 class="title item-title">
					<a href="${linkTo[HistoryController].similarAnswers(entry.key.id)}">
						<c:out value="${entry.key.question.title}" escapeXml="true" />
					</a>
				</h3>
				<p class="moderator-text">Quantidade de edi��es : ${entry.value.size()}</p>
				<tags:tagsFor taggable="${entry.key.question}"></tags:tagsFor>
			</c:if>
			
			<div class="stats">
				<c:set var="information" value="${entry.value[fn:length(entry.value)-1]}"/>
				<span class="last-updated-at"><tags:prettyTime time="${information.createdAt}" /></span>
				<span>- �ltimo usu�rio a editar :</span>
				<tags:userProfileLink user="${information.author}" isPrivate="false"></tags:userProfileLink>
			</div>
		</li>
	</c:forEach>
</ul>