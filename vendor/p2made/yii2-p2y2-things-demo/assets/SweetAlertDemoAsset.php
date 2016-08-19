<?php
/**
 * SweetAlertDemoAsset.php
 *
 * @copyright Copyright &copy; Pedro Plowman, https://github.com/p2made, 2016
 * @author Pedro Plowman
 * @package p2made/yii2-p2y2-things-demo
 * @license MIT
 */

namespace p2made\demo\assets;

class SweetAlertDemoAsset extends \yii\web\AssetBundle
{
	public $sourcePath = '@vendor/p2made/yii2-p2y2-things-demo/assets/lib';

	public $js = [
		'js/animate-demo.js',
	];

	public $depends = [
		'yii\web\YiiAsset',
		'p2made\demo\assets\ThingsDemoAsset',
	];
}
