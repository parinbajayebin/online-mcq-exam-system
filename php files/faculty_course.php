<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Upload CSV</title>
    <link rel="stylesheet" href="faculty.css?v=1.0">
</head>
<?php
session_start();

$usercourse="";
$usercourseErr="";

if ($_SERVER["REQUEST_METHOD"] == "POST")
{
if (empty($usercourse=$_POST["user_course"])){  
    $usercourseErr = "Select in which course you want to upload CSV file..";  
    } else {  
    $usercourse = input_data($_POST["user_course"]);  
    }
}
    function input_data($data) {  
        $data = trim($data);  
        $data = stripslashes($data);  
        $data = htmlspecialchars($data);  
        return $data;  
      } 
?>
<body>
<div class="header">
    <button onclick="goBack()">Back</button><br>
</div>

    <div class="container">
        <h1>Upload CSV</h1>
        <form method="post">
            Please select the course in which you want to upload a CSV file:
            <br><br>
            <select name="user_course" id="user_course">
                <option value="">--- Choose a Course ---</option>
                <option <?php if (isset($usercourse) && $usercourse=="msccs") echo "selected"; ?> value="msccs">MSCCS</option>
                <option <?php if (isset($usercourse) && $usercourse=="aiml") echo "selected"; ?> value="aiml">AIML</option>
                <option <?php if (isset($usercourse) && $usercourse=="mca") echo "selected"; ?> value="mca">MCA</option>
            </select>
            <br>
            <span class="error"><?php echo $usercourseErr; ?></span>
            <br><br>
            <button type="submit" name="submit">Go</button>
        </form>
    </div>

    <script>
    function goBack() {
        window.history.back();
    }
</script>

</body>
<?php
if(isset($_POST['submit']))
        {
            if($usercourseErr == "")
            {
                $_SESSION['usercourseupload']=$usercourse;
                header("location:faculty_subject.php");
            }
        }
?>
</html>
