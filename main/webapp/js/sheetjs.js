function s2ab(s) { 
    var buf = new ArrayBuffer(s.length); //convert s to arrayBuffer
    var view = new Uint8Array(buf);  //create uint8array as viewer
    for (var i=0; i<s.length; i++) view[i] = s.charCodeAt(i) & 0xFF; //convert to octet
    return buf;    
}
// function exportExcel(){ 
//     // step 1. workbook 생성
//     var wb = XLSX.utils.book_new();

//     // step 2. 시트 만들기 
//     var newWorksheet = excelHandler.getWorksheet();
    
//     // step 3. workbook에 새로만든 워크시트에 이름을 주고 붙인다.  
//     XLSX.utils.book_append_sheet(wb, newWorksheet, excelHandler.getSheetName());

//     // step 4. 엑셀 파일 만들기 
//     var wbout = XLSX.write(wb, {bookType:'xlsx',  type: 'binary'});

//     // step 5. 엑셀 파일 내보내기 
//     saveAs(new Blob([s2ab(wbout)],{type:"application/octet-stream"}), excelHandler.getExcelFileName());
// }
// $(document).ready(function() { 
//     $("#excelFileExport").click(function(){
//         exportExcel();
//     });
// });

// var excelHandler = {
//     getExcelFileName : function(){
//         return 'table-test.xlsx';
//     },
//     getSheetName : function(){
//         return 'Table Test Sheet';
//     },
//     getExcelData : function(){
//         return document.getElementById('tableData'); 
//     },
//     getWorksheet : function(){
//         return XLSX.utils.table_to_sheet(this.getExcelData());
//     }
// }

// table에 입력한 값 excel에 사용하기
function printName()  {
    for(var i=2; i<=50; i++){
    const name = document.getElementById('name'+i).value;
    document.getElementById("result"+i).innerText = name;
    }
}

// 라디오 클릭 시, 클릭한 값 바로 출력하기

// 성별
function getGender(event) {    
    document.getElementById('radioresult1').innerText = event.target.value;
}
// 병역
function militaly(event) {    
    document.getElementById('radioresult2').innerText = event.target.value;
}
// 보장구 유무
function getvalue1(event) {    
    document.getElementById('radioresult3').innerText = event.target.value;
}
// 장애 정도
function getvalue2(event) {    
    document.getElementById('radioresult4').innerText = event.target.value;
}
// 학력
function getvalue3(event) {    
    document.getElementById('radioresult5').innerText = event.target.value;
}

function fnExcelReport(id, title) {
       var tab_text = '<html xmlns:x="urn:schemas-microsoft-com:office:excel">';
           tab_text = tab_text + '<head><meta http-equiv="content-type" content="application/vnd.ms-excel; charset=UTF-8">';
           tab_text = tab_text + '<xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet>'   
           tab_text = tab_text + '<x:Name>Test Sheet</x:Name>';
           tab_text = tab_text + '<x:WorksheetOptions><x:Panes></x:Panes></x:WorksheetOptions></x:ExcelWorksheet>';
           tab_text = tab_text + '</x:ExcelWorksheets></x:ExcelWorkbook></xml></head><body>';
           tab_text = tab_text + "<table border='1px'>";
           var exportTable = $('#' + id).clone();
           exportTable.find('input').each(function (index, elem) { $(elem).remove(); });
           tab_text = tab_text + exportTable.html();
           tab_text = tab_text + '</table></body></html>';
           var data_type = 'data:application/vnd.ms-excel';
           var ua = window.navigator.userAgent;
           var msie = ua.indexOf("MSIE ");
           var fileName = title + '.xls';
            //Explorer 환경에서 다운로드 
            if (msie > 0 || !!navigator.userAgent.match(/Trident.*rv\:11\./)) {
            if (window.navigator.msSaveBlob) { 
                var blob = new Blob([tab_text], { 
                type: "application/csv;charset=utf-8;"
            });           
             navigator.msSaveBlob(blob, fileName);        }
                } else {
                            var blob2 = new Blob([tab_text], {  
                                          type: "application/csv;charset=utf-8;"        });        var filename = fileName;        var elem = window.document.createElement('a');        elem.href = window.URL.createObjectURL(blob2);        elem.download = filename;        document.body.appendChild(elem);        elem.click();        document.body.removeChild(elem);    }}
