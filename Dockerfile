FROM ubuntu:latest

RUN apt-get update && apt-get upgrade -y && apt-get install -y clojure

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
