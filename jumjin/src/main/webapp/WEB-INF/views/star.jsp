<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="./resources/css/star.css">
</head>
<body>
<form name="myform" id="myform" method="post" action="./save.do">
    <fieldset>
        <legend></legend>
        <input type="radio" name="rating" value="5" id="rate1"><label for="rate1">⭐⭐</label>
    
        <input type="radio" name="rating" value="4" id="rate2"><label for="rate2">⭐</label>
       
        <input type="radio" name="rating" value="3" id="rate3"><label for="rate3">⭐</label>
       
        <input type="radio" name="rating" value="2" id="rate4"><label for="rate4">⭐</label>
   
        <input type="radio" name="rating" value="1" id="rate5"><label for="rate5">⭐</label>
       
    </fieldset>
    <button type="submit">j</button>
</form>
</body>
</html>