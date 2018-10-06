<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "teacher_subject_assign_detail".
 *
 * @property int $teacher_subject_assign_detail_id
 * @property int $teacher_subject_assign_detail_head_id
 * @property int $class_id
 * @property int $subject_id
 * @property string $created_at
 * @property string $updated_at
 * @property int $created_by
 * @property int $updated_by
 *
 * @property TeacherSubjectAssignHead $teacherSubjectAssignDetailHead
 * @property Subjects $subject
 * @property StdClasses $class
 */
class TeacherSubjectAssignDetail extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'teacher_subject_assign_detail';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['teacher_subject_assign_detail_head_id', 'class_id', 'subject_id', 'created_by', 'updated_by'], 'required'],
            [['teacher_subject_assign_detail_head_id', 'class_id', 'subject_id', 'created_by', 'updated_by'], 'integer'],
            [['created_at', 'updated_at'], 'safe'],
            [['teacher_subject_assign_detail_head_id'], 'exist', 'skipOnError' => true, 'targetClass' => TeacherSubjectAssignHead::className(), 'targetAttribute' => ['teacher_subject_assign_detail_head_id' => 'teacher_subject_assign_head_id']],
            [['subject_id'], 'exist', 'skipOnError' => true, 'targetClass' => Subjects::className(), 'targetAttribute' => ['subject_id' => 'subject_id']],
            [['class_id'], 'exist', 'skipOnError' => true, 'targetClass' => StdClasses::className(), 'targetAttribute' => ['class_id' => 'class_id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'teacher_subject_assign_detail_id' => 'Teacher Subject Assign Detail ID',
            'teacher_subject_assign_detail_head_id' => 'Teacher Subject Assign Detail Head ID',
            'class_id' => 'Class ID',
            'subject_id' => 'Subject ID',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
            'created_by' => 'Created By',
            'updated_by' => 'Updated By',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getTeacherSubjectAssignDetailHead()
    {
        return $this->hasOne(TeacherSubjectAssignHead::className(), ['teacher_subject_assign_head_id' => 'teacher_subject_assign_detail_head_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSubject()
    {
        return $this->hasOne(Subjects::className(), ['subject_id' => 'subject_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getClass()
    {
        return $this->hasOne(StdClasses::className(), ['class_id' => 'class_id']);
    }
}
