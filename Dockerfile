FROM jodogne/orthanc-plugins

# Show the default config shipped with the base image
# RUN echo "===== BEFORE COPY =====" && \
#     cat /etc/orthanc/orthanc.json || echo "File not found"
    
# Copy your custom config
COPY orthanc.json /etc/orthanc/orthanc.json

# Show the config after your COPY
RUN echo "===== AFTER COPY =====" && \
    cat /etc/orthanc/orthanc.json

# RUN echo "===== LISTING ORTHANC BINARIES =====" && \
#     ls -l /usr/local/bin | grep -i Orthanc || echo "No Orthanc in /usr/bin" && \
#     ls -l /usr/local/sbin | grep -i Orthanc || echo "No Orthanc in /usr/sbin"

# CMD ["/usr/local/sbin/Orthanc", "/etc/orthanc/orthanc.json"]

EXPOSE 8042
