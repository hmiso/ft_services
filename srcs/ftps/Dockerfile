FROM	alpine

RUN	apk update
RUN	apk add openrc openssl vsftpd
RUN apk add --no-cache --upgrade bash && rm -rf /var/cache/apk/*
RUN mkdir -p /var/ftp

COPY ./vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY start.sh /start.sh
RUN chmod u+x /start.sh
RUN	mkdir -p /ftp_anon /hmiso
RUN	printf "hmiso\nhmiso\n" | adduser hmiso -s /bin/false -h /hmiso
RUN	printf "/bin/false\n" >> /etc/shells
RUN	chown hmiso:hmiso /hmiso
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj '/C=AB/ST=CD/L=EF/O=21/CN=hmiso' -keyout /etc/vsftpd/vsftpd.key -out /etc/vsftpd/vsftpd.crt

EXPOSE	20 21 21000

ENTRYPOINT [ "sh", "start.sh" ]