<?php

namespace app\models;

// Use to call function stamping DateTime
use yii\behaviors\TimestampBehavior;
// Use to call function stamping User-ID
use yii\behaviors\BlameableBehavior;
// Use to call function Split Select2's combobox into array
use yii\behaviors\AttributeBehavior;
use yii\db\ActiveRecord;
use \yii\helpers\ArrayHelper;
use \yii\helpers\Html;

use Yii;

/**
 * This is the model class for table "subscriber".
 *
 * @property integer $id
 * @property integer $user_id
 * @property string $prefix_name
 * @property string $full_name
 * @property string $gender
 * @property string $birth_date
 * @property string $person_type 
 * @property string $photo
 * @property string $job_title
 * @property string $office 
 * @property string $department
 * @property string $province 
 * @property string $email
 * @property string $line_id  
 * @property string $url   
 * @property string $notes
 * @property string $activate_status  
 * @property string $created_by  
 * @property string $created_at  
 * @property string $updated_by  
 * @property string $updated_at     
 *
 * @property Phone[] $phones
 * @property User $user
 * 
 */
class Subscriber extends \yii\db\ActiveRecord
{
    // User-Defined constants: constants
    const FILE_PATH = '/phonebook-yii2/web/uploads/';
    const THAI_YEAR_DIFF = 543;    
    const FISCAL_YEAR = 2559;

    // User-Defined constants: Person type
    const GENDER_1 = '1', GENDER_1_DESC = 'ชาย';
    const GENDER_2 = '2', GENDER_2_DESC = 'หญิง';   
    const GENDER_9 = '9', GENDER_9_DESC = 'อื่นๆ/ไม่ระบุ';

    // User-Defined constants: Person type
    const PERSON_TYPE_1 = '1', PERSON_TYPE_1_DESC = 'ข้าราชการ';
    const PERSON_TYPE_2 = '2', PERSON_TYPE_2_DESC = 'พนักงานราชการ';
    const PERSON_TYPE_3 = '3', PERSON_TYPE_3_DESC = 'พนักงานกระทรวง';
    const PERSON_TYPE_4 = '4', PERSON_TYPE_4_DESC = 'ลูกจ้างประจำ';
    const PERSON_TYPE_5 = '5', PERSON_TYPE_5_DESC = 'ลูกจ้างชั่วคราว';
    const PERSON_TYPE_6 = '6', PERSON_TYPE_6_DESC = 'ลูกจ้างโครงการ';    
    const PERSON_TYPE_9 = '9', PERSON_TYPE_9_DESC = 'อื่นๆ/ไม่ระบุ/ไม่ทราบ';
    // User-Defined constants: Activated/De-activated status
    const STATUS_ACTIVATE = 1, STATUS_ACTIVATE_DESC = 'ใช้';
    const STATUS_DEACTIVATE = 2, STATUS_DEACTIVATE_DESC = 'ไม่ใข้';

    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'subscriber';
    }

    /**
     * @inheritdoc   
     */
    public function rules()
    {
        return [
            [['user_id', 'full_name'], 'required'], 
            [['user_id'], 'integer'],
            [['birth_date'], 'safe'],
            [['prefix_name', 'gender', 'person_type', 'job_title', 'office', 'department', 'province', 'notes', 'activate_status'], 'string'],
            [['full_name', 'job_title', 'office', 'department', 'email', 'email', 'line_id', 'url'], 'string', 'max' => 100],
            [['photo', 'province'], 'string', 'max' => 255]
        ];
    }

    /**
     * Returns a list of behaviors that this component should behave as.
     *
     * @return array
     */
    /*
    public function behaviors()
    {
        return [
            TimestampBehavior::className(),
        ];
    }
     * 
     */
    public function behaviors() {
        return [
            //Dune
            // Timestamp service class calling
            TimestampBehavior::className(),
            // Logging-on user service class calling            
            BlameableBehavior::className(),
            [
                'class' => AttributeBehavior::className(),
                'attributes' => [
                    ActiveRecord::EVENT_BEFORE_INSERT => 'activate_status',
                    ActiveRecord::EVENT_BEFORE_UPDATE => 'activate_status',
                ],
                'value' => function ($event) {   
                    return $this->activate_status;
                },
            ],                          
        ];
    } 

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'รหัส',
            'user_id' => 'User ID',
            'prefix_name' => 'คำนำหน้า',
            'full_name' => 'ชื่อ-สกุล',
            'gender' => 'เพศ',
            'birth_date' => 'วันเดือนปีเกิด',
            'person_type' => 'ประเภทบุคคล',
            'photo' => 'ไฟล์รูปภาพ',
            'job_title' => 'ตำแหน่ง',
            'office' => 'หน่วยงาน (กอง)',
            'department' => 'ส่วนราชการ (กรม)',
            'province' => 'จังหวัด',
            'email' => 'อีเมล์ (E-Mail)',
            'line_id' => 'รหัสผู้ใช้ไลน์ (Line ID)',
            'url' => 'เว็บไซต์/เฟซบุ้ค',
            'notes' => 'รายละเอียดเพิ่มเติม',
            'activate_status' => Yii::t('app', 'สถานะ(ใช้/ไม่ใช้)'),
            'created_at' => Yii::t('app', 'สร้างเมื่อ'),
            'created_by' => Yii::t('app', 'สร้างโดย'),
            'updated_at' => Yii::t('app', 'แก้ไขเมื่อ'),
            'updated_by' => Yii::t('app', 'แก้ไขโดย'),            
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPhones()
    {
        return $this->hasMany(Phone::className(), ['subscriber_id' => 'id']);
    }

    public function getUser()
    {
        return $this->hasOne(User::className(), ['id' => 'user_id']);
    }    

    /**
     * User-Defined functions
     */
    // FileUpload-Single-Photo
    public function uploadPhoto($file_photos)
    {
        if ($this->validate()) { 

            // FileUpload-Path
            //$file_path = Yii::getAlias('@uploads') . '/';
            // Development Path (http://SERVER_NAME/phonebook-yii2)
            $file_path = '/xampp/htdocs/phonebook-yii2/web/uploads/';
            //
            // Production Path (http://SERVER_NAME)
            //$file_path = '/htdocs/uploads/';
            $file_names = [];
            $file_counter = 0;
            foreach ($file_photos as $file) {
                $file_counter++;
                // MD5 file name
                //$file_name = $this->id.'-'.$this->person_type.'-'.$this->province.'-'.$file_counter.'.'.$file->extension;
                $file_name = md5($file->baseName).'.'.$file->extension;
                $file->saveAs($file_path . $file_name);      
                $file_names[] = $file_name;
            } //end foreach
            return implode(',', $file_names);  
        } else {
            return false;
        }
    }

    // FileUpload-Multiple-Photos
    public function uploadMultiplePhoto($file_photos)
    {
        if ($this->validate()) { 

            // FileUpload-Path
            //$file_path = Yii::getAlias('@uploads') . '/';
            // Development Path (http://SERVER_NAME/phonebook-yii2)
            $file_path = '/xampp/htdocs/phonebook-yii2/web/uploads/';
            //
            // Production Path (http://SERVER_NAME)
            //$file_path = '/htdocs/uploads/';
            $file_names = [];
            $file_counter = 0;
            foreach ($file_photos as $file) {
                $file_counter++;
                // MD5 file name
                //$file_name = $this->id.'-'.$this->person_type.'-'.$this->province.'-'.$file_counter.'.'.$file->extension;
                $file_name = md5($file->baseName).'.'.$file->extension;
                $file->saveAs($file_path . $file_name);      
                $file_names[] = $file_name;
            } //end foreach
            return implode(',', $file_names);  
        } else {
            return false;
        }
    }

    // FileUpload-Single-Photo
    public function edPhoto() {
        // FileUpload-Path                                 
        //return Yii::getAlias('@webroot') . '/uploads/' . $this->photo;
        //return Yii::getAlias('@appRoot') . '/uploads/' . $this->photo;  
        return $this->photo;       
    }

    // FileUpload-Single-Photo with HTML Link
    public function getUploadedPhotoHtml() {
        // FileUpload-Path                                 
        //return Yii::getAlias('@webroot') . '/uploads/' . $this->photo;
        //return Yii::getAlias('@appRoot') . '/uploads/' . $this->photo;      
        return (($this->photo!="") ? Html::a(($this->photo), (Subscriber::FILE_PATH.$this->photo), ['target' => '_blank']) : "");  
    }    

    // FileUpload-Multiple-Photos
    public function getUploadedMultiplePhoto() {
        // FileUpload-Path
        //$file_path = Yii::getAlias('@webroot');
        //$file_path = Yii::getAlias('@appRoot') . '/uploads/';    
        $file_path = '/phonebook-yii2/web/uploads/';         
        $items = explode(',', $this->photo);
        $file_photos = ''; // Clear value
        foreach ($items as $file_key => $file_value) {
            $file_photos .= (($file_value!="") ? Html::a(($file_value), ($file_path.$file_value), ['target' => '_blank']) : "") . "<br/>";  
        } //end foreach
        return $file_photos;
    }

    // FileUpload-Multiple-Photos with HTML Link
    public function getUploadedMultiplePhotoHtml() {
        // FileUpload-Path
        //$file_path = Yii::getAlias('@webroot');
        //$file_path = Yii::getAlias('@appRoot') . '/uploads/';    
        $file_path = '/phonebook-yii2/web/uploads/';         
        $items = explode(',', $this->photo);
        $file_photos = ''; // Clear value
        foreach ($items as $file_key => $file_value) {
            $file_photos .= (($file_value!="") ? Html::a(($file_value), ($file_path.$file_value), ['target' => '_blank']) : "") . "<br/>";  
        } //end foreach
        return $file_photos;
    }    

    public function stringToArray($value){
      return empty($value) ? null :explode(',', $value);
    }

    public function arrayToString($value){
      return is_array($value) ? implode(',', $value) : null ;
    }

    public function itemList($key) {
        $items = [
            'fiscalyear'=>[
                '2563'=>'2563',
                '2562'=>'2562',
                '2561'=>'2561',
                '2560'=>'2560',
                '2559'=>'2559',
            ],    
            'gender'=>[
                self::GENDER_1 => self::GENDER_1_DESC,    
                self::GENDER_2 => self::GENDER_2_DESC,
                self::GENDER_9 => self::GENDER_9_DESC, 
            ],                         
            'person_type'=>[
                self::PERSON_TYPE_1 => self::PERSON_TYPE_1.'-'.self::PERSON_TYPE_1_DESC,    
                self::PERSON_TYPE_2 => self::PERSON_TYPE_2.'-'.self::PERSON_TYPE_2_DESC,
                self::PERSON_TYPE_3 => self::PERSON_TYPE_3.'-'.self::PERSON_TYPE_3_DESC,                
                self::PERSON_TYPE_4 => self::PERSON_TYPE_4.'-'.self::PERSON_TYPE_4_DESC, 
                self::PERSON_TYPE_5 => self::PERSON_TYPE_5.'-'.self::PERSON_TYPE_5_DESC,
                self::PERSON_TYPE_6 => self::PERSON_TYPE_6.'-'.self::PERSON_TYPE_6_DESC, 
                self::PERSON_TYPE_9 => self::PERSON_TYPE_9.'-'.self::PERSON_TYPE_9_DESC, 
            ], 
            'country'=>[
                '000'=>'000-ไม่ระบุ/ไม่ทราบ',
                '001'=>'001-ประเทศ..1','002'=>'002-ประเทศ..2','003'=>'003-ประเทศ..3',
                '004'=>'004-ประเทศ..4','005'=>'005-ประเทศ..5','006'=>'006-ประเทศ..6',
                '007'=>'007-ประเทศ..7','008'=>'008-ประเทศ..8','09'=>'009-ประเทศ..9',
                '010'=>'010-ประเทศ..10','011'=>'011-ประเทศ..11','099'=>'099-ประเทศไทย',
                '999'=>'999-อื่นๆ'
            ],                  
            'ministry'=>[
                '00'=>'00-ไม่ระบุ/ไม่ทราบ',
                '01'=>'01-กระทรวง...1','02'=>'02-กระทรวง...2','03'=>'03-กระทรวง...3',
                '04'=>'04-กระทรวง...4','05'=>'05-กระทรวง...5','06'=>'06-กระทรวง...6',
                '07'=>'07-กระทรวง...7','08'=>'08-กระทรวง...8','09'=>'09-กระทรวง...9',
                '10'=>'10-กระทรวง...10','11'=>'11-กระทรวง...11','12'=>'12-กระทรวง...12',
                '99'=>'99-อื่นๆ'
            ],         
            'department'=>[
                '00'=>'00-ไม่ระบุ/ไม่ทราบ',
                '01'=>'01-กรม...1','02'=>'02-กรม...2','03'=>'03-กรม...3',
                '04'=>'04-กรม...4','05'=>'05-กรม...5','06'=>'06-กรม...6',
                '07'=>'07-กรม...7','08'=>'08-กรม...8','09'=>'09-กรม...9',
                '99'=>'99-อื่นๆ'
            ], 
            'division'=>[
                '00'=>'00-ไม่ระบุ/ไม่ทราบ',
                '01'=>'01-สำนักงานเลขานุการกรม','02'=>'02-กองแผนงาน','03'=>'03-สำนัก...',
                '04'=>'04-สำนัก...','05'=>'05-สำนัก...','06'=>'06-สำนัก...',
                '07'=>'07-สำนัก...','08'=>'08-สำนัก...','09'=>'09-สำนัก...',
                '10'=>'10-สำนัก...','11'=>'11-สำนัก...','12'=>'12-สำนัก...',
                '99'=>'99-อื่นๆ'
            ],              
            'workfield'=>[
                '00'=>'00-ไม่ระบุ/ไม่ทราบ',
                '01'=>'01-บริหาร','02'=>'02-แผนงาน/ยุทธศาสตร์ 2','03'=>'03-อำนวยการ',
                '04'=>'04-เทคโนโลยีสารสนเทศ',
                '99'=>'99-อื่นๆ'
            ],                                  
            'region'=>[
                '00'=>'00-ไม่ระบุ/ไม่ทราบ',
                '01'=>'01-เขตสุขภาพที่ 1','02'=>'02-เขตสุขภาพที่ 2','03'=>'03-เขตสุขภาพที่ 3',
                '04'=>'04-เขตสุขภาพที่ 4','05'=>'05-เขตสุขภาพที่ 5','06'=>'06-เขตสุขภาพที่ 6',
                '07'=>'07-เขตสุขภาพที่ 7','08'=>'08-เขตสุขภาพที่ 8','09'=>'09-เขตสุขภาพที่ 9',
                '10'=>'10-เขตสุขภาพที่ 10','11'=>'11-เขตสุขภาพที่ 11','12'=>'12-เขตสุขภาพที่ 12',
            ],                                
            'province'=>[
                '00'=>'00-ไม่ระบุ/ไม่ทราบ',
                '10'=>'10-กรุงเทพมหานคร','11'=>'11-สมุทรปราการ','12'=>'12-นนทบุรี','13'=>'13-ปทุมธานี','14'=>'14-พระนครศรีอยุธยา',
                '15'=>'15-อ่างทอง','16'=>'16-ลพบุรี','17'=>'17-สิงห์บุรี','18'=>'18-ชัยนาท','19'=>'19-สระบุรี','20'=>'20-ชลบุรี',
                '21'=>'21-ระยอง','22'=>'22-จันทบุรี','23'=>'23-ตราด','24'=>'24-ฉะเชิงเทรา','25'=>'25-ปราจีนบุรี','26'=>'26-นครนายก','27'=>'27-สระแก้ว',
                '30'=>'30-นครราชสีมา','31'=>'31-บุรีรัมย์','32'=>'32-สุรินทร์','33'=>'33-ศรีสะเกษ','34'=>'34-อุบลราชธานี',
                '35'=>'35-ยโสธร','36'=>'36-ชัยภูมิ','37'=>'37-อำนาจเจริญ','38'=>'38-บึงกาฬ','39'=>'39-หนองบัวลำภู',
                '40'=>'40-ขอนแก่น','41'=>'41-อุดรธานี','42'=>'42-เลย','43'=>'43-หนองคาย','44'=>'44-มหาสารคาม',
                '45'=>'45-ร้อยเอ็ด','46'=>'46-กาฬสินธุ์','47'=>'47-สกลนคร','48'=>'48-นครพนม','49'=>'49-มุกดาหาร',
                '50'=>'50-เชียงใหม่','51'=>'51-ลำพูน','52'=>'52-ลำปาง','53'=>'53-อุตรดิตถ์','54'=>'54-แพร่',
                '55'=>'55-น่าน','56'=>'56-พะเยา','57'=>'57-เชียงราย','58'=>'58-แม่ฮ่องสอน',
                '60'=>'60-นครสวรรค์','61'=>'61-อุทัยธานี','62'=>'62-กำแพงเพชร','63'=>'63-ตาก',
                '64'=>'64-สุโขทัย','65'=>'65-พิษณุโลก','66'=>'66-พิจิตร','67'=>'67-เพชรบูรณ์',
                '70'=>'70-ราชบุรี','71'=>'71-กาญจนบุรี','72'=>'72-สุพรรณบุรี','73'=>'73-นครปฐม','74'=>'74-สมุทรสาคร',
                '75'=>'75-สมุทรสงคราม','76'=>'76-เพชรบุรี','77'=>'77-ประจวบคีรีขันธ์',
                '80'=>'80-นครศรีธรรมราช','81'=>'81-กระบี่','82'=>'82-พังงา','83'=>'83-ภูเก็ต','84'=>'84-สุราษฎร์ธานี','85'=>'85-ระนอง','86'=>'86-ชุมพร',
                '90'=>'90-สงขลา','91'=>'91-สตูล','92'=>'92-ตรัง','93'=>'93-พัทลุง','94'=>'94-ปัตตานี','95'=>'95-ยะลา','96'=>'96-นราธิวาส',                
            ],                         
            'activate_status'=>[
              self::STATUS_ACTIVATE => self::STATUS_ACTIVATE_DESC,
              self::STATUS_DEACTIVATE => self::STATUS_DEACTIVATE_DESC        
            ],            
            'tag'=>[
                'อนามัยแม่และเด็ก' => 'อนามัยแม่และเด็ก',
                'วัยเรียน' => 'วัยเรียน',             
                'วัยรุ่น' => 'วัยรุ่น',
                'วัยทำงาน' => 'วัยทำงาน',
                'วัยสูงอายุ' => 'วัยสูงอายุ',
                'สร้างเสริมสุขภาพ' => 'สร้างเสริมสุขภาพ',
                'อนามัยสิ่งแวดล้อม' => 'อนามัยสิ่งแวดล้อม',
                'การเงิน/งบประมาณ' => 'การเงิน/งบประมาณ',
                'โภชนาการ' => 'โภชนาการ',                   
                'ออกกำลังกาย' => 'ออกกำลังกาย',
                'คุ้มครองผู้บริโภค' => 'คุ้มครองผู้บริโภค',
                'ส่งเสริมสุขภาพ' => 'ส่งเสริมสุขภาพ',
                'คุ้มครองผู้บริโภค' => 'คุ้มครองผู้บริโภค',
                'กรมอนามัย' => 'กรมอนามัย',
            ],               
        ];
        return array_key_exists($key, $items) ? $items[$key] : [];
    }

    public function getGenderItems() {
        return $this->itemList('gender');
    }

    public function getPersonTypeItems() {
        return $this->itemList('person_type');
    }

    public function getCountryItems() {
        return $this->itemList('country');
    }   

    public function getMinistryItems() {
        return $this->itemList('ministry');
    }       

    public function getDepartmentItems() {
        return $this->itemList('department');
    }    

    public function getDivisionItems() {
        return $this->itemList('division');
    }          

    public function getWorkfieldItems() {
        return $this->itemList('workfield');
    }           

    public function getRegionItems() {
        return $this->itemList('region');
    }   

    public function getProvinceItems() {
        return $this->itemList('province');
    }   

    public function getActivateStatusItems() {
        return $this->itemList('activate_status');
    }  

    public function getTagItems() {
        return $this->itemList('tag');
    }         

    public function getGender(){
      return ArrayHelper::getValue($this->getGenderItems(),$this->gender);
    }    

    public function getPersonType(){
      return ArrayHelper::getValue($this->getPersonTypeItems(),$this->person_type);
    }    

    public function getCountry() {
        return ArrayHelper::getValue($this->getCountryItems(),$this->country);
    }   

    public function getMinistry() {
        return ArrayHelper::getValue($this->getMinistryItems(),$this->ministry);
    }   

    public function getDepartment() {
        return ArrayHelper::getValue($this->getDepartmentItems(),$this->department);
    }   

    public function getDivision() {
        return ArrayHelper::getValue($this->getDivisionItems(),$this->division);
    }    

    public function getWorkfield() {
        return ArrayHelper::getValue($this->getWorkfieldItems(),$this->workfield);
    }    

    public function getRegion() {
        return ArrayHelper::getValue($this->getRegionItems(),$this->region);
    }    

    public function getProvince() {
        return ArrayHelper::getValue($this->getProvinceItems(),$this->province);
    }        

    public function getActivateStatus() {
        return ArrayHelper::getValue($this->getActivateStatusItems(),$this->activate_status);
    }  

    public function getTag() {
        return ArrayHelper::getValue($this->getTagItems(),$this->tag);
    }         
            
}
