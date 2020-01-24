FROM mysql:5.7.18
ENV MYSQL_DATABASE: "sqli_baby_omega"
ENV MYSQL_USER: "omega_coder"
ENV MYSQL_PASSWORD: "omega_coder_was_here_1337"
ENV MYSQL_ROOT_PASSWORD: "root"
ENV MYSQL_ALLOW_EMPTY_PASSWORD: "yes"
ADD setup.sql /docker-entrypoint-initdb.d/setup.sql
ADD my.cnf /etc/mysql/conf.d/my.cnfs