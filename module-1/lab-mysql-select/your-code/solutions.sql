USE publications;


#Challenge 1 - Who Have Published What At Where?

SELECT  titleauthor.au_id AS AUTHOR_ID ,au_lname AS LAST_NAME, au_fname AS FIRST_NAME, title AS TITLE,  pub_name AS PUBLISHER
    FROM authors
        INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
        INNER JOIN titles ON titleauthor.title_id = titles.title_id
        INNER JOIN publishers ON publishers.pub_id = titles.pub_id;

#Challenge 2 - Who Have Published How Many At Where?

SELECT authors.au_id AS AUTHOR_ID , au_lname AS LAST_NAME, au_fname AS FIRST_NAME, COUNT(titles.title) AS TOTAL
    FROM authors
        INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
        INNER JOIN titles ON titleauthor.title_id = titles.title_id
        INNER JOIN publishers ON publishers.pub_id = titles.pub_id
    GROUP BY  authors.au_id
     ORDER BY COUNT(titles.title) DESC;
 

#Challenge 3 - Best Selling Authors

SELECT authors.au_id AS AUTHOR_ID, au_lname AS LAST_NAME, au_fname AS FIRST_NAME, COUNT(titles.title) AS TOTAL
    FROM authors
        INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
        INNER JOIN titles ON titleauthor.title_id = titles.title_id
    GROUP BY authors.au_id
    ORDER BY COUNT(titles.title) DESC
    LIMIT 3;

SELECT  authors.au_id, CONCAT(au_lname, " ", au_fname) AS Full_name,sum(sales.qty) as TOTAL

    FROM authors

        INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
        INNER JOIN sales ON titleauthor.title_id = sales.title_id

   GROUP BY au_id

   ORDER BY TOTAL DESC LIMIT 3;


#Challenge 4 - Best Selling Authors Ranking

SELECT authors.au_id AS AUTHOR_ID, au_lname AS LAST_NAME, au_fname AS FIRST_NAME, IFNULL(sum(sales.qty),0) AS TOTAL
    FROM authors
        LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id

         LEFT JOIN sales ON titleauthor.title_id = sales.title_id
   
     GROUP BY au_id

     ORDER BY TOTAL DESC;








