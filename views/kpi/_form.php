<?php

use yii\helpers\Html;
use wbraganca\dynamicform\DynamicFormWidget;
use yii\widgets\DetailView;

// Change to use bootstrap\ActiveForm to support inline()
//use yii\widgets\ActiveForm;
use yii\bootstrap\ActiveForm;
//
use yii\jui\DatePicker;
//use kartik\widgets\DatePicker;
use kartik\widgets\Select2;
//Dune
use \yii\helpers\ArrayHelper;
?>

<div class="subscriber-form">

<?php $form = ActiveForm::begin(['id' => 'dynamic-form']); ?>
    
<div class="row">
    <div class="col-lg-3 col-sm-3 col-sm-12 col-sm-12">        
    <?= $form->field($model, 'prefix_name')->textInput(['maxlength' => 50]) ?> 
    </div>  
    <div class="col-lg-5 col-sm-5 col-sm-12 col-sm-12">        
    <?= $form->field($model, 'full_name')->textInput(['maxlength' => 100]) ?> 
    </div>   
    <div class="col-lg-4 col-sm-4 col-sm-12 col-sm-12">        
    <?= $form->field($model, 'gender')->inline()->radioList($model->getGenderItems()) ?>
    </div>                       
</div>   

<div class="row">     
    <div class="col-lg-3 col-sm-3 col-sm-12 col-sm-12">   
    <?= $form->field($model, 'birth_date')->textInput() ?>
    <!-- <?php echo DatePicker::widget([
        'model' => $model,
        'attribute' => 'birth_date',
        'language' => 'th',
        'dateFormat' => 'yyyy-MM-dd',
    ]);
    ?> -->
    </div>    
    <div class="col-lg-6 col-sm-6 col-sm-6 col-sm-6">     
    <?= $form->field($model, 'job_title')->textInput(['maxlength' => true]) ?>        
    </div>              
    <div class="col-lg-3 col-sm-3 col-sm-6 col-sm-6">     
    <? //= $form->field($model, 'person_type')->textInput(['maxlength' => 1, 'width' => 50]) ?>
    <?= $form->field($model, 'person_type')->widget(Select2::classname(),         
        [           
            'data' => $model->getPersonTypeItems(),
            //'data' => ArrayHelper::map(PersonType::find()->all(),'type_id','type_name'),
            'options' => ['placeholder'=>'เลือกประเภทบุคคล ...'],
            'pluginOptions' => [
                'allowClear' => true
        ],
      ]) 
      ?>       
    </div>       
</div>   

<div class="row">
    <div class="col-lg-4 col-sm-4 col-sm-12 col-sm-12">   
    <?= $form->field($model, 'office')->textInput(['maxlength' => true]) ?>
    </div>        
    <div class="col-lg-4 col-sm-4 col-sm-12 col-sm-12">      
    <?= $form->field($model, 'department')->textInput(['maxlength' => true]) ?>  
    </div>    
    <div class="col-lg-4 col-sm-4 col-sm-12 col-sm-12">      
    <? //= $form->field($model, 'province')->textInput(['maxlength' => 100, 'width' => 300]) ?>
    <?= $form->field($model, 'province')->widget(Select2::classname(),         
        [           
            'data' => $model->getProvinceItems(),
            //'data' => ArrayHelper::map(Province::find()->all(),'province_id','province_name'),
            'options' => ['placeholder'=>'เลือกจังหวัด ...'],
            'pluginOptions' => [
                'allowClear' => true
        ],
      ]) 
      ?>       
    </div>                  
</div>              

<div class="row">
    <div class="col-lg-4 col-sm-4 col-sm-12 col-sm-12">   
    <?= $form->field($model, 'email')->textInput(['maxlength' => true]) ?>     
    </div>        
    <div class="col-lg-3 col-sm-3 col-sm-12 col-sm-12">      
    <?= $form->field($model, 'line_id')->textInput(['maxlength' => true]) ?>
    </div>              
    <div class="col-lg-5 col-sm-5 col-sm-12 col-sm-12">            
    <?= $model->isNewRecord ? '' : '<span class="bg-danger" style="font-weight:bold">ไฟล์รูปภาพปัจจุบัน:</span><br>'.$model->getUploadedPhotoHtml().'<br>' ?>
    <?= $form->field($model, 'photo')->fileInput(['multiple' => false]) ?>    
    </div>                 
</div>        

<div class="row">
	<div class="panel panel-default">
        <div class="panel-heading"><h4><i class="glyphicon glyphicon-envelope"></i> หมายเลขโทรศัพท์</h4></div>
        <div class="panel-body">
             <?php DynamicFormWidget::begin([
                'widgetContainer' => 'dynamicform_wrapper', // required: only alphanumeric characters plus "_" [A-Za-z0-9_]
                'widgetBody' => '.container-items', // required: css class selector
                'widgetItem' => '.item', // required: css class
                'limit' => 5, // the maximum times, an element can be cloned (default 999)
                'min' => 1, // 0 or 1 (default 1)
                'insertButton' => '.add-item', // css class
                'deleteButton' => '.remove-item', // css class
                'model' => $modelsPhone[0],
                'formId' => 'dynamic-form',
                'formFields' => [
                    'number',
                ],
            ]); ?>

            <div class="container-items"><!-- widgetContainer -->
            <?php foreach ($modelsPhone as $i => $modelPhone): ?>
                <div class="item panel panel-default"><!-- widgetBody -->
                    <div class="panel-heading">
                        <h3 class="panel-title pull-left">Phones</h3>
                        <div class="pull-right">
                            <button type="button" class="add-item btn btn-success btn-xs"><i class="glyphicon glyphicon-plus"></i></button>
                            <button type="button" class="remove-item btn btn-danger btn-xs"><i class="glyphicon glyphicon-minus"></i></button>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="panel-body">
                        <?php
                            // necessary for update action.
                            if (! $modelPhone->isNewRecord) {
                                echo Html::activeHiddenInput($modelPhone, "[{$i}]id");
                            }
                        ?>
                        
                        <div class="row">
                            <div class="col-sm-6">
                                <?= $form->field($modelPhone, "[{$i}]number")->textInput(['maxlength' => true]) ?>
                            </div>
                      
                        </div><!-- .row -->
                    </div>
                </div>
            <?php endforeach; ?>
            </div>
            <?php DynamicFormWidget::end(); ?>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-lg-12 col-sm-12 col-sm-12 col-sm-12">        
    <?= $form->field($model, 'notes')->textarea(['rows' => 3]) ?>
    </div>                    
</div>     

<div class="row"> 
    <div class="col-lg-12 col-sm-12 col-sm-12 col-sm-12">      
<? //= $form->field($model, 'tag')->textInput(['maxlength' => 255]) ?>
<?= $form->field($model, 'tag')->widget(Select2::classname(), 
    [
        'data' => $model->getTagItems(),
        'options' => ['multiple'=>true,'placeholder'=>'เลือกคำค้น/เรื่องที่เกียวข้อง ...'],
        'pluginOptions' => [
            'allowClear' => true
    ],
    ]) 
    ?>              
    </div>        
</div>    
    
<div class="row">    
    <div class="col-lg-12 col-sm-12 col-sm-12 col-sm-12">      
    <?= $form->field($model, 'activate_status')->inline()->radioList($model->getActivateStatusItems()) ?>
    </div>                 
</div>  

<div class="form-group">
    <?= Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') 
        : Yii::t('app', 'Update'), ['class' => $model->isNewRecord 
        ? 'btn btn-success' : 'btn btn-primary']) ?>
    <?= Html::a(Yii::t('app', 'Cancel'), ['subscriber/index'], ['class' => 'btn btn-default']) ?>       
</div>

<? //= $form->field($model, 'user_id')->textInput() ?>   
<?= \yii\helpers\Html::activeHiddenInput($model,'user_id'); ?>

<?php ActiveForm::end(); ?>

</div>
<!--div class="subscriber-form"-->