(function() { 
	"use strict";
	
	let map = null;
	let nowScale = null;
	let mouseCrs = null;
	var indexMap = true;
	var indexmapCtrl = null;
	var CrsCode = null;
	
	const init = () => {
		
		// 지도 실행
		const mapOpt = { target : 'map-div' };
		
		o2.util.Crs.initProj4();
		// o2Map에서 데이터를 불러옴 선언시 "map"이라는 객체 사용 이제 map객체는 오투맵을 사용하게 해주는 브릿지역할.
		map = new o2.map.O2Map(mapOpt);
		
		map.setScale(114285.4857);
		
		// 중심 좌표 Qs. 왜 카카오에서는 안될까?
		map.setCenter([14131075.312138427, 4516384.2158616865]); 	
		
		// 좌표계 설정
//		map.setCrsCode(127.20000, 37.30000);
		
		// 카카오 지도 실행 (디폴트 카카오 지도)
		const kakaolayer = new o2.layer.base.Kakao();

		map.addO2Layer(kakaolayer,'BAS');
		
		// 원점으로 돌아가기
	    document.getElementById("def").onclick = function() { map.setCenter([14131075.312138427, 4516384.2158616865]) };
		
		// 확대하기
		document.getElementById("zoomIn").onclick = function() { map.zoomIn(); };
		
		// 축소하기
		document.getElementById("zoomOut").onclick = function() { map.zoomOut(); };
		
		// 거리측정
		document.getElementById("distanceBtn").onclick = function() { let type = 'LineString'; Measure(type); };
		
//		{
//		document.getElementById("distanceBtn").onclick = function() { let type = 'LineString'; Measure(type); };
//			key : LineString
//		}

		// 넓이측정
		document.getElementById("measurementBtn").onclick = function() { let type = 'Polygon'; Measure(type); };

		// 원 반경 측정
		document.getElementById("circle").onclick = function() { let type = 'Circle'; Measure(type); };
		
		// ##### 거리 / 넓이 / 원반경 측정 s #####
		function Measure(type){
		
		// 누르지 않아도 맵이 지워지지 않음			
//		map.clear();

		let measureOpt = {
			targetMap: map
		}

		if (o2.util.Common.defined(type)) {
			measureOpt.type = type; // type : LineString, Polygon, Circle
		}
		let handler = new o2.handler.Measure(measureOpt);

		map.setHandler(handler);
		}
		// ##### 거리 / 넓이 / 원반경 측정 e #####
		
		// 뒤로가기
	    document.getElementById("prev").onclick = function() { map.prevPosition(); };
	   
	   	// 앞으로가기
	    document.getElementById("next").onclick = function() { map.nextPosition(); };
	    
	    // 이미지 다운로드
	    document.getElementById("save").onclick = function() { map.saveImage(); };
	    
	    // 인덱스 맵 ON
		document.getElementById("indexMap").onclick = function() { map.onIndexMap(map.getBaseLayer()); };
	   
	   	// 초기화
	    document.getElementById("clear").onclick = function() { map.clear(); };

		// 축척값 가져오기 moveend
	    document.getElementById("scale").value = map.getScale(); 
	    
	    document.getElementById("scale").onchange = function() {
		
	    map.setScale(this.value); 
		};
		
		// 서비스 중지
	    document.getElementById("no2").onclick = function() { alert("서비스를 준비 중입니다"); };
	    
	    // 레이어 가져오기
//	    map.describeLayer(map.targetLayer());
		
	    
	   
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