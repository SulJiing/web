<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<style>
.rq {
  color: red;
  font-weight: bold;
}
</style>
	
<!-- <div class="col-sm-8"> -->
	  <h4>회원가입</h4>
	  <hr>
<!-- 바로 action으로 지정된 위치로 데이터를 일일히 보내지 않고 함수를 연결해서 데이터 직렬화 후 처리 위치로 전달할  예정 -->
	  <form class="form-horizontal" method="post" onsubmit="valid(event)">
	    <div class="form-group">
	      <label for="id" class="control-label col-sm-2">아이디<span class="rq"> *</span></label>
	      <div class="col-sm-4">
	        <input type="text" class="form-control" id="id" name="mem_id" placeholder="Enter id"
	        required pattern="[a-zA-Z]\w{3,7}">
<!-- 	        required pattern="[a-zA-Z][a-zA-Z0-9]{3,7}"> -->
	      </div>
	      <div class="col-sm-6" style="text-align: left;">
            <button type="button" class="btn btn-success btn-sm" id="idChk">중복검사</button>
            <span id="disp"></span>
	      </div>
	    </div>
	    
	    <!-- 정규식패턴 regular expression: 정해진 규칙을 통해 텍스트에서 정보를 추출하는데 사용되는 패턴 -->
		<!-- 전방탐색: 일치영역만 찾고 값은 반환하지 않는 패턴, '?='로 시작하며 '='다음에 일치할 텍스트를 찾음 -->
		<!-- * 0회 이상 반복 -->
		<!-- + 1회 이상 반복 -->
		<!-- ? 0 또는 1회 -->
	    <div class="form-group">
	      <label for="pass" class="control-label col-sm-2">비밀번호<span class="rq"> *</span></label>
	      <div class="col-sm-4">
	      	<!-- 임의문자(.)를 대상으로 최소 갯수(*?)의 패턴을 찾음 => 적어도 1개 이상의 각 문자들이 적용되야 함을 표현 -->
	        <input type="password" class="form-control" id="pass" name="mem_pass"
	         required pattern="(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$%\^&amp;\*\(\)_\+\|]).{8,}">
			<!-- not a valid regular expression & ==> &amp; ^ [] $ () | * + ? {} \ 는 이스케이프 처리  "> -->
	      </div>
	    </div>
	    
	    <div class="form-group">
	      <label for="name" class="control-label col-sm-2">이름<span class="rq"> *</span></label>
	      <span class="sp"></span>
	      <div class="col-sm-4">
	        <input type="text" class="form-control" id="name" name="mem_name"
	         required pattern="[가-힣]{2,8}">
	      </div>
	    </div>
	    
	    <div class="form-group">
	      <label for="bir" class="control-label col-sm-2">생년월일</label>
	      <div class="col-sm-4">
	        <input type="date" class="form-control" id="bir" name="mem_bir">
	      </div>
	    </div>
	    
	    <div class="form-group">
	      <label for="hp" class="control-label col-sm-2">연락처<span class="rq"> *</span></label>
	      <div class="col-sm-4">
	        <input type="text" class="form-control" id="hp" name="mem_hp" placeholder="010-0000-0000"
	        required pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}">
<!-- 	        required pattern="\d{2,3}-\d{3,4}-\d{5}"> -->
	      </div>
	    </div>
	    
	    <div class="form-group">
	      <label for="mail" class="control-label col-sm-2">이메일</label>
	      <div class="col-sm-4">
	        <!-- 영문숫자조합문자가 최소 1회 이상반복, @발생, 문자최소1회반복, dot으로 시작하는 영문자가 1~2회 발생 -->
	        <!-- escape로 특수문자를 처리 -->
	        <input type="email" class="form-control" id="mail" name="mem_mail"
	        pattern="\w+@\w+(\.[a-z]+){1,2}">
<!-- 	        pattern="[0-9a-zA-Z]+@[0-9a-zA-Z]+(\.[a-z]+){1,2}"> -->
	      </div>
	    </div>
	    
	    <div class="form-group">
	      <label for="add1" class="control-label col-sm-2">우편번호<span class="rq"> *</span></label>
	      <div class="col-sm-4">
	        <input type="text" class="form-control" id="postAddr" name="mem_zip" required>
	      </div>
	      <div class="col-sm-6" style="text-align: left;">
	        <button type="button" id="addrBtn" class="btn btn-info btn-sm">주소검색</button>
	      </div>
	    </div>
	    
	    <div class="form-group">
	      <label for="add1" class="control-label col-sm-2">주소<span class="rq"> *</span></label>
	      <div class="col-sm-6">
	        <input type="text" class="form-control" id="addr1" name="mem_add1" required>
	      </div>
	    </div>
	    
	    <div class="form-group">
	      <label for="add2" class="control-label col-sm-2">상세주소<span class="rq"> *</span></label>
	      <div class="col-sm-6">
	        <input type="text" class="form-control" id="addr2" name="mem_add2" required>
	      </div>
	    </div>
	    
	    <div class="form-group">
	      <div class="col-sm-offset-2 col-sm-6">
	        <button class="btn btn-default" id="joinBtn">가입하기</button>
	        <span id="joinspan"></span>
	      </div>
	    </div>
	  </form>
	</div>
	
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

	$('#addrBtn').on('click',postcode);
	// kakao주소api
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function postcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postAddr').value = data.zonecode;
                document.getElementById("addr1").value = roadAddr;
//                 document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
    
    // 아이디 중복검사
	// 	$('#idChk').on('click',function(){});
	$('#id').on('keyup',function(){
		$.ajax({
			type:'get',
			url:'./idChk.jsp',
			data:{uId: $('#id').val()}, // "uId=" + $('#id').val()
			success:function(data){
				console.log(data);
				if(data.rst=="ok"){
					// 사용가능
					$('#disp').text(data.msg).css('color','green');
				} else {
					// 사용불가
					$('#disp').text(data.msg).css('color','red');
				}
			},
			error:function(xhr){
				alert("상태: "+xhr.status);
			},
			dataType:'json'
		});
	});
function valid(e) {
	
	e.preventDefault(); // submit 기능을 중지시킴 => 현재 페이지로 정의된 /Join으로 이동하지 않음
	
	// 데이터 직렬화
	let data = $('form').serialize();
	console.log("순식간에 지나감",data);
	
	// ajax를 이용해서 데이터를 servlet또는 jsp로 전달하고 응답(처리결과)받기
	$.ajax({
		method: 'get',
		url:'serialize.jsp',
		data: data,
		success:function(data){
			console.log(data);
			if(data ==1){
				$('#joinspan').text("가입성공").css('color','green');
				if(confirm("로그인 페이지로 이동하시겠습니까?")) {
					location.href="login.html";
				}
			} else{
				$('#joinspan').text("가입실패").css('color','red');
			}
		},
		error:function(xhr){
			alert("상태: "+xhr.status);
		},
		dataType:''
	});
}
</script>
</body>
</html>