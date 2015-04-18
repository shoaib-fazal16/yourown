<?php
/* * *******************************************************************************
 * This file is part of KReporter. KReporter is an enhancement developed
 * by Christian Knoll. All rights are (c) 2012 by Christian Knoll
 *
 * This Version of the KReporter is licensed software and may only be used in
 * alignment with the License Agreement received with this Software.
 * This Software is copyrighted and may not be further distributed without
 * witten consent of Christian Knoll
 *
 * You can contact us at info@kreporter.org
 * ****************************************************************************** */
if (!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');

$searchFields['KReports'] =
        array(
            'name' => array('query_type' => 'default'),
            'report_module' => array('query_type' => 'default'),
            'current_user_only' => array('query_type' => 'default', 'db_field' => array('assigned_user_id'), 'my_items' => true, 'vname' => 'LBL_CURRENT_USER_FILTER', 'type' => 'bool'),
            'assigned_user_id' => array('query_type' => 'default'),
);
?>
