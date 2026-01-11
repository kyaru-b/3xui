FROM ghcr.io/mhsanaei/3x-ui:latest

# Установка временной зоны
ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Здесь можно добавить свои сертификаты, если нужно копировать их при сборке
# COPY ./cert /root/cert

# Открываем порт по умолчанию
EXPOSE 2053

# Точка входа остается стандартной из образа
