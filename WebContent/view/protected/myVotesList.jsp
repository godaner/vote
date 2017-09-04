<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	//防止用户登陆后回退
	response.setHeader("Cache-Control","no-store");   
	response.setHeader("Pragma","no-cache");   
	response.setDateHeader("Expires",0);   
%>
<link rel="stylesheet" href="<c:url value='/css/global.css'></c:url>" />
<link rel="stylesheet" href="<c:url value='/css/votesList.css'></c:url>" />
<%-- ${votes} --%>
<div class="contentDiv">

	<div class="titleDiv">
		<img src="<c:url value='/img/title_ico.gif'></c:url>"/>
		<div class="titleFont">投票列表</div>
	</div>
	<div class="votesTabDiv">
		<table>
			<c:forEach items="${votes.pageVotes}" var="v">
				<tr>
					<td class="firstTd">
						
						<a tatget="viewsIframe" class="vote_icon" href="<c:url value='/votes/votesAction!selectVoteWithCustomField.action?id=${v.id}&forward=editVote'></c:url>">
							${v.theme}
							<!-- 描述 -->
							<div class="drecDiv">
							
<!-- 									private Integer itemNum;//vote選項數目
									private Integer voteNum;//vote的縂得票數
									private Integer joinerNum;//vote的參加者數量 -->
								共${v.itemNum}个选项,${v.joinerNum}人参与,共${v.voteNum}票,
								<!-- 多选 -->
								<c:if test="${v.selectWay eq 1}">
									多选
								</c:if>
								<!-- 单选 -->
								<c:if test="${v.selectWay eq 0}">
									单选
								</c:if>
								,发起者:${v.launcher.username}
							</div>
						</a>
						
					</td>
					<td class="secondTd">
						<a tatget="viewsIframe" class="join_icon" href="<c:url value='/votes/votesAction!selectVoteWithCustomField.action?id=${v.id}&forward=editVote'></c:url>">管理</a>
					</td>
				</tr>
			</c:forEach>
		
		</table>
		
	</div>
	<div class="pager">
	
		<!-- 设置页码 -->	
		<c:set var="pageRange" value="3"></c:set>
		<c:set var="pageStart" value="${votes.page - pageRange}"></c:set>
		<c:set var="pageEnd" value="${votes.page + pageRange}"></c:set>
		<c:if test="${pageStart le 0}">
			<c:set var="pageStart" value="1"></c:set>
		</c:if>
		<c:if test="${pageEnd gt votes.maxPage}">
			<c:set var="pageEnd" value="${votes.maxPage}"></c:set>
		</c:if>
		[
			<c:forEach var="v" begin="${pageStart}" end="${pageEnd}">
				<c:set value="" var="color"></c:set>
				<c:if test="${votes.page eq v}">
					<c:set value="red" var="color"></c:set>
				</c:if>
				<a style="color: ${color};" href="<c:url value='/votes/votesAction!selectVoteWithCustomFieldByPageAndKW.action?page=${v}'></c:url>">${v}</a>
			</c:forEach>
		]
		
		<!-- //上一页下一页 -->
		<c:if test="${votes.page gt 1}"><!-- 下载已经是最后一页 -->
			<a href="<c:url value='/votes/votesAction!selectMyVoteWithCustomFieldByPage.action?page=${votes.page-1}'></c:url>">上一页</a>
		</c:if>
		<c:if test="${votes.page lt votes.maxPage}"><!-- 下载已经是最后一页 -->
			<a href="<c:url value='/votes/votesAction!selectMyVoteWithCustomFieldByPage.action?page=${votes.page+1}'></c:url>">下一页</a>
		</c:if>
		[${votes.page}/${votes.maxPage}]
		
		
		
		
		
	</div>

</div>