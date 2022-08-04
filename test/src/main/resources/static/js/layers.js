(function () {
	
	"use strict";
	
	const init = () => {
		
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
					tr.innerHTML += `<td>`;
					tr.innerHTML += `	<input type="checkbox" id="checkbox${index}" style="zoom:2.0;margin-top:10px;">`;
					tr.innerHTML += `	<label for="checkbox${index}" style="padding-left:20px;"><font size="4">${value.DATA_KOR_NM}</font></label>`;
					tr.innerHTML += `</td>`;
					
					document.querySelector('#layer-list tbody').append(tr);
					
					tr.querySelector('input[type="checkbox"]').addEventListener('change', function() {
						
						console.log(value);
						
						if (this.checked) {
							console.log('레이어 on');
							
						} else {
							console.log('레이어 off');
						}
						
					});
					
					// layer 불러오는 방법 s
					var layer = new o2.layer.O2Layer({
					
						source: new ol.source.TileWMS(({
							url: o2.common.Config.getHostWMS(),
							
							params: {
								'LAYERS': 'DBMS:SOL_GWLEE:' + value.DATA_ENG_NM,
								'TILED': true
							}
						})),
						id: value.DATA_ENG_NM,
						name: value.DATA_ENG_NM,
						visible : value.VISIBLE_YN,		
						opacity : value.OPACITY,
						zIndex : value.SORT_ORDER
					});
				
					// 'SVC' 레이어에 서울시 4종 레이어 추가
					if(value.VISIBLE_YN == "Y"){
					map.getO2GroupLayerById('SVC').getLayers().push(layer);
					console.log(layer);
					} else {
						alert("레이어 작동 오류")
					}
					// layer 불러오는 방법 e 
					
					// layer on/Off s					
					var layerChkBox = document.querySelectorAll('input[type=checkbox][name=layers]');
	
					for(var checkbox of layerChkBox) {
						checkbox.addEventListener('change', function(e) {
							var checkedLayer = map.getO2LayerById(e.target.id);
							var checkedLayerId = checkedLayer.values_.id;
							
				            if(e.target.checked) {
								if(e.target.id == checkedLayer.values_.id) {
									checkedLayer.setVisible(true);
									url = "/"+o2.common.Config.HOST.VALUES.APP_CONTEXT_PATH+"/updateLayerVisible.do"
									param = {checkedLayerId: checkedLayerId, checkedLayerVisible: 'Y'};
									updateLayer(url, param);
								}
							} else {
								if(e.target.id == checkedLayer.values_.id) {
									checkedLayer.setVisible(false);
									param = {checkedLayerId: checkedLayerId, checkedLayerVisible: 'N'};
									url = "/"+o2.common.Config.HOST.VALUES.APP_CONTEXT_PATH+"/updateLayerVisible.do";
									updateLayer(url, param);
								}
							}
						});
					}
 					// layer On/OFF e
					
				});
				
			},
			// Ajax 오류 
			error : function(jqXHR, textStatus, errorThrown) {
				alert("ajaxUpdate " + jqXHR.textStatus + " : "
						+ jqXHR.errorThrown);
			}
		});
		
	}
	
	
	

	
	init(); // 이 init() 이 있어야지 위에서 써잇는 ajax 함수 영역위에 타고 올라가서 실행이된다.
	
	console.log("init(); 다음 여기서 시작");
	
	// 오른쪽 마우스 이벤트
	document.addEventListener('mousedown', function() {
		
		// Window에서 제공하는 마우스 우클릭 제거
		window.oncontextmenu = function () {
			
			console.log("마우스 우클릭 안됨");
		  
		  	return false;
		};
		
//			document.getElementById("button").mousedown = function() {
//				
//	    		("#boxWrap").append("<button class='original'></button>");
//			    	
//	    		console.log("동작확인");
//		    	
//	    		my_btn.addEventListener('click', () => {
//						  
//			 		alert('안녕하세요!!');
//						
//				}, { once : true});
//			    
//
//			};
		
	});
		
})();