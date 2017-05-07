<html>

<head>
	<title>제목</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
</head>

<body>

	<div class="content">

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
				<#list list as item>
					<tr>
						<td>${ item.id }</td>
						<td><a href="/article/${ item.id }" > ${ item.title } </a></td>
						<td>${ item.author }</td>
						<td>${ item.created }</td>
					</tr>
				</#list>
			</tbody>
		</table>


        <nav aria-label="Page navigation">
            <ul class="pagination">

			<#if paging.firstPageNum != 1>
                <li>
                	<a href="/articles/#{paging.firstPageNum - 1}" aria-label="Previous">
                		<span aria-hidden="true">&laquo;</span>
                	</a>
                </li>
			<#else >
				<li class="disabled">
                	<a href="#" aria-label="Previous">
                		<span aria-hidden="true">&laquo;</span>
                	</a>
                </li>
			</#if>

			<#list paging.firstPageNum .. paging.lastPageNum as page>
				<#if page != paging.currentPageNum>
                	<li ><a href="/articles/${page}">${page}</a></li>
				<#else>
                	<li class="active"><a href="/articles/${page}">${page} <span class="sr-only">(current)</span> </a></li>
				</#if>
			</#list>

			<#if paging.lastPageNum < paging.maxPageNum >
                <li>
                    <a href="/articles/#{paging.lastPageNum + 1}" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
			<#else >
                <li class="disabled">
                    <a href="#" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
			</#if>
            <a href="/article/create" class="btn btn-default">글쓰기</a>
			</ul>

		</nav>


	</div>
</body>

</html>