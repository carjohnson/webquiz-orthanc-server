FROM jodogne/orthanc-plugins
COPY orthanc.json /etc/orthanc/orthanc.json
EXPOSE 8042
CMD ["orthanc", "/etc/orthanc/orthanc.json"]