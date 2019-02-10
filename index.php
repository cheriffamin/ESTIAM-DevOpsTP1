<?php
    $dbhost = 'localhost';
    $dbuser = 'amine';
    $dbpass = 'amine';
    $dbname = 'mydb';

    $conn = mysqli_connect($dbhost, $dbuser, $dbpass, $dbname);

    if(! $conn ){
       die('Could not connect: ' . mysqli_connect_error());
    }

    $insert_sql = "INSERT INTO Compteur (position)
    VALUES (0)";
    $update_sql = "UPDATE Compteur SET position=position+1 WHERE id=1";

    mysqli_select_db($con,"devops");
    $insert_result = mysqli_query( $conn, $insert_sql);

    if(! $insert_result ) {
        die('Could not update data: ' . mysqli_error($conn));
    }

    $update_result = mysqli_query( $conn, $update_sql);

    if(! $update_result ) {
        die('Could not update data: ' . mysqli_error($conn));
    }
    
    $select_result=mysqli_query($conn, "SELECT position FROM Compteur WHERE id=1");
    $data=mysqli_fetch_assoc($select_result);
    echo $data['position'] ;

    mysql_close($conn);

?>