<?php
if (!defined('sugarEntry') || !sugarEntry)
    die('Not A Valid Entry Point');

$job_strings[] = 'escalateUser';

	
	function escalateUser($bean, $event, $arguments)
	{
		global $db;
		
		$query= 'SELECT * FROM tasks
									WHERE escalate_date = CURDATE() AND escalated=0 AND deleted=0';
								
		$result = $db->query($query);
		while($row = $db->fetchByAssoc($result)){
			$task = BeanFactory::getBean('Tasks', $row['id']);
			$task->assigned_user_id = $row['user'];
			$task->escalated = 1;
			$task->save();
		}
		return true;

	}