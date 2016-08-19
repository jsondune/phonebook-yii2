<?php
/**
 * ThingsDemoAsset.php
 *
 * @copyright Copyright &copy; Pedro Plowman, https://github.com/p2made, 2016
 * @author Pedro Plowman
 * @package p2made/yii2-p2y2-things-demo
 * @license MIT
 */

namespace p2made\demo\assets;

class ThingsDemoAsset extends \yii\web\AssetBundle
{
	public $sourcePath = '@vendor/p2made/yii2-p2y2-things-demo/assets/lib';

	public $css = [
		'css/things-demo.css',
	];

	public $depends = [
		'p2made\assets\P2CoreAsset',
	];
}
