<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서명만들기</title>
</head>
<style>

.f-left{
	float: left;
}


.canvas {
	width: 300px;
	height: 300px;
	background-color: white;
	border-radius: 15px;
	box-shadow: 0 4px 6px rgba(50, 50, 93, 0.11), 0 1px 3px
		rgba(0, 0, 0, 0.5);
	margin-left: 20px;
	margin-top: 20px;
}

.controls {
	margin-top: 150px;
	display: flex;
	flex-direction: column;
	align-items: center;
}

.controls .controls__btns {
	margin-bottom: 30px;
}

.controls__btns button {
	all: unset;
	cursor: pointer;
	background-color: white;
	padding: 5px 0px;
	width: 80px;
	text-align: center;
	border-radius: 5px;
	box-shadow: 0 4px 6px rgba(50, 50, 93, 0.11), 0 1px 3px
		rgba(0, 0, 0, 0.08);
	border: 2px solid rgba(0, 0, 0, 0.2);
	color: rgba(0, 0, 0, 0.7);
	text-transform: uppercase;
	font-weight: 800;
	font-size: 12px;
}

.controls__btns button:active {
	transform: scale(0.98);
}

.controls .controls__colors {
	display: flex;
}

.controls__colors .controls__color {
	width: 50px;
	height: 50px;
	border-radius: 25px;
	cursor: pointer;
	box-shadow: 0 4px 6px rgba(50, 50, 93, 0.11), 0 1px 3px
		rgba(0, 0, 0, 0.08);
}

.controls .controls__range {
	margin-bottom: 30px;
}
</style>

<body>
	<div class="canvasBox f-left">
		<canvas id="jsCanvas" class="canvas"></canvas>
	</div>
	<div class="controls f-left">
		<div class="controls__range">
			<input type="range" id="jsRange" min="0.1" max="5" value="2.5"
				step="0.1" />
		</div>
		<div class="controls__btns">
			<button id="jsSave">Save</button>
		</div>
	</div>
	<script type="text/javascript">
		const canvas = document.getElementById("jsCanvas");
		const ctx = canvas.getContext("2d");
		const colors = document.getElementsByClassName("jsColor");
		const range = document.getElementById("jsRange");
		const mode = document.getElementById("jsMode");
		const saveBtn = document.getElementById("jsSave");

		const INITIAL_COLOR = "#2c2c2c";
		const CANVAS_SIZE = 300;

		canvas.width = CANVAS_SIZE;
		canvas.height = CANVAS_SIZE;

		ctx.fillStyle = "white";
		ctx.fillRect(0, 0, CANVAS_SIZE, CANVAS_SIZE);
		ctx.strokeStyle = INITIAL_COLOR;
		ctx.lineWidth = 2.5;

		let painting = false;
		let filling = false;

		function stopPainting() {
		  painting = false;
		}

		function startPainting() {
		  painting = true;
		}

		function onMouseMove(event) {
		  const x = event.offsetX;
		  const y = event.offsetY;
		  if (!painting) {
		    ctx.beginPath();
		    ctx.moveTo(x, y);
		  } else {
		    ctx.lineTo(x, y);
		    ctx.stroke();
		  }
		}

		function handleColorClick(event) {
		  const color = event.target.style.backgroundColor;
		  ctx.strokeStyle = color;
		  ctx.fillStyle = color;
		}

		function handleRangeChange(event) {
		  const size = event.target.value;
		  ctx.lineWidth = size;
		}

		function handleModeClick() {
		  if (filling === true) {
		    filling = false;
		    mode.innerText = "Fill";
		  } else {
		    filling = true;
		    mode.innerText = "Paint";
		  }
		}

		function handleCanvasClick() {
		  if (filling) {
		    ctx.fillRect(0, 0, CANVAS_SIZE, CANVAS_SIZE);
		  }
		}

		function handleCM(event) {
		  event.preventDefault();
		}

		function handleSaveClick() {
		  const image = canvas.toDataURL();
		  const link = document.createElement("a");
		  link.href = image;
		  link.download = "signature_img";
		  link.click();
		}

		if (canvas) {
		  canvas.addEventListener("mousemove", onMouseMove);
		  canvas.addEventListener("mousedown", startPainting);
		  canvas.addEventListener("mouseup", stopPainting);
		  canvas.addEventListener("mouseleave", stopPainting);
		  canvas.addEventListener("click", handleCanvasClick);
		  canvas.addEventListener("contextmenu", handleCM);
		}

		Array.from(colors).forEach(color =>
		  color.addEventListener("click", handleColorClick)
		);

		if (range) {
		  range.addEventListener("input", handleRangeChange);
		}

		if (mode) {
		  mode.addEventListener("click", handleModeClick);
		}

		if (saveBtn) {
		  saveBtn.addEventListener("click", handleSaveClick);
		}
	</script>
</body>
</html>