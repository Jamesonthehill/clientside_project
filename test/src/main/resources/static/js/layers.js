(function () {
	
	"use strict";
	
	const init = () => {
		
		initEvent();
		
		//사용자 레이어 DB 물러옴
		$.ajax({
			async : false,
			cache : false,
			type : "post",
			url : "/index/layer/layerAjax",
			contentType : "application/json; charset=UTF-8",
			dataType : 'json',
			success : function(response) {
				
				console.log(response.RESULT);
				
				document.querySelector('#layer-list tbody').innerHTML = '';
				
				response.RESULT.map((value, index) => {
					
					let tr = document.createElement('tr');
					
					tr.id= index;
					
					tr.innerHTML += `<td style="border-radius:30px;">`;
					tr.innerHTML += `	<input type="checkbox" id="checkbox${index}" style="zoom:2.0;margin-top:5px;">`;
					tr.innerHTML += `	<font size="5" style="padding-left:15px;border-radius:15px;padding-right:15px;">${value.LYR_NM}</font>`;
					tr.innerHTML += `</td>`;
					
					document.querySelector('#layer-list tbody').append(tr);
					
					tr.querySelector('input[type="checkbox"]').addEventListener('change', function() {
						map.getO2LayerById(value.TABLE_NM).setVisible(this.checked);
					});
					
					tr.querySelector('font').addEventListener('click', () => {
						
						document.querySelectorAll(`#layer-list tr:not([id="${index}"])`).forEach(el => {
							el.classList.remove('active');
						});
						
						if (tr.classList.contains('active')) {
							tr.classList.remove('active');
						} else {
							tr.classList.add('active');
						}
						
					});
						
					tr.querySelector('font').addEventListener('mouseup', () => {
						
						let div = document.createElement('div');
						
						console.log("우클릭이벤트 실시")
						div.innerHTML += `<div style="border-radius:30px;width:200px;height:260px;background-color:white;">`;
						div.innerHTML += `<input type="checkbox">`;
						div.innerHTML += `</div>`;
					});	
					// layer 불러오는 방법
					const layer = new o2.layer.O2Layer({
					
						source: new ol.source.TileWMS(({
							url: o2.common.Config.getHostWMS(),
							
							params: {
								'LAYERS': 'DBMS:SOL_GWLEE:' + value.TABLE_NM,
								'TILED': true
							}
						})),
						id: value.TABLE_NM,
						name: value.LYR_NM,
						visible : false,		
						opacity : value.OPACITY,
						zIndex : value.SORT_ORDER
					});
				
					// 'SVC' 레이어에 서울시 4종 레이어 추가
					map.getO2GroupLayerById('SVC').getLayers().push(layer);
					
//					document.querySelectorAll("font").forEach(function(el){
//						el.onclick = function() {
//							console.log(this.innerText);
//
//							document.querySelectorAll("font").forEach(function(deselectEl) {
//								deselectEl.style.backgroundColor='white';
//							});
//							
//							this.style.backgroundColor='#e0f3f9';
//						}
//					});
					
				});
				
			},
			// Ajax 오류 
			error : function(jqXHR, textStatus, errorThrown) {
				alert("ajaxUpdate " + jqXHR.textStatus + " : "
						+ jqXHR.errorThrown);
			}
		});
		
	}
	
	const initEvent = () => {
		
		// layer index change
		document.querySelectorAll(".move-button").forEach(function(el) {
			
			el.addEventListener('click', () => {
				
				const activeTr = document.querySelector('#layer-list tr.active');
				
				if (activeTr === null) {
					alert('활성화된 레이어가 없습니다.');
					return;
				}

				if (el.id === 'up') {
					
					const previousTr = activeTr.previousSibling;
					
					if (previousTr === null) {
						alert('이전 레이어가 없습니다.');
						return;
					}
					
					previousTr.before(activeTr);
					
				} else {
					
					const nextTr = activeTr.nextSibling;
					
					if (nextTr === null) {
						alert('다음 레이어가 없습니다.');
						return;
					}
					
					nextTr.after(activeTr);
					
				}
				
			});
			
		});
		
	}
	

	
	init(); // 이 init() 이 있어야지 위에서 써잇는 ajax 함수 영역위에 타고 올라가서 실행이된다.
	
	
	
	
	console.log("init(); 다음 여기서 시작");
	

		
	// 오른쪽 마우스 이벤트
//		const rightClick = document.getElementById('mouseup');
//			
//		rightClick.addEventListener('mousedown', function(e) {
//					
//			var isRightButton ;
//			    
//		    e = e || window.event;
//			
//		    if ("which" in e) {  // Gecko (Firefox), WebKit (Safari/Chrome) & Opera
//		        isRightButton = e.which == 3; 
//		    } else if ("button" in e) {  // IE, Opera 
//		        isRightButton = e.button == 2; 
//		
//			}
//	   		console.log("오른쪽 마우스 클릭");
//		});
			
			
//		const rightClick= (event.which == 3) || (event.button == 2);
		
//		window.oncontextmenu = function () {
		    
//			console.log(rightClick);

//		     return rightClick;
		
			// Window에서 제공하는 마우스 우클릭 제거
			
//		}};
//		element.addEventListener("mouseup", mouse_end);	

		
		window.oncontextmenu = function () {
			
			console.log("window 마우스 우클릭 안됨");
		  
		  	return false;
		};
		
		
})();