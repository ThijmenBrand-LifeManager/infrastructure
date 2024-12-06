CREATE DATABASE "lfm-authorization";
CREATE DATABASE "lfm-workstream";
CREATE ROLE "lfm_authorization_service" WITH LOGIN PASSWORD 'Welcome01!';
CREATE ROLE "lfm_workstream_service" WITH LOGIN PASSWORD 'Welcome01!';
GRANT ALL PRIVILEGES ON DATABASE "lfm-authorization" TO "lfm_authorization_service";
GRANT ALL PRIVILEGES ON DATABASE "lfm-workstream" TO "lfm_workstream_service";
GRANT ALL PRIVILEGES ON SCHEMA public TO lfm_authorization_service;
GRANT ALL PRIVILEGES ON SCHEMA public TO lfm_workstream_service;