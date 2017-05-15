<html>

<head>
    <title>리스트</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <script src="/js/vue.js"></script>
    <script src="/js/vue-resource.min.js"></script>
	<script src="/src/articles.js"></script>
</head>

<body>

    <div id="app" class="content">
        <table class="table table-bordered">
            <colgroup>
                <col width="10%">
                <col width="40%">
                <col width="30%">
                <col width="10%">
                <col width="10%">
            </colgroup>
            <thead>
                <th>글 번호</th>
                <th>제목</th>
                <th>지은이</th>
                <th>시간</th>
            </thead>
            <tbody>
                    <tr v-for="item in list">
                        <td>{{ item.id }}</td>
                        <td><a href="" v-bind:href="'/article/' + item.id"> {{ item.title }} </a></td>
                        <td>{{ item.author }}</td>
                        <td>{{ item.created.year }}-{{ item.created.monthValue }}-{{ item.created.dayOfMonth }}</td>
                    </tr>
            </tbody>
        </table>


        <nav aria-label="Page navigation">
            <ul class="pagination">
                <li v-bind:class="{ 'disabled': isFirst }">
                    <a v-bind:href="this.isFirst ? '#' : '/articles/' + ( firstPageNum - 1 )" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>

                <li v-for="pageNum in ( lastPageNum - firstPageNum + 1 )" >
                    <a v-bind:href="'/articles/' + ( pageNum + ( firstPageNum - 1) )">
                        {{ pageNum + ( firstPageNum - 1) }}
                        <span class="sr-only" v-show="this.currentPagenum ==  ( pageNum + ( this.firstPageNum - 1 ) )">(current)</span>
                    </a>

                </li>

                <li v-bind:class="{ 'disabled': isLast }">
                    <a v-bind:href="this.isLast ? '#' : '/articles/' + ( lastPageNum + 1 )" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>

            <a href="/article/create" class="btn btn-default">글쓰기</a>
            </ul>

        </nav>


    </div>
</body>

</html>