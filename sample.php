<?php
//@author anoop kumar
require_once( str_replace('//', '/', dirname(__FILE__) . '/') . 'Xslt.php');//include xslt class for transformation.
$xml = new Xslt();
echo $xml->ttok("twilio.xml");//load twilio xml
?>
