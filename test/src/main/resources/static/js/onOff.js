(function () {
	
	"use strict";
	
	console.log("onOff.js 스크립트 시작");
	
	$.ajax({
			async : false,
			cache : false,
			type : "post",
			url : "/layer/layerAjax",
			success : function(data) {
				
				$.each(data, function(i) {
					const obj = new Object();

					console.log(obj);
				});
				console.log("sdfsdfsffsdfsdf");
			}
			,
			error : function(jqXHR, textStatus, errorThrown) {
				alert("ajaxUpdate " + jqXHR.textStatus + " : "
						+ jqXHR.errorThrown);
			}
		});

});

