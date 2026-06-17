FROM jodogne/orthanc-plugins
    
# Copy your custom config
COPY orthanc.json /etc/orthanc/orthanc.json

# Show the config after your COPY - for debug
RUN echo "===== AFTER COPY =====" && \
    cat /etc/orthanc/orthanc.json

# NOTE: CMD is intentionally omitted here.
# The container's start command is set explicitly in Render's
# service settings under "Docker Command":
#   /usr/local/sbin/Orthanc /etc/orthanc/orthanc.json
# Render's Docker Command setting takes precedence over Dockerfile CMD/ENTRYPOINT,
# and having both defined causes a "duplicate commands" deploy error.
# If migrating off Render, uncomment the line below:
# CMD ["/usr/local/sbin/Orthanc", "/etc/orthanc/orthanc.json"]


EXPOSE 8042
