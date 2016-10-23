library(sparklyr)

spark_install(version = "1.6.2")

sc <- spark_connect(master = "local")

library(dplyr)
iris_tbl <- copy_to(sc, iris)
flights_tbl <- copy_to(sc, nycflights13::flights, "flights")
batting_tbl <- copy_to(sc, Lahman::Batting, "batting")

src_tbls(sc)

t <- flights_tbl %>% filter(dep_delay == 2)
t <- iris_tbl %>% filter(Species == "setosa")

