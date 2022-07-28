(function() { 
	
	"use strict";
	
	let map = null;
	let nowScale = null;
	let mouseCrs = null;
	let layers = null;
	
	const init = () => {
		
		// 지도 실행
		const mapOpt = { target : 'map-div' };
		
		o2.util.Crs.initProj4();
		// o2Map에서 데이터를 불러옴 선언시 "map"이라는 객체 사용 이제 map객체는 오투맵을 사용하게 해주는 브릿지역할.
		map = new o2.map.O2Map(mapOpt);
		
		// 카카오 지도 실행 (디폴트 카카오 지도)
		const kakaolayer = new o2.layer.base.Kakao();

		map.addO2Layer(kakaolayer,'BAS');
		
		
		// 중심 가져오기
//		const a = map.getCenter();
//		console.log(a);
		
		// 디폴트 좌표 세팅
//		o2.common.Config.MAP.VALUES.MAP_NM = "GIS_MAP"; 
		
					

		// 확대하기
		document.getElementById("zoomIn").onclick = function() { map.zoomIn(); };
		
		// 축소하기
		document.getElementById("zoomOut").onclick = function() { map.zoomOut(); };
		
		// 거리측정
		document.getElementById("distanceBtn").onclick = function() { let type = 'LineString'; Measure(type); };

		// 넓이측정
		document.getElementById("measurementBtn").onclick = function() { let type = 'Polygon'; Measure(type); };
		
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
	    document.getElementById("prev").onclick = function() { map.prevPosition(); };
	   
	   	// 앞으로가기
	    document.getElementById("next").onclick = function() { map.nextPosition(); };
	    
	    // 이미지저장
	    document.getElementById("save").onclick = function() { map.saveImage(); };
	   
	   	// 초기화
	    document.getElementById("clear").onclick = function() { map.clear(); };

		// 인덱스 맵
	    document.getElementById("indexMap").onclick = function() { map.onIndexMap(); console.log("인덱스 맵 ON"); };
		
		// 축척값 가져오기
	    document.getElementById("scale").value = map.getScale(); 
	    
	    document.getElementById("scale").onchange = function() {
		
	    map.setScale(this.value); 
		};
		
		// 위도/경도 값 가져오기
//	    document.getElementById("lat").value = map.getD(); 
	    
//	    document.getElementById("lat").onchange = function() {
		
//	    map.setScale(this.value); 
//		};
		
	    
		
	    
	   
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