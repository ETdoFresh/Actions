FROM barichello/godot-ci:3.2.1

WORKDIR ~

COPY . .

RUN mkdir -v -p build/web
RUN godot -v --export "HTML5" build/web/index.html