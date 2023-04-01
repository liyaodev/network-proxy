FROM liyaodev/base-cpu-u20-py310:v1.0.0
LABEL maintainer=liyaodev

RUN echo 'root:root' | chpasswd

# 构建Tini的多服务容器
RUN wget -O /tini https://github.com/krallin/tini/releases/download/v0.19.0/tini && \
    chmod +x /tini
ENTRYPOINT ["/tini", "--"]

WORKDIR /www/server

COPY ./requirements.txt ./requirements.txt
RUN pip install --no-cache-dir -r ./requirements.txt \
    -i http://pypi.douban.com/simple  --trusted-host pypi.douban.com

ENV PYTHONUNBUFFERED 1

CMD ["tail", "-f", "/dev/null"]
EXPOSE 8888
