FROM rocker/verse 
RUN apt update && apt install -y git man-db && rm -rf /var/lib/apt/lists/*
docker run --rm \
   --platform linux/x86_64 \
   -p 8788:8787 \
   -e PASSWORD=yourpassword \
   -e DISABLE_AUTH=false  \
   rocker/verse