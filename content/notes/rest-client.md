+++
title = 'Rest Client'
date = 2025-10-09T00:02:07-04:00
+++

## Github Repository
- [Rest Client](https://github.com/Huachao/vscode-restclient?tab=readme-ov-file#environment-variables)

## File Upload
```
POST http://localhost:3000/upload
Content-Type: multipart/form-data; boundary=boundary

--boundary
Content-Disposition: form-data; name="file"; filename="example.txt"
Content-Type: text/plain

< ./example.txt
--boundary
```
