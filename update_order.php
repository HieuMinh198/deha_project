<?php
include ("check_login.php");
include ("controllers/c_order_history.php"); 
$c_update = new c_order_history();
$c_update->update_status();
?>