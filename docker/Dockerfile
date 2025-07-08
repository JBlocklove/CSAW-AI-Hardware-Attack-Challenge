# ─── Base & Packages ───────────────────────────────────────
FROM debian:stable-slim
LABEL maintainer="jason.blocklove@nyu.edu"
ENV DEBIAN_FRONTEND=noninteractive

# Install all tools from tools.list
COPY ./docker/tools.list /tmp/tools.list
RUN apt-get update \
 && xargs -a /tmp/tools.list apt-get install -y \
 && rm -rf /var/lib/apt/lists/* /tmp/tools.list

# ─── User & Shell Setup ────────────────────────────────────
# Create non-root user with zsh login shell
RUN useradd -m devuser -s /usr/bin/zsh

# Copy in your zshrc so they get your aliases, prompt, etc.
COPY --chown=devuser:devuser ../docker/dotfiles/.zshrc /home/devuser/.zshrc

# ─── Challenges ────────────────────────────────────────────
# Bake in the full challenges/ tree
COPY --chown=devuser:devuser ../challenges/ /home/devuser/challenges/

# ─── Workdir & Entrypoint ──────────────────────────────────
USER devuser
WORKDIR /home/devuser

# Drop into a login zsh
ENTRYPOINT ["zsh"]
CMD ["-l"]

