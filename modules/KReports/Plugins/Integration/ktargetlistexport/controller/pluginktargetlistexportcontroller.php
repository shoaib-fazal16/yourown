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

require_once('modules/KReports/KReport.php');

class pluginktargetlistexportcontroller {

    public   function action_export_to_targetlist() {

        $thisReport = new KReport();
        $thisReport->retrieve($_REQUEST['record']);

        // check if we have set dynamic Options
        if (isset($_REQUEST['whereConditions']))
            $thisReport->whereOverride = json_decode_kinamu(html_entity_decode($_REQUEST['whereConditions']));

        $thisReport->createTargeList($_REQUEST['targetlist_name']);

        return true;
    }
    
}

?>
