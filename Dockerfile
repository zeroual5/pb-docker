FROM pocketbase/pocketbase:latest

EXPOSE 10000

CMD ["serve", "--http=0.0.0.0:10000", "--dir", "/pb_data"]