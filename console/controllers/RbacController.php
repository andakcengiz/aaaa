<?php
namespace console\controllers;

use Yii;
use yii\console\Controller;
use common\rbac\AuthorRule;

class RbacController extends Controller
{
    public function actionInit()
    {
        $auth = Yii::$app->authManager;

        // add "createPost" permission
        $YorumOlustur = $auth->createPermission('YorumOlustur');
        $YorumOlustur->description = 'Yorum Oluşturmak için';
        $auth->add($YorumOlustur);
		
		//// silme
		$YorumSil = $auth->createPermission('YorumSil');
        $YorumSil->description = 'Yorum Sil';
        $auth->add($YorumSil);

        // add "updatePost" permission
        $YorumGuncelle = $auth->createPermission('YorumGuncelle');
        $YorumGuncelle->description = 'Yorum Güncellenek için';
        $auth->add($YorumGuncelle);

        // add "author" role and give this role the "createPost" permission
        $author = $auth->createRole('author');
        $auth->add($author);
        $auth->addChild($author, $YorumOlustur);

        // add "admin" role and give this role the "updatePost" permission
        // as well as the permissions of the "author" role
        $admin = $auth->createRole('admin');
        $auth->add($admin);
        $auth->addChild($admin, $YorumGuncelle);
		$auth->addChild($admin, $YorumSil);
		$auth->addChild($admin, $author);

        // Assign roles to users. 1 and 2 are IDs returned by IdentityInterface::getId()
        // usually implemented in your User model.
        $auth->assign($author, 2);
        $auth->assign($admin, 1);
    }
 
 public function actionAuthorRule()
 {
  $auth = Yii::$app->authManager;

  // add the rule
  $rule = new AuthorRule;
  $auth->add($rule);

  // add the "updateOwnPost" permission and associate the rule with it.
  $KendiYorum = $auth->createPermission('KendiYorum');
  $KendiYorum->description = 'Kendi Yorumumu Güncelle';
  $KendiYorum->ruleName = $rule->name;
  $auth->add($KendiYorum);

  // "updateOwnPost" will be used from "updatePost"
  $YorumGuncelle = $auth->getPermission('YorumGuncelle');
  $auth->addChild($KendiYorum, $YorumGuncelle);

  // allow "author" to update their own posts
  $author = $auth->getRole('author');
  $auth->addChild($author, $KendiYorum);
 }
}