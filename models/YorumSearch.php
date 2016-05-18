<?php

namespace andakcengiz\yorum\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use andakcengiz\yorum\models\Yorum;

/**
 * YorumSearch represents the model behind the search form about `backend\modules\yorum\models\Yorum`.
 */
class YorumSearch extends Yorum
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'author'], 'integer'],
            [['title', 'body'], 'safe'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = Yorum::find();

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'id' => $this->id,
            'author' => $this->author,
        ]);

        $query->andFilterWhere(['like', 'title', $this->title])
            ->andFilterWhere(['like', 'body', $this->body]);

        return $dataProvider;
    }
}
