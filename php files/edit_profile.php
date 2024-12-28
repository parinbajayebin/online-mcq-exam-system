<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update User</title>
    <link rel="stylesheet" href="sign_up.css">
    <style>
        .header {
  position: absolute;
  top: 5px;
  right: 5px;
}

.header button {
  display: inline-block;
}
</style>
</head>
<body>
    <?php
    require_once("conn.php");
    session_start();

    if (!isset($_SESSION['userid'])) {
        die("User not logged in!");
    }

    $userId = $_SESSION['userid'];
    $query = "SELECT * FROM user WHERE user_id = '$userId'";
    $result = mysqli_query($conn, $query);
    $user = mysqli_fetch_assoc($result);

    if (!$user) {
        die("User not found!");
    }

    $nameErr = $emailErr = $mobilenoErr = $passkeyErr = $passkeyvalueErr = "";  
    $name = $email = $mobileno = $passkey = $passkeyvalue = "";

    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        function input_data($data) {  
            $data = trim($data);  
            $data = stripslashes($data);  
            $data = htmlspecialchars($data);  
            return $data;  
        }

        if (empty($_POST["name"])) {  
            $nameErr = "Name is required";  
        } else {  
            $name = input_data($_POST["name"]);  
            if (!preg_match("/^[a-zA-Z ]*$/",$name)) {  
                $nameErr = "Only alphabets and white space are allowed";  
            }  
        }  

        if (empty($_POST["email"])) {  
            $emailErr = "Email is required";  
        } else {  
            $email = input_data($_POST["email"]);  
            if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {  
                $emailErr = "Invalid email format";  
            }  
        }  

        if (empty($_POST["mobileno"])) {  
            $mobilenoErr = "Mobile no is required";  
        } else {  
            $mobileno = input_data($_POST["mobileno"]);  
            if (!preg_match("/^[0-9]*$/", $mobileno)) {  
                $mobilenoErr = "Only numeric value is allowed.";  
            }  
            if (strlen($mobileno) != 10) {  
                $mobilenoErr = "Mobile no must contain 10 digits.";  
            }  
        }  

        if (empty($_POST["passkey"])) {  
            $passkeyErr = "Select Passkey Option.";  
        } else {  
            $passkey = input_data($_POST["passkey"]);  
        }

        if (empty($_POST['passkeyvalue'])) {  
            $passkeyvalueErr = "Please fill passkey value.";  
        } else {  
            $passkeyvalue = input_data($_POST["passkeyvalue"]);  
        }

        if ($nameErr == "" && $emailErr == "" && $mobilenoErr == "" && $passkeyErr == "" && $passkeyvalueErr == "") {
            $query = "UPDATE user SET 
                      name = '$name', 
                      mobileno = '$mobileno', 
                      email = '$email', 
                      passkey = '$passkey', 
                      passkeyval = '$passkeyvalue'
                      WHERE user_id = $userId";

if (mysqli_query($conn, $query)) {
    echo "<script type='text/javascript'>
    alert('Credentials Saved Successfully.');
    window.location = 'logout.php';
  </script>";
exit;
}
        }
    } else {
        // Load data from the database into the form fields
        $name = $user['name'];
        $email = $user['email'];
        $mobileno = $user['mobileno'];
        $passkey = $user['passkey'];
        $passkeyvalue = $user['passkeyval'];
    }
    ?>

<div class="header">
    <button onclick="goBack()">Back</button><br>
</div><br><br><br><br>

    <div class="container">
        <h1>Edit Profile</h1><br>
        <form method="post" name="updateUser" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>">
            <label for="name">Name</label>
            <input type="text" name="name" id="name" value="<?php echo $name; ?>" placeholder="Enter your name"/>
            <span class="error"><?php echo $nameErr; ?> </span> <br><br>

            <label for="mobileno">Mobile No.</label>
            <input type="text" name="mobileno" id="mobileno" value="<?php echo $mobileno; ?>" placeholder="Enter your mobile number"/>
            <span class="error"><?php echo $mobilenoErr; ?> </span> <br><br>

            <label for="email">Email id.</label>
            <input type="text" name="email" id="email" value="<?php echo $email; ?>" placeholder="Enter your email address"/>
            <span class="error"><?php echo $emailErr; ?> </span> <br><br>

            <label for="passkey">PassKey if you forget the Password</label><br><br>
            <select name="passkey" id="passkey" placeholder="Choose a passkey">
                <option value="">--- Choose a passkey ---</option>
                <option <?php if ($passkey == "favteacher") echo "selected"; ?> value="favteacher">Fav Teacher</option>
                <option <?php if ($passkey == "favmovie") echo "selected"; ?> value="favmovie">Fav Movie</option>
                <option <?php if ($passkey == "favbook") echo "selected"; ?> value="favbook">Fav Book</option>
            </select><br>
            <span class="error"><?php echo $passkeyErr; ?> </span><br><br>

            <label for="passkeyvalue">PassKey Value</label>
            <input type="text" name="passkeyvalue" id="passkeyvalue" value="<?php echo $passkeyvalue; ?>" placeholder="Enter your passkey value"/>
            <span class="error"><?php echo $passkeyvalueErr; ?> </span><br><br>

            <button type="submit" name="submit">Update</button>
        </form>
    </div>

    <script>
    function goBack() {
        window.history.back();
    }
</script>

</body>
</html>
