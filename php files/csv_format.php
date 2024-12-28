<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        img {
            width: 50%;
            height: auto;
            max-width: 1000px;
            max-height: 600px;
        }
        .header {
            position: absolute;
            top: 5px;
            right: 5px;
        }

        .header button {
            display: inline-block;
        }
        button {
        padding: 10px 20px;
        background-color: #007bff;
        color: #fff;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
        }

        button:hover {
             background-color: #0056b3;
        }

    </style>
</head>
<body>
<div class="header">
    <button onclick="goBack()">Back</button><br>
</div>

    <img src="csv_format.png" alt="CSV Format">
    </img>
    <script>
    function goBack() {
        window.history.back();
    }
</script>
</body>
</html>
