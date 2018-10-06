<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "timings".
 *
 * @property int $timing_id
 * @property string $Timings
 * @property string $timing_description
 * @property string $created_at
 * @property string $updated_at
 * @property int $created_by
 * @property int $updated_by
 *
 * @property Classes[] $classes
 */
class Timings extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'timings';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['Timings', 'timing_description', 'created_by', 'updated_by'], 'required'],
            [['Timings', 'created_at', 'updated_at'], 'safe'],
            [['created_by', 'updated_by'], 'integer'],
            [['timing_description'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'timing_id' => 'Timing ID',
            'Timings' => 'Timings',
            'timing_description' => 'Timing Description',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
            'created_by' => 'Created By',
            'updated_by' => 'Updated By',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getClasses()
    {
        return $this->hasMany(Classes::className(), ['timing_id' => 'timing_id']);
    }
}
