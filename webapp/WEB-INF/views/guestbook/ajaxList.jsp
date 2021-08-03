<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="${pageContext.request.contextPath}/assets/css/mysite.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/guestbook.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.12.4.js"></script>

</head>

<body>
  <div id="wrap">


    <!-- Header -->
    <c:import url="/WEB-INF/views/includes/header.jsp"></c:import>

    <div id="container" class="clearfix">

      <!-- aside -->
      <c:import url="/WEB-INF/views/includes/asideGuestBook.jsp"></c:import>

      <div id="content">

        <div id="content-head" class="clearfix">
          <h3>ajax방명록</h3>
          <div id="location">
            <ul>
              <li>홈</li>
              <li>방명록</li>
              <li class="last">ajax방명록</li>
            </ul>
          </div>
        </div>
        <!-- //content-head -->

        <div id="guestbook">
          <form action="" method="get">
            <table id="guestAdd">
              <colgroup>
                <col style="width: 70px;">
                <col>
                <col style="width: 70px;">
                <col>
              </colgroup>
              <tbody>
                <tr>
                  <th><label class="form-text" for="input-uname">이름</label></th>
                  <td><input id="input-uname" type="text" name="name" value=""></td>
                  <th><label class="form-text" for="input-pass">패스워드</label></th>
                  <td><input id="input-pass" type="password" name="password" value=""></td>
                </tr>
                <tr>
                  <td colspan="4"><textarea name="content" cols="72" rows="5"></textarea></td>
                </tr>
                <tr class="button-area">
                  <td colspan="4" class="text-center"><button type="submit" id="btnSubmit">등록</button></td>
                </tr>
              </tbody>
            </table>
          </form>

          <div id="listArea"></div>

        </div>
        <!-- //guestbook -->

      </div>
      <!-- //content  -->
    </div>
    <!-- //container  -->

    <!-- footer -->
    <c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>

  </div>
  <!-- //wrap -->

</body>
<script type="text/javascript">
	// 페이지가 로딩되기 전일 때(이벤트)
	$(document).ready(function() { // 문서가 준비되면 매개변수로 넣은 함수를 실행하라는 의미
		// ajax 요청
		$.ajax({

			url : "${pageContext.request.contextPath}/api/guestbook/list",
			type : "post",
			/*
			contentType : "application/json",
			data : {
				name : "홍길동"
			},
			dataType : "json",
			 */
			success : function(guestbookList) {
				// 성공 시 처리해야될 코드 작성
				console.log(guestbookList);

				// 화면에 그리기
				for (var i = 0; i < guestbookList.length; i++) {

					render(guestbookList[i], "down");
				}

			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		});
	});

	// 등록 버튼 클릭할 때(이벤트)
	$("#btnSubmit").on("click", function() {
		event.preventDefault(); // href를 통해 이동하거나, 창이 새로고침하여 실행되는 걸 막아준다.
		console.log("등록버튼 클릭");

		<!--
		/*** 방법 1 ***/
		// name 값 읽어오기
		var name = $("[name='name']").val();
		console.log(name);

		// password 값 읽어오기
		var password = $("[name='password']").val();
		console.log(password);

		// content 값 읽어오기
		var content = $("[name='content']").val();
		console.log(content);

		// 읽은 값을 객체에 넣기
		var guestbookVo = {
			name : name,
			password : password,
			content : content
		};
		-->

		// 읽은 값을 객체에 넣기
		var guestbookVo = {
			name : $("[name='name']").val(),
			password : $("[name='password']").val(),
			content : $("[name='content']").val()
		};

		$.ajax({

			url : "${pageContext.request.contextPath }/api/guestbook/write",
			type : "get",
			// contentType : "application/json",

			/* 	*** 방법 1 ***
			// 사용자가 입력한 데이터를 객체에 넣음
			 data : {
			 name : name,
			 password : password,
			 content : content,
			 }, */

			/*** 방법 2 ***/
			// 사용자가 입력한 데이터를 객체에 넣음
			data : guestbookVo,

			// dataType : "json",
			success : function(guestbookVo) {
				/*성공시 처리해야될 코드 작성*/
				render(guestbookVo, "up");
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		});
	});

	function render(guestbookVo, type) {
		var str = '';
		str += '<table class="guestRead">';
		str += '	<colgroup>';
		str += '		<col style="width: 10%;">';
		str += '		<col style="width: 40%;">';
		str += '		<col style="width: 40%;">';
		str += '		<col style="width: 10%;">';
		str += '	</colgroup>';
		str += '	<tr>';
		str += '		<td>' + guestbookVo.no + '</td>';
		str += '		<td>' + guestbookVo.name + '</td>';
		str += '		<td>' + guestbookVo.reg_date + '</td>';
		str += '		<td><a href="">삭제</a></td>';
		str += '	</tr>';
		str += '	<tr>';
		str += '		<td colspan="4">' + guestbookVo.content + '</td>';
		str += '	</tr>';
		str += '</table>';

		if (type === "up") {
			$("#listArea").prepend(str);

		} else if (type === "down") {
			$("#listArea").append(str);
		} else {
			console.log("방향을 지정해주세요.")
		}

	};

	function name() {

	};
</script>

</html>