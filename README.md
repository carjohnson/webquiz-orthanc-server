# WebQuizProject-Orthanc-Server

# Orthanc DICOMweb Server for Render

This repository contains a minimal, production‑ready Orthanc configuration
designed to run as a Docker‑based Web Service on Render. It provides:

- A fully enabled DICOMweb endpoint (QIDO, WADO, STOW)
- CORS support for OHIF Viewer
- Persistent storage for uploaded studies
- A clean `/dicom-web/` root compatible with OHIF

---

## 📁 Repository Structure


- **Dockerfile** — builds an Orthanc image with the configuration below.
- **orthanc.json** — main Orthanc configuration file (DICOMweb, CORS, storage path).

---

## 🚀 Deploying to Render

### 1. Create a new Web Service
- Go to Render → “New Web Service”
- Connect this GitHub repo
- Render will automatically detect the Dockerfile

### 2. Set the service parameters
- **Environment:** Docker
- **Port:** `8042`
- **Auto‑deploy:** On (optional)

### 3. Add a Persistent Disk
Render Dashboard → Your Service → **Disks**

- Name: `orthanc-storage`
- Size: 5–20 GB (expand later if needed)
- Mount Path: `/var/lib/orthanc/db`

This ensures your uploaded DICOM studies persist across deploys.

---

## 🌐 Accessing Orthanc

Once deployed, your service will be available at:
https://<your-service>.onrender.com/

### Orthanc Explorer UI
https://<your-service>.onrender.com/

### DICOMweb Root
https://<your-service>.onrender.com/dicom-web/

OHIF will use this endpoint for QIDO/WADO/STOW.

---

## 📤 Uploading DICOM Studies

### Option A — Drag & Drop
Open the Orthanc Explorer UI and drop `.dcm` files.

### Option B — cURL
```bash
curl -X POST \
  -H "Content-Type: application/dicom" \
  --data-binary @myfile.dcm \
  https://<your-service>.onrender.com/instances
