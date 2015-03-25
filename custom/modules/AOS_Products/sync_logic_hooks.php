<?php
class sync_logic_hooks
{
 
/**
* Called as process_record logic hook on the Performers module
*/
public function list_record_process($bean, $event, $arguments)
{
    //Do some code to get the related shows for the performer and store in the $other_shows variable
	$html = '<a href=http://www.yourownacre.com/suiteapi/property_sync.php?suite_id='.$bean->id.' target="_blank">Sync</a>';
    $bean->sync_property = $html;
}
 
}