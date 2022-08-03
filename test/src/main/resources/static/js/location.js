(function () {
   
   "use strict";
   
   const init = () => {
      
      $.ajax({
         async : false,
         cache : false,
         type : "post",
         url : "/index/location/locationAjax",
         contentType : "application/json; charset=UTF-8",
         dataType : 'json',
         success : function(response) {
            
            console.log(response.RESULT);
            
            let html = '';
            
            response.RESULT.map((value, index) => {
               console.log(`순서: ${index}, 값: ${value}`);
               html += `<option value=${value.EMD_CD}>${value.EMD_CD}</option>`
            });
            
            document.querySelector('#location').innerHTML = html;
            
            document.querySelector('#location').addEventListener('change', event => {
               
               const locationValue = event.target.value;
               
               // 조건문
               if (locationValue === '출입구') {
                  console.log('출입구');
               }
               
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