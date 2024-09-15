FROM rocker/verse 
RUN apt update && apt install -y git man-db && rm -rf /var/lib/apt/lists/*