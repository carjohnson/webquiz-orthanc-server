FROM jodogne/orthanc-plugins
    
# Copy your custom config
COPY orthanc.json /etc/orthanc/orthanc.json

# Show the config after your COPY - for debug
RUN echo "===== AFTER COPY =====" && \
    cat /etc/orthanc/orthanc.json

CMD ["/usr/local/sbin/Orthanc", "/etc/orthanc/orthanc.json"]


EXPOSE 8042
