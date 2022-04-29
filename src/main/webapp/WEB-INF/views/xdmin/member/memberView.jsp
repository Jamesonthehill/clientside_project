<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags"%>
<!-- 공동코드 선언  -->
<%-- <jsp:useBean id="CodeServiceImpl" class="com.clientside.project.modules.code.CodeServiceImpl"/> --%>


<!doctype html>
<html lang="ko">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="../../../../resources/xdmin/css/memberView.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://kit.fontawesome.com/b322818db5.js" crossorigin="anonymous"></script>
<script src="../../../../resources/common/js/validation.js"></script>

<title>인테리어 플랫폼 오늘의 집</title>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<div class="container-fluid" style="background-color: #00bfff;">
		<a class="navbar-brand" href="http://localhost:8080/member/memberList"><image src="../../../../resources/xdmin/image/hoem.png" width="100px" height="50px"></a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
	</div>
</nav>
</head>


<body style="float: center;">
	<form id="formList" name="formList" method="POST">
		<%-- <input type="hidden" id="thisPage" name="thisPage" value="<c:out value="${vo.thisPage}" default="1"/>">  --%>
		<input type="hidden" id="ifmmSeq" name="ifmmSeq" value="<c:out value="${rt.ifmmSeq}"/>">
		<input type="hidden" id="thisPage" name="thisPage" value="<c:out value="${vo.thisPage}"/>">
		<input type="hidden" id="ifmmDelNy" name="ifmmDelNy" value="<c:out value="${vo.ifmmDelNy}"/>">
		<input type="hidden" id="shOption" name="shOption" value="<c:out value="${vo.shOption}"/>">
		<input type="hidden" id="shValue" name="shValue" value="<c:out value="${vo.shValue}"/>">
		<input type="hidden" id="shOptionDate" name="shOptionDate" value="<c:out value="${vo.shOptionDate}"/>">
		<input type="hidden" id="shDateStart" name="shDateStart" value="<c:out value="${vo.shDateStart}"/>">
		<input type="hidden" id="shDateEnd" name="shDateEnd" value="<c:out value="${vo.shDateEnd}"/>">
		<h1 style="text-align: center;">회원상세</h1>
		<hr>
		<!-- Button trigger modal -->
		<div class="ccc">
			<%-- 	<a class="btn btn-primary" href="/member/memberList?ifmmSeq=<c:out value="${rt.ifmmSeq}"/>&thisPage=<c:out value="${vo.thisPage}"/>&shOption=<c:out value="${vo.shOption }"/>&shValue=<c:out value="${vo.shValue }"/>">목	록</a>
				<a class="btn btn-info" style="color:white;" href="/member/memberEdit?ifmmSeq=<c:out value="${rt.ifmmSeq}"/>">수	정</a>
				<button type="button" class="btn btn-danger"  data-bs-toggle="modal" data-bs-target="#staticBackdrop" style="font-family: 잘풀리는하루; color:white;">삭	제</button> --%>
			<a class="btn btn-primary" href="javascript:goList(<c:out value="${vo.thisPage}" default="1"/>)">목 록</a> 
			<a class="btn btn-info" style="color: white;" href="javascript:goEdit(<c:out value="${rt.ifmmSeq}"/>)">수 정</a> 
			<a class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#staticBackdrop" style="color: white;">삭 제</a>
		</div>
		<br>
		<br>
		<!-- Modal -->
		<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="staticBackdropLabel">경고</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">정말 지우시겠습니까?</div>
					<div class="modal-footer">
						<%-- <button href="/infra/code/codeGroupDele?ifmmSeq=<c:out value="${item.ifmmSeq}"/>" type="button" class="btn btn-primary" id="btnDelete"> 네(진행하기)</button> --%>
						<a href="/member/memberListDele?ifmmSeq=<c:out value="${rt.ifmmSeq}"/>" class="btn btn-danger" id="btnDelete">삭제</a>
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">아니요(돌아가기)</button>
					</div>
				</div>
			</div>
		</div>


		<hr>
		<div>
			<div class="row">
				<div class="col-2 col-md-1 mb-2 p-0 text-end pe-2"
					style="margin: auto;">
					<img src="/resources/uploaded/<c:out value="${rt.uuidFileName}"/>"
						style="width: 150px; height: 150px;"
						class="rounded-circle border border-5">
				</div>
				<%-- <a href="/infra/resources/uploaded/<c:out value="${item.uuidFileName}"/>">파일 다운로드</a> --%>
				<!-- <img src="/resources/uploaded/wolfgrey.jpg"> -->
				<div class="col-4 col-md-1 mb-2"></div>
			</div>

			<table class="table table-hover">
				<tr>
					<td rowspan="10"
						style="background-color: #00bfff; width: 10px; color: white; padding-top: 110px;">인적사항</td>
					<td rowspan="2"
						style="background-color: #00bfff; color: white; text-align: center; margin: auto; width: 80px; padding-top: 30px;">이름</td>
					<td style="background-color: #00bfff; color: white; width: 80px;">한
						글</td>
					<td><c:out value="${rt.ifmmName}" /></td>
					<td style="background-color: #00bfff; color: white; width: 130px;">비밀번호</td>
					<td><c:out value="${rt.ifmmPassword}" /></td>
				</tr>
				<tr>
					<td style="background-color: #00bfff; color: white;">영 어</td>
					<td><c:out value="${rt.ifmmNameEng}" /></td>
					<td style="background-color: #00bfff; color: white;">비밀번호확인</td>
					<td><c:out value="${rt.ifmmPassword2}" /></td>
				</tr>
				<tr>
					<td style="background-color: #00bfff; color: white;">아이디</td>
					<td colspan="2"><c:out value="${rt.ifmmId}" /></td>
					<td style="background-color: #00bfff; color: white;">성별</td>
					<td colspan="2"><c:out value="${rt.ifcdName}" /></td>
				</tr>
				<tr>
					<td style="background-color: #00bfff; color: white;">E-Mail</td>
					<td colspan="2"><c:out value="${rt.ifmeEmailFull}" /></td>
					<td style="background-color: #00bfff; color: white;">통신사</td>
					<td><c:out value="${rt.ifmpTelecompany}" /></td>
				</tr>

				<tr>
					<td style="background-color: #00bfff; color: white;">생일</td>
					<td colspan="2"><c:out value="${rt.ifmmDob}" /></td>
					<td style="background-color: #00bfff; color: white;">휴대폰</td>
					<td><c:out value="${rt.ifmpNumber}" /></td>
				</tr>
				<tr>
					<td style="background-color: #00bfff; color: white;">가입날짜</td>
					<td colspan="2"><fmt:formatDate value="${rt.regDateTime}"
							pattern="yyyy-MM-dd" /></td>
					<td style="background-color: #00bfff; color: white;">마케팅 수신동의</td>
					<td colspan="2"><input type="radio"
						<c:if test="${rt.ifmmMarketing eq 'email' }">checked </c:if>
						disabled>&nbspEmail <input type="radio"
						<c:if test="${rt.ifmmMarketing eq 'sms' }">checked </c:if>
						disabled>&nbspSns <input type="radio"
						<c:if test="${rt.ifmmMarketing eq 'push' }">checked </c:if>
						disabled>&nbspPush</td>
				</tr>
				<tr>
					<td style="background-color: #00bfff; color: white;">주소</td>
					<td colspan="5"><c:out value="${rt.ifmaAddress1}" /></td>
				</tr>

				<tr>
					<td style="background-color: #00bfff; color: white;">상세주소</td>
					<td colspan="2"><c:out value="${rt.ifmaAddress2}" /></td>
					<td style="background-color: #00bfff; color: white; width: 130px;">우편번호</td>
					<td colspan="2"><c:out value="${rt.ifmaZipcode}" /></td>
				</tr>
				<tr>
					<td style="background-color: #00bfff; color: white;">위도</td>
					<td colspan="2"><c:out value="${rt.ifmaLat}" /></td>
					<td style="background-color: #00bfff; color: white;">경도</td>
					<td colspan="2"><c:out value="${rt.ifmaLng}" /></td>
				</tr>
				<tr>
					<td style="background-color: #00bfff; color: white;">국적</td>
					<td><c:out value="${rt.ifnNation}" /></td>
				</tr>
			</table>
		</div>
		<div style="height: 10px;"></div>
		<table class="table table-hover">
			<tr>
				<td rowspan="4"
					style="background-color: #00bfff; color: white; width: 10px; padding-top: 40px;">구매정보</td>
				<td style="background-color: #00bfff; color: white;">제품명</td>
				<td style="background-color: #00bfff; color: white;">제품구매일</td>
				<td style="background-color: #00bfff; color: white;">제품가격</td>
			</tr>
			<tr>
				<td><input class="form-control me-2" type="text" id="" name=""
					disabled></td>
				<td><input class="form-control me-2" type="date" disabled></td>
				<td><input class="form-control me-2" type="text" id="" name=""
					disabled></td>
			</tr>
			<tr>
				<td><input class="form-control me-2" type="text" id="" name=""
					disabled></td>
				<td><input class="form-control me-2" type="date" disabled></td>
				<td><input class="form-control me-2" type="text" id="" name=""
					disabled></td>
			</tr>
			<tr style="padding: 10px;">
				<td><input class="form-control me-2" type="text" id="" name=""
					disabled></td>
				<td><input class="form-control me-2" type="date" disabled></td>
				<td><input class="form-control me-2" type="text" id="" name=""
					disabled></td>
			</tr>
		</table>

		<div style="height: 10px;"></div>


	</form>
</body>

	<script href="../_bootstrap/bootstrap-5.1.3-dist/js/bootstrap.bundle.min.js"></script> 
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script> 
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> 
	<script src="/resources/common/jquery/jquery-ui-1.13.1.custom/jquery-ui.js"></script> 
	<link href="/resources/common/jquery/jquery-ui-1.13.1.custom/jquery-ui.css" rel="stylesheet"/> 
	

<script type="text/javascript">
   	 	
		$("#btnDelete").on("click", function(){ /* // 아이디면 샵 클래스면 점  btn 앞을 말한거다. */
		// confirm("진짜 삭제?") // alert 확인버튼 밖에 없다
		var answer = confirm("삭제 하시겠습니까?")
		
		});
	</script>

<script type="text/javascript">
			var myModal = document.getElementById('myModal')
			var myInput = document.getElementById('myInput')
			
			myModal.addEventListener('shown.bs.modal', function () {
			  myInput.focus()
			});
	</script>


<!-- 이거   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
 -->


<script type="text/javascript"> /* 이거 영민님이 주신 박스 전체 체크 하는 기능 */

	function selectAll(selectAll) {
		const checkboxes 
			= document.getElementsByName("checkbox1");
		
		checkboxes.forEach((checkbox) => {
			checkbox.checked = selectAll.checked;
		})
	};
	</script>
	
	<script>
	goList = function(seq) {
			alert(seq);
			// form 객체를 가져온다
			$("#thisPage").val(seq);
			$("#formList").attr("action", "/member/memberList");
			$("#formList").submit();
			// 그 가져온 객체를 전달한다.
		};

		
		goEdit = function(seq){
			$("#ifmmSeq").val(seq);
			$("#formList").attr("action", "/member/memberEdit");
			$("#formList").submit();
		};
	</script>

<!-- 	<script type="text/javascript">
		$("#btnupdateDelete").on("click", function(){ /* // 아이디면 샵 클래스면 점  btn 앞을 말한거다. */
		// confirm("진짜 삭제?") // alert 확인버튼 밖에 없다
		var answer = confirm("가짜삭제 하시겠습니까?")
		if(answer){
		}
			else {
			alert("취소")
			return false;
			}
		});
	</script> -->


</html>