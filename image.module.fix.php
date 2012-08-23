<?php
  // see also http://drupal.org/node/757808#comment-6384624
  $query = "SELECT * FROM {image} WHERE image_size = '_original'";
  $result = db_query($query);

  while ($row = db_fetch_array($result, MYSQL_ASSOC)) {
    $fid = $row['fid'];
    $nid = $row['nid'];
  
    $file_query = "SELECT * FROM {files} WHERE fid = " . $fid; 
    $file_result = db_query($file_query);     
    $image_file =  db_fetch_array($file_result);  
    if ( $image_file[2] != '_original') {
      watchdog("Image Fix", "Fixing image node %nid for fid %fid", array('%nid' => $nid, '%fid' => $fid), WATCHDOG_NOTICE, l('view', 'node/'.$nid));
//      $fix = db_query("UPDATE {files} SET filename = '_original' WHERE fid = " . $fid); 
    }
  }
?>