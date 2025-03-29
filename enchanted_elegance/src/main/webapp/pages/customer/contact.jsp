<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Contact Page</title>
</head>
<body>
    <form action="../../add-contact" method="post">
        <h2>Contact Now</h2>

        <div>
            <label>Name</label>
            <input type="text" name="name" placeholder="Name"  required>
        </div>
         <div>
            <label>Email</label>
            <input type="email" name="email" placeholder="Email"   required>
        </div>
        <div>
            <label >Mobile</label>
            <input type="text" name="mobile" placeholder="Mobile"  required>
        </div>
        <div>
            <label>Subject</label>
            <input type="text"  name="subject" required>
        </div>
        <div>
            <label >Message</label>
            <textarea name="message" cols="30" rows="5" placeholder="Write your message or questions here..." required></textarea>
        </div>

        <div>
            <input type="submit" value="Send">
        </div>
    </form>
</body>
</html>