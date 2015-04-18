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
if (!defined('sugarEntry') || !sugarEntry)
   die('Not A Valid Entry Point');

require_once('include/MVC/View/views/view.edit.php');
require_once('modules/KReports/utils.php');
require_once('modules/KReports/KReportVisualizationManager.php');

global $dictionary;

class KReportsViewEdit extends ViewEdit {

   function __construct() {

      // 2013-02-28 disable VCR Display
      $GLOBALS['sugar_config']['disable_vcr'] = true;

      parent::ViewEdit();
   }

   function display() {
      global $app_list_strings, $mod_strings, $current_language, $dictionary, $sugar_config;

      // ann Add Js Strinf that will be assigned at the end befor ehte view gets rendered
      $this->addJsString = '';
      $jsVariables = '';

      // get the Sugar Flavor
      $jsVariables .= "var sugar_flavor='" . $GLOBALS['sugar_flavor'] . "';";

      // get all the where editable fields per operator
      include('modules/KReports/config/KReportWhereOperators.php');
      $jsVariables .= "var kreportoperatorcount=" . json_encode($kreporterWhereOperatorCount) . ";";


      $mod_lang = return_module_language($current_language, 'KReports');

      foreach ($mod_lang as $id => $value) {
         $returnArray[] = array('lblid' => $id, 'value' => $value);
      }

      // add the app list array we need
      if (is_array($this->bean->field_defs) && count($this->bean->field_defs) > 0) {
         foreach ($this->bean->field_defs as $fieldId => $fieldDetails) {
            if (isset($fieldDetails['options']) && isset($app_list_strings[$fieldDetails['options']])) {
               $thisString = jarray_encode_kinamu($app_list_strings[$fieldDetails['options']]);
               $returnArray[] = array('lblid' => $fieldId . '_options', 'value' => jarray_encode_kinamu($app_list_strings[$fieldDetails['options']]));
            }
         }
      }

      // set the language
      $langJson = json_encode_kinamu($returnArray);
      $this->ss->assign('jsonlanguage', json_encode_kinamu($returnArray));

      // see if we have a return id
      if (!isset($_REQUEST['return_id']) || $_REQUEST['return_id'] == '')
         $_REQUEST['return_id'] = $this->bean->id;

      // set Options
      if ($this->bean->reportoptions == '')
         $this->bean->reportoptions = '{"resultsFolded":false,"optionsFolded":true,"authCheck":"full","showDeleted":false,"showExport":true,"showSnapshots":false,"showTools":true}';

      // handle Plugins
      $pluginManager = new KReportPluginManager();
      $pluginManager->getEditViewPlugins($this);

      // handle authorization objects
      if (!empty($GLOBALS['KAuthAccessController'])) {
         if ($GLOBALS['KAuthAccessController']->orgManaged('KReport')) {
            $jsVariables .= "var korgmanaged=true;";
         } else {
            $jsVariables .= "var korgmanaged=false;";
         }
      }

      // manage Visualitazion Variables
      $thisVisualizationManager = new KReportVisualizationManager();
      $this->addJsString .= $thisVisualizationManager->getLayouts();

      // assign to the Template
      $this->ss->assign('editViewAddJs', $this->addJsString);

      //2013-03-15 pass in teh auth check type
      $jsVariables .= 'kreportAuthCheck=\'' . $sugar_config['KReports']['authCheck'] . '\';';
      // handle access authentication for Dialog
      global $sugar_config;
      switch ($sugar_config['KReports']['authCheck']) {
         case 'KAuthObjects':
            $this->ss->assign('authaccess_id', $this->bean->korgobjectmain);

            // get the name 
            require_once('modules/KOrgObjects/KOrgObject.php');
            $thisObject = new KOrgObject();
            $thisObject->retrieve($this->bean->korgobjectmain);
            $this->ss->assign('authaccess_name', $thisObject->name);
            break;

         case 'SecurityGroups':
            $thisRecord = $db->fetchByAssoc($db->query("SELECT securitygroups_records.id, name FROM securitygroups_records INNER JOIN securitygroups ON securitygroups.id = securitygroups_records.securitygroup_id WHERE securitygroups_records.record_id='" . $this->bean->id . "'"));
            if ($thisRecord) {
               $this->ss->assign('authaccess_id', $thisRecord['id']);
               $this->ss->assign('authaccess_name', $thisRecord['name']);
            }
            break;
         case 'PRO':
            if (!empty($this->bean->team_id)) {
               $thisTeam = BeanFactory::getBean('Teams', $this->bean->team_id);
               $this->ss->assign('team_name', $thisTeam->name . ' ' . $thisTeam->name_2);
            }
            break;
      }

      // set ambigious ariables
      $this->ss->assign('jsVariables', $jsVariables);

      // set if the Reporter is in DebugMode
      if ($GLOBALS['sugar_config']['KReports']['debug']) {
         $jsVariables .= "var kreportDebug=true;";
         $this->ss->assign('kreportDebug', true);
      } else {
         $jsVariables .= "var kreportDebug=false;";
         $this->ss->assign('kreportDebug', false);
      }


      if (!empty($this->bean->team_id)) {
         $thisTeam = BeanFactory::getBean('Teams', $this->bean->team_id);
         $this->ss->assign('team_name', $thisTeam->name . ' ' . $thisTeam->name_2);
      }

      // off we go
      parent::display();
   }

}

?>
