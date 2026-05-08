#FROM jodogne/orthanc-plugins
# COPY orthanc.json /etc/orthanc/orthanc.json
#EXPOSE 8042
FROM jodogne/orthanc-plugins

# Enable DICOMweb plugin
RUN sed -i 's/"DicomWeb": false/"DicomWeb": true/' /etc/orthanc/orthanc.json

# Allow remote access (Render runs behind a proxy)
RUN sed -i 's/"RemoteAccessAllowed": false/"RemoteAccessAllowed": true/' /etc/orthanc/orthanc.json

# Allow CORS for OHIF
RUN sed -i 's/"HttpServerEnabled": true/"HttpServerEnabled": true, "HttpAllowOrigin": "*"/' /etc/orthanc/orthanc.json

EXPOSE 8042
