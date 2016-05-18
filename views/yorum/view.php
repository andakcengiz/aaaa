<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model backend\modules\yorum\models\Yorum */

$this->title = $model->title;
$this->params['breadcrumbs'][] = ['label' => 'Yorums', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="yorum-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Güncelle', ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Sil', ['delete', 'id' => $model->id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Silmek İstediğinize Eminmisiniz?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            
            'title',
            'body:ntext',
            'authors.username',
        ],
    ]) ?>

</div>
