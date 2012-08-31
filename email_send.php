<?php 
$to = ($_POST['email']);
$subject = ($_POST['name']); 
$message = ($_POST['message']); 
$message .= "\n\n---------------------------\n"; 
$message .= "TEST email">\n"; 
$headers = "TEST email">\n"; 
if(@mail($to, $subject, $message, $headers)) 
{ 
    echo "answer=ok"; 
}  
else  
{ 
    echo "answer=error"; 
} 
?>
