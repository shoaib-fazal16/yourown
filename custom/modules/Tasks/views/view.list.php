<?php
require_once('include/MVC/View/views/view.list.php');
class TasksViewList extends ViewList {

	function listViewProcess() {
        /* $this->params['custom_order_by'] = ' ,tasks.priority ASC'; */
		parent::listViewProcess(); 
    }
}
?>