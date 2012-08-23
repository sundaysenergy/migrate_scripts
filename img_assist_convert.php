#!/usr/bin/env drush

$query = "SELECT * FROM {field_data_body} WHERE body_value like '%[img_assist%'";
$result = db_query($query);
if (!$result) {
  exit();
} 

$count=0;
//while ($row = mysql_fetch_assoc($result)) {
//print_r($result);
foreach ( $result as $row) {
  $tmp = $row->body_value;
  $count++;
  drush_print();
  drush_print("###############################################################################");
  drush_print();
  drush_print("Entity ID: " . $row->entity_id);

  $start = strpos($tmp, "[img_assist");
  // Added parentheses here since operator precedence was incorrect.
  if (($start = strpos($tmp, "[img_assist")) !== FALSE) {
    $end = strpos($tmp, "]", $start);
    $img = substr($tmp, $start+12, $end-$start-12);
    drush_print("Img: $img ");
    drush_print();

    list($nid, $title, $desc, $link_img, $align, $width, $height) = explode("|", $img);

    $nid = substr($nid, strpos($nid, "=")+1);
    $title = substr($title, strpos($title, "=")+1);
    $desc = substr($desc, strpos($desc, "=")+1);
    $link_img = substr($link_img, strpos($link_img, "=")+1);
    $align = substr($align, strpos($align, "=")+1);
    $width = substr($width, strpos($width, "=")+1);
    $height = substr($height, strpos($height, "=")+1);

    drush_print("NID: $nid ");
    drush_print();

    // Changed query to always get the original image. Formerly, the query would return a row for each derivative of the image such as thumbnail.
    $query_image = "SELECT * FROM {image} WHERE nid = :nid AND image_size = :size";
    $result_image = db_query($query_image, array(':nid' => $nid, ':size' => '_original'));
    $row_image = $result_image->fetchObject(); 
    $fid = $row_image->fid;

    drush_print("FID: $fid ");
    drush_print('');

    $query_file = "SELECT * FROM {file_managed} WHERE fid = :fid";
    $result_file = db_query($query_file, array(':fid' => $fid));
    $row_file = $result_file->fetchObject();
    
    if ($img_path = $row_file->uri) { 
      $scheme = file_uri_scheme($img_path);
      $wrapper = file_stream_wrapper_get_instance_by_scheme($scheme);
      $img_path = '/' . $wrapper->getDirectoryPath() . '/' . file_uri_target($img_path);
  
      $image_tag = "<img alt=\"$desc\" src=\"$img_path\" width=\"$width\" height=\"$height\" class=\"inline inline-$align\" />"; // Not a critical change, but now specifies width and height in the image's attribute tags. Also preserves the alignment of the image if the user specified an alignment through image assist.
  
      drush_print("Src: $image_tag ");
      drush_print();
    }
    else { // this image doesn't exist anymore - remove the code -- example is node/1044
      drush_print("missing image nid: $nid ");
      drush_print();
      $image_tag = '';
    }

    $buffer = substr($tmp, 0, $start) . $image_tag . substr($tmp, $end+1);    
    $res = db_update('field_data_body')
        ->fields(array(
          'body_value' => $buffer, 
        ))
        ->condition('entity_id', $row->entity_id)
        ->execute();
      
    if (!$res) {
      $message  = 'Query error : ' . mysql_error() . "\n";
      $message .= 'Query : ' . $update_query;
      drush_print($message);
      exit();
    }
  }  
}

drush_print();
drush_print("End ($count entities modified)");
drush_print("Run this multiple times for nodes like 5616 and 3462!");
drush_print();
