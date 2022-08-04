(function () {
   
   "use strict";
   
   const init = () => {
      
      $.ajax({
         async : false,
         cache : false,
         type : "post",
         url : "/index/location/locationAjax",  // controller에 내가 사용할 주소와 일치 / root-context 유의 // 먼저 데이터가 들어오는지 확인이 필요 (controller에서 syso 찍어보자)
         contentType : "application/json; charset=UTF-8",
         dataType : 'json',
         success : function(data) { // 여기서 response 객체나 data 객체나 바꾸어 사용해도 상관은 없음.
            
//            console.log(data); 
            
            let html = ''; // 선언할때 보통 처음에는 null을 넣어주고 시작해야 중복 또는 값이 여러개 생기는 오류가 발생안함.
            
            data.RESULT.map((value, index) => {
//               console.log(`순서: ${index}, 값: ${value}`);  // 이것도 console.log() = system.out.println() 이거랑 비슷한 느낌이라 없어도 상관은 없음 오류 안남
               html += `<option value=${value.EMD_CD}>${value.EMD_CD}</option>` // value={value.[colume 이름] 컬럼이름 바뀌어도 아작스 오류는 안남}
            });
            // 여기까지는 단순 선언 해주는것이기 Error가 발생하지 않음
            document.querySelector('#location').innerHTML = html;
            
            document.querySelector('#location').addEventListener('change', event => {
               
               const locationValue = event.target.value;
               
               // 조건문
               if (locationValue === '서초동') {
                  console.log('서초동');
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