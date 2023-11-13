<%@ include file="/WEB-INF/jsp/include/top.jsp"%>
<link rel="stylesheet" type="text/css" href="/css/page/group.css" />

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

   <div class="d-flex" id="wrapper">
      <!-- Sidebar-->
      
      <div class="col-md-2 col-lg-3 col-xl-2 border-end bg-white" id="sidebar-wrapper" style="
       margin-bottom: 50px;
       border-bottom: 1px solid #dee2e6;">
       
        <div class="list-group list-group-flush">
               <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">마이 페이지</a>
               <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">신청 글 작성</a>
               <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">신청 목록/ 승인 및 거절</a>
               <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">진행 중인 봉사</a>
               <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">봉사활동 후기글</a>
               <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">캘린더 관리</a>
               <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">개인 정보 및 프로필 수정</a>
         </div>
         
      </div>
      
      <div style="width:100%">
      
         <div class="kanban-board">
            <div class="column" id="waiting-column" style="min-height:700px; margin-bottom:50px;">
                <h2 style="color: black;
                font-size: 25px;
                font-weight: bold;">신청 대기 목록</h2>
                
                
                <div class="card" style="min-height: 643px;">
                    <table style="font-size:13px;">
                        <tr>
                         <th>신청번호</th>
                            <th>봉사글번호</th>
                            <th>회원번호</th>
                            <th>이름</th>
                            <th>상태</th>
                        </tr>
                        
                        <c:forEach var="state" items="${state}">
                        <tbody id="stateList">
	                        <tr id="statestateList">
	                            <td class="volunProceedSeq" id="volun_proceed_seq">${state.volunProceedSeq}</td>
	                            <td id="recruitSeq">${state.recruitSeq}</td>
	                            <td id="memSeq">${state.memSeq}</td>
	                            <td id="name">${state.name}</td>                                           
	                            <td id="statestate">
	                                <div class="button-container">
	                                   <input type="hidden" value="${state.state}" id="state">
	                                   
		                                   <button onclick="moveToAccepted(this)" >승인</button>
		                                   <button onclick="openRejectDialog(${state.volunProceedSeq})">거절</button>
	                                </div>
	                            </td>
	                        </tr>
                        </tbody>
                        </c:forEach>
                        
                    </table>
                </div>
            </div>
            
         <!-- 신청 확정 내역 -->

            <div class="column" id="accepted-column" style="margin-bottom:50px;">
            
                <!-- 승인 내역 카드 -->
                <h2 style="color: black; font-size: 25px; font-weight: bold;">승인 목록</h2>
                <div class="card" style="min-height:300px;">
                    <table style="font-size:13px;">
                        
                        <tr>
                           	<th>신청번호</th>
                            <th>봉사글번호</th>
                            <th>회원번호</th>
                            <th>이름</th>
                            <th>상태</th>
                        </tr>
                        
                        <tbody id="approveList">
	                        <c:forEach var="approve" items="${approve}">
		                        	<tr id="approveDetail">
			                            <td class="approveVolunProceedSeq">${approve.volunProceedSeq}</td>
			                            <td id="approveRecruitSeq">${approve.recruitSeq}</td>
			                            <td id="approveMemSeq">${approve.memSeq}</td>
			                            <td id="approveName">${approve.name}</td>                                           
			                            <td id="approveState">${approve.state}</td>
			                        </tr>
	                        </c:forEach>
                        </tbody>
                        
                     	<tr id="approveapproveList" style="display: none;">
                            <td class="approveVolunProceedSeq"></td>
                            <td id="approveRecruitSeq"></td>
                            <td id="approveMemSeq"></td>
                            <td id="approveName"></td>                                           
                            <td id="approveState"></td>
	                    </tr>
                    </table>
                </div>
                
                <!-- 거절 내역 카드 -->
                <h2 style="color: black; font-size: 25px; font-weight: bold;">거절 목록</h2>
                <div class="card" style="min-height:300px;">
                    <table style="font-size:13px;">
                        
                        <tr>
                           <th>신청번호</th>
                            <th>봉사글번호</th>
                            <th>회원번호</th>
                            <th>이름</th>
                            <th>상태</th>
                        </tr>
                        
                        <tbody id="rejectList">
	                        <c:forEach var="reject" items="${reject}">
		                        	<tr id="rejectDetail">
			                            <td class="rejectVolunProceedSeq">${reject.volunProceedSeq}</td>
			                            <td id="rejectRecruitSeq">${reject.recruitSeq}</td>
			                            <td id="rejectMemSeq">${reject.memSeq}</td>
			                            <td id="rejectName">${reject.name}</td>                                           
			                            <td id="rejectState">${reject.state}</td>
			                        </tr>
	                        </c:forEach>
                        </tbody>
                        
                     	<tr id="rejectrejectList" style="display: none;">
	                            <td class="rejectVolunProceedSeq"></td>
	                            <td id="rejectRecruitSeq"></td>
	                            <td id="rejectMemSeq"></td>
	                            <td id="rejectName"></td>                                           
	                            <td id="rejectState"></td>
	                    </tr>
                     	
                    </table>
                </div>
                
            </div>

        
        </div>

        
        <div id="rejectDialog" class="modal">
        <input type="hidden" id="volunSeq" value="">
            <div class="modal-content">
               <span class="close" onclick="closeRejectDialog()">&times;</span>
               <h2>거절 사유 입력</h2>
               <textarea id="rejectMessage" rows="4" cols="50"></textarea>
               <button onclick="sendRejectionReason(this)">전송</button>
            </div>
        </div>

	  
    </div>
</div>
 

<script>


function moveToAccepted(button) {
    button.disabled = true;

    const state = $(button).closest("tr").find("#state").val();
    const volunProceedSeq = $(button).closest("tr").find(".volunProceedSeq").text();

    const param = {
        state: state,
        volunProceedSeq: volunProceedSeq,
    };

    fetch("<c:url value='/manager/approve'/>", {
        method: "POST",
        headers: {
            "Content-Type": "application/json; charset=UTF-8",
        },
        body: JSON.stringify(param),
    })
    .then((response) => response.json())
    .then((json) => {
        if (json.status) {
            // 성공적으로 승인되었을 때, 승인 상태로 변경하고 목록에서 삭제
            console.log("성공1");
            const row = $(button).closest("tr");
            console.log("성공2");
            row.remove();
            console.log("성공3");
            
            const approveList = $("#approveList"); // 댓글 목록 요소 (전체 데이터)
            approveList.empty();
            
            // 승인 데이터를 가져오는 방식에 따라서 아래 코드 수정이 필요합니다.
            const approves = json.approve.approve; // 승인 데이터 가져오기
           	console.log(approves);
           	console.log("성공4");
            
           	approves.forEach((approve) => {
	       		const approveapproveList = $("#approveapproveList").clone();
	            
	       		console.log("성공5");
	            console.log(approve);
	            
	            approveapproveList.find(".approveVolunProceedSeq").text(approve.volunProceedSeq);
	            approveapproveList.find("#approveRecruitSeq").text(approve.recruitSeq);
	            approveapproveList.find("#approveMemSeq").text(approve.memSeq);
	            approveapproveList.find("#approveName").text(approve.name);
	            approveapproveList.find("#approveState").text(approve.state);
        	   

                // 목록에 새로운 행 추가
               	approveapproveList.show();
               	approveList.append(approveapproveList);
           
           	
           	})
           
        } else {
            alert('승인에 실패했습니다: ' + json.message);
            console.log(json.message);
        }
    })
    .catch(error => {
        console.error('오류 발생:', error);
    });
}


 function sendRejectionReason(button) {

	    const state = document.getElementById('state').value;
	    const rejectMessage = document.getElementById('rejectMessage').value;
	   /*  const volunProceedSeq = document.getElementById('volun_proceed_seq').textContent; */
	    const volunProceedSeq = $("#volunSeq").val();
	   
	    console.log("state: " + state);
 	    console.log("거절 사유: " + rejectMessage);
	    console.log("volunProceedSeq: " + volunProceedSeq);

	    const param = {
	        state: state,
 	        rejectMessage: rejectMessage,
	        volunProceedSeq: volunProceedSeq,
	    };
	    
	    console.log("state2: " + state);
 	    console.log("거절 사유2: " + rejectMessage);
	    console.log("volunProceedSeq2: " + volunProceedSeq);

	    fetch("<c:url value='/manager/reject'/>", {
	        method: "POST",
	        headers: {
	            "Content-Type": "application/json; charset=UTF-8",
	        },
	        body: JSON.stringify(param),
	    })
	    .then((response) => response.json())
	    .then((json) => {
	        if (json.status) {

	        	const volunProceedSeq = $("#volunSeq").val(); // 서버에서 받은 값

	        	// volunProceedSeq 값을 가진 행을 찾아서 삭제
	        	$("#stateList .volunProceedSeq").filter(function() {
	        	    return $(this).text() === volunProceedSeq;
	        	}).closest("tr").remove();

	        	

	            const rejectList = $("#rejectList"); // 거절 목록 요소 (전체 데이터)
	            rejectList.empty();

	            // 거절 데이터를 가져오는 방식에 따라서 아래 코드 수정이 필요합니다.
	            const rejects = json.reject.reject; // 거절 데이터 가져오기
	            console.log(rejects);
	            console.log("성공4");

	            rejects.forEach((reject) => {
	                const rejectrejectList = $("#rejectrejectList").clone();

	                console.log("성공5");
	                console.log(reject);

	                rejectrejectList.find(".rejectVolunProceedSeq").text(reject.volunProceedSeq);
	                rejectrejectList.find("#rejectRecruitSeq").text(reject.recruitSeq);
	                rejectrejectList.find("#rejectMemSeq").text(reject.memSeq);
	                rejectrejectList.find("#rejectName").text(reject.name);
	                rejectrejectList.find("#rejectState").text(reject.state);

	                // 목록에 새로운 행 추가
	                rejectrejectList.show();
	                rejectList.append(rejectrejectList);

	             	// 모달 대화 상자 닫기
	                const rejectDialog = document.getElementById('rejectDialog');
	                rejectDialog.style.display = "none";


	                // 모달 대화 상자 내용 초기화
	                document.getElementById('rejectMessage').value = "";

	            })
	            
	            
	            
	            
	            
	        } else {
	            alert('거절에 실패했습니다: ' + json.message);
	            console.log(json.message);
	        }
	    })
	    .catch(error => {
	        console.error('오류 발생:', error);
	    });
	}

 
 
 
 /* 거절폼 */

function openRejectDialog(seq) {
    const rejectDialog = document.getElementById('rejectDialog');
    console.log("뭐가쓰이는걸까1");
    $("#volunSeq").val(seq);
    
    rejectDialog.style.display = "block";
}



function closeRejectDialog() {
    const rejectDialog = document.getElementById('rejectDialog');
    rejectDialog.style.display = "none";
}

	

</script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

<script src="js/bootstrap.bundle.min.js"></script>
<script src="js/tiny-slider.js"></script>

<script src="js/flatpickr.min.js"></script>


<script src="js/aos.js"></script>
<script src="js/glightbox.min.js"></script>
<script src="js/navbar.js"></script>
<script src="js/counter.js"></script>
<script src="js/custom.js"></script>







<%@ include file="/WEB-INF/jsp/include/bottom.jsp"%>