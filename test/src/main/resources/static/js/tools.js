(function() { 
		"use strict";
	
		
		//proxy.jsp를 통한 describeLayer API 호출
		var proxyHost = "common/proxy.jsp";
		var o2platformHost = "http://localhost:8081/o2.platform";
		var api = "/info/layerinfo/describeLayer";
		//파라미터 맨 앞에 url을 추가한다. 
		// 	var param = "url=" + o2platformHost + api + "&" + "LAYER=DBMS:SOL_GWLEE:LSMD_CONT_LDREG";
		var param = "url=" + o2platformHost + api + "&" + "LAYER=DBMS:SOL_GWLEE:LSMD_CONT_LDREG";
		var url = proxyHost + "?" + param;
	
		//아래 형태로 url이 생성되어 동작하게 되며, 정상 호출 된다.
		//common/proxy.jsp?url=http://localhost:9090/o2.platform/info/layerinfo/describeLayer&LAYER=DBMS:TEST:LSMD_CONT_LDREG
		fetch(url).then(function(res){
		    return res.json();
		}).then(function(data){
		    console.log(data);
		})
		
		
		//--------------------
		// o2.common.Config 설정 클래스
		//--------------------
		
		//콘솔창에서 o2.common.Config를 통해 전체 설정항목을 확인할 수 있다.
		//어플리케이션이 초기화되는 시점에서 환경에 따른 HOST설정을 어플리케이션 단에서 설정하는 방법을 소개한다.
		
		//아래 방식으로 값을 설정한다.
		
		//어플리케이션 컨텍스트패스
		o2.common.Config.HOST.VALUES.APP_CONTEXT_PATH = "index";
		//어플리케이션 프록시
		o2.common.Config.HOST.VALUES.APP_PROXY = "common/proxy.jsp";
		//O2Platform 호스트
		o2.common.Config.HOST.VALUES.PLATFORM_HOST = "http://localhost:8081/o2.platform";
		//어플리케이션 프록시 사용 여부
		o2.common.Config.HOST.VALUES.USE_PROXY = true;
		
		o2.common.Config.MAP.VALUES.MAP_NM = "index"; 
		//지도값 세팅

		
//	const extent = () => {
//		 
//	  	const mapConf = o2.common.Config.MAP.VALUES;
//	  	const firstMoveBbox = [ 14131075.312138427, 4516384.2158616865, 14139263.04786485, 4520381.276549992];
//	  	const bbox = o2.util.Crs.transformBbox( firstMoveBbox, mapConf.MAP_CRS, app.map.getCrsCode());
//		
//	  	app.zoomExtent(bbox);
//		
//		}
				
	
	const init = () => {
		
		// 지도 실행
		const mapOpt = { target : 'map-div' };
		
		o2.util.Crs.initProj4();
		// o2Map에서 데이터를 불러옴 선언시 "map"이라는 객체 사용 이제 map객체는 오투맵을 사용하게 해주는 브릿지역할.
		map = new o2.map.O2Map(mapOpt);
		
		map.setScale(114285.4857);
		
		// 중심 좌표 Qs. 왜 카카오에서는 안될까?
		map.setCenter([14131075.312138427, 4516384.2158616865]); 	
		
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
//			map.clear();

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
	    document.getElementById("prev").onclick = () => map.prevPosition();
	   
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
//		map.setField();
	    
	   
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