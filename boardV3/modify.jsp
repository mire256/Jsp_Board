<%@page import="vo.BoardVO"%>
<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modify.jsp</title>
<style type="text/css">
	table {margin: 0 auto;}
	table, tr, th, td{
		border: 1px solid black;
		border-collapse: collapse;
	}
	
	th{
		padding: 2px;
		font-size: 20px;
		text-shadow : 2px 2px 2px #FFFFFF;
		background: 
		-webkit-linear-gradient(top, #9dd53a 0%,#9dd53a 17%,#9dd53a 17%,#9dd53a 20%,#a1d54f 29%,#a1d54f 35%,#a1d54f 44%,#9dd53a 54%,#80c217 59%,#a1d54f); 
	}
	
	#t1 {
		width: 100px;
		background-color: white;
	}
	
	#contents {
		background-color: #aaa;
	}
	
	

</style>
</head>
<body>
	<!-- 게시글 번호에 따른 데이터 조회 결과를 각 td에 출력해보세요 -->
	<%
		String no = request.getParameter("bno");
			
		BoardDAO dao = new BoardDAO();
		BoardVO vo = new BoardVO();	
		
		if(no!=null){
			int bno = Integer.parseInt(no);
			
			vo = dao.getData(bno);			
		}else {
			response.sendRedirect("list.jsp");
		}
	%>
	<form action="modifyOk.jsp">
		<input type="hidden" name="bno" value="<%=vo.getBno() %>" />
	<table>
		<tr id="top">
			<th id="t1" class="rowH" >작성자</th>
			<td><%=vo.getWriter() %></td>
			<th id="t2">조회수</th>
			<td><%=vo.getHits() %></td>
			<th id="t3">작성일시</th>
			<td><%=vo.getRegdate() %></td>
		</tr>
		<tr id="title">
			<th class="rowH">제목</th>
			<td colspan="5">
				<input type="text" name="title" id="" value="<%=vo.getTitle() %>" size="30" />
			</td>
		</tr>
		<tr id="contents">
			<th class="rowH">내용</th>
			<td colspan="5">
				<textarea name="contents" id="" cols="200" rows="10"><%=vo.getContents() %></textarea>
			</td>
		</tr>
		<tr>
			<th class="rowH"></th>
			<td colspan="6">
				<a href="list.jsp"><input type="button" value="목록" /></a>
				<input type="submit" value="수정" />
				<input type="button" value="삭제" />			
			</td>
		</tr>		
	</table>
	</form>
</body>
</html>








