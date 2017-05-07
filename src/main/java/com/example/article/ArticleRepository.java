package com.example.article;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import javax.xml.crypto.Data;
import java.sql.*;
import java.time.LocalDateTime;
import java.time.OffsetDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by nayoonho on 2017. 4. 8..
 */
@Repository
public class ArticleRepository {

    @Autowired
    DataSource dataSource;

    public void add(Article article) throws SQLException {
        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        String sql = "INSERT INTO ARTICLE(title, author, body, created)";
        sql += " values(?, ?, ?, ?)";

        Connection connection = jdbcTemplate.getDataSource().getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(
            sql, Statement.RETURN_GENERATED_KEYS
        );

        preparedStatement.setString(1, article.getTitle());
        preparedStatement.setString(2, article.getAuthor());
        preparedStatement.setString(3, article.getBody());
        preparedStatement.setTimestamp(4, Timestamp.valueOf(article.getCreated()));

        preparedStatement.executeUpdate();

        ResultSet tableKeys = preparedStatement.getGeneratedKeys();
        tableKeys.next();
        article.setId(tableKeys.getLong(1));

    }

    public Article get(Long id){
        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);

        return jdbcTemplate.queryForObject("select * from article where id = ?"
                , new Object[]{id}
                , new RowMapper<Article>() {

            @Override
            public Article mapRow(ResultSet resultSet, int i) throws SQLException {
                Article article = new Article();
                article.setId(resultSet.getLong("ID"));
                article.setTitle(resultSet.getString("TITLE"));
                article.setAuthor(resultSet.getString("AUTHOR") );
                article.setBody(resultSet.getString("BODY"));
                article.setCreated(
                        LocalDateTime.of(
                            resultSet.getDate("CREATED").toLocalDate(),
                            resultSet.getTime("CREATED").toLocalTime()
                        )
                    );
                return article;
            }
        });
    }

    public Long getCount(){
        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);

        return jdbcTemplate.queryForObject(
                "select count(*) cnt from article"
                , java.lang.Long.class
        );
    }

    public List<Article> getList(ArticleListRequest request){
        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);

        return jdbcTemplate.query("select * from article ORDER BY CREATED DESC  limit ? , ? "
                , new Object[]{request.getStartIndex(), request.getLimitArticle()}
                , new RowMapper<Article>() {
                    @Override
                    public Article mapRow(ResultSet resultSet, int i) throws SQLException {
                        Article article = new Article();
                        article.setId(resultSet.getLong("ID"));
                        article.setTitle(resultSet.getString("TITLE"));
                        article.setAuthor(resultSet.getString("AUTHOR") );
                        article.setBody(resultSet.getString("BODY"));
                        article.setCreated(
                                LocalDateTime.of(
                                        resultSet.getDate("CREATED").toLocalDate(),
                                        resultSet.getTime("CREATED").toLocalTime()
                                )
                        );
                        return article;

                    }
                }
        );
    }
}
