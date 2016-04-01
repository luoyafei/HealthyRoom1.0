<?php
/**
 * KindEditor PHP
 * 
 * 本PHP程序是演示程序，建议不要直接在实际项目中使用。
 * 如果您确定直接使用本程序，使用之前请仔细确认相关安全设置。
 * 
 */

require_once 'JSON.php';
 
$domain = "kindeditor"; //storage服务中的domain名称

$s = new SaeStorage();
//图片扩展名
$ext_arr = array('gif', 'jpg', 'jpeg', 'png', 'bmp');

//遍历目录取得文件信息
$file_list = array();
$stor = new SaeStorage();
$num = 0;
while ( $ret = $stor->getList($domain, "*", 100, $num ) ) {
    $i = 0;
    foreach($ret as $file) {
    	$file_attrArray = $stor->getAttr($domain,$file);
	$file_list[$i]['is_dir'] = false;
	$file_list[$i]['has_file'] = false;
	$file_list[$i]['filesize'] = $file_attrArray['length'];
	$file_list[$i]['dir_path'] = '';
	$file_ext = strtolower(array_pop(explode('.', trim($file))));
	$file_list[$i]['is_photo'] = in_array($file_ext, $ext_arr);
	$file_list[$i]['filetype'] = $file_ext;
	$file_list[$i]['filename'] = $file; //文件名，包含扩展名
	$file_list[$i]['datetime'] = date('Y-m-d H:i:s',$file_attrArray['datetime']); //文件最后修改时间
	$num++;
	$i++;
    }
}

//排序
function cmp_func($a, $b) {
	global $order;
	if ($a['is_dir'] && !$b['is_dir']) {
		return -1;
	} else if (!$a['is_dir'] && $b['is_dir']) {
		return 1;
	} else {
		if ($order == 'size') {
			if ($a['filesize'] > $b['filesize']) {
				return 1;
			} else if ($a['filesize'] < $b['filesize']) {
				return -1;
			} else {
				return 0;
			}
		} else if ($order == 'type') {
			return strcmp($a['filetype'], $b['filetype']);
		} else {
			return strcmp($a['filename'], $b['filename']);
		}
	}
}
usort($file_list, 'cmp_func');

$result = array();
//相对于根目录的上一级目录
$result['moveup_dir_path'] = "";
//相对于根目录的当前目录
$result['current_dir_path'] = "";
//当前目录的URL
$result['current_url'] = $stor->getUrl($domain,'');
//文件数
$result['total_count'] = count($file_list);
//文件列表数组
$result['file_list'] = $file_list;

//输出JSON字符串
header('Content-type: application/json; charset=UTF-8');
$json = new Services_JSON();
echo $json->encode($result);
?>
