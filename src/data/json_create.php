<?php
    shell_exec('chomd +x ./json.sh');
    $json = shell_exec('./json.sh');
    echo $json;
?>