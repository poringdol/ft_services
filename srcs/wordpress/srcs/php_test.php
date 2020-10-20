<!doctype html>

<html lang="en">
<head>
  <meta charset="utf-8">

  <title>nginx</title>

</head>

<body>
    <p>BEGIN</p>
  <?php
    $testConnection = mysqli_connect('serv-mysql:3306', 'pdemocri', 'pdemocri');
    if (!$testConnection) {
        die('Error: ' . mysqli_error());
    }
    echo 'Database connection working!';
    mysqli_close($testConnection);
    ?>

    <p>END</p>
    </body>
    </html>