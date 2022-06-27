function s2ab(s) { 
    var buf = new ArrayBuffer(s.length); //convert s to arrayBuffer
    var view = new Uint8Array(buf);  //create uint8array as viewer
    for (var i=0; i<s.length; i++) view[i] = s.charCodeAt(i) & 0xFF; //convert to octet
    return buf;    
}
function exportExcel(){ 
    // step 1. workbook 생성
    var wb = XLSX.utils.book_new();

    // step 2. 시트 만들기 
    var newWorksheet = excelHandler.getWorksheet();
    
    // step 3. workbook에 새로만든 워크시트에 이름을 주고 붙인다.  
    XLSX.utils.book_append_sheet(wb, newWorksheet, excelHandler.getSheetName());

    // step 4. 엑셀 파일 만들기 
    var wbout = XLSX.write(wb, {bookType:'xlsx',  type: 'binary'});

    // step 5. 엑셀 파일 내보내기 
    saveAs(new Blob([s2ab(wbout)],{type:"application/octet-stream"}), excelHandler.getExcelFileName());
}
$(document).ready(function() { 
    $("#excelFileExport").click(function(){
        exportExcel();
    });
});

var excelHandler = {
    getExcelFileName : function(){
        return 'table-test.xlsx';
    },
    getSheetName : function(){
        return 'Table Test Sheet';
    },
    getExcelData : function(){
        return document.getElementById('tableData'); 
    },
    getWorksheet : function(){
        return XLSX.utils.table_to_sheet(this.getExcelData());
    }
}

// table에 입력한 값 excel에 사용하기
function printName()  {
    for(var i=1; i<=10; i++){
    const name = document.getElementById('name'+i).value;
    document.getElementById("result"+i).innerText = name;
    }
}

// 라디오 클릭 시, 클릭한 값 바로 출력하기
function getGender(event) {
    for(var i=1; i<=10; i++)
    document.getElementById('radioresult').innerText = 
    event.target.value;
  }