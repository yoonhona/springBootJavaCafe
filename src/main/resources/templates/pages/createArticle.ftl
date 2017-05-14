<html>

<head>
    <title>쓰기</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <script src="/js/vue.js" ></script>
    <script src="/src/createArticle.js" ></script>

</head>

<body>

    <div id="app" class="content">
        <form action="/article" method="POST" class="form-horizontal" v-on:submit.prevent="formValid">
            <div class="form-group">
                <label for="inputTitle" class="col-sm-2 control-label">제목</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="inputTitle" name="title" placeholder="제목" v-model="title" ref="title">
                </div>
            </div>
            <div class="form-group">
                <label for="inputAuthor" class="col-sm-2 control-label">지은이</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="inputAuthor" name="author" placeholder="지은이" v-model="author" ref="author">
                </div>
            </div>
            <div class="form-group">
                <label for="inputBody" class="col-sm-2 control-label">내용</label>
                <div class="col-sm-10">
                    <textarea id="inputBody" name="body" class="form-control" rows="5" placeholder="내용" v-model="body" ref="body"></textarea>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="submit" class="btn btn-default" >글작성</button>
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