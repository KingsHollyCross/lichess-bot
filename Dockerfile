FROM debian:stable-slim
MAINTAINER OIVAS7572
RUN echo OIVAS7572
COPY . .

# If you want to run any other commands use "RUN" before.

RUN apt-get update && apt-get upgrade -y && apt-get install -y wget unzip python3 python3-pip p7zip
RUN python3 -m pip install --no-cache-dir -r requirements.txt > pip.log

RUN wget https://abrok.eu/stockfish/latest/linux/stockfish_x64_bmi2.zip -O stockfish.zip
RUN unzip stockfish.zip && rm stockfish.zip
RUN mv stockfish_* engines/stockfish && chmod +x engines/stockfish

#Engine name ^^^^^^^^^^^^^^^^^^^

CMD python3 lichess-bot.py -u
