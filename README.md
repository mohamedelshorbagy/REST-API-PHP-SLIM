# REST-API-PHP-SLIM


# REST API FOR THE PROJECT 

# Operations

# Insert Members:

http://localhost/index.php/insertMember
You need to parse Data with Post Method in JSON FORM
Data needed for Insertion of members : 
1. username 
2. pass
3. email 
4. phone 
5. Blood
6. birthDate
7. healthCondition


# Example
```JSON
{
    "username" : "Mohamed",
    "pass":"Mohamed",
    "email":"Mohamed@mohamed.com",
    "phone":"01098653265", 
    "Blood":"A+",
    "birthDate":"28-5-2016",
    "healthCondition":"Good"
   
}
```

---------------------------------------------------------------------------------------------------

# Insert Posts
http://localhost/index.php/insertPost
You need to parse Data with Post Method in JSON FORM
Data needed for Insertion of Posts :
1. post
2. user_id

# Example 
```JSON
{
    "post":"This is a Test Post",
    "user_id" : "150"
}
```

# Insert Comments For Posts 
http://localhost/index.php/insertComment
You need to parse Data with Post Method in JSON FORM
Data needed for Insertion of Comments :
1. post_id
2. user_id 
3. comment

# Example 
```JSON
{
    "post_id":"2",
    "user_id" : "150",
    "comment":"This is A test Comment for a Post"
}
```

// --------------------------------------------------------------------------------------- //

# Fetching Data From Database 

# Fetch All Data OF Members 
http://localhost/index.php/fetchAllData


# Fetch All Posts From DB 
http://localhost/index.php/getPosts
Data inside the retrive JSON : 
1. c_id ==> Post ID 
2. comment ==> Post Data 
3. user_id ==> User ID 
4. date ==> Date of Posting the Post 
5. user_name ==> User Name 




# Fetch All Comments From DB 
http://localhost/index.php/getComments
Data inside the retrive JSON : 
1. comm_id ==> Comment ID 
2. post_id ==> Post ID 
3. user_id ==> User ID 
4. date ==> Date of Posting the Comment
5. Com ==> Comment Data
6. user_name ==> User Name 


// --------------------------------------------------------------------------------------- //

# Delete Section 

# Delete Members
http://localhost/index.php/member/delete/{id}

You Need instead of {id} Parse A NUmber represents the UserID 

Example : http://localhost/index.php/member/delete/120
=> 5 -> Represents the Member ID
# Delete Posts

http://localhost/index.php/post/delete/{id}
You Need instead of {id} Parse A NUmber represents the PostID 

Example : http://localhost/index.php/post/delete/5
=> 5 -> Represents the Post ID

# Delete Comments
http://localhost/index.php/comment/delete/{id}
You Need instead of {id} Parse A NUmber represents the CommentID 

Example : http://localhost/index.php/comment/delete/5

=> 5 -> Represents the Comment ID
























