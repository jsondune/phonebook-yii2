P2Y2Things Demo v1.11.1
==========

[![License](https://poser.pugx.org/p2made/yii2-p2y2-things-demo/license)](https://packagist.org/packages/p2made/yii2-p2y2-things-demo)
[![Total Downloads](https://poser.pugx.org/p2made/yii2-p2y2-things-demo/downloads)](https://packagist.org/packages/p2made/yii2-p2y2-things-demo)
[![Latest Stable Version](https://poser.pugx.org/p2made/yii2-p2y2-things-demo/v/stable)](https://packagist.org/packages/p2made/yii2-p2y2-things-demo)
[![Latest Unstable Version](https://poser.pugx.org/p2made/yii2-p2y2-things-demo/v/unstable)](https://packagist.org/packages/p2made/yii2-p2y2-things-demo)

---

A set of pages to demonstrate [`p2made/yii2-p2y2-things`](https://github.com/p2made/yii2-p2y2-things), bundled as a theme.

It declares p2made/yii2-p2y2-things as a dependancy.

*!!!* This theme still has lots of rough & unfinished bits. It's only been let out of the cage so I can begin using it in other projects.

Installation
------------

The preferred way to install P2Y2Things Demo is through [composer](http://getcomposer.org/download/).
Depending on your composer installation, run *one* of the following commands:

```
composer require --prefer-dist p2made/yii2-p2y2-things-demo "*"
```

or

```
php composer.phar require --prefer-dist p2made/yii2-p2y2-things-demo "*"
```

Alternatively add:

```
"p2made/yii2-p2y2-things-demo": "*"
```

to the requires section of your `composer.json` file & P2Y2Things Demo will be installed next time you run `composer update`.

The files are installed via Yii's recommended usage of the `fxp/composer-asset-plugin`.

Quick Start
-----------

Once the extension is installed, you can have a *preview* by reconfiguring the path mappings of the view component:

```
	'components' => [
		'view' => [
			'theme' => [
				'pathMap' => [
					'@app/views' => '@vendor/p2made/yii2-p2y2-things-demo/views',
				],
			],
		],
	],
```

To view pages in `site/pages/` you need to modify `actions()` in the `SiteController`:

```
	public function actions()
	{
		return [
			...
			'page' => [
				'class' => 'yii\web\ViewAction',
			],
		];
	}
```

**DO NOT** modify the views in the  `views/` folder. Your changes will be lost next time you run `composer update`.

You can copy elements from these examples into your own views.

---
[![Dependency Status](https://www.versioneye.com/user/projects/56e14929df573d0048dafebb/badge.svg?style=flat)](https://www.versioneye.com/user/projects/56e14929df573d0048dafebb)
