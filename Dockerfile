# Cassandra Backup
# William Ward <wward@givepaycommerce.com>
# GivePay Commerce, LLC
# 2019-05-8

FROM maven:3

COPY . /app

WORKDIR /app

RUN mvn clean install

CMD 'backup.sh'