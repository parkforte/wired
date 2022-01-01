<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"">
<title>CodePen - FilePond Multiple File Upload</title>
<link rel="stylesheet" href='<c:url value="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css"/>'>
<link rel='stylesheet' href='<c:url value="https://unpkg.com/filepond-plugin-image-preview/dist/filepond-plugin-image-preview.min.css"/>'>
<link rel='stylesheet' href='<c:url value="https://unpkg.com/filepond/dist/filepond.min.css"/>'><link rel="stylesheet" href='<c:url value="/resources/css/style.css"/>'>
</head>
<body>
<!-- partial:index.partial.html -->
<!--
The classic file input element we'll enhance to a file pond
-->
<input type="file" 
       class="filepond"
       name="filepond"
       multiple
       data-max-file-size="3MB"
       data-max-files="3" />

<!-- file upload itself is disabled in this pen -->
<!-- partial -->
<script src='<c:url value="https://unpkg.com/filepond-plugin-file-encode/dist/filepond-plugin-file-encode.min.js"/>'></script>
<script src='<c:url value="https://unpkg.com/filepond-plugin-file-validate-size/dist/filepond-plugin-file-validate-size.min.js"/>'></script>
<script src='<c:url value="https://unpkg.com/filepond-plugin-image-exif-orientation/dist/filepond-plugin-image-exif-orientation.min.js"/>'></script>
<script src='<c:url value="https://unpkg.com/filepond-plugin-image-preview/dist/filepond-plugin-image-preview.min.js"/>'></script>
<script src='<c:url value="https://unpkg.com/filepond/dist/filepond.min.js"/>'></script><script  src='<c:url value="/resources/js/script.js"/>'></script>
</body>
</html>