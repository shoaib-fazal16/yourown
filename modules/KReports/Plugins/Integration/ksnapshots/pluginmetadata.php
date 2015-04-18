<?php
$pluginmetadata = array(
    'id' => 'ksnapshots', 
    'type' => 'integration', 
    'category' => 'tool',
    'displayname' => 'LBL_KSNAPSHOTS',
    'integration' => array(
        'include' => 'ksnapshots.php',
        'class' => 'ksnapshot',
    ), 
    'includes' => array(
        'edit' => 'ksnapshot' . ($GLOBALS['sugar_config']['KReports']['debug'] ? '_debug' : '') . '.js',
        'editPanel' => 'K.kreports.ksnapshot.snapshotPanel'
    )
);