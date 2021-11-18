<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        mark.sky {
            background: linear-gradient(to top, #54fff9 20%, transparent 30%);
        }
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#findBtn").click(function () {
                if (!$("#userId").val()) {
                    alert("아이디입력");
                    return;
                } else if (!$("#userEmail").val()) {
                    alert("이메일입력");
                    return;
                } else if (!$("#userName").val()) {
                    alert("이름 입력");
                    return;
                } else {
                    $("#writeform").attr("action", "${root}/user/find").submit();
                }
            });
        });
    </script>
</head>
<body>
    <div class="container text-center mt-3">
        <div class="col-lg-8 mx-auto">
            <h2 class="p-3 mb-3 shadow bg-light"><mark class="sky">비밀번호 찾기</mark></h2>
            <form id="writeform" class="text-left mb-3" method="post" action="">
               <input type="hidden" name="action" value="create">
                
                <div class="form-group">
                    <label for="userId">아이디:</label>
                    <input type="text" class="form-control" id="userId" name="userId" placeholder="아이디">
                </div>
                <div class="form-group">
                    <label for="userEmail">이메일:</label>
                    <input type="text" class="form-control" id="userEmail" name="userEmail" placeholder="이메일">
                </div>
                <div class="form-group">
                    <label for="userName">이름:</label>
                    <input type="text" class="form-control" id="userName" name="userName" placeholder="이름">
                </div>
               
                <div class="text-center">
                    <button type="button" id="findBtn" class="btn btn-outline-primary">비밀번호 찾기</button>
                    <button type="reset" class="btn btn-outline-danger">초기화</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>