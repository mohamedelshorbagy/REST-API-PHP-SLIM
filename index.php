<?php

require 'confing.php';
require 'Slim/Slim.php';
\Slim\Slim::registerAutoloader();

$app = new \Slim\Slim();


//Members Insertion
$app->post('/insertMember',function () use ($app) {

$db = getDB();
      // Json Object has the Data of the New Member
  	$json = $app->request->getBody();
  	$data = json_decode($json, true);
    $data['username'] = filter_var($data['username'],FILTER_SANITIZE_STRING);
    $data['pass'] = filter_var($data['pass'],FILTER_SANITIZE_STRING);
    $data['email'] = filter_var($data['email'],FILTER_SANITIZE_EMAIL);
    $data['phone'] = filter_var($data['phone'],FILTER_SANITIZE_NUMBER_INT);
    $data['Blood'] = filter_var($data['Blood'],FILTER_SANITIZE_STRING);
    $data['birthDate'] = filter_var($data['birthDate'],FILTER_SANITIZE_STRING);
    $data['healthCondition'] = filter_var($data['healthCondition'],FILTER_SANITIZE_STRING);

  	$stmt = $db ->prepare("insert into signup(username,pass,email,phone,Blood,birthDate,healthCondition) values ('".$data['username']."','".$data['pass']."','".$data['email']."','".$data['phone']."','".$data['Blood']."','".$data['birthDate']."','".$data['healthCondition']."')");
    $stmt->execute();



/*

  	if($result){
  		$app->response->setStatus(201);
  		echo '{"flag": "true","msg": "item successfully added"}';
  	}else{
  		$app->response->setStatus(422);
  		echo '{"flag": "false","msg": "Oops! An error occurred"}';
  	}

*/


});

// --------------------------------------------------------------------------------------------------- //

// Posts Insertion
$app->post('/insertPost',function () use ($app) {
$db = getDB();
    $json  = $app->request->getBody();
    $data = json_decode($json , true);
    $data['post'] = filter_var($data['post'],FILTER_SANITIZE_STRING);
    if (is_numeric($data['user_id'])) {
        $data['user_id'] = intval($data['user_id']);
    } else {
      $data['user_id'] = 0;
    }
    $stmt = $db ->prepare("INSERT INTO comments(comment,date,user_id) VALUES ('".$data['post']."',CURRENT_TIMESTAMP,'".$data['user_id']."')");
    $stmt->execute();



});
// --------------------------------------------------------------------------------------------------- //
// Comments Insertion
$app->post('/insertComment',function () use ($app) {
$db = getDB();
  $json = $app->request->getBody();
  $data = json_decode($json , true);
  $data['comment'] = filter_var($data['comment'],FILTER_SANITIZE_STRING);
    if (is_numeric($data['post_id']) && is_numeric($data['user_id'])){
          $data['post_id'] = intval($data['post_id']);
          $data['user_id'] = intval($data['user_id']);
    } else {
      $data['post_id'] = 0;
      $data['user_id'] = 0;
    }



  $stmt = $db->prepare("INSERT INTO commentsec(post_id,user_id,date,Com) VALUES ('".$data['post_id']."','".$data['user_id']."',CURRENT_TIMESTAMP,'".$data['comment']."')");
  $stmt->execute();



});

// --------------------------------------------------------------------------------------------------- //
// All Data of the Memebrs
$app->get('/fetchAllData', function() use ($app) {
$db = getDB();
 $sql = "SELECT * from signup";
 $stmt = $db->query($sql);
 $items = $stmt->fetchAll();
 echo json_encode($items , JSON_PRETTY_PRINT);
});




// --------------------------------------------------------------------------------------------------- //
// Posts Selections
$app->get('/getPosts',function () use ($app){
$db = getDB();
  $stmt = $db ->prepare("SELECT comments.* ,signup.username AS user_name FROM comments INNER JOIN signup ON signup.id = comments.user_id ORDER BY date DESC");
  $stmt->execute();
  $posts = $stmt->fetchAll();
    echo json_encode($posts , JSON_PRETTY_PRINT);





});

// --------------------------------------------------------------------------------------------------- //
// Comments Selections
$app->get('/getComments',function () use ($app) {
  $db = getDB();
    $stmt = $db->prepare("SELECT commentsec.* ,signup.username AS user_Name FROM commentsec INNER JOIN signup ON signup.id = commentsec.user_id ORDER BY date ASC");
    $stmt->execute();
    $comments = $stmt->fetchAll();
    echo json_encode($comments , JSON_PRETTY_PRINT);

});

// -------------------------------------------------------------------------------------------------- //
// Delete Members

$app->delete('/members/delete/:id',function ($id) use ($app) {
    $db = getDB();

  if (is_numeric($id)) {
      $id = intval($id);
  } else {
    $id = 0;
  }
      $stmt = $db->prepare("DELETE FROM signup WHERE id='".$id."' LIMIT 1");
      $stmt->execute();

});


//Delete Posts

$app->delete('/post/delete/:id',function ($id) use ($app) {
    $db = getDB();

    $id = is_numeric($id) ? intval($id) : 0;

    $stmt = $db->prepare("DELETE FROM comments WHERE c_id='".$id."' LIMIT 1");

    $stmt->execute();


});

// DELETE Comments

$app->delete("/comment/delete/:id",function ($id) use ($app) {

    $db = getDB();

  $id = is_numeric($id) ? intval($id) : 0;

  $stmt = $db->prepare("DELETE FROM commentsec WHERE comm_id='".$id."' LIMIT 1");

  $stmt->execute();



});










$app->run();



?>
