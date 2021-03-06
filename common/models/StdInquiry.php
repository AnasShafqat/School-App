<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "std_inquiry".
 *
 * @property int $std_inquiry_id
 * @property int $branch_id
 * @property string $std_inquiry_no
 * @property string $inquiry_session
 * @property string $std_name
 * @property string $std_father_name
 * @property string $gender
 * @property string $std_contact_no
 * @property string $std_father_contact_no
 * @property string $std_inquiry_date
 * @property string $std_intrested_class
 * @property string $std_previous_class
 * @property string $previous_institute
 * @property string $std_roll_no
 * @property int $std_obtained_marks
 * @property int $std_total_marks
 * @property string $std_percentage
 * @property string $refrence_name
 * @property string $refrence_contact_no
 * @property string $refrence_designation
 * @property string $std_address
 * @property string $comment
 * @property string $inquiry_status
 * @property string $created_at
 * @property string $updated_at
 * @property int $created_by
 * @property int $updated_by
 *
 * @property Branches $branch
 */
class StdInquiry extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'std_inquiry';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['inquiry_session', 'std_name', 'std_father_name', 'gender', 'std_father_contact_no', 'std_inquiry_date', 'std_intrested_class', 'std_previous_class', 'previous_institute', 'std_roll_no', 'std_obtained_marks', 'std_total_marks', 'std_percentage'], 'required'],
            [['branch_id', 'std_obtained_marks', 'std_total_marks', 'created_by', 'updated_by'], 'integer'],
            [['gender', 'inquiry_status'], 'string'],
            [['branch_id','std_inquiry_date', 'created_at', 'updated_at','inquiry_status', 'created_by', 'updated_by', 'refrence_name', 'refrence_contact_no', 'refrence_designation', 'std_address', 'comment', 'std_contact_no'], 'safe'],
            [['std_inquiry_no', 'std_contact_no', 'std_father_contact_no', 'refrence_contact_no'], 'string', 'max' => 15],
            [['inquiry_session'], 'string', 'max' => 20],
            [['std_name', 'std_father_name', 'refrence_name'], 'string', 'max' => 32],
            [[], 'string', 'max' => 50],
            //[['previous_institute','std_intrested_class','std_previous_class'], 'string', 'max' => 120],
            [['std_roll_no'], 'string', 'max' => 10],
            [['std_percentage'], 'string', 'max' => 6],
            [['refrence_designation'], 'string', 'max' => 30],
            [['std_address'], 'string', 'max' => 200],
            [['comment'], 'string', 'max' => 255],
            [['branch_id'], 'exist', 'skipOnError' => true, 'targetClass' => Branches::className(), 'targetAttribute' => ['branch_id' => 'branch_id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'std_inquiry_id' => 'Inquiry No',
            'branch_id' => 'Branch ID',
            'std_inquiry_no' => 'Student Inquiry No',
            'inquiry_session' => 'Inquiry Session',
            'std_name' => 'Student Name',
            'std_father_name' => "Father's Name",
            'gender' => 'Gender',
            'std_contact_no' => 'Student Contact No',
            'std_father_contact_no' => 'Father Contact No',
            'std_inquiry_date' => 'Inquiry Date',
            'std_intrested_class' => 'Intrested Class',
            'std_previous_class' => 'Previous Class',
            'previous_institute' => 'Previous Institute',
            'std_roll_no' => 'Previous Roll No',
            'std_obtained_marks' => 'Obtained Marks',
            'std_total_marks' => 'Total Marks',
            'std_percentage' => 'Percentage',
            'refrence_name' => 'Refrence Name',
            'refrence_contact_no' => 'Refrence Contact No',
            'refrence_designation' => 'Refrence Designation',
            'std_address' => 'Student Address',
            'comment' => 'Comment',
            'inquiry_status' => 'Inquiry Status',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
            'created_by' => 'Created By',
            'updated_by' => 'Updated By',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getBranch()
    {
        return $this->hasOne(Branches::className(), ['branch_id' => 'branch_id']);
    }
}
