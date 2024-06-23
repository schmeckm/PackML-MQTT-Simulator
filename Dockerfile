# Verwenden Sie ein offizielles Node.js-Image als Basis-Image
FROM node:14

# Labels
LABEL maintainer="tom.hollingworth@spruiktec.com"
LABEL org.opencontainers.image.authors="tom.hollingworth@spruiktec.com"
LABEL org.opencontainers.image.source="https://github.com/Spruik/PackML-MQTT-Simulator"
LABEL org.opencontainers.image.url="https://spruiktec.com/"
LABEL org.opencontainers.image.vendor="Spruik Technologies LLC"
LABEL org.opencontainers.image.version="2.0.4"

# Setzen des Arbeitsverzeichnisses
WORKDIR /machine

# Kopieren der package.json und Installation der Abhängigkeiten
COPY package.json /machine
RUN npm install

# Kopieren des Quellcodes und Setzen der Besitzerrechte
COPY --chown=node:node ./src/ /machine

# Festlegen des Benutzers, unter dem der Container läuft
USER node

# Setzen der Umgebungsvariablen
ENV NODE_ENV=production
ENV NODE_OPTIONS="--max-old-space-size=20"

# Starten der Anwendung
CMD ["node", "index.js"]
