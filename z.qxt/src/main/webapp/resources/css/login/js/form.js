$(function() {
		$("#loginName").focus();
		$('body').keypress(function(e) {
			if (e.which == 13) {
				$("#submitBtn").click();
				return false;
			}
		});

		$("#submitBtn").click(function() {
			var errorMsg = "";
			if ($("#loginName").val() == "") {
				errorMsg += "&nbsp;&nbsp;用户名不能为空!";
			}
			if ($("#password").val() == "") {
				errorMsg += "&nbsp;&nbsp;密码不能为空!";
			}

			if (errorMsg != "") {
				$(".login_info").html(errorMsg);
				$(".login_info").show();
				if ($("#loginName").val() == "") {
					$("#loginName").focus();
				} else {
					$("#password").focus();
				}
				return;
			}

			login();
		});
	});

/*	function validate() {
		var errorMsg = "";
		var flag = 0;
		if ($("#loginName").val() == "") {
			flag = 1;
			errorMsg += "&nbsp;&nbsp;�û�����Ϊ��!";
		}
		if ($("#password").val() == "") {
			flag = 2;
			errorMsg += "&nbsp;&nbsp;���벻��Ϊ��!";
		}

		if (errorMsg != "") {
			$(".login_info").html(errorMsg);
			if (flag == 1) {
				$("#loginName").focus();
			}
			return false;
		}
		return true;
	}*/

	function resetForm() {
		$("#registerForm")[0].reset();
	}

	