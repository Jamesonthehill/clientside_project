(function () {
	
	"use strict";
	
	const init = () => {
		
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
					tr.innerHTML += `	<label for="checkbox${index}" style="padding-left:20px;"><font size="6">${value.ROLENAMENY}</font></label>`;
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
					
				});
				
			},
			// Ajax 오류 
			error : function(jqXHR, textStatus, errorThrown) {
				alert("ajaxUpdate " + jqXHR.textStatus + " : "
						+ jqXHR.errorThrown);
			}
		});
		
	}
	
	init();
	
})();