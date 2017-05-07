package com.example.article;

import lombok.Data;

/**
 * Created by nayoonho on 2017. 5. 5..
 */
@Data
public class ArticleListRequest {
    private final Long limitArticle = 20L;
    private final Long limitPage    = 10L;
    private Long currentPageNum;
    private Long firstPageNum;
    private Long lastPageNum;
    private Long maxArticle;
    private Long maxPageNum;
    private Long startIndex;

    public ArticleListRequest() {
    }

    public void setPageNum(){
        this.maxPageNum = this.maxArticle / this.limitArticle;
        this.maxPageNum = this.maxArticle % this.limitArticle > 0 ? this.maxPageNum + 1 : this.maxPageNum;

        this.firstPageNum =  ((this.currentPageNum - 1) / limitPage ) * this.limitPage + 1;

        this.lastPageNum = this.firstPageNum + this.limitPage - 1;
        this.lastPageNum = this.lastPageNum > this.maxPageNum ? this.maxPageNum : this.lastPageNum;

        this.startIndex = this.currentPageNum == 1 ? 0 : ( this.currentPageNum - 1) * this.limitArticle;

    }
}
