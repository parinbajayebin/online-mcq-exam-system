<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="student.css?v=1.0">
</head>
<body>
<div class="container">
    <?php session_start(); 
    echo "<h1>";
    echo "Exam Category : "." ".$_SESSION['user_exam_category'];
    echo "</h1>";?>
    <h3>
<span class="error">
   Important Instructions : <br><br>
---> Read all the questions before attempting them<br>
---> You will have 15 seconds for each question to be answered<br>
---> Read the correct answers of each question after submitting<br>
---> No negative markings are there<br>
</span>
</h3>
<br>
<form action="exam.php">
    <button type="submit" name="submit">Start</button>
</div>
</body>
</html>