<html>

<head>
	<title>쓰기</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
</head>

<body>
	<div class="content">
		<form action="/article" method="POST" class="form-horizontal">
            <div class="form-group">
                <label for="inputTitle" class="col-sm-2 control-label">제목</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="inputTitle" name="title" placeholder="제목">
                </div>
            </div>
            <div class="form-group">
                <label for="inputAuthor" class="col-sm-2 control-label">지은이</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="inputAuthor" name="author" placeholder="지은이">
                </div>
            </div>
            <div class="form-group">
                <label for="inputBody" class="col-sm-2 control-label">내용</label>
                <div class="col-sm-10">
                    <textarea id="inputBody" name="body" class="form-control" rows="5"></textarea>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="submit" class="btn btn-default">글작성</button>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <a href="/articles/1"  class="btn btn-default">리스트</a>
                </div>
            </div>
		</form>
	</div>
</body>

</html>