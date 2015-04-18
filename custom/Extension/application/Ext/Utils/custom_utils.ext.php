<?php

function getSubpanelQueryParts($params)
{
    $bean = $GLOBALS['app']->controller->bean;
    
    $return_array['select']='SELECT tasks.id ';
    $return_array['from']='FROM tasks ';
    $return_array['where']=" WHERE tasks.parent_id = '$bean->id' 
        AND tasks.parent_type = 'AOS_Products' AND deleted = 0 ";
    $return_array['join'] = "";
    $return_array['join_tables'][0] = '';
        
    return $return_array;
}