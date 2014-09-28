# Bitcoind

FROM digitalwonderland/base:latest

ADD src/ /

RUN yum install -y tar && yum clean all && export BITCOIND_VERSION=0.9.3 \
  && curl -LsS https://bitcoin.org/bin/${BITCOIND_VERSION}/bitcoin-${BITCOIND_VERSION}-linux.tar.gz | tar -xzf - -C /tmp \
  && chown -R root:root /tmp/bitcoin-${BITCOIND_VERSION}-linux \
  && mv /tmp/bitcoin-${BITCOIND_VERSION}-linux/bin/64/bitcoin-cli /usr/local/bin \
  && mv /tmp/bitcoin-${BITCOIND_VERSION}-linux/bin/64/bitcoind /usr/local/bin \
  && mv /tmp/bitcoin-${BITCOIND_VERSION}-linux/bin/64/test_bitcoin /usr/local/bin \
  && rm -rf /tmp/bitcoin-${BITCOIND_VERSION}-linux

RUN groupadd -r bitcoind \
  && useradd -c "Bitcoind" -d /var/lib/bitcoind -g bitcoind -m -r -s /sbin/nologin bitcoind \
  && rm /var/lib/bitcoind/.bash*

ENV HOME /var/lib/bitcoind

USER bitcoind

EXPOSE 8332 8333 18332 18333

VOLUME ["/var/lib/bitcoind"]

ENTRYPOINT ["/usr/local/bin/bitcoind"]
