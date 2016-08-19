<?php

namespace app\controllers;

use yii\helpers\Html;

use yii\web\Controller;
use yii\filters\VerbFilter;
use yii\web\NotFoundHttpException;
use yii\web\MethodNotAllowedHttpException;
use yii\web\UploadedFile;
use yii\data\ActiveDataProvider;

use yii\helpers\ArrayHelper;

use app\models\Subscriber;
use app\models\SubscriberSearch;
use app\models\Phone;
use app\models\Model;

use Yii;

/**
 * SubscriberController implements the CRUD actions for Subscriber model.
 */
class SubscriberController extends Controller
{
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['post'],
                ],
            ],
        ];
    }

    /**
     * Lists all Subscriber models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new SubscriberSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Subscriber model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {   $dataProviderPhones = new ActiveDataProvider([
            'query' => $this->findModelPhones($id),
            'pagination' => [
                'pageSize' => 20,
            ],
        ]);
        return $this->render('view', [
            'model' => $this->findModel($id),
            'dataProvider' => $dataProviderPhones
        ]);
    }

    /**
     * Creates a new Subscriber model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    /*
    public function actionCreate()
    {
        $model = new Subscriber();
        $modelsPhone = [new Phone];

        if ($model->load(Yii::$app->request->post())) {
            $model->user_id=Yii::$app->user->getId();
            if($model->save()):

             $modelsPhone = Model::createMultiple(Phone::classname());
            
            Model::loadMultiple($modelsPhone, Yii::$app->request->post());

            // validate all models
            $valid = $model->validate();
            $valid = Model::validateMultiple($modelsPhone) && $valid;

            if ($valid) {
                $transaction = \Yii::$app->db->beginTransaction();
                try {
                    if ($flag = $model->save(false)) {
                        foreach ($modelsPhone as $modelPhone) {
                            $modelPhone->subscriber_id = $model->id;
                            if (! ($flag = $modelPhone->save(false))) {
                                $transaction->rollBack();
                                break;
                            }
                        }
                    }
                    if ($flag) {
                        $transaction->commit();
                        return $this->redirect(['view', 'id' => $model->id]);
                    }
                } catch (Exception $e) {
                    $transaction->rollBack();
                }
            }
            endif;
     
        } else {
            return $this->render('create', [
                'model' => $model,
                'modelsPhone' => (empty($modelsPhone)) ? [new Phone] : $modelsPhone
            ]);
        }
    }
    */     
    public function actionCreate()
    {
        $model = new Subscriber();
        $modelsPhone = [new Phone];

        // Define the default values
        $model->person_type = Subscriber::PERSON_TYPE_1;
        $model->activate_status = Subscriber::STATUS_ACTIVATE;
        $model->user_id = Yii::$app->user->id;
        $model->created_by = Yii::$app->user->id;
        $model->updated_by = Yii::$app->user->id;        

        if ($model->load(Yii::$app->request->post())) {
            $model->user_id=Yii::$app->user->getId();
            if($model->save()):

             $modelsPhone = Model::createMultiple(Phone::classname());
            
            Model::loadMultiple($modelsPhone, Yii::$app->request->post());

            // validate all models
            $valid = $model->validate();
            $valid = Model::validateMultiple($modelsPhone) && $valid;

            // if data validated & multiple files uploaded
            $file_photo = UploadedFile::getInstances($model, 'photo');
            //if ($valid) {
            if ($valid && ($model->photo = $model->uploadPhoto($file_photo))) {
                $transaction = \Yii::$app->db->beginTransaction();
                try {
                    if ($flag = $model->save(false)) {
                        // Place here your code to delete uploaded file(s) here 
                        // ...                      
                        foreach ($modelsPhone as $modelPhone) {
                            $modelPhone->subscriber_id = $model->id;
                            if (! ($flag = $modelPhone->save(false))) {
                                $transaction->rollBack();
                                break;
                            }
                        }
                    }
                    if ($flag) {
                        $transaction->commit();
                        return $this->redirect(['view', 'id' => $model->id]);
                    }
                } catch (Exception $e) {
                    $transaction->rollBack();
                }
            }
            endif;
     
        } else {
            return $this->render('create', [
                'model' => $model,
                'modelsPhone' => (empty($modelsPhone)) ? [new Phone] : $modelsPhone
            ]);
        }
    }

    /**
     * Updates an existing Subscriber model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
     /*
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);
        $modelsPhone = $model->phones;

        // Define the default values
        $model->updated_by = Yii::$app->user->id;    
        
        if ($model->load(Yii::$app->request->post())) {

            $oldIDs = ArrayHelper::map($modelsPhone, 'id', 'id');
            $modelsPhone = Model::createMultiple(Phone::classname(), $modelsPhone);
            Model::loadMultiple($modelsPhone, Yii::$app->request->post());
            $deletedIDs = array_diff($oldIDs, array_filter(ArrayHelper::map($modelsPhone, 'id', 'id')));


            // validate all models
            $valid = $model->validate();
            $valid = Model::validateMultiple($modelsPhone) && $valid;

            if ($valid) {
                $transaction = \Yii::$app->db->beginTransaction();
                try {
                    if ($flag = $model->save(false)) {
                        if (! empty($deletedIDs)) {
                            Phone::deleteAll(['id' => $deletedIDs]);
                        }
                        foreach ($modelsPhone as $modelPhone) {
                            $modelPhone->subscriber_id = $model->id;
                            if (! ($flag = $modelPhone->save(false))) {
                                $transaction->rollBack();
                                break;
                            }
                        }
                    }
                    if ($flag) {
                        $transaction->commit();
                        return $this->redirect(['view', 'id' => $model->id]);
                    }
                } catch (Exception $e) {
                    $transaction->rollBack();
                }
            }
        }

        return $this->render('update', [
            'model' => $model,
            'modelsPhone' => (empty($modelsPhone)) ? [new Phone] : $modelsPhone
        ]);
    }
    */     
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);
        $modelsPhone = $model->phones;

        // Define the default values
        $model->updated_by = Yii::$app->user->id;    

        if ($model->load(Yii::$app->request->post())) {

            $oldIDs = ArrayHelper::map($modelsPhone, 'id', 'id');
            $modelsPhone = Model::createMultiple(Phone::classname(), $modelsPhone);
            Model::loadMultiple($modelsPhone, Yii::$app->request->post());
            $deletedIDs = array_diff($oldIDs, array_filter(ArrayHelper::map($modelsPhone, 'id', 'id')));


            // validate all models
            $valid = $model->validate();
            $valid = Model::validateMultiple($modelsPhone) && $valid;

            // if data validated & multiple files uploaded
            $file_photo = UploadedFile::getInstances($model, 'photo');        
            if ($valid && ($model->photo = $model->uploadPhoto($file_photo))) {

                $transaction = \Yii::$app->db->beginTransaction();
                try {
                    if ($flag = $model->save(false)) {
                        if (! empty($deletedIDs)) {
                            Phone::deleteAll(['id' => $deletedIDs]);
                            // Place here your code to delete uploaded file(s) here 
                            // ...
                        }
                        foreach ($modelsPhone as $modelPhone) {
                            $modelPhone->subscriber_id = $model->id;
                            if (! ($flag = $modelPhone->save(false))) {
                                $transaction->rollBack();
                                break;
                            }
                        }
                    }
                    if ($flag) {
                        $transaction->commit();
                        return $this->redirect(['view', 'id' => $model->id]);
                    }
                } catch (Exception $e) {
                    $transaction->rollBack();
                }
            }
        }

        return $this->render('update', [
            'model' => $model,
            'modelsPhone' => (empty($modelsPhone)) ? [new Phone] : $modelsPhone
        ]);
    }

    /**
     * Deletes an existing Subscriber model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the Subscriber model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Subscriber the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Subscriber::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }

    protected function findModelPhones($id)
    {
        if (($model = Phone::find()->where(['subscriber_id'=>$id])) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
