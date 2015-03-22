<?php
$module_name = 'yo_County';
$listViewDefs [$module_name] = 
array (
  'NAME' => 
  array (
    'width' => '32%',
    'label' => 'LBL_NAME',
    'default' => true,
    'link' => true,
  ),
  'STATE' => 
  array (
    'type' => 'enum',
    'studio' => 'visible',
    'label' => 'LBL_STATE',
    'width' => '10%',
    'default' => true,
  ),
  'COUNTY' => 
  array (
    'type' => 'dynamicenum',
    'studio' => 'visible',
    'label' => 'LBL_COUNTY',
    'width' => '10%',
    'default' => true,
  ),
  'GISMAP' => 
  array (
    'type' => 'iframe',
    'label' => 'LBL_GISMAP',
    'width' => '10%',
    'default' => true,
  ),
);
?>
