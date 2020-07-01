FROM barichello/godot-ci:3.2.1

RUN pwd
RUN ls
RUN mkdir -v -p build/web

CMD ["godot", "-v", "--export", "'HTML5'", "build/web/index.html"]
