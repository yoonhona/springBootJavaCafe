/**
 * Created by nayoonho on 2017. 5. 7..
 */


window.onload = function(){
    var arrayCurrentURL = document.location.href.split("/");
    var currentPagenum = arrayCurrentURL[arrayCurrentURL.length - 1];

    var app = new Vue({
        el:"#app"
        , data: {
            currentPagenum: currentPagenum
            , firstPageNum: ""
            , lastPageNum: ""
            , maxArticle: ""
            , maxPageNum: ""
            , startIndex: ""
            , list: []
            // css
            , isFirst: false
            , isLast: false
        }
        , created: function() {
            this.searchList()
        }
        , methods:{
            searchList: function(){

                this.$http.post('/articles/' + this.currentPagenum)
                .then( response => {
                    this.list = response.body.list;
                    this.firstPageNum = response.body.paging.firstPageNum;
                    this.lastPageNum  = response.body.paging.lastPageNum;
                    this.maxArticle   = response.body.paging.maxArticle;
                    this.maxPageNum   = response.body.paging.maxPageNum;
                    this.startIndex   = response.body.paging.startIndex;
                    this.isFirst      = this.firstPageNum === 1 ? true : false;
                    this.isLast       = this.lastPageNum >= this.maxPageNum ? true: false;

                    //this.previousUrl = this.setPreviousUrl();

                }, response => {
                    console.log(response.body);
                });
            },
            setPreviousUrl: function(){
                return this.isFirst ? '#' : '/articles/1'
            },
            isCurrent: function (pageNum) {
                return this.currentPagenum === pageNum;
            }
        }
    });
};

