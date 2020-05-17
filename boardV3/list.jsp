<%@page import="dao.BoardV2_DAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    request.setCharacterEncoding("utf-8");
    
     String search = request.getParameter("search");
    String keyword = request.getParameter("keyword");
    
    System.out.println(search);
    System.out.println(keyword);
    /* 페이징 처리 */
    

   //전달된 페이지번호를 반환받아 저장
   int pageNo=1;//페이지번호를 저장하기 위한 변수
   if(request.getParameter("pageNo")!=null) {//전달값이 존재할 경우
      pageNo=Integer.parseInt(request.getParameter("pageNo"));
   }
   
   if(pageNo<=0) {
      //비정상적인 페이지 번호가 전달된 경우 무조건 1 페이지로 설정 
      pageNo=1;
   }

   //List<BoardDTO> boardList = dao_test.getDAO().getboardList(pageNo);
   
   
   
   
   /** 게시판 페이징 계산**/
   
   //페이지에 응답될 게시글의 갯수 설정
   int pageSize=10;//응답 게시글의 갯수를 저장하기 위한 변수
   BoardV2_DAO dao = new BoardV2_DAO();
          
	// 총 게시글 수
	int totalCount = dao.getTotalCount();
   //총 페이지 갯수를 계산하여 저장
   //int totalPage=totalBoard/pageSize+(totalBoard%pageSize==0?0:1);//총 페이지 갯수를 저장하기 위한 변수
	 int totalPage=(int)Math.ceil((double)totalCount/pageSize);

   
   //페이지 번호에 대한 게시글 시작 행번호를 계산하여 저장
   // => 1 Page : 1, 2 Page : 11, 3 Page : 21, 4 Page : 31,... 
   int startRow=(pageNo-1)*pageSize+1;
   
   //페이지 번호에 대한 게시글 종료 행번호를 계산하여 저장
   // => 1 Page : 10, 2 Page : 20, 3 Page : 30, 4 Page : 41,... 
   int endRow=pageNo*pageSize;
   
   //마지막 페이지의 게시글 종료 행번호를 게시글 전체 갯수로 변경
   if(endRow>totalCount) {
      endRow=totalCount;
   }
   
   //System.out.println(search);
   
   //List<BoardDTO> boardList = dao_test.getDAO().getboardPasingList(startRow, endRow);
   
   
   //페이지에 응답될 게시글의 출력시작번호를 계산하여 저장
   // => 게시글이 하나 출력될 때마다 1씩 감소
   int number=totalCount-(pageNo-1)*pageSize;
   
   //페이지 블럭에 출력될 페이지 번호의 갯수를 설정하여 저장
   int blockSize=5;//블럭에 출력될 페이지 번호의 갯수를 저장하기 위한 변수
   
   //페이지 블럭에 출력될 시작 페이지 번호를 계산하여 출력
   // => 1 Block(1~5) : 1, 2 Block(6~10) : 6, 3 Block(11~15) : 11, 4(16~20) Block : 16,... 
   int startNo=(pageNo-1)/blockSize*blockSize+1;//블럭에 출력될 페이지 시작 페이지번호를 저장하기 위한 변수
   
   //페이지 블럭에 출력될 마지막 페이지 번호를 계산하여 출력
   // => 1 Block(1~5) : 5, 2 Block(6~10) : 10, 3 Block(11~15) : 15, 4(16~20) Block : 20,...
   int endNo=startNo+blockSize-1;
   
   //마지막 페이지 블럭의 페이지 번호 변경
   if(endNo>totalPage) {
      endNo=totalPage;
   }
 	// 현재 페이지(currentPage) 얻어오기

	
 	
 	
 	
/*  	
 	String cp = request.getParameter("cp");
	
	int currentPage = 0;	

	if(cp!=null){
		currentPage = Integer.parseInt(cp);
	}else {
		currentPage = 1;
	}

	
	

	
	// 한 페이지당 레코드 수 : 10
	int recordByPage = 10;
	
	// 총 페이지 수 

 	/*
 	현재 페이지 번호
 	  1    2    3    4 .....
 	
 	각 페이지별 레코드 번호
 	  1    11   21   31
 	
 	 10    20   30   40 
	*/
	
	// 현재 페이지 - 레코드 시작번호
/* 	int startNo = (currentPage-1)*recordByPage+1; 
	
 	// 현재 페이지 - 레코드 끝번호
 	int endNo = currentPage*recordByPage; */ 
 	
 	
	/* out.println("<h2>총 게시물 수 : "+ totalCount+ "</h2>");
 	out.println("<h2>한 페이지당 게시물 수 : "+ recordByPage+"</h2>");
 	out.println("<h2>총 페이지 수 : " + totalPage+"</h2>");
 	out.println("<h2>현재 페이지 번호 : " + currentPage+"</h2>");
 	out.println("<h2>현재 페이지 시작번호 : " + startNo +"</h2>");
 	out.println("<h2>현재 페이지 끝번호 : " + endNo + "</h2>");
	 */
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Jsp_Board</title>

<style type="text/css">
   table{
   width: 1000px;
   margin: 0 auto;
   }
   
   table, tr, th, td{
   border: 1px solid black;
   border-collapse: collapse;
   }
   
  th{
     
   padding: 2px;
   font-size: 20px;
   background-color: #82ca9c;
    
    }
   
   .col1{
   width: 15%;
   text-align: center;
   }
   
   .col2{
   width: 50%;
   text-align: center;
   }
   
   .col3{
   width: 15%;
   }
   
   .col4{
   width: 20%;
   }
   
   .btn{
   text-align: center;
   }
   #page{
      width:10px;
      margin: 0;
      padding:2px; 
      
      border:  1px solid black; 
   
   }
   
   #pagelist{
      text-align: center;
   
   }
.red{
color: red;
font-size: 20px;
height:100px;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	//tr - 첫번째 tr 이 0번째임 
	
	$("tr:first").css("background-color","pink");
	$("tr:last").css("background-color","pink");
	$("tr:odd").css("background-color","yellow");
	
	//마우스가 over 되면 red 클래스 삽입 
	$("th").on('mouseover',function(){
		//$(this).addClass("red");
		$(this).toggleClass("red");
	});
	//마우스가 아웃되면 red 클래스 제거 
	$("th").on('mouseout',function(){
		$(this).removeClass("red");
	});
});

</script>
</head>
<body>

   
   <!-- table>tr>th.col$*4 -->
   <table>
      <tr>
         <th class="col1">게시물번호</th>
         <th class="col2">제목</th>
         <th class="col3">작성자</th>
         <th class="col4">조회수</th>
      </tr>
      <!-- 사용자가 작성한 게시물을 전부 출력해보세요 -->
      
   <%
   

   ArrayList<BoardVO> list = dao.getAllData(startRow, endRow);
   

   for(BoardVO vo : list){
   %>
      
      <tr>
         <td class="col1"><%=vo.getBno() %></td>
         <td class="col2">
         <a href="detail.jsp?bno=<%=vo.getBno()%>"><%=vo.getTitle() %></a></td>      <!-- 제목을 클릭하면 상세 페이지로 이동(내용을 보여주는) -->
         <td class="col3"><%=vo.getWriter() %></td>
         <td class="col4"><%=vo.getHits() %></td>
      </tr>
   <%
   }
   %>
   <tr>
   	<td colspan="4"  id= "pagelist">
   	<div>
      <% if(startNo>blockSize) { %>
      <a href="<%=request.getContextPath()%>/boardV3/list.jsp?pageNo=1">[처음]</a>
      <a href="<%=request.getContextPath()%>/boardV3/list.jsp?pageNo=<%=startNo-blockSize%>">[이전]</a>
      <% } else { %>
      [처음][이전]
      <% } %>
      
      <% for(int i=startNo;i<=endNo;i++) { %>
         <% if(pageNo!=i) { %>
         <a href="<%=request.getContextPath()%>/boardV3/list.jsp?pageNo=<%=i%>">[<%=i %>]</a>
         <% } else { %>
         <span style="font-weight: bold; color: red;">[<%=i %>]</span>
         <% } %>
      <% } %>
      
      <% if(endNo!=totalPage) { %>
      <a href="<%=request.getContextPath()%>/boardV3/list.jsp?pageNo=<%=startNo+blockSize%>">[다음]</a>
      <a href="<%=request.getContextPath()%>/boardV3/list.jsp?pageNo=<%=totalPage%>">[마지막]</a>
      <% } else { %>
      [다음][마지막]
      <% } %>
      </div>
<%--    	<%
					for(int i=currentPage-3; i<=currentPage+3; i++){
						if(i<=0){
							continue;
						}else if(i>totalPage){
							break;
						}else {
				%>	 --%>
  <%--  	  <a href="list.jsp?cp=<%=i%>"><span id="page"><%=i %></span></a> --%>
  <%--  	  <%
   	  }  //if end 	  
   	       }//for end  	   
   	  %> --%>
   	</td>
   </tr>
   <%-- <tr>
   <td><form action="<%=request.getContextPath()%>/boardV3/list.jsp" method="post" id="searchForm" style="display: contents;">
         <select name="search">
            <option value="writer" selected="selected">&nbsp;작성자&nbsp;</option>
            <option value="title">&nbsp;제목&nbsp;</option>
            <option value="contents">&nbsp;내용&nbsp;</option>
         </select>
         <input type="text" name="keyword" id="keyword">
         <button type="submit">검색</button>
      </form></td>
   </tr> --%>
   
   
      <tr>
         <td colspan="4" class="btn">
         <a href="write.jsp"><input type="button" value="등록" size="200px" /></a>
         </td>
      </tr>
   </table>
</body>
</html>