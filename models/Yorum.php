<?php

namespace andakcengiz\yorum\models;

use Yii;
use common\models\User;

/**
 * This is the model class for table "yorum".
 *
 * @property integer $id
 * @property string $title
 * @property string $body
 * @property integer $author
 *
 * @property User $author0
 */
class Yorum extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'yorum';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['title', 'body'], 'required'],
            [['body'], 'string'],
            [['author'], 'integer'],
            [['title'], 'string', 'max' => 128],
            [['author'], 'exist', 'skipOnError' => true, 'targetClass' => User::className(), 'targetAttribute' => ['author' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'title' => 'Başlık',
            'body' => 'İçerik',
            'author' => 'Yazar',

			
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getAuthors()
    {
        return $this->hasOne(User::className(), ['id' => 'author']);
    }
}
