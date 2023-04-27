FROM paritytech/ci-linux:dafdd6fb-20230127

WORKDIR /var/www

RUN git clone https://github.com/hashed-io/hashed-substrate-parachain.git hashed-substrate && cd hashed-substrate && git checkout main && cargo build --release

# COPY ./target/release/hashed-parachain .
# COPY ./resources/* resources/.
# COPY ./scripts/start_collator.sh .

EXPOSE 30333 40333 9933 9944 9946

WORKDIR /var/www/hashed-substrate

CMD [ "/var/www/hashed-substrate/scripts/start_collator.sh" ]
