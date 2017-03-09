# REST-API-PHP-SLIM


# REST API FOR THE PROJECT 

# Operations

# Insert Members:

http://YourIPAddress/index.php/insertMember   <br /> <br />


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
http://YourIPAddress/index.php/insertPost   <br /> <br />
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
http://YourIPAddress/index.php/insertComment     <br /> <br />
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
http://YourIPAddress/index.php/fetchAllData   <br /> <br />


# Fetch All Posts From DB 
http://YourIPAddress/index.php/getPosts   <br /> <br />
Data inside the retrive JSON : 

1. c_id ==> Post ID 
2. comment ==> Post Data 
3. user_id ==> User ID 
4. date ==> Date of Posting the Post 
5. user_name ==> User Name 




# Fetch All Comments From DB 
http://YourIPAddress/index.php/getComments   <br /> <br />
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
http://YourIPAddress/index.php/member/delete/{id}    <br /> <br />

You Need instead of {id} Parse A NUmber represents the UserID 

Example : http://YourIPAddress/index.php/member/delete/120  <br /> <br />
=> 5 -> Represents the Member ID
# Delete Posts

http://YourIPAddress/index.php/post/delete/{id}   <br /> <br />
You Need instead of {id} Parse A NUmber represents the PostID 

Example : http://YourIPAddress/index.php/post/delete/5   <br /> <br />
=> 5 -> Represents the Post ID

# Delete Comments
http://YourIPAddress/index.php/comment/delete/{id}   <br /> <br />
You Need instead of {id} Parse A NUmber represents the CommentID 

Example : http://YourIPAddress/index.php/comment/delete/5    <br /> <br />

=> 5 -> Represents the Comment ID



# Note : 

-> You can Get Your IP ADDRESS From Command Prompt with Command : 
$ ipconfig 

You will Find You IP ADDRESS Like this : 
# 192.168.1.6























