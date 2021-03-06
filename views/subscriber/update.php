<?php

use yii\helpers\Html;

use yii\base\ErrorException;

/* @var $this yii\web\View */
/* @var $model app\models\Subscriber */

$this->title = 'Update Subscriber: ' . ' ' . $model->full_name;
$this->params['breadcrumbs'][] = ['label' => 'Subscribers', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->full_name, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="subscriber-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
         'modelsPhone'=>$modelsPhone,
    ]) ?>

</div>
