<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<form action="/save" method="post" enctype="multipart/form-data">
    <div class="form-group">
        <label class="sr-only" for="name">Name</label>
        <input type="text" class="form-control" id="name" placeholder="Name" name="name" value="${user.name }" required>
    </div>
    <button type="submit" class="btn btn-primary">确认</button>
</form>

<br>
