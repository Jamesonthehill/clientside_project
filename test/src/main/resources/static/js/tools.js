(function() { 
	"use strict";
	
	let map = null;
	let nowScale = null;
	let mouseCrs = null;
	
	
	
	
	const init = () => {
		
		// 지도 실행
		const mapOpt = {
			target : 'map-div'
		};
		
		o2.util.Crs.initProj4();
		map = new o2.map.O2Map(mapOpt);
		const kakaolayer = new o2.layer.base.Kakao();
		
		map.addO2Layer(kakaolayer,'BAS');

		// 확대하기
		document.getElementById("zoomIn").onclick = function() {
			map.zoomIn();
		};
		
		// 축소하기
		document.getElementById("zoomOut").onclick = function() {
			map.zoomOut();
		};
		
		// 거리측정
		document.getElementById("distanceBtn").onclick = function() {
			let type = 'LineString';
			Measure(type);
		};

		// 넓이측정
		document.getElementById("measurementBtn").onclick = function() {
			let type = 'Polygon';
			Measure(type);
		};
		
		function Measure(type){
		map.clear();

		let measureOpt = {
			targetMap: map
		}

		if (o2.util.Common.defined(type)) {
			measureOpt.type = type; // type : LineString, Polygon, Circle
		}

		let handler = new o2.handler.Measure(measureOpt);

		map.setHandler(handler);
		}
		
		// ##### 여기까지가 넓이/축소 하는 방법 #####
		
		
		// 뒤로가기
	    document.getElementById("prev").onclick = function() {
	    	map.prevPosition();
	    }
	   
	   	// 앞으로가기
	    document.getElementById("next").onclick = function() {
	    	map.nextPosition();
	    }
	    
	    // 이미지저장
	    document.getElementById("save").onclick = function() {
	    	map.saveImage();
	    }
	   
	   	// 초기화
	    document.getElementById("clear").onclick = function() {
	    	map.clear();
	    }

	    document.getElementById("IndexMap").onclick = function() {
	    	map.onIndexMap();
	    	alert("인덱스 맵 작동");
	    }
	   
		// 이벤트 실행
		initEvent();
		
	}
	
	const initEvent = () => {
		
		// map change
		document.querySelectorAll('.map-change-button').forEach(button => {
			button.addEventListener('click', () => {
				
				const mapType = button.value;
				mapChangeEvent(mapType);
				
			});
		});
		
	}
	
	const mapChangeEvent = (mapType) => {
		
		map.setBaseLayer({
			id: mapType,
			autoResolutionsByBasemap: true
		})
		
	}
	
	init();
	
	
})();