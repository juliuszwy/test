<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <meta charset=utf-8 />
<title>403哟</title>
<style type="text/css">
.demo p:first-child {
  text-align: center;
  font-family: cursive;
  font-size: 140px;
  font-weight: bold;
  line-height: 100px;
  letter-spacing: 5px;
  color: rgb(226, 109, 109);
}

.demo p:first-child span {
  cursor: pointer;
  text-shadow: 0px 0px 2px #686868,
    0px 1px 1px #ddd,
    0px 2px 1px #d6d6d6,
    0px 3px 1px #ccc,
    0px 4px 1px #c5c5c5,
    0px 5px 1px #c1c1c1,
    0px 6px 1px #bbb,
    0px 7px 1px #777,
    0px 8px 3px rgba(100, 100, 100, 0.4),
    0px 9px 5px rgba(100, 100, 100, 0.1),
    0px 10px 7px rgba(100, 100, 100, 0.15),
    0px 11px 9px rgba(100, 100, 100, 0.2),
    0px 12px 11px rgba(100, 100, 100, 0.25),
    0px 13px 15px rgba(100, 100, 100, 0.3);
  -webkit-transition: all .1s linear;
  transition: all .1s linear;
}

.demo p:first-child span:hover {
  text-shadow: 0px 0px 2px #686868,
    0px 1px 1px #fff,
    0px 2px 1px #fff,
    0px 3px 1px #fff,
    0px 4px 1px #fff,
    0px 5px 1px #fff,
    0px 6px 1px #fff,
    0px 7px 1px #777,
    0px 8px 3px #fff,
    0px 9px 5px #fff,
    0px 10px 7px #fff,
    0px 11px 9px #fff,
    0px 12px 11px #fff,
    0px 13px 15px #fff;
  -webkit-transition: all .1s linear;
  transition: all .1s linear;
}

.demo p:not(:first-child) {
  text-align: center;
  color: red;
  font-family: cursive;
  font-size: 20px;
  text-shadow: 0 1px 0 #fff;
  letter-spacing: 1px;
  line-height: 2em;
  margin-top: 100px;
}
</style>
</head>
<body>
  <div class="modal-dialog">
<div class="modal-content">
<!-- <div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
				</h4>
			</div> -->
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true" style="margin: 10px ">
					&times;
			</button>
			<div class="modal-body" >
				 <div class="demo row" style="margin-top: 54px">
				    <p><span>F</span><span>O</span><span>B</span><span>I</span><span>D</span><span>D</span><span>E</span><span>N</span></p>
				    <p>对不起，您没有权限访问(´･ω･`)</p>
				  </div>
		          <div style="text-align: center;display: none;" id="qrDiv">
		          	<span style="font-size: 30px;color: #A2B5CD">请打开微信客户端扫描下方二维码完成支付！！！</span>
		          	<div>
		          		<img src="" id="qrCode"/>
		          	</div>
		          </div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
				<button type="button" class="btn btn-primary" id="save">
					确认
				</button>
			</div>
		</div>
   </div>
</body>
</html>