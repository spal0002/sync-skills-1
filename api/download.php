<?php


/*
$conn = new mysqli('localhost', 'root', '');  
mysqli_select_db($conn, 'sync_skills');  

$setSql = "SELECT @a:=@a+1 serial_number, 
emp_id as `Employee ID`,
emp_name as `Employee Name`,
email as `Email`,
designation as  `Designation`,
reporting_to as  `Reporting To`,
tech_domain as  `Domain`,
tech_domain as  `Category`,
skill_set as  `Skill Set`
FROM `sync_employees`, (SELECT @a:= 0) AS a;
";  

$setRec = mysqli_query($conn, $setSql);  

$columnHeader = '';  
$columnHeader = "Sr NO" . "\t" . "Employee ID" . "\t" . "Employee Name" . "\t" . "Email" . "\t" . "Designation" . "\t" . "Reporting To" . "\t" . "Domain" . "\t" . "Category" . "\t" . "Skill Set" . "\t";  

$setData = '';  

while ($rec = mysqli_fetch_row($setRec)) {  
$rowData = '';  
foreach ($rec as $value) {  
$value = '"' . $value . '"' . "\t";  
$rowData .= $value;  
}  
$setData .= trim($rowData) . "\n";  
}  


header("Content-type: application/octet-stream");  
header("Content-Disposition: attachment; filename=User_Detail_Reoprt.xls");  
header("Pragma: no-cache");  
header("Expires: 0");  

echo ucwords($columnHeader) . "\n" . $setData . "\n"; 

*/

  /** PHPExcel */
    include 'Classes/PHPExcel.php';

 $conn = new mysqli('localhost', 'root', '');  
mysqli_select_db($conn, 'sync_skills');  

// create new PHPExcel object
$objPHPExcel = new PHPExcel;
// set default font
$objPHPExcel->getDefaultStyle()->getFont()->setName('Calibri');
// set default font size
$objPHPExcel->getDefaultStyle()->getFont()->setSize(8);
// create the writer
$objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, "Excel2007");
// Create your database query
$query = "SELECT emp_id , emp_name, email , designation , reporting_to , tech_domain , tech_category, skill_set FROM `sync_employees`";  

// Execute the database query
$result = mysqli_query($conn, $query);  
$objPHPExcel = new PHPExcel(); 
$objPHPExcel->setActiveSheetIndex(0); 
$rowCount = 2; 
  
$objPHPExcel->getActiveSheet()->SetCellValue('A1', 'Employee ID');
$objPHPExcel->getActiveSheet()->SetCellValue('B1', 'Employee Name'); 
$objPHPExcel->getActiveSheet()->SetCellValue('C1', 'Email'); 
$objPHPExcel->getActiveSheet()->SetCellValue('D1', 'Designation'); 
$objPHPExcel->getActiveSheet()->SetCellValue('E1', 'Reporting To'); 
$objPHPExcel->getActiveSheet()->SetCellValue('F1', 'Domain'); 
$objPHPExcel->getActiveSheet()->SetCellValue('G1', 'Category'); 
$objPHPExcel->getActiveSheet()->SetCellValue('H1', 'Skill Set'); 

while($row = mysqli_fetch_array($result)){ 
    $objPHPExcel->getActiveSheet()->SetCellValue('A'.$rowCount, $row['emp_id']); 
    $objPHPExcel->getActiveSheet()->SetCellValue('B'.$rowCount, $row['emp_name']); 
    $objPHPExcel->getActiveSheet()->SetCellValue('C'.$rowCount, $row['email']); 
    $objPHPExcel->getActiveSheet()->SetCellValue('D'.$rowCount, $row['designation']); 
    $objPHPExcel->getActiveSheet()->SetCellValue('E'.$rowCount, $row['reporting_to']); 
    $objPHPExcel->getActiveSheet()->SetCellValue('F'.$rowCount, $row['tech_domain']); 
    $objPHPExcel->getActiveSheet()->SetCellValue('G'.$rowCount, $row['tech_category']); 
    $objPHPExcel->getActiveSheet()->SetCellValue('H'.$rowCount, $row['skill_set']); 
    $rowCount++; 
} 
$objWriter = new PHPExcel_Writer_Excel2007($objPHPExcel); 
$objWriter->save('some_excel_file.xlsx');
header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
header('Content-Disposition: attachment;filename="test.xlsx"');
header('Cache-Control: max-age=0');
$objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel2007');
SaveViaTempFile($objWriter);
exit;

function SaveViaTempFile($objWriter){
    $filePath = '' . rand(0, getrandmax()) . rand(0, getrandmax()) . ".tmp";
    $objWriter->save($filePath);
    readfile($filePath);
    unlink($filePath);
    exit;
}

?>