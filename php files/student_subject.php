<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="student.css?v=1.0">
</head>

<?php
$usersubject="";
$usersubjectErr="";

if ($_SERVER["REQUEST_METHOD"] == "POST")
{
    if (empty($usersubject=$_POST["user_subject"])){  
        $usersubjectErr = "Select in which subject you want to create an exam..";  
    } else {  
        $usersubject = input_data($_POST["user_subject"]);  
    }       
}
function input_data($data) {  
    $data = trim($data);  
    $data = stripslashes($data);  
    $data = htmlspecialchars($data);  
    return $data;  
} 
?>

<?php
require_once("conn.php");
session_start();

$course_id=$_SESSION['courseid'];
$query1="SELECT * from subject where course_id=".$course_id;
$result=mysqli_query($conn,$query1);

?>
<body>
<div class="header">
    <button onclick="goBack()">Back</button><br>
</div>

<div class="container">
    <form method="post">
    Please select the Subject in which you want to create an Exam:
        <br><br>
            <select name="user_subject" id="subject">
                <?php
                if (mysqli_num_rows($result) > 0) {
                    // output data of each row
                    echo "<option value=''>Select Subject</option>";
                    while($row = mysqli_fetch_assoc($result)) {
                        echo "<option value='" . $row["subject_name"] . "'>" . $row["subject_name"] . "</option>";
                    }
                } else {
                    echo "<option>No products found</option>";
                }
                ?>
            </select>
            <span class="error"><?php echo $usersubjectErr; ?> </span><br><br>
            <button type="submit" name="submit">Submit</button>
        </form>
            </div>
        <?php
        if(isset($_POST['submit']))
        {
            if(empty($usersubjectErr))
            {
                $_SESSION['usersubjectupload']=$usersubject;
                header("location:student_topic.php");
            }
        }
        ?>
    
    <script>
    function goBack() {
        window.history.back();
    }
</script>

    </body>
    </html>
