FROM gcc:13-bookworm

# Install your dev deps once, in the image
RUN set -e \
 && apt-get update \
 && apt-get install -y --no-install-recommends \
      bear \
      libbsd-dev \
      libxfixes-dev \
      libx11-dev \
      libxext-dev \
 && rm -rf /var/lib/apt/lists/*

# Add an entrypoint script that will create the user matching the host
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# Default workdir inside the container
WORKDIR /workspace

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["bash"]
