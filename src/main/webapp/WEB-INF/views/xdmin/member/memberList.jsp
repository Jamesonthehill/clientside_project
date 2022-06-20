<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags"%>




<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../../../../resources/user/css/memberList.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link href="/resources/common/jquery/jquery-ui-1.13.1.custom/jquery-ui.css" rel="stylesheet">
<script src="https://kit.fontawesome.com/b322818db5.js" crossorigin="anonymous"></script>

<title>인테리어 플랫폼 오늘의 집</title>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<div class="container-fluid" style="background-color: #00bfff;">
		<a class="navbar-brand" href="/member/memberList"><img src="../../../../resources/xdmin/image/hoem.png" width="100px" height="50px"></a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
	</div> 
</nav>


</head>
<body>

	<p style="float: left;">&nbsp&nbsp홈 > 회원관리</p>
	<br>
	<br>
	<h1>회원관리</h1>
	<form id="formList" name="formList" method="POST">
		<input type="hidden" id="thisPage" name="thisPage" value="<c:out value="${vo.thisPage}" default="1"/>"> 
		<input type="hidden" id="ifmmSeq" name="ifmmSeq">
		<input type="hidden" name="checkboxSeqArray">
		<div class="row border m-2">
			<!--  검색하는 영역을 네모난 통으로 씌워주는 것 -->
			<div class="row mb-2">
				<!-- sm-2 반응형, p-1~10 박스크기, pt-위쪽,왼쪽으로부터)얼마나 띄워쓸것인지 위치 -->
				<div class="col-sm-2 p-2 pb-3">
					<select class="form-select" name="shOptionDate">
						<option value="">::날짜::</option>
						<option value="1">등록일</option>
						<option value="2">수정일</option>
						<option>끝날짜</option>
					</select>
				</div>
				<div class="col-sm-2 p-2 pb-3">
					<%-- <fmt:parseDate var="shDateStart" value="${vo.shDateStart }" pattern="yyyy-MM-dd HH:mm:ss"/> --%>
					<%-- <fmt:formatDate value="${shDateStart}" pattern="yyyy-MM-dd"/> --%>
					<input class="form-control shDate" type="text" id="shDateStart"
						name="shDateStart"
						<fmt:formatDate value="${shDateStart}" pattern="yyyy-MM-dd HH:mm:ss"/>
						placeholder="시작일" autocomplete="off">
					<%-- <input class="form-control" type="text" name="shJoinValue" value="<c:out value="${vo.shJoinValue}"/>" placeholder="시작일">  --%>
				</div>
				<div class="col-sm-2 p-2 pb-3">
					<%-- <fmt:parseDate var="shDateEnd" value="${vo.shDateEnd }" pattern="yyyy-MM-dd HH:mm:ss"/> --%>
					<input class="form-control shDate" type="text" id="shDateEnd"
						name="shDateEnd"
						<fmt:formatDate value="${shDateEnd}" pattern="yyyy-MM-dd HH:mm:ss"/>
						placeholder="종료일" autocomplete="off">
					<!-- <input class="form-control shDate" type="text" id="abcDate" placeholder="종료일"> -->
				</div>
			</div>
			<div class="row mb-2">
				<div class="col-sm-2 p-2 pb-3">
					<select class="form-select" name="shOption">
						<option value="">::검색구분::</option>
						<option Value="1" <c:if test="${vo.shOption eq 1}">selected</c:if>>이름</option>
						<option Value="2" <c:if test="${vo.shOption eq 2}">selected</c:if>>아이디</option>
						<option Value="3" <c:if test="${vo.shOption eq 3}">selected</c:if>>연락처</option>
						<option Value="4" <c:if test="${vo.shOption eq 4}">selected</c:if>>이메일</option>
					</select>
				</div>
				<div class="col-sm-2 p-2 pb-3">
					<input class="form-control" type="text" name="shValue"
						value="<c:out value="${vo.shValue}"/>" placeholder="검색어">
				</div>
			</div>
			<button class="btn btn-warning my-2 aaa" type="submit" name="search"
				onclick="/memberList.jsp" style="width: 50px; hieght: 15px;">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
					fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
								<path
						d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
							</svg>
			</button>
			<button class="btn btn-danger my-2 aaa" onclick="/memberList.jsp" style="width: 50px; hieght: 15px;">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-clockwise" viewBox="0 0 16 16">
								<path fill-rule="evenodd" d="M8 3a5 5 0 1 0 4.546 2.914.5.5 0 0 1 .908-.417A6 6 0 1 1 8 2v1z" />
								<path d="M8 4.466V.534a.25.25 0 0 1 .41-.192l2.36 1.966c.12.1.12.284 0 .384L8.41 4.658A.25.25 0 0 1 8 4.466z" /></svg>
			</button>
		</div>
	</form>

	<button class="btn btn-success my-2 bbb">
		<i class="fas fa-file-excel"></i>
	</button>

	<%--  							<form id="formList" name="formList" method="POST" action="/member/memberForm?thisPage=<c:out value="${vo.thisPage}"/>&shOption=<c:out value="${vo.shOption}"/>&shValue=<c:out value="${vo.shValue}"/>">
 --%>
	<a class="btn btn-primary my-2 bbb" href="javascript:goForm()"><i class="fas fa-user-plus"></i></a>
	<div class="aaa">
		<p>총회원수: 120</p>
	</div>
	<table class="table table-hover">
		<thead>
			<tr>
				<th scope="col" style="background-color: #00bfff;" style="color: white;">no</th>
				<th scope="col" style="background-color: #00bfff;" style="color: white;"><input type="checkbox" id="checkboxAll" name="" value="" class="form-check-input"> 전체선택
				<th scope="col" style="background-color: #00bfff;" style="color: white;">이름</th>
				<th scope="col" style="background-color: #00bfff;" style="font-family: white;">아이디</th>
				<th scope="col" style="background-color: #00bfff;" style="font-family: white;">연락처</th>
				<th scope="col" style="background-color: #00bfff;" style="font-family: white;">이메일</th>
				<th scope="col" style="background-color: #00bfff;" style="font-family: white;">가입</th>

			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="item" varStatus="status">
				<tr>
					<th scope="row"><c:out value="${item.ifmmSeq}" /></th>
					<td><input type="checkbox" id="checkboxSeq" name="checkboxSeq" value="<c:out value="${item.ifmmSeq}"/>" class="form-check-input"></td>
					<td><a href="javascript:goView(<c:out value="${item.ifmmSeq}"/>)"><c:out value="${item.ifmmName}" /></a></td>
					<td><c:out value="${item.ifmmId}" /></td> <!-- 아이디 -->
					<td><c:out value="${item.ifmpNumber}" /></td> <!-- 연락처  -->
					<td><c:out value="${item.ifmeEmailFull}" /></td>
					<td><fmt:formatDate value="${item.regDateTime}"	pattern="yyyy-MM-dd" /></td>
					<%--       <td><a href="/member/memberView?ifmmSeq=<c:out value="${item.ifmmSeq}"/>&thisPage=<c:out value="${vo.thisPage}"/>">상세보기</a></td> <!--  memberView 앞에 / 썻다가 2시간 삽질 -->
 --%>
				</tr>
			</c:forEach>

		</tbody>
	</table>
	<!-- Button trigger modal -->
	<div class="aaa">
		<button class="btn  btn-danger my-2" data-bs-toggle="modal" data-bs-target="#staticBackdrop"> <i class="fas fa-trash-alt"></i></button>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">확인</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">데이터를 영구적으로 삭제 하시겠습니까?</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" name="" id="btnModalDelete">네</button>
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">아니요</button>
				</div>
			</div>
		</div>
	</div>

	<br>
	<div class="alert alert-danger" role="alert" style="width: 1280px; margin: auto;">*회원자료 삭제시 다른 회원이 회원아이디를 사용하지 못하도록 회원아이디, 이름은 삭제 하지 않고 영구 보관합니다.</div>
	<br>
	<form id="" name="" method="get" action="/member/memberList">
		<nav aria-label="Page navigation example">
			<div class="ddd">
				<ul class="pagination">
					<c:if test="${vo.startPage gt vo.pageNumToShow}">
						<li class="page-item"><a class="page-link" href="javascript:goList(<c:out value='${vo.startPage -1}'/>);">Previous</a></li>
					</c:if>
					<c:forEach begin="${vo.startPage}" end="${vo.endPage}" varStatus="i">
						<c:choose>
							<c:when test="${i.index eq vo.thisPage}">
								<li class="page-item active"><a class="page-link" href="javascript:goList(<c:out value='${i.index}'/>);">${i.index}</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link" href="javascript:goList(<c:out value='${i.index}'/>);">${i.index}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${vo.endPage ne vo.totalPages}">
						<li class="page-item"><a class="page-link" href="javascript:goList(<c:out value='${vo.endPage +1}'/>);">Next</a></li>
					</c:if>

				</ul>
			</div>
		</nav>
	</form>
</body>


<script href="../_bootstrap/bootstrap-5.1.3-dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="/resources/common/jquery/jquery-ui-1.13.1.custom/jquery-ui.js"></script>
<link href="/resources/common/jquery/jquery-ui-1.13.1.custom/jquery-ui.css" rel="stylesheet" />

<script type="text/javascript">
	function selectAll(selectAll) {
		const checkboxes 
			= document.getElementsByName("checkbox1");
		
		checkboxes.forEach((checkbox) => {
			checkbox.checked = selectAll.checked;
		})
	};
	
		goList = function(seq) {
			alert(seq);
			// form 객체를 가져온다
			$("#thisPage").val(seq);
			$("#formList").submit();
			// 그 가져온 객체를 전달한다.
		};

		goForm = function(){
			$("#formList").attr("action", "/member/memberForm");
			$("#formList").submit();
		};
		goView = function(seq){
			$("#ifmmSeq").val(seq); // ifmmSeq란 데이터를 받아오겠다. val(seq) 출력 그리고 다음행 실행
			$("#formList").attr("action", "/member/memberView"); // member/memberView로 넘겨주겠다.
			$("#formList").submit(); // 그냥 공통적으로 submit는 실행해준다는 의미기 때문에 넣어줘야한다.
		};
		
	</script>




<script type="text/javascript">
	$(document).ready(function(){
		 $("input.shDate").datepicker();
	}); 

	$.datepicker.setDefaults({
	    dateFormat: 'yy-mm-dd',
	    prevText: '이전 달',
	    nextText: '다음 달',
	    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	    dayNames: ['일', '월', '화', '수', '목', '금', '토'],
	    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
	    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	    showMonthAfterYear: true,
	    yearSuffix: '년'
	});
	</script>

<script>
	
				$("#checkboxAll").click(function() {
				 	if($("#checkboxAll").is(":checked")) $("input[name=checkboxSeq]").prop("checked", true);
				 	else $("input[name=checkboxSeq]").prop("checked", false);
			}); 

				
				$("input[name=checkboxSeq]").click(function() {
					var total = $("input[name=checkboxSeq]").length;
					var checked = $("input[name=checkboxSeq]:checked").length;
					
					if(total != checked) $("#checkboxAll").prop("checked", false);
					else $("#checkboxAll").prop("checked", true);
				});					
				
	</script>
	
	<script>
	
	var goUrlMultiUele ="/member/memberMultiUele";
	var goUrlMultiDele ="/memberMultiDele";
	var seq = $("input:hidden[name=ifmmSeq]");
	var form = $("form[name=formList]");
	var checkboxSeqArray = [];
	
	
				$("#btnModalUelete").on("click", function(){
					$("input[name=checkboxSeq]:checked").each(function(){ // check된것을 찾고 체크된 값만 넘김
						checkboxSeqArray.push($(this).val());  // check 해당된 값을 담는다.
					});				
				
				$("input:hidden[name=checkboxSeqArray]").val(checkboxSeqArray);
				
				$("#modalConfirm").modal("hide");
			
				form.attr("action", goUrlMultiUele).submit();
				
				});
				

				$("#btnModalDelete").on("click", function() {
					$("input[name=checkboxSeq]:checked").each(function(){
						checkboxSeqArray.push($(this).val());
					});				
				
				$("input:hidden[name=checkboxSeqArray]").val(checkboxSeqArray);
				
				$("#modalConfirm").modal("hide");
			
				form.attr("action", goUrlMultiDele).submit();
				
				}); 
				
	</script>

</html>
