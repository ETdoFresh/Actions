FROM barichello/godot-ci:3.2.1

RUN mkdir -v -p ~/.local/share/godot/templates
RUN mv /root/.local/share/godot/templates/3.2.1.stable ~/.local/share/godot/templates/3.2.1.stable || true
RUN mkdir -v -p build/web
RUN godot -v --export "HTML5" build/web/index.html