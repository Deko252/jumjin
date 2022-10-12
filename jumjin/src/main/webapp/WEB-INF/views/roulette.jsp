<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Roulette</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="../resources/assets/favicon.ico" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="./resources/css/admin_styles.css" rel="stylesheet" />
    </head>
      <style>
		body {          
			width: 100%; 
	        height: 100vh; 
			background: skyblue; 
			overflow : hidden;
		}	
		.container {
			display: grid;
			min-height: 100%;
			align-content: center;
			justify-content: center;
		}
		
		#roullete {
			width: 400px;
			height: 400px;
			border-radius: 50%;
			background: white;
			/*border: 3px solid black;*/
			position: relative;
		}
		
		.panel {
			position: absolute;
			width: 400px;
			height: 400px;
			border-radius: 50%;
			-webkit-clip-path: polygon(0% 0%, 50% 50%, 0% 50%, 0% 0%);
			clip-path: polygon(0% 0%, 50% 50%, 0% 50%, 0% 0%);
		}
		
		.txt {
			font-size: 24px;
			width: 260px;
			height: 260px;
			position: absolute;
			top: 30px;
			left: 30px;
			text-align: center;
			transform: rotate(-67deg);
		}
		
		.pallet{
			width: 295px;
			height: 180px;
		}
		.colorBox{
			width: 20px;
			height: 20px;
			float: left;
			margin: 1px 1px 0px 0px;
			cursor: pointer;
		}
		.showColorBox{
			float: left;
			margin: 1px 1px 0px 0px;
			text-align: center;
		}
		.popup { 
			position: fixed; 
			left: 0; 
			top: 0; 
			width: 100%; 
			height: 100%; 
			background-color: rgba(0, 0, 0, 0.5); 
			opacity: 0; 
			visibility: hidden; 
			transform: scale(1.1); 
			transition: visibility 0s linear 0.25s, opacity 0.25s 0s, transform 0.25s; 
     	} 
     	
		.popup-content { 
			position: absolute; 
			top: 50%; 
			left: 50%; 
			transform: translate(-50%, -50%); 
			background-color: white; 
			padding: 1rem 1.5rem; 
			border-radius: 0.5rem; 
		}
		.btnArea {
    		float: right;
	    }
	    .btnArea input {
    		background-color: #1aa2c0;
			border: none;
		    height: 32px;
		    line-height: 1;
		    padding-left: 15px;
		    padding-right: 15px;
		    color: #ffffff
	    }
		.show-popup { 
			opacity: 1; 
			z-index:5;
			visibility: visible; 
			transform: scale(1.0); 
			transition: visibility 0s linear 0s, opacity 0.25s 0s, transform 0.25s; 
		}
		#addDiv{
					position: absolute;
		}
		.arrow{    
			left: 50%;
		    position: sticky;
		    z-index: 1;
			width: 0;
			height: 0;
			border-top: 30px solid purple;/* 화살표 */
			border-left: 10px solid transparent;
			border-right: 10px solid transparent;
		}
		#copyright{
			font-size: 7px;
		}
		
		table {
		    border-collapse: separate;
		    border-spacing: 1px;
		    text-align: center;
		    line-height: 1.5;
		    margin: 20px 10px;
		}
		table th {
		    padding: 10px;
		    font-weight: bold;
		    vertical-align: top;
		    color: #fff;
		    background: #ce4869 ;
		}
		table td {
		    padding: 10px;
		    vertical-align: top;
		    border-bottom: 1px solid #ccc;
		    background: #eee;
		}
    </style>
    <script type="text/javascript">

		window.onload = function(){
			initRoulette();
		}
		
    	function initRoulette(){
    		setRoulettePanel();
    		initAddPop();
    		
        	document.getElementById("roullete").addEventListener("animationstart", function(e) {
        	    console.log("시작");
        	}, false);

        	document.getElementById("roullete").addEventListener("animationend", function(e) {
        	    console.log("종료");
        	}, false);
    	}

    	function triggerAddPop(){
    		document.querySelector(".popup").classList.toggle("show-popup");
    	}
    	function openAddPop(){
    		document.getElementById("btnArea").innerHTML = '<input type="button" id="cancelBtn" value="CANCEL" onclick="triggerAddPop();"><input type="button" id="addBtn" value="ADD" onclick="clickAddBtn();">';
    		
   			document.getElementById("addText").value = "";
   			document.getElementById("fontColor").value = "";
   			document.getElementById("color").value = "";
   			document.getElementById("colorTypeBg").checked = "checked"
    		
    		document.querySelector(".popup").classList.toggle("show-popup"); 
    	}
    	
    	function openUpdatePop(index){
    		document.getElementById("btnArea").innerHTML = '<input type="button" id="cancelBtn" value="CANCEL" onclick="triggerAddPop();"><input type="button" id="saveBtn" value="SAVE" onclick="clickUpdateBtn('+index+');">';
    		
			var target = document.getElementById("panelInfo"+index);
			document.getElementById("addText").value = target.innerHTML;
			document.getElementById("fontColor").value = target.style.color;
			document.getElementById("color").value = target.style.background;;
			document.getElementById("colorTypeBg").checked = "checked"	
	    	document.querySelector(".popup").classList.toggle("show-popup"); 
    	}
    	
    	function initAddPop(){
			//2차원 배열 파레트 데이터
			var pallet = [["#FF0000", "#FF5E00", "#FFBB00", "#FFE400", "#ABF200", "#1DDB16", "#00D8FF", "#0054FF", "#0100FF", "#5F00FF", "#FF00DD", "#FF007F", "#000000", "#FFFFFF"],
			              ["#FFD8D8", "#FAE0D4", "#FAECC5", "#FAF4C0", "#E4F7BA", "#CEFBC9", "#D4F4FA", "#D9E5FF", "#DAD9FF", "#E8D9FF", "#FFD9FA", "#FFD9EC", "#F6F6F6", "#EAEAEA"],
			              ["#FFA7A7", "#FFC19E", "#FFE08C", "#FAED7D", "#CEF279", "#B7F0B1", "#B2EBF4", "#B2CCFF", "#B5B2FF", "#D1B2FF", "#FFB2F5", "#FFB2D9", "#D5D5D5", "#BDBDBD"],
			              ["#F15F5F", "#F29661", "#F2CB61", "#E5D85C", "#BCE55C", "#86E57F", "#5CD1E5", "#6799FF", "#6B66FF", "#A566FF", "#F361DC", "#F361A6", "#A6A6A6", "#8C8C8C"],
			              ["#CC3D3D", "#CC723D", "#CCA63D", "#C4B73B", "#9FC93C", "#47C83E", "#3DB7CC", "#4374D9", "#4641D9", "#8041D9", "#D941C5", "#D9418C", "#747474", "#5D5D5D"],
			              ["#980000", "#993800", "#997000", "#998A00", "#6B9900", "#2F9D27", "#008299", "#003399", "#050099", "#3F0099", "#990085", "#99004C", "#4C4C4C", "#353535"],
			              ["#670000", "#662500", "#664B00", "#665C00", "#476600", "#22741C", "#005766", "#002266", "#030066", "#2A0066", "#660058", "#660033", "#212121", "#191919"]];
			var tag = "";
			for(i=0; i<pallet.length; i++){
				for(j=0; j<pallet[i].length; j++){
					tag += "<div id="+pallet[i][j]+" class='colorBox' onclick='colorSet(this)'></div>";
				}
			}
			//파레트 파싱
			document.getElementById("palletBox").innerHTML = tag;

			//색상 입히기
			var colorBox = document.getElementsByClassName("colorBox");
			for(i=0; i<colorBox.length; i++){
				colorBox[i].style.background = colorBox[i].id;
			}
		}
    	
    	function setRoulettePanel(){
    		var panelArr =  document.querySelectorAll(".panel")
    		let panelArrSize = panelArr.length;
    		let rotate = 360 / panelArrSize;
    		
    		var i = 0
    		var panelRotate = 0;
    		var panelInfoTbody = [];
    		while ( i < panelArrSize){
    			panelRotate = panelRotate + rotate; 
    			panelArr[i].style.transform = "rotate("+panelRotate+"deg)";
    			i = i + 1;
    			panelInfoTbody.push("<tr><td id=\"panelInfo"+i+"\" style=\"background:"+panelArr[i-1].style.background+"; color:"+panelArr[i-1].style.color+"\">"+panelArr[i-1].innerText+"</td>");
    			panelInfoTbody.push("<td><button onclick=\"openUpdatePop('"+i+"');\">수정</button></td></tr>");
    			
    		}
    		panelInfoTbody.push("<tr><td colspan=\"2\"><button class=\"addBtn\" onclick=\"openAddPop('add');\">ADD</button></td></tr>");
    		document.getElementById("panelInfoTbody").innerHTML = panelInfoTbody.join('');
    	}
    	
    	function clickAddBtn(){
    		var roullete = document.getElementById("roullete");
    		let size = document.querySelectorAll(".panel").length+1;
    		let addPanel = document.createElement("div");
    		var panelText = document.getElementById("addText").value;
    		
    		addPanel.setAttribute("class", "panel panel_" + size);
    		addPanel.innerHTML = "<strong class=\"txt\">"+panelText+"</strong>";

    		addPanel.style.background = document.getElementById("color").value;
    		addPanel.style.color = document.getElementById("fontColor").value;
    		
    		roullete.appendChild(addPanel);
    		roullete.setAttribute("class", "eq" + size);
    		setRoulettePanel();
    		document.querySelector(".popup").classList.toggle("show-popup"); 
    	}
    	
    	function clickUpdateBtn(index){
    		let targetPanel = document.querySelector(".panel_" + index);
    		var panelText = document.getElementById("addText").value;
    		
    		targetPanel.innerHTML = "<strong class=\"txt\">"+panelText+"</strong>";

    		targetPanel.style.background = document.getElementById("color").value;
    		targetPanel.style.color = document.getElementById("fontColor").value;
    		
    		setRoulettePanel();
    		document.querySelector(".popup").classList.toggle("show-popup"); 
    	}
    	
    	function clickStartBtn() {
    		
    		document.getElementById("roullete").style.animation = "";
    		var randomRotate = (Math.random() * 3000) + 1000;
    		var randomAnimation = (Math.random() * 7000) + 2000;
    		
    		//document.getElementById("roullete").style.animation = "rotation 7s forwards ease-in-out";
    		document.getElementById("roullete").animate([
    		    { transform: "rotate(0deg)" },{ transform: "rotate("+randomRotate + "deg)" }
    	      ], 
    	      {
    			fill: 'forwards',
    		    duration: randomAnimation,
    		    easing: 'ease-in-out'
    		   }
    		);         
    		
		}

    	function colorSet(target){
    		var colorType = document.querySelector('input[name="colorType"]:checked').value;
    		if(colorType == "font"){
    			document.getElementById("fontColor").value=target.id;
        		document.getElementById("showColorBox").style.color = target.id;
    		} else {
    			document.getElementById("color").value=target.id;
        		document.getElementById("showColorBox").style.background = target.id;
    		}
		}
    </script>
    <div class="container"> 
    		<header class="header">
    			<h1 class="title">룰렛</h1>
    		</header>
    		<div class="arrow"></div>
    		<div class="eq8" id="roullete">
				<div class="panel panel_1" style="background: #00D8FF;"><strong class="txt">1</strong></div>
				<div class="panel panel_2" style="background: #F2CB61;"><strong class="txt">2</strong></div>
				<div class="panel panel_3" style="background: #FAECC5;"><strong class="txt">3</strong></div>
				<div class="panel panel_4" style="background: #665C00;"><strong class="txt">4</strong></div>
				<div class="panel panel_5" style="background: #476600;"><strong class="txt">5</strong></div>
				<div class="panel panel_6" style="background: #2F9D27;"><strong class="txt">6</strong></div>
				<div class="panel panel_7" style="background: #003399;"><strong class="txt">7</strong></div>
				<div class="panel panel_8" style="background: #6B66FF;"><strong class="txt">8</strong></div>
			</div>
			<button class="startBtn" onclick="clickStartBtn();">돌리기</button>

			<div id="addDiv">
 				<table id="panelInfo">
 					<thead>
 						<tr><th>Contents</th><th></th></tr>
 					</thead>
					<tbody id="panelInfoTbody">
					</tbody>
				</table>
			</div>

	        <p id="copyright">HTML Roulette Copyright (c) 2021 KangJungMin All rights reserved.</p>
        </div>
        
        <!-- 롤렛 패널 수정 팝업  -->
		<div class="popup"> 
			<div class="popup-content"> 
				<h1 class="title">판넬추가/수정</h1>
				<table>
					<tbody>
					<tr>
						<th><label for="addText">TEXT</label></th>
						<td><input type="text" id="addText"></td>
					</tr>
					<tr>
						<th><label for="showColorBox">COLOR</label></th>
						<td class="showColorBox" id="showColorBox">
							TEXT
						</td>
					</tr>
					
					<tr>
						<td>
							<input type="radio" id="colorTypeBg" name="colorType" value="background" checked="checked">
							<label for="colorTypeBg">background</label>
							<br/>
							<input type="radio" id="colorTypeFont" name="colorType" value="font">
							<label for="colorTypeFont">font</label>
						</td>
						<td>
							<div id="palletBox" class="pallet"></div>
							<input type="hidden" id="fontColor">
							<input type="hidden" id="color">
						</td>
					</tr>
					 
					</tbody>
					
				</table>
				
		         <div class="btnArea" id="btnArea">
		         	<input type="button" id="cancelBtn" value="CANCEL" onclick="triggerAddPop();">
					<input type="button" id="addBtn" value="ADD" onclick="clickAddBtn();">
					<input type="button" id="saveBtn" value="SAVE" onclick="clickUpdateBtn();">
		         </div>
	         </div>
	     </div>
        <!-- Navigation-->
      <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-bottom">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="./index.do">점.진.사</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item"><a class="nav-link" href="./roulette.do">룰렛 돌리기</a></li>
                        <li class="nav-item"><a class="nav-link" href="./ghostLeg.do">사다리 타기</a></li>
                        <li class="nav-item"><a class="nav-link" href="./map.do">지도</a></li>
                        <li class="nav-item active"><a class="nav-link" href="./board.do">리뷰게시판</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- Page Content-->
       <section>
            <div class="container px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5">
                    <div class="col-lg-6">
                        <h1 class="mt-5">The Big Picture</h1>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Deserunt voluptates rerum eveniet sapiente repellat esse, doloremque quod recusandae deleniti nostrum assumenda vel beatae sed aut modi nesciunt porro quisquam voluptatem.</p>
                    </div>
                </div>
            </div>
        </section>
        <!-- Bootstrap core JS-->
       <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        Core theme JS
        <script src="../resources/js/admin_scripts.js"></script>
    </body>
</html>