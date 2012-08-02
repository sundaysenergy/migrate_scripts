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
  while (($start = strpos($tmp, "[img_assist")) !== FALSE) {
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

    $query_image = "SELECT * FROM {image} WHERE nid = :nid AND image_size = ':size'"; // Changed query to always get the original image. Formerly, the query would return a row for each derivative of the image such as thumbnail.
    $result_image = db_query($query_image, array(':nid' => $nid, ':size' => '_original'));
    $row_image = $result_image->fetchObject(); 
    $fid = $row_image->fid;

    drush_print("FID: $fid ");
    drush_print();

    $query_file = "SELECT * FROM {files} WHERE fid = :fid";
    $result_file = db_query($query_file, array(':fid' => $fid));
    $row_file = $result_file->fetchObject(); 
    
    $img_path = $row_file->filepath;
    if ($img_path[0] != '/') {
      $img_path = '/' . $img_path;
    }
    
    drush_print("Src: $img_path ");
    drush_print();

    $buffer = substr($tmp, 0, $start);

    $buffer .= "<img alt=\"$desc\" src=\"$img_path\" width=\"$width\" height=\"$height\" class=\"inline inline-$align\" />"; // Not a critical change, but now specifies width and height in the image's attribute tags. Also preserves the alignment of the image if the user specified an alignment through image assist.
    
    $buffer .= substr($tmp, $end+1);
    //echo "Buffer: $buffer \n";
    $tmp = $buffer;
  } // End : while ($start = strpos($tmp, "[img_assist"))   
  $update_query = "UPDATE {field_data_body} SET body_value = ':value' WHERE entity_id = :eid";
  $res = db_query($query, array(':value' => addslashes($tmp), ':eid' => $row->entity_id));
  if (!$res) {
    $message  = 'Query error : ' . mysql_error() . "\n";
    $message .= 'Query : ' . $update_query;
    drush_print($message);
    exit();
  }
  //break; // Test
}// End : while ($row = mysql_fetch_assoc($result))

drush_print();
drush_print("End ($count entities modified)");
drush_print();
drush_print();
