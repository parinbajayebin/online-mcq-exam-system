<?php
session_start();

$keep_sessions = [
    'userid',
    'username',
    'usercategory',
    'status',
    'courseid',
    'mono',
    'email'
];

foreach ($_SESSION as $key => $value) {
    if (!in_array($key, $keep_sessions)) {
        unset($_SESSION[$key]);
    }
}

header("Location: faculty_interface.php");
exit;
?>
