<%@page import="dao.BoardV2_DAO"%>
<%@page import="vo.BoardVO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%
		String no = request.getParameter("bno");
		
			dao.BoardV2_DAO dao = new dao.BoardV2_DAO();
			BoardVO vo = new BoardVO();	
			
			if(no!=null){
		int bno = Integer.parseInt(no);
		
		//조회 증가 메소드 추가 
		dao.raiseHits(bno);
		
		vo = dao.getData(bno);			
			}else {
		response.sendRedirect("list.jsp");
			}
	%>
<meta charset="UTF-8">
<title>detail.jsp</title>
<style type="text/css">

table{width: 900px; margin : 0 auto;}

table,tr,th,td{

border : 1px solid black;
border-collapse: collapse;
}

th{
padding : 2px;
padding: 2px;
font-size: 20px;
  background: linear-gradient(135deg,  #9a1e2b 0%,#ca203c 32%,#ca203c 32%,#d82a4a 50%,#e87e93 100%); 
    filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#9a1e2b', endColorstr='#e87e93',GradientType=1 ); 
}


</style>

<!-- 삭제 시 한번 더 확인하는 알림 구현 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
   $(document).ready(function(){
      
      $("#delConfirm").on('click', function(){
         
         //console.log("click");
         
         var flag = confirm("정말 삭제 하시겠습니까 ?");
         
         if(flag){
            //console.log("삭제  수행");
            
            //창 이동시키기 => deleteOk.jsp = > 삭제 기능을 수행해보세요 .
            
            location.href = "deleteOk.jsp?bno=<%=vo.getBno()%>";
            
            
         }
      });
      
   });


</script>
</head>
<body>
	<!-- 게시글 번호에 따른 데이터 조회 결과를 각 td에 출력해보세요 -->
	<table>
		<tr id="top">
			<th id="t1">작성자</th>
			<td><%=vo.getWriter() %></td>
			<th id="t2">조회수</th>
			<td><%=vo.getHits() %></td>
			<th id="t3">작성일시</th>
			<td><%=vo.getRegdate() %></td>
		</tr>
		<tr id="title">
			<th>제목</th>
			<td colspan="5">
				<%=vo.getTitle() %>
			</td>
		</tr>
		<tr id="contents">
			<th>내용</th>
			<td colspan="5">
				<textarea disabled="disabled" name="" id="" cols="200" rows="10"><%=vo.getContents() %></textarea>
			</td>
		</tr>
		<tr>
			<td colspan="6">
				<a href="list.jsp"><input type="button" value="목록" /></a>
				<a href="modify.jsp?bno=<%=vo.getBno() %>"><input type="button" value="수정" /></a>
				      <input type="button" value="삭제" id="delConfirm" />	
			</td>
		</tr>		
	</table>

</body>
</html>


