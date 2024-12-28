<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="faculty.css?v=1.0">
</head>

<?php
$usertopic="";
$usertopicErr="";

if ($_SERVER["REQUEST_METHOD"] == "POST")
{
if (empty($usertopic=$_POST["user_topic"])){  
    $usertopicErr = "Select in which Topic you want to upload CSV file..";  
    } else {  
    $usertopic = input_data($_POST["user_topic"]);  
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
$usersubject=$_SESSION['usersubjectupload'];

$query="SELECT * from subject";
$result1=mysqli_query($conn,$query);
while($pow=mysqli_fetch_assoc($result1))
{
    if($pow['subject_name']==$usersubject){
    $subject_id=$pow['subject_id'];}
}
$query1="SELECT * from topic where subject_id=".$subject_id;
$result=mysqli_query($conn,$query1);

?>
<body>
<div class="header">
    <button onclick="goBack()">Back</button><br>
</div>

<div class="container">
<form method="post">
Please select the Topic in which you want to upload a CSV file:
<br><br>
        <select name="user_topic" id="topic">
            <?php

            if (mysqli_num_rows($result) > 0) {
                // output data of each row
                echo "<option value=''>Select Topic</option>";
                while($row = mysqli_fetch_assoc($result)) {
                    echo "<option value='" . $row["topic_name"] . "'>" . $row["topic_name"] . "</option>";
                }
            } else {
                echo "<option>No products found</option>";
            }
            ?>
        </select>
        <span class="error"><?php echo $usertopicErr; ?> </span><br><br>
        <button type="submit" name="submit">Submit</button>
    </form>
    <br><br>
    <a href="faculty_add_topic.php">Want to Add More Topic???</a>
        </div>
    <?php
if(isset($_POST['submit']))
        {
            if(empty($usertopicErr))
            {
                $_SESSION['usertopicupload']=$usertopic;
                header("location:csvupload.php");
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