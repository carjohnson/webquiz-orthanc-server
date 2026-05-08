#FROM jodogne/orthanc-plugins
# COPY orthanc.json /etc/orthanc/orthanc.json
#EXPOSE 8042

FROM jodogne/orthanc-plugins

# Enable DICOMweb
RUN sed -i 's/"DicomWeb"[[:space:]]*:[[:space:]]*false/"DicomWeb": true/' /etc/orthanc/orthanc.json

# Enable QIDO/WADO/STOW inside the DicomWeb block
RUN sed -i 's/"EnableWado"[[:space:]]*:[[:space:]]*false/"EnableWado": true/' /etc/orthanc/orthanc.json
RUN sed -i 's/"EnableQido"[[:space:]]*:[[:space:]]*false/"EnableQido": true/' /etc/orthanc/orthanc.json
RUN sed -i 's/"EnableStow"[[:space:]]*:[[:space:]]*false/"EnableStow": true/' /etc/orthanc/orthanc.json

# Allow remote access
RUN sed -i 's/"RemoteAccessAllowed"[[:space:]]*:[[:space:]]*false/"RemoteAccessAllowed": true/' /etc/orthanc/orthanc.json

# Allow CORS
RUN sed -i 's/"HttpServerEnabled"[[:space:]]*:[[:space:]]*true/"HttpServerEnabled": true, "HttpAllowOrigin": "*"/' /etc/orthanc/orthanc.json

# Disable authentication
RUN sed -i 's/"AuthenticationEnabled"[[:space:]]*:[[:space:]]*true/"AuthenticationEnabled": false/' /etc/orthanc/orthanc.json

EXPOSE 8042
