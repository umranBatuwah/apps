--
-- PostgreSQL database dump
--

-- Dumped from database version 13.4
-- Dumped by pg_dump version 13.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: account_services; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account_services (
    id bigint NOT NULL,
    account_id character varying(255),
    account_services_json jsonb
);


ALTER TABLE public.account_services OWNER TO postgres;

--
-- Name: catalogue; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.catalogue (
    id bigint NOT NULL,
    details jsonb
);


ALTER TABLE public.catalogue OWNER TO postgres;

--
-- Name: TABLE catalogue; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.catalogue IS 'Inventory of dashboards';


--
-- Name: cloud; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cloud (
    id bigint NOT NULL,
    name character varying(255),
    status character varying(255),
    created_on timestamp without time zone,
    updated_on timestamp without time zone,
    updated_by character varying(255),
    created_by character varying(255)
);


ALTER TABLE public.cloud OWNER TO postgres;

--
-- Name: cloud_element; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cloud_element (
    id bigint NOT NULL,
    name character varying(255),
    parent_id character varying(255),
    status character varying(255),
    created_on timestamp without time zone,
    updated_on timestamp without time zone,
    updated_by character varying(255),
    created_by character varying(255),
    view_json bytea,
    view_json_content_type character varying(255),
    product_enclave_id_id bigint,
    cloud_environment_id_id bigint
);


ALTER TABLE public.cloud_element OWNER TO postgres;

--
-- Name: TABLE cloud_element; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.cloud_element IS 'Discovered assets of a cloud environment';


--
-- Name: cloud_environment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cloud_environment (
    id bigint NOT NULL,
    name character varying(255),
    description character varying(5000),
    account_id character varying(255),
    access_key character varying(255),
    secret_key character varying(255),
    region character varying(255),
    vault_id character varying(255),
    org_id bigint,
    status character varying(255),
    created_on timestamp without time zone,
    updated_on timestamp without time zone,
    updated_by character varying(255),
    created_by character varying(255),
    cloud_id bigint,
    department_id bigint
);


ALTER TABLE public.cloud_environment OWNER TO postgres;

--
-- Name: TABLE cloud_environment; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.cloud_environment IS 'Client''s cloud accounts';


--
-- Name: data_source; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.data_source (
    id bigint NOT NULL,
    name character varying(255),
    description character varying(5000),
    type character varying(255),
    status character varying(255),
    created_on timestamp without time zone,
    updated_on timestamp without time zone,
    updated_by character varying(255),
    created_by character varying(255),
    cloud_environment_id bigint
);


ALTER TABLE public.data_source OWNER TO postgres;

--
-- Name: TABLE data_source; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.data_source IS 'Client specific datasources';


--
-- Name: databasechangelog; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);


ALTER TABLE public.databasechangelog OWNER TO postgres;

--
-- Name: databasechangeloglock; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


ALTER TABLE public.databasechangeloglock OWNER TO postgres;

--
-- Name: demo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.demo (
    id integer NOT NULL,
    details jsonb,
    view_json jsonb
);


ALTER TABLE public.demo OWNER TO postgres;

--
-- Name: demo_catalogues_detail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.demo_catalogues_detail (
    id integer NOT NULL,
    details jsonb
);


ALTER TABLE public.demo_catalogues_detail OWNER TO postgres;

--
-- Name: demo_catalogues_detail_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.demo_catalogues_detail_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.demo_catalogues_detail_id_seq OWNER TO postgres;

--
-- Name: demo_catalogues_detail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.demo_catalogues_detail_id_seq OWNED BY public.demo_catalogues_detail.id;


--
-- Name: demo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.demo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.demo_id_seq OWNER TO postgres;

--
-- Name: demo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.demo_id_seq OWNED BY public.demo.id;


--
-- Name: department; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.department (
    id bigint NOT NULL,
    name character varying(255),
    description character varying(500),
    org_id bigint,
    status character varying(255),
    created_on timestamp without time zone,
    updated_on timestamp without time zone,
    updated_by character varying(255),
    created_by character varying(255)
);


ALTER TABLE public.department OWNER TO postgres;

--
-- Name: department_product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.department_product (
    id bigint NOT NULL,
    description character varying(5000),
    status character varying(255),
    created_on timestamp without time zone,
    updated_on timestamp without time zone,
    updated_by character varying(255),
    created_by character varying(255),
    product_id bigint,
    department_id bigint,
    cloud_environment_id bigint
);


ALTER TABLE public.department_product OWNER TO postgres;

--
-- Name: deployment_environment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.deployment_environment (
    id bigint NOT NULL,
    name character varying(255),
    description character varying(5000),
    status character varying(255),
    created_on timestamp without time zone,
    updated_on timestamp without time zone,
    updated_by character varying(255),
    created_by character varying(255)
);


ALTER TABLE public.deployment_environment OWNER TO postgres;

--
-- Name: jhi_persistent_audit_event; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jhi_persistent_audit_event (
    event_id bigint NOT NULL,
    principal character varying(50) NOT NULL,
    event_date timestamp without time zone,
    event_type character varying(255)
);


ALTER TABLE public.jhi_persistent_audit_event OWNER TO postgres;

--
-- Name: jhi_persistent_audit_evt_data; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jhi_persistent_audit_evt_data (
    event_id bigint NOT NULL,
    name character varying(150) NOT NULL,
    value character varying(255)
);


ALTER TABLE public.jhi_persistent_audit_evt_data OWNER TO postgres;

--
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    id bigint NOT NULL,
    name character varying(255),
    description character varying(5000),
    status character varying(255),
    created_on timestamp without time zone,
    updated_on timestamp without time zone,
    updated_by character varying(255),
    created_by character varying(255)
);


ALTER TABLE public.product OWNER TO postgres;

--
-- Name: product_billing; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_billing (
    id bigint NOT NULL,
    period_from date,
    period_to date,
    due_date date,
    amount double precision,
    description character varying(5000),
    status character varying(255),
    created_on timestamp without time zone,
    updated_on timestamp without time zone,
    updated_by character varying(255),
    created_by character varying(255),
    product_id bigint,
    department_id bigint,
    deployment_environment_id bigint
);


ALTER TABLE public.product_billing OWNER TO postgres;

--
-- Name: product_deployment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_deployment (
    id bigint NOT NULL,
    description character varying(5000),
    billing_frequency character varying(255),
    status character varying(255),
    created_on timestamp without time zone,
    updated_on timestamp without time zone,
    updated_by character varying(255),
    created_by character varying(255),
    department_id bigint,
    product_id bigint,
    deployment_environment_id bigint
);


ALTER TABLE public.product_deployment OWNER TO postgres;

--
-- Name: product_enclave; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_enclave (
    id bigint NOT NULL,
    name character varying(255),
    status character varying(255),
    created_on timestamp without time zone,
    updated_on timestamp without time zone,
    updated_by character varying(255),
    created_by character varying(255),
    cloud_environment_id_id bigint
);


ALTER TABLE public.product_enclave OWNER TO postgres;

--
-- Name: TABLE product_enclave; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.product_enclave IS 'Discovered assets of a cloud environment';


--
-- Name: product_service; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_service (
    id bigint NOT NULL,
    description character varying(5000),
    status character varying(255),
    created_on timestamp without time zone,
    updated_on timestamp without time zone,
    updated_by character varying(255),
    created_by character varying(255),
    product_id bigint,
    services_id bigint,
    deployment_environment_id bigint
);


ALTER TABLE public.product_service OWNER TO postgres;

--
-- Name: product_services_detail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_services_detail (
    id bigint NOT NULL,
    product_name character varying(255),
    env character varying(255),
    master_services_details jsonb
);


ALTER TABLE public.product_services_detail OWNER TO postgres;

--
-- Name: sequence_generator; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sequence_generator
    START WITH 100
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sequence_generator OWNER TO postgres;

--
-- Name: service_analytics; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.service_analytics (
    id bigint NOT NULL,
    time_interval timestamp without time zone,
    service_detail_id bigint,
    type character varying(100),
    score integer,
    rate_of_growth character varying(10)
);


ALTER TABLE public.service_analytics OWNER TO postgres;

--
-- Name: service_billing; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.service_billing (
    id bigint NOT NULL,
    period_from date,
    period_to date,
    due_date date,
    amount double precision,
    description character varying(5000),
    status character varying(255),
    created_on timestamp without time zone,
    updated_on timestamp without time zone,
    updated_by character varying(255),
    created_by character varying(255),
    product_id bigint,
    services_id bigint,
    department_id bigint
);


ALTER TABLE public.service_billing OWNER TO postgres;

--
-- Name: service_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.service_category (
    id bigint NOT NULL,
    name character varying(255),
    description character varying(5000),
    status character varying(255),
    created_on timestamp without time zone,
    updated_on timestamp without time zone,
    updated_by character varying(255),
    created_by character varying(255)
);


ALTER TABLE public.service_category OWNER TO postgres;

--
-- Name: service_detail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.service_detail (
    id bigint NOT NULL,
    metadata_json jsonb,
    view_json jsonb,
    sla_json jsonb
);


ALTER TABLE public.service_detail OWNER TO postgres;

--
-- Name: service_provider_cloud_account; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.service_provider_cloud_account (
    id bigint NOT NULL,
    cloud_type character varying(255),
    account_id character varying(255),
    access_key character varying(255),
    secret_key character varying(255),
    region character varying(255),
    status character varying(255),
    created_on timestamp without time zone,
    updated_on timestamp without time zone,
    updated_by character varying(255),
    created_by character varying(255)
);


ALTER TABLE public.service_provider_cloud_account OWNER TO postgres;

--
-- Name: TABLE service_provider_cloud_account; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.service_provider_cloud_account IS 'Synectiks Cloud account details';


--
-- Name: service_tag; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.service_tag (
    id bigint NOT NULL,
    tag_name character varying(255),
    status character varying(255),
    created_on timestamp without time zone,
    updated_on timestamp without time zone,
    updated_by character varying(255),
    created_by character varying(255),
    service_category_id bigint
);


ALTER TABLE public.service_tag OWNER TO postgres;

--
-- Name: service_tag_link; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.service_tag_link (
    id bigint NOT NULL,
    description character varying(255),
    status character varying(255),
    created_on timestamp without time zone,
    updated_on timestamp without time zone,
    updated_by character varying(255),
    created_by character varying(255),
    services_id bigint,
    service_tag_id bigint,
    hosting_type character varying(255),
    name character varying(255)
);


ALTER TABLE public.service_tag_link OWNER TO postgres;

--
-- Name: services; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.services (
    id bigint NOT NULL,
    name character varying(255),
    description character varying(5000),
    status character varying(255),
    created_on timestamp without time zone,
    updated_on timestamp without time zone,
    updated_by character varying(255),
    created_by character varying(255),
    service_category_id bigint
);


ALTER TABLE public.services OWNER TO postgres;

--
-- Name: demo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.demo ALTER COLUMN id SET DEFAULT nextval('public.demo_id_seq'::regclass);


--
-- Name: demo_catalogues_detail id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.demo_catalogues_detail ALTER COLUMN id SET DEFAULT nextval('public.demo_catalogues_detail_id_seq'::regclass);


--
-- Data for Name: account_services; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.account_services (id, account_id, account_services_json) FROM stdin;
55851	897373451	{"vpcs": [{"name": "VPC1", "clusters": [{"name": "Cluster1", "products": [{"name": "EMS", "environments": [{"name": "PROD", "services": {"common": [{"app": [{"id": "PROD_FileRepo-app1", "dbid": 55808.0, "name": "FileRepo-app1", "security": {"score": 26.0}, "description": "File repo API Gateway common service", "performance": {"score": 65.0}, "serviceType": "App", "associatedOU": "Synectiks", "availability": {"score": 25.0}, "associatedEnv": "PROD", "associatedDept": "LOGISTICS", "dataProtection": {"score": 32.0}, "userExperiance": {"score": 60.0}, "serviceDetailId": 55808.0, "associatedProduct": "EMS", "serviceHostingType": "Cluster", "associatedCloudElement": "API-Gateway", "associatedCloudElementId": "0f46r83d5a", "associatedClusterNamespace": "EMS", "associatedGlobalServiceLocation": "", "associatedManagedCloudServiceLocation": ""}], "data": [], "name": "FileRepo", "associatedOU": "Synectiks", "associatedDept": "LOGISTICS"}], "business": []}}]}, {"name": "HRMS", "environments": [{"name": "PROD", "services": {"common": [{"app": [{"id": "PROD_FileRepo-app1", "dbid": 55806.0, "name": "FileRepo-app1", "security": {"score": 80.0}, "description": "File repo API Gateway common service", "performance": {"score": 38.0}, "serviceType": "App", "associatedOU": "Synectiks", "availability": {"score": 52.0}, "associatedEnv": "PROD", "associatedDept": "LOGISTICS", "dataProtection": {"score": 74.0}, "userExperiance": {"score": 79.0}, "serviceDetailId": 55806.0, "associatedProduct": "HRMS", "serviceHostingType": "Cluster", "associatedCloudElement": "API-Gateway", "associatedCloudElementId": "0f46r83d5a", "associatedClusterNamespace": "HRMS", "associatedGlobalServiceLocation": "", "associatedManagedCloudServiceLocation": ""}], "data": [{"id": "PROD_FileRepo-data1", "dbid": 55807.0, "name": "FileRepo-data1", "security": {"score": 51.0}, "description": "File repo DynamoDB common service", "performance": {"score": 60.0}, "serviceType": "Data", "associatedOU": "Synectiks", "availability": {"score": 13.0}, "associatedEnv": "PROD", "associatedDept": "LOGISTICS", "dataProtection": {"score": 24.0}, "userExperiance": {"score": 15.0}, "serviceDetailId": 55807.0, "associatedProduct": "HRMS", "serviceHostingType": "Cluster", "associatedCloudElement": "Dynamodb", "associatedCloudElementId": "formkiq-core-prod-documents", "associatedClusterNamespace": "HRMS", "associatedGlobalServiceLocation": "", "associatedManagedCloudServiceLocation": ""}], "name": "FileRepo", "associatedOU": "Synectiks", "associatedDept": "LOGISTICS"}], "business": []}}]}]}]}], "account": "897373451"}
\.


--
-- Data for Name: catalogue; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.catalogue (id, details) FROM stdin;
40552	{"dev": {"appBlocks": {"workflows": [], "generators": [], "commonMicroservices": []}, "dataFlows": {}, "libraryAndSDKs": {}, "buildDeployTemplates": {}}, "ops": {"workflows": {}, "collectors": {}, "dataSources": [{"id": 1, "name": "AWS-PullMetric-Api", "description": "Pull AWS metrics with Cloud API", "associatedCloud": "AWS", "associatedCreds": "Vault", "associatedTargetDs": "NA", "associatedWorkflowTemplate": "s3://...", "associatedApplicationLocation": "AppKubeMain"}, {"id": 2, "name": "AWS-PullLog-Api", "description": "Pull AWS Logs with Cloud API", "associatedCloud": "AWS", "associatedCreds": "Vault", "associatedTargetDs": "NA", "associatedWorkflowTemplate": "s3://...", "associatedApplicationLocation": "AppKubeMain"}, {"id": 3, "name": "AWS-PullLogs-Local", "description": "Receive AWS Logs and Store in Local ES", "associatedCloud": "AWS", "associatedCreds": "Vault", "associatedWorkflowTemplate": "s3://...", "associatedApplicationLocation": "LogManager"}, {"id": 4, "name": "AWS-StoreTrace-Local", "description": "Receive Traces and Store in Local Zipkin DB", "associatedCloud": "AWS", "associatedCreds": "Vault", "associatedWorkflowTemplate": "s3://...", "associatedApplicationLocation": "TraceManager"}, {"id": 4, "name": "Azure-PullMetric-Api", "description": "Pull Azure metrics with Cloud API", "associatedCloud": "Azure", "associatedCreds": "Vault", "associatedTargetDs": "NA", "associatedWorkflowTemplate": "s3://...", "associatedApplicationLocation": "AppKubeMain"}, {"id": 5, "name": "Azure-PullLogs-Api", "description": "Pull Azure Logs with Cloud API", "associatedCloud": "Azure", "associatedCreds": "Vault", "associatedTargetDs": "NA", "associatedWorkflowTemplate": "s3://...", "associatedApplicationLocation": "AppKubeMain"}, {"id": 6, "name": "Azure-PullLogs-Local", "description": "Receive Azure Logs and Store in Local ES", "associatedCloud": "Azure", "associatedCreds": "Vault", "associatedWorkflowTemplate": "s3://...", "associatedApplicationLocation": "LogManager"}, {"id": 7, "name": "Azure-StoreTrace-Local", "description": "Receive Traces and Store in Local Zipkin DB", "associatedCloud": "AWS", "associatedCreds": "Vault", "associatedWorkflowTemplate": "s3://...", "associatedApplicationLocation": "TraceManager"}, {"id": 8, "name": "Azure Active Directory - Overview", "description": "Azure Active Directory Operations", "associatedCloud": "Azure"}], "diagonostics": {}, "kubeOperators": {}, "cloudDashBoards": [{"id": 1, "name": "AWS API Gateway", "description": "AWS API Gateway pull log monitoring dashboard", "jsonLocation": "s3://synectiks-monitoring-dashboards/AWS/API Gateway/Performance.json", "associatedCloud": "AWS", "associatedSLAType": "PERFORMANCE", "associatedDataType": "LOG", "associatedDataSourceType": "AWS-PullLog-Api", "associatedCloudElementType": "API-Gateway"}, {"id": 2, "name": "AWS API Gateway", "description": "AWS API Gateway pull metrics monitoring dashboard", "jsonLocation": "s3://synectiks-monitoring-dashboards/AWS/API Gateway/Performance.json", "associatedCloud": "AWS", "associatedSLAType": "PERFORMANCE", "associatedDataType": "LOG", "associatedDataSourceType": "AWS-PullMetric-Api", "associatedCloudElementType": "API-Gateway"}, {"id": 3, "name": "AWS DynamoDB", "description": "AWS DynamoDB pull log monitoring dashboard", "jsonLocation": "s3://synectiks-monitoring-dashboards/AWS/DynamoDB/Performance.json", "associatedCloud": "AWS", "associatedSLAType": "PERFORMANCE", "associatedDataType": "LOG", "associatedDataSourceType": "AWS-PullLog-Api", "associatedCloudElementType": "Dynamodb"}, {"id": 4, "name": "AWS DynamoDB", "description": "AWS DynamoDB pull metrics monitoring dashboard", "jsonLocation": "s3://synectiks-monitoring-dashboards/AWS/DynamoDB/Performance.json", "associatedCloud": "AWS", "associatedSLAType": "PERFORMANCE", "associatedDataType": "LOG", "associatedDataSourceType": "AWS-PullMetric-Api", "associatedCloudElementType": "Dynamodb"}], "provisioningTemplates": [{"id": 1, "name": "AWS-Landing-Zone", "actOn": "MainProduct", "description": "Create AWS Accounts with Best Practices", "associatedCloud": "AWS", "associatedCreds": "Vault", "associatedSpecsTemplate": "s3://..."}, {"id": 2, "name": "Azure-Landing-Zone", "actOn": "MainProduct", "description": "Create Azure Account and Subscription with Best Practices", "associatedCloud": "Azure", "associatedCreds": "Vault", "associatedSpecsTemplate": "s3://..."}, {"id": 3, "name": "Google-Landing-Zone", "actOn": "MainProduct", "description": "Create Google Project with Best Practices", "associatedCloud": "Google", "associatedCreds": "Vault", "associatedSpecsTemplate": "s3://..."}, {"id": 4, "name": "AWS-Product-Enclave", "actOn": "LandingZone", "description": "Create AWS VPC/Gateway/Firewall Services", "associatedCloud": "AWS", "associatedCreds": "Vault", "associatedSpecsTemplate": "s3://..."}, {"id": 5, "name": "Azure-Product-Enclave", "actOn": "LandingZone", "description": "Create Azure VPC/Gateway/Firewall Services", "associatedCloud": "Azure", "associatedCreds": "Vault", "associatedSpecsTemplate": "s3://..."}, {"id": 6, "name": "Google-Product-Enclave", "actOn": "LandingZone", "description": "Create Google VPC/Gateway/Firewall Services", "associatedCloud": "Google", "associatedCreds": "Vault", "associatedSpecsTemplate": "s3://..."}, {"id": 7, "name": "AWS-Product-Cluster", "actOn": "ProductEnclave", "description": "Create EKS k8 cluster with best practices", "associatedCloud": "AWS", "associatedCreds": "Vault", "associatedSpecsTemplate": "s3://..."}, {"id": 8, "name": "Azure-Product-Cluster", "actOn": "ProductEnclave", "description": "Create Azure AKS k8 cluster with best practices", "associatedCloud": "Azure", "associatedCreds": "Vault", "associatedSpecsTemplate": "s3://..."}, {"id": 9, "name": "Google-Product-Cluster", "actOn": "ProductEnclave", "description": "Create Google k8 cluster with best practices", "associatedCloud": "Google", "associatedCreds": "Vault", "associatedSpecsTemplate": "s3://..."}, {"id": 10, "name": "Common-Service-File-Repo", "actOn": "ProductEnclave", "description": "Provision Filerepo Common Services", "associatedCloud": "Google", "associatedCreds": "Vault", "associatedSpecsTemplate": "s3://..."}]}, "sec": {"complianceRules": {}, "complianceAuditors": {}, "compliancePolicies": {}, "codeSecurityTemplates": {}, "dataSecurityTemplates": {}, "conainerSecurityTemplates": {}}}
\.


--
-- Data for Name: cloud; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cloud (id, name, status, created_on, updated_on, updated_by, created_by) FROM stdin;
251	AWS	ACTIVE	2022-04-11 06:27:55.417692	2022-04-11 06:27:55.417692	Postman	Postman
\.


--
-- Data for Name: cloud_element; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cloud_element (id, name, parent_id, status, created_on, updated_on, updated_by, created_by, view_json, view_json_content_type, product_enclave_id_id, cloud_environment_id_id) FROM stdin;
1	Agent	1080p	Compatible clicks-and-mortar Paradigm	2022-04-01 02:58:51	2022-03-31 11:30:14	Auto Toys array	Managed compress	\\x89504e470d0a1a0a0000000d49484452000000c0000000c0080300000065029c35000002fd504c5445000000cbaaa34b566cac9983baa78bb59885b08e7eb0907eb59584b08f7eb39282b19180b19180b1907fbc9986b99684b1907eb09080b59382b79685ae8d7cb08f7eb08f7eb1907eac8b7db49382b1907fb08f7ec6a18db29180b1907fb39282797277c9a38fd3ac97c29d8ab1907fb29281ad8b7ad8b09acea793b19080bf9b88ab8977aa8775c0a293ccb1a2d1b6a8d6bbadb99a8ac7aa9be5cdc0efd8ccf3ddd1f6e2d7f8e4d8f0dacedcc2b5bc9e8ee0c7baeed6caf5e0d4f8e3d6f6e1d5f4dfd3f2dcd0caad9febd4c7f4ded1e3cabdceb3a5e8d0c4d8bfb1c4a798fae5d9a88472f4dfd4fae3d5f1ded4f9e2d4d4ccd095abcb81a0c9a3b2cce6d7d2cfcad08aa4caebd9ce4189c60080c52083c51b82c52684c52e85c6007cc27b9eca4d8cc6478ac64a8bc60282c5cac6cf1181c44088c6aeb7ccacbfd8b5c9e1b2bacd6f99c8bdbfcefce5d5fdf7f4fffffffefdfdfff1e5fbf1ebfcf4efe7cbbe0981c5fae8defefbf8ebcfc3eed3c6f9fafbf9ece5ecd0c3dfe0e19292936c6f77d5d5d7f0f2f4aaaaab7d8186bfbec0eccfc2ebcfc2fadccef5d8cac7c5c7000000e8e8e9454545989b9ceed2c5eccfc2393939b5b6b8cbcccdebcfc2a3a4a4ebcfc2878d903c88c66294c7a9a7a64a4d599d9e9e535866ebcfc1edd5c7ebcfc3939799ebcfc2eacec2eccfc2ead0c3558fc7e6d4cc9caccbcabfba3884c1418ccb4189c6397eb8d2b9abacb1c84591d13982bf4189c64189c6c1a293bd9f8e3f6389f6e1d4f2ddd0f6e1d4decec5bdb6b1d5c8c08e9496b2afad9c9d9d979b9c464c5d484f5f4b556a474e60474e60d7d7da313c53484f60495061495061495061484f60495060494f614950614950613e465a585e6d4d55674a5264495061494f6148516349506149506124324c484f61485061132746495061484f61001a40465771406085406a9508598d7d9abedbe4ee226fa85081b13f77ac3373aa3373aa3679b30063a3007ac14082bb4761827194bb6c9dcf396fa1c6d3e40171b03372aa3374ab3678b13273aa4188c63372aa3272aa4189c64188c64089c69cd9201a000000ff74524e530003030205184270868f569be0ffffffe733fffffffbfda82564bffffffff17a0bffffffcbb6ffffffd6ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff69ffffff482effffc7fffffffffffffffebe7ffffffffffffffffffaffffffffffafffffffffffffffa011d6ffe7d1e08cffffffff6ffffb28dad9ff48eb842e4415dd9fa6fffffffffface037557da6d4e1fbddb29175462768befffffffffff9896183fcff71c9fff09bfffffffffffffffffffffefffffffffffffffffffffff2839fb7d0d45cb5dfde6f838fea0000193f494441547801d497d176b23a108583001635131b6762eb402b5025f2fe0f7816b3385d14e1ffcfcd01ba6f58e4eadbccde1355ffb3824def258c42f59bd401c7c9f6254dd3975ddc9efc2afc967eb73f681099e3fe55a920fc4d1f3fd91f2c9c10ad25226781ce6f4a45eb040e225110ca8b7cfcf70bc389094d965966d68e72f8f8bcae700861d4afea46f85ed38331da11daa2ac1859e4c8c257b2b6210441eb214e76dbed2e89852d7ebf1158470eb12a4b73e76f3932fcb9260752d5eb2efd3ab235c6eae3d7394d2f470b39116bcc8bdae7a8b927cae1f6b69e18054a5db70f0bc60aa5b606a07d21c7cc98fb017f2be7e098a8701d0e22a5760f308e9c732c708e8884bee3b7a879283ae9ad785f7ef5a8f87c328ef887102ccab3a84bf3cc2f313abd88fbc5e3931c80698088799663fbaceaba417e162213c33952d1e2f1d96a43cf7c4d26fca7b22e700c1fa0cd5a735bd481f0ef41d3086151ddbb00591cc1f7991c135c167510a9e80cec46f8ad6f01d19475854ff8c69715cab1a3456710a9f802e4f859f7cc23cb00bcc6a776d4fe74e74ed49ca5480bf17f01f18850976d82d096c30623425967dc3b74902a152ec4ff18e7676c24f9580d06a0516775d960ffcc39b35561b82a7e465fb4fcec070d40eb6b3f2cb5d3f65d452bca8f74d74885072b48e2a39107224bc9ec0e02155da6f8190bdf5d62d90ffe6a189f6f07c7b7591d48e9ce407a82df968d60fada60afbe592d831911c1e33aaf838dfa04c713ba57a546f1e1f907bfc47fc2c14da9cd9c0548584f1a409fdd25f1fd0a635617adad4907e98cab68a3ae0f4393fcb64d8a205becf167883c29a74f33aea240bd00f194d0f85c0c783fc13f2697bbd956d146bd7d58376da029843f2f25493cd847532273885534d306da03f11f0c54f87d198810fece2fbf4ce72972a05e29777f32d020b3be375e4a2b56fe033febb98a1ca8747a00c20b28cbb4e8f8755920f2dfe5b4dda96806fef8681d4f0bad18c0ace90c78dfe3d7b96e956b7e16d98f196ee4486dcd34bfb4d7c82333d8fd35d0f82f7ccefff0661eeaaddb3a00cebab713c73d127a963e76971da46dc992492f0e6f3bf1fb3f4f29d19667b758642748825fc42665bc120a70330ceeef1e8387f087eb1a00a5d416b52a8bbf275827d54a2541ce316e77ba699a7632ce006e107c7c0d103c87024990324631f19e81718c09c22b7f1cdf4658594f398b7b695ef485742206c311bb46780349e86a707ff7bef5e6ecff12e4341ab5dba3c8d98825034415974f492d2c1d87d3ac339e282d8551d6891272ea102881cb6ae0dabafbe06de8d9f3e7301bcf078bfe60beecb609e70850198f5540b792cafad57220a450b614e5c47d300e21e3486e344521015c1b149f0000b2de5a486d9c68a9ed7cb38d182fbd0908010064de7a2d8537fd2825c220050610da89fea08a01d2d468650fe220d47c38cb12c639638cb364543f7b7525d60abdde72847327faf018f00c9e2e42806da439b1cd31947e3e580fbb9dde76b6daaca7faa6f5b5beb42952727606ad907de9d359230abcabd585713e42a534aa6429f1acfa03b1462e6346ced6d601e3d81ded8fc72a4058bb6f6e995785aa319ee64fc45a391f9d11b83d4b4080a75fea3a0c98ace5e20f2cb3ea2f8995939ac047c10f4fa1a2e0e1ee7f9fd7658c3807b2aa01e9cb794ce13411bd0e75044f274908683c115635210bb94484e03ee4a779026f0e0790367200de8bba9c9c15b3f00080d1bc390031c8289cb474e1003e8dea143a13caaac68e60c3e13f71a1f70780848ea5554d8915933a8e217193d97da82cf4517c08e16c20ac6a4e4c8fd54710fd3f14c0fdddd72d7f194cf8ca4740081f0a0fe08435e7413e938e69bde3faf2757000a071211a3d01bd26081e20722bae87400087899ef09e528d028822a3709cca1e83ad24e27d12dd34ea41ca2abb65e4d00b3d3880b06914316f164059dde57b8057eee6f5316c21bb1d02d6c962f1e75d68a975a567e59841e8b1b86e25806dadb197cdb3115aca6729cc1f30f879e7d9bd68bfa0389ec03c42f037c75fdfdd8706b8a802d51066a6c53c1f8f9793be96e6364235a5a9221f3bb575313552d78ad6f4dbfb2070771d0fe100a06ae6d8509e4ec25a0ff274368a23a40ca37637ef3b845be64be3f6163132c6288947b3349f4a616d1d0410faaac3cd035f110780343fce62e56ea19b51ce29454c2041c6b13d9ccaab346b85c86791d34300a74629e7384a277b452b97147d1d0bb7e2bdf71319603c17f6d80aaf124e936a0fe4b7a024616c3416170456171de44848a9e5f588838d37cad89396fa4df485ab6301f75a2d07c046f5346fc5a4cdf168948720c0586ace08ac988f5ebc227835af882f2b5b295adde1107024f6008f3f54005beb8d2bdff75e08ec8d47a4b47410bf321d1e03dd07a953f48bde52b03eb0175f14ad1cd3c39df163d8b50ae12b713800b9c6a4348b00650c63270967401c01db567cc766a7b41d1c18c65996c5c0fc2a3821b46d8dadbb8937adcfbcfd01ef97084fa53d7491394348aaedf96c984f8a62926fda9c3aa4978e386f76220e4e2feae6c5603028d6c3d97e8dfa520138112b4eca792ce866eeeb0a60238fe97bc628c3ac379c08298513f93c4d33a46c3417e731308e29c6b3b5d7125a9af9b0972594c66351e7a10442af16ffef9e911f276b025797f24249b1ebdb4afac69585f1f26262dbed4491e713a3ed416d27a41aacddf7c4e14f4d478c00845c4fdf571734484e1612d63c3bd1a61c0bf7a2942ebfa5cc6e77b45f55dfd5a6d6aa7e434bf73dbb3b36746fca9bbefb80f703f7ee8aec7427fa1bade6f59d38b284711ceedd7dd99c779f37e720d8405b3d67274f0b81a304c8460267131c09ce3903e33439a77f73bbba918c35c26ffd3990be03f5a3aa54dd3a228a1c6a24a2a80ec13936cc6dec88f0c5c71fd031d0e21347005d0c27a56b226a38d2de501d9d3681dad57d8ead87db3042d7be7f5bdc18003543137c75c96e01a284353d1a8b1b1e8ac7a2bd7d2195305b97416d46235b7748e60481bfbea7d761b608bed4e6fd5fedcd00416a444f98565c4feaf4b7974b4f26752ac3322d3da510b0a16e6a33a3cce6f86c9b65ea5d60e3a3808e01672121685fffbe7380278874f75b0346f720d3d030d3087fd417d7ace4080390437dd153db08b70df147a371d3ec1f031b6fe3f7df140b00eb39673b09007aa23f42d28aa25ecf64b972e30a55baa72f9ed01d8058a2bf43069b3291abf926d32ab5758e1a89e429c095b761372096604a91eb32309dd053e9109166f2347410844630c1e931bd1ec08a85a9eda24c316d5fc62f51dba05e0720a39fe0bca25880023a0b304d0bfd6280060441c1bf5c761223a2b800e2618560c4e3afd9f27e4c94110700e40f16c402b434f98a521bae0748a6d22c3088ab44e3038cd98b9e001727f8eba51cb74d5e7401e0365cf4b50a9d03bec21c426e0069960534bfb0b8b0c4eee511f60090fc2cf0e595c5d5b5122398915c1940d27a013e465cfc1b9b5b12426e8049f8feb77740dbb5c8580f0caa84aa0690bec03877f7c0b69f03df841b4096368353c200a001b6ca950bb23b03721ebed8fdc56a756f676f9747566b621a1352ed0c4cc24b3717f7aa7bd59d03b89fc1ae1292ffac940f8bbe26610998dbac1cfee1065068694061975677aad59d25886c52525806d81288c01c00800c7d2957caaeec50d023485a9eb833f0c76165f3585411b5fa0a875441843c0040276701cc5bb7dbb912b7340ec0b40600773c0150f0f0b05c11958226da0115fa01d8dd037e28a1d2dac21e0deceeb25342a666c4a24cb74ccd29a1a57bf7a184c2ee12e22ad36f686bcad72aa8828e01e0109ac0a3890f764007bc8939806672699a76dac477c17694f56ce28b8787b4861e88c94093efe1a32d00f85376650022a39a3f3a399a67f7f2325600e0569cc9b8a5b10c04f861f4e6c9e3839cc7611436650c605d481300c0130610445e832ccba2e3e283cc8a46c25da0d4a861f241e6d83c071996ff0080adb9565f934880327601908b332c261be174299156d2f4576eaf2d25e48c6d035fdeef02801e0680a70f85024013b800904dc0e2cfc836c0a00a0751543b8c1284fd1930705b7ee6227201e0b2e00c3ce3007c1238004a881029e02ca727b0444848b10799b39460363291abd926fdcce600f01610d803f09eeb9b0ca07c5a4249a813555515559d99cce7f399f1ebec8192ee38b316a251dab6890cb54dcc709b1299e6004e0bb0a3508ba039f09c031c5eac03b8f562ac93e9e54bf6bf936b44bb65d50318b7539d5c676c83b7062c0070a680b8390000c543fe117fcad8d9526a46fcc5eb4ac46f9dd952529be1658b529bb3a5bcc812107c22a6877d7079ff039e8220e2523b7a13a665dd7a5d039665697cb74e901c69684bd0a763d0df6c25c72b6883c72fb28dcb1711a6226ae7a83eadebd31ed2e90baf0882c8a8ed76035b126c1dd402ef8782bc855b8401c07adaaea1b640a00d63b573e45543a5e07c0f889c67eb481199c055b06d08e22f3f298a3cb768f77190fcf3f3d57f03325615556928889f899c6b4304a3ff98b90aded88d201c50856f0af65e04d696bb855d1ff9c53edb39dbb93b1f561597b9c28aca2c2c9323a98ce2f63133fcb766ecbb0d7495e7427cfede0bd37cbb33a6f9be715af5fe4056f0beba283f40064917265cab47782cdf035b0f77f74214056dd713937a921e421796f7d7c2f1eec6dac6378945b18dd43ce844ff4173f0f0acfdda1d71461a56927cba7515b19f65906c243e458dba680c90c17f54aa84432a0cca3bc9472f1f7a5726d03e96c11b9b37c6712a72a31c7ca99fce2fd78d76880c5a9dd4475019fef9d293cf1c2ec40af7c6c6a79fd6536500256c2819448113b4b7b093cdf60fec40f6c1513b2d0008f0bb3f7fe987178e1c3db6b0540083777ffbe078663301c2ebb39eb66dd5ac702be210e51c928b1d6ef5c6adaa1f8651a6fdb632f53a90e3279e7ee1e8d193a70af0f32d6399fd3ef5728021320651e09309f165f7c95e5db751f681089df060cf8eb65ac6acda0b238c3fa60ce3afd0ca4da74e1e397af2f4b1620c89cb0b688a868c01af07ed081fee734d34c3593ac59e598d7b4e80ee9475bfa337d7ed682612257452b3317e9f309ae9b436fbdb678e3e7e1a37a02057f459147e4c190c8354394961d6de8e1c8b082698e976d75bdda1c7059974a65f0a5b1ea78458c1aae3b3990d483bb7f92b8f9d3a5fa4b15e1a9a802083f60809643b906e074d651f9ae751ce510c225c272310999c82e8db8e4f08cc84725313df7281c6f473da3637903b46a500642a8408951be9d252837046804e856ac12aee424a809b8e05b3f55fc9fa1a4b4b05e5cf56cb5532e0fe9a410c10f531cae1c63e93e4b6a429a263a31dcb6ea73bd01ce88c6e19678a587b85ab4f1a5218ade904852c2d2708c603a9e5de0ee0b52808ecc0479b1cf11a1ca6eb2f75720513f8fd41adb29545593a306f38180c55f123b839746bcd4ca44bf0b514eb164c404a3f56403230888160c2a03bdc6d80907b20b81064f61353e006143f5e452ad07601801090b165ea38460ca9e5425bb1c4fc36404ef850d8d33154c84018679aaeeb746ad83554a8e4a880a2fde98433c638472151dd8fe3d8afd79a1e659c28ade807e43d4049b6c0200dcff3cc51a7e65a89c4377ebda929184889d3bcaae0ef0c8099df2030eaedf8cca5924001cebd9c827c7920da0ed6fc46c62e91b8caa36b11d318f67657569407fc781783e49b3a55c49f5f66b96f8afc5b0c0580eb354ba610bee39a8c28e287cad9796d8094922aeb18086f748671462076fb26e10618c54f62c8735f50a14a06c038d13d73139e4e3853cfbc94e7b0f96149babc55e76496417d0e932ad1b9625151c7123085a1048e00986b05cb3b1b54c3fe0bac00bdad0cc383973189c0c881b255b04ca24539f62f1ff20f2229ee098556f91709746efe09244f67baf10f194029124836cff0e62c7f21cfff1a423dfb4ccd20ff5cb63917f27d0fe53f14e140ad795e03a92708dff7d00ae48f5f1670991818f9184045bbf51c3e892b1b83df8fe3b3f21b82ae1807ca953ff241d7058b0ab801056a70ee5f5c585a2e2581570723cef7a00018be19bf7a6961b99c04deb223b7c105515d80025060829b6ecf2e3181d5d069f923c0c787b08d45f6904b08bd6a05e370bdc404822074c641d76d6a99411752188c0bce1ad5b8f5c8e5cb8f854179098c0f1d3a74e5caa143571f3be8d79a0d9df01444f73ac341affdc7a19fae5dfbf6cad5b74a4be0d0f7d7527c7fdd1e07edd69ae5fbaeebfad6dabaedfcc5cc59e8386e75713ccae87b874f9c8728b771a6528465cc532c330e1623172d4b195bd515458be205d340c378b3f73a9c745ea5e7387193eb1de6ffeeb0e1f7bb70064f120f52c4b635053eecac86426752e0a93c8e663f9066a3d831398a1493129a4d88669b16810f8340e80c0afc6f4d231a314d7846b4b4343b95374180801931628bb6ac9ccd19000179d1d0ac079a018bc58c453f161aa21d5b966dc7b02c1038b333400c43351ea8964160acc507f089790286a5251c1b04c2e1b3c41e9e0943427fad2986a31a96aaa51d623b4253fdac64dab29d7a27b5645928000943664edf03c9c7f9ffdaa205dbf781ada58116768120f000042cc930d2b3297975fd5924340aba9f3efcb3f58dbf33d9dc3de5812c6b1ac14d40b48420f0894588f24ec2481b1f5a24b99c2f144be54a35e25fe8e4f7348cdc98bd56aa17a89e9f83d681f9078e4a888ab5d22ba4d30206b1ada862c3da4a24e148da78c5b89bad375b6071e2123e7ca55d2c7418635cefce25f16fd2bf361ea414132720f5664c1090d2b26cc13292e5fb49ec059a771b8c72c6d022535e7f361a9499935b3891f55eb14019e3b4d371597e0ea8f0dfe7b046ac1416a14f7c7ebfc10a469f00bffa93f707f838071c4eed500e1ab490a955c3dec54f64f0239552dff5e0219472da981fb7652c389a829f711dfc9b4421b1b429c3d6569751d4ebb9e9728af1ae01126ebfbd1e396687196f902aa52c658c765c84c7b0c122128d0c149540f0b3402092040aaa73db53c567a4cbe83838153811d9e6faa82e1f1f7eb5dca78c233d9da471cfa3f2b8928aa6680f625b3ebad05b86b93039f21b9882a9e02519ebf47bd5e35140fc702533648ce29c4f05760062f95c97138984ff758468f07154ba317560f2554330c0894087e13f95a35740fc48adcf19477831fa40469effc0ae44a5e8d6895f993eeef6529ed160c081335a6f458e5601f09ff5b2706561e5f8029b8bc83321bbf3e636fc972f4c027bd99e6c02712d51c6b33554383afc70ade0151dba45f4c1ef17c45c8f6fc90ffd728281b3a9d32de3ada46c0bef7b44fc1b7d61ed886103e83f14d9dedec2207efd4240e0f7a080e0c058bf72140670856a8633c4dfb300b6cbbfce1f90bc78613128202a504633550038347f6dc8e06adb8737e6ee050dce470306f1b76e0427609ead704a775618b600e170fccf8a8cbb74c730f84a286870455c44d06e19e44fea6211da723b73967976188399d07a415c3d5b46ef2edd0e1a5c8e070a68907f2e2f2ea0edb642761d0c0eccbfd1612edd3dfa80800164cae24e7ceb023a3a6c61aeabd3bdc465ee06801c90bf45f95ef85756f44df9b68fe7835e8fbf5e40fd8f2e2c0df49515be27034e5b073308873628effc5bcc19ed24ae4561b8a7be086f727c86731243941125b1813bafb9e3294c7c035a922209f72a4d465469d2324a6824c808d25d409501509dc9acae8e0152a6ac2d177ef1c61bfbff7badff8764c752f4d76f1a8defb7f1443335f13055a6504053e692a96622116dddb51bf57d9de8e048103fa2ffb04c3a7ffdc6668c391de06e2dd14c4efee1f65f74e0beb804f0d43713ff6d6d74bb1119e8dd531d94b97380fda319a4fdb96148bbdd66ad4ea7f5106fee7a7abd325dc502f5d4c71f23dd9dbdedd8d6b604c8d23d718b0ced235d5423e9d7cd27f68eed9a000fb7fd145a8032c502c5c34f25a25f3623522cb61dfe8324b76923000735fe019c997a85207fbfce66b0d1c3ddff4dd70294e92a7e03dd6dc6b7baeb92fb86830952b8478c01083913443efda2451a80891be4f3d0eab4d6fa49b74cdd024af6d7229b7b70f43e60878823b0a015f91a885240c07e83cd01c7700b16507e7467479a275f921b608086c9db4425030dd023e01b83dde93cf493c9fee3e606ae8e1f7a0860042538569e0aad6002f822e0db249842b4bbee3ffce91098d414f054e98a50240e00221040dbfeb1ee3f7cfe10e0088a7403a210d20c7a0482e8c5e09cfdf087a06268216185be41ba4e8f40104e38088e10c04ad3774814aad401d4d972067a267d04a71c2128103f85210281d88ea2045bb8a71b28d0231cb2681330832360dbaca786031d7084c0d4f2c41088c2f9b50906283402f53b83e14856038620c94fe410d0bf93120c10320cf29d714610b2cfaaac28cba798d3805e062a0b083000dbe3bcbce2876728a7f8f76862c053b78872a5ac5f9f930d1cea866910d0ebf65fe50f8679d40f3f9937dca3f93564109f651a26c7042c4dd32ccb2a954e4e4e0a40ad562b02df5cae3c8e4fabd5cbe301b3e7c8b71d36caa0764014718fe65a50e483cba3cb8b8beae9f195073ea208c0230b00082895408aa67db5881300c41040b976cbfb0dd8b8fc59148e787348ff9c1705457d265e29a2a2a52fb401711a21ffe2d83ef9b8fcb3872582d7dc81df82a2be81d159f029c292bcffa185f7d063c79e51cf5cf9b8f9be3709a005582465c6406e41b74f09e173454c4bd661f6b47c36f6e4fb11710abf54353cf1a0782f92f85446e0c0050f7f30ca06dc33fee35a483f87d10322abb94fd60f4f1f0e1c8fc1389d41f90b2e69b339d7037290163e196cf9e1d8e53583bf53ae3a43d9dc9b4b0eab76497e03a2bdd702c46cc7720000000049454e44ae426082	image/png	\N	\N
2	Tools payment	Tasty	infrastructures Assimilated Michigan	2022-03-31 23:48:46	2022-04-01 02:24:37	Games withdrawal Pants	Bedfordshire deliverables	\\x89504e470d0a1a0a0000000d49484452000000c0000000c0080300000065029c35000002fd504c5445000000cbaaa34b566cac9983baa78bb59885b08e7eb0907eb59584b08f7eb39282b19180b19180b1907fbc9986b99684b1907eb09080b59382b79685ae8d7cb08f7eb08f7eb1907eac8b7db49382b1907fb08f7ec6a18db29180b1907fb39282797277c9a38fd3ac97c29d8ab1907fb29281ad8b7ad8b09acea793b19080bf9b88ab8977aa8775c0a293ccb1a2d1b6a8d6bbadb99a8ac7aa9be5cdc0efd8ccf3ddd1f6e2d7f8e4d8f0dacedcc2b5bc9e8ee0c7baeed6caf5e0d4f8e3d6f6e1d5f4dfd3f2dcd0caad9febd4c7f4ded1e3cabdceb3a5e8d0c4d8bfb1c4a798fae5d9a88472f4dfd4fae3d5f1ded4f9e2d4d4ccd095abcb81a0c9a3b2cce6d7d2cfcad08aa4caebd9ce4189c60080c52083c51b82c52684c52e85c6007cc27b9eca4d8cc6478ac64a8bc60282c5cac6cf1181c44088c6aeb7ccacbfd8b5c9e1b2bacd6f99c8bdbfcefce5d5fdf7f4fffffffefdfdfff1e5fbf1ebfcf4efe7cbbe0981c5fae8defefbf8ebcfc3eed3c6f9fafbf9ece5ecd0c3dfe0e19292936c6f77d5d5d7f0f2f4aaaaab7d8186bfbec0eccfc2ebcfc2fadccef5d8cac7c5c7000000e8e8e9454545989b9ceed2c5eccfc2393939b5b6b8cbcccdebcfc2a3a4a4ebcfc2878d903c88c66294c7a9a7a64a4d599d9e9e535866ebcfc1edd5c7ebcfc3939799ebcfc2eacec2eccfc2ead0c3558fc7e6d4cc9caccbcabfba3884c1418ccb4189c6397eb8d2b9abacb1c84591d13982bf4189c64189c6c1a293bd9f8e3f6389f6e1d4f2ddd0f6e1d4decec5bdb6b1d5c8c08e9496b2afad9c9d9d979b9c464c5d484f5f4b556a474e60474e60d7d7da313c53484f60495061495061495061484f60495060494f614950614950613e465a585e6d4d55674a5264495061494f6148516349506149506124324c484f61485061132746495061484f61001a40465771406085406a9508598d7d9abedbe4ee226fa85081b13f77ac3373aa3373aa3679b30063a3007ac14082bb4761827194bb6c9dcf396fa1c6d3e40171b03372aa3374ab3678b13273aa4188c63372aa3272aa4189c64188c64089c69cd9201a000000ff74524e530003030205184270868f569be0ffffffe733fffffffbfda82564bffffffff17a0bffffffcbb6ffffffd6ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff69ffffff482effffc7fffffffffffffffebe7ffffffffffffffffffaffffffffffafffffffffffffffa011d6ffe7d1e08cffffffff6ffffb28dad9ff48eb842e4415dd9fa6fffffffffface037557da6d4e1fbddb29175462768befffffffffff9896183fcff71c9fff09bfffffffffffffffffffffefffffffffffffffffffffff2839fb7d0d45cb5dfde6f838fea0000193f494441547801d497d176b23a108583001635131b6762eb402b5025f2fe0f7816b3385d14e1ffcfcd01ba6f58e4eadbccde1355ffb3824def258c42f59bd401c7c9f6254dd3975ddc9efc2afc967eb73f681099e3fe55a920fc4d1f3fd91f2c9c10ad25226781ce6f4a45eb040e225110ca8b7cfcf70bc389094d965966d68e72f8f8bcae700861d4afea46f85ed38331da11daa2ac1859e4c8c257b2b6210441eb214e76dbed2e89852d7ebf1158470eb12a4b73e76f3932fcb9260752d5eb2efd3ab235c6eae3d7394d2f470b39116bcc8bdae7a8b927cae1f6b69e18054a5db70f0bc60aa5b606a07d21c7cc98fb017f2be7e098a8701d0e22a5760f308e9c732c708e8884bee3b7a879283ae9ad785f7ef5a8f87c328ef887102ccab3a84bf3cc2f313abd88fbc5e3931c80698088799663fbaceaba417e162213c33952d1e2f1d96a43cf7c4d26fca7b22e700c1fa0cd5a735bd481f0ef41d3086151ddbb00591cc1f7991c135c167510a9e80cec46f8ad6f01d19475854ff8c69715cab1a3456710a9f802e4f859f7cc23cb00bcc6a776d4fe74e74ed49ca5480bf17f01f18850976d82d096c30623425967dc3b74902a152ec4ff18e7676c24f9580d06a0516775d960ffcc39b35561b82a7e465fb4fcec070d40eb6b3f2cb5d3f65d452bca8f74d74885072b48e2a39107224bc9ec0e02155da6f8190bdf5d62d90ffe6a189f6f07c7b7591d48e9ce407a82df968d60fada60afbe592d831911c1e33aaf838dfa04c713ba57a546f1e1f907bfc47fc2c14da9cd9c0548584f1a409fdd25f1fd0a635617adad4907e98cab68a3ae0f4393fcb64d8a205becf167883c29a74f33aea240bd00f194d0f85c0c783fc13f2697bbd956d146bd7d58376da029843f2f25493cd847532273885534d306da03f11f0c54f87d198810fece2fbf4ce72972a05e29777f32d020b3be375e4a2b56fe033febb98a1ca8747a00c20b28cbb4e8f8755920f2dfe5b4dda96806fef8681d4f0bad18c0ace90c78dfe3d7b96e956b7e16d98f196ee4486dcd34bfb4d7c82333d8fd35d0f82f7ccefff0661eeaaddb3a00cebab713c73d127a963e76971da46dc992492f0e6f3bf1fb3f4f29d19667b758642748825fc42665bc120a70330ceeef1e8387f087eb1a00a5d416b52a8bbf275827d54a2541ce316e77ba699a7632ce006e107c7c0d103c87024990324631f19e81718c09c22b7f1cdf4658594f398b7b695ef485742206c311bb46780349e86a707ff7bef5e6ecff12e4341ab5dba3c8d98825034415974f492d2c1d87d3ac339e282d8551d6891272ea102881cb6ae0dabafbe06de8d9f3e7301bcf078bfe60beecb609e70850198f5540b792cafad57220a450b614e5c47d300e21e3486e344521015c1b149f0000b2de5a486d9c68a9ed7cb38d182fbd0908010064de7a2d8537fd2825c220050610da89fea08a01d2d468650fe220d47c38cb12c639638cb364543f7b7525d60abdde72847327faf018f00c9e2e42806da439b1cd31947e3e580fbb9dde76b6daaca7faa6f5b5beb42952727606ad907de9d359230abcabd585713e42a534aa6429f1acfa03b1462e6346ced6d601e3d81ded8fc72a4058bb6f6e995785aa319ee64fc45a391f9d11b83d4b4080a75fea3a0c98ace5e20f2cb3ea2f8995939ac047c10f4fa1a2e0e1ee7f9fd7658c3807b2aa01e9cb794ce13411bd0e75044f274908683c115635210bb94484e03ee4a779026f0e0790367200de8bba9c9c15b3f00080d1bc390031c8289cb474e1003e8dea143a13caaac68e60c3e13f71a1f70780848ea5554d8915933a8e217193d97da82cf4517c08e16c20ac6a4e4c8fd54710fd3f14c0fdddd72d7f194cf8ca4740081f0a0fe08435e7413e938e69bde3faf2757000a071211a3d01bd26081e20722bae87400087899ef09e528d028822a3709cca1e83ad24e27d12dd34ea41ca2abb65e4d00b3d3880b06914316f164059dde57b8057eee6f5316c21bb1d02d6c962f1e75d68a975a567e59841e8b1b86e25806dadb197cdb3115aca6729cc1f30f879e7d9bd68bfa0389ec03c42f037c75fdfdd8706b8a802d51066a6c53c1f8f9793be96e6364235a5a9221f3bb575313552d78ad6f4dbfb2070771d0fe100a06ae6d8509e4ec25a0ff274368a23a40ca37637ef3b845be64be3f6163132c6288947b3349f4a616d1d0410faaac3cd035f110780343fce62e56ea19b51ce29454c2041c6b13d9ccaab346b85c86791d34300a74629e7384a277b452b97147d1d0bb7e2bdf71319603c17f6d80aaf124e936a0fe4b7a024616c3416170456171de44848a9e5f588838d37cad89396fa4df485ab6301f75a2d07c046f5346fc5a4cdf168948720c0586ace08ac988f5ebc227835af882f2b5b295adde1107024f6008f3f54005beb8d2bdff75e08ec8d47a4b47410bf321d1e03dd07a953f48bde52b03eb0175f14ad1cd3c39df163d8b50ae12b713800b9c6a4348b00650c63270967401c01db567cc766a7b41d1c18c65996c5c0fc2a3821b46d8dadbb8937adcfbcfd01ef97084fa53d7491394348aaedf96c984f8a62926fda9c3aa4978e386f76220e4e2feae6c5603028d6c3d97e8dfa520138112b4eca792ce866eeeb0a60238fe97bc628c3ac379c08298513f93c4d33a46c3417e731308e29c6b3b5d7125a9af9b0972594c66351e7a10442af16ffef9e911f276b025797f24249b1ebdb4afac69585f1f26262dbed4491e713a3ed416d27a41aacddf7c4e14f4d478c00845c4fdf571734484e1612d63c3bd1a61c0bf7a2942ebfa5cc6e77b45f55dfd5a6d6aa7e434bf73dbb3b36746fca9bbefb80f703f7ee8aec7427fa1bade6f59d38b284711ceedd7dd99c779f37e720d8405b3d67274f0b81a304c8460267131c09ce3903e33439a77f73bbba918c35c26ffd3990be03f5a3aa54dd3a228a1c6a24a2a80ec13936cc6dec88f0c5c71fd031d0e21347005d0c27a56b226a38d2de501d9d3681dad57d8ead87db3042d7be7f5bdc18003543137c75c96e01a284353d1a8b1b1e8ac7a2bd7d2195305b97416d46235b7748e60481bfbea7d761b608bed4e6fd5fedcd00416a444f98565c4feaf4b7974b4f26752ac3322d3da510b0a16e6a33a3cce6f86c9b65ea5d60e3a3808e01672121685fffbe7380278874f75b0346f720d3d030d3087fd417d7ace4080390437dd153db08b70df147a371d3ec1f031b6fe3f7df140b00eb39673b09007aa23f42d28aa25ecf64b972e30a55baa72f9ed01d8058a2bf43069b3291abf926d32ab5758e1a89e429c095b761372096604a91eb32309dd053e9109166f2347410844630c1e931bd1ec08a85a9eda24c316d5fc62f51dba05e0720a39fe0bca25880023a0b304d0bfd6280060441c1bf5c761223a2b800e2618560c4e3afd9f27e4c94110700e40f16c402b434f98a521bae0748a6d22c3088ab44e3038cd98b9e001727f8eba51cb74d5e7401e0365cf4b50a9d03bec21c426e0069960534bfb0b8b0c4eee511f60090fc2cf0e595c5d5b5122398915c1940d27a013e465cfc1b9b5b12426e8049f8feb77740dbb5c8580f0caa84aa0690bec03877f7c0b69f03df841b4096368353c200a001b6ca950bb23b03721ebed8fdc56a756f676f9747566b621a1352ed0c4cc24b3717f7aa7bd59d03b89fc1ae1292ffac940f8bbe26610998dbac1cfee1065068694061975677aad59d25886c52525806d81288c01c00800c7d2957caaeec50d023485a9eb833f0c76165f3585411b5fa0a875441843c0040276701cc5bb7dbb912b7340ec0b40600773c0150f0f0b05c11958226da0115fa01d8dd037e28a1d2dac21e0deceeb25342a666c4a24cb74ccd29a1a57bf7a184c2ee12e22ad36f686bcad72aa8828e01e0109ac0a3890f764007bc8939806672699a76dac477c17694f56ce28b8787b4861e88c94093efe1a32d00f85376650022a39a3f3a399a67f7f2325600e0569cc9b8a5b10c04f861f4e6c9e3839cc7611436650c605d481300c0130610445e832ccba2e3e283cc8a46c25da0d4a861f241e6d83c071996ff0080adb9565f934880327601908b332c261be174299156d2f4576eaf2d25e48c6d035fdeef02801e0680a70f85024013b800904dc0e2cfc836c0a00a0751543b8c1284fd1930705b7ee6227201e0b2e00c3ce3007c1238004a881029e02ca727b0444848b10799b39460363291abd926fdcce600f01610d803f09eeb9b0ca07c5a4249a813555515559d99cce7f399f1ebec8192ee38b316a251dab6890cb54dcc709b1299e6004e0bb0a3508ba039f09c031c5eac03b8f562ac93e9e54bf6bf936b44bb65d50318b7539d5c676c83b7062c0070a680b8390000c543fe117fcad8d9526a46fcc5eb4ac46f9dd952529be1658b529bb3a5bcc812107c22a6877d7079ff039e8220e2523b7a13a665dd7a5d039665697cb74e901c69684bd0a763d0df6c25c72b6883c72fb28dcb1711a6226ae7a83eadebd31ed2e90baf0882c8a8ed76035b126c1dd402ef8782bc855b8401c07adaaea1b640a00d63b573e45543a5e07c0f889c67eb481199c055b06d08e22f3f298a3cb768f77190fcf3f3d57f03325615556928889f899c6b4304a3ff98b90aded88d201c50856f0af65e04d696bb855d1ff9c53edb39dbb93b1f561597b9c28aca2c2c9323a98ce2f63133fcb766ecbb0d7495e7427cfede0bd37cbb33a6f9be715af5fe4056f0beba283f40064917265cab47782cdf035b0f77f74214056dd713937a921e421796f7d7c2f1eec6dac6378945b18dd43ce844ff4173f0f0acfdda1d71461a56927cba7515b19f65906c243e458dba680c90c17f54aa84432a0cca3bc9472f1f7a5726d03e96c11b9b37c6712a72a31c7ca99fce2fd78d76880c5a9dd4475019fef9d293cf1c2ec40af7c6c6a79fd6536500256c2819448113b4b7b093cdf60fec40f6c1513b2d0008f0bb3f7fe987178e1c3db6b0540083777ffbe078663301c2ebb39eb66dd5ac702be210e51c928b1d6ef5c6adaa1f8651a6fdb632f53a90e3279e7ee1e8d193a70af0f32d6399fd3ef5728021320651e09309f165f7c95e5db751f681089df060cf8eb65ac6acda0b238c3fa60ce3afd0ca4da74e1e397af2f4b1620c89cb0b688a868c01af07ed081fee734d34c3593ac59e598d7b4e80ee9475bfa337d7ed682612257452b3317e9f309ae9b436fbdb678e3e7e1a37a02057f459147e4c190c8354394961d6de8e1c8b082698e976d75bdda1c7059974a65f0a5b1ea78458c1aae3b3990d483bb7f92b8f9d3a5fa4b15e1a9a802083f60809643b906e074d651f9ae751ce510c225c272310999c82e8db8e4f08cc84725313df7281c6f473da3637903b46a500642a8408951be9d252837046804e856ac12aee424a809b8e05b3f55fc9fa1a4b4b05e5cf56cb5532e0fe9a410c10f531cae1c63e93e4b6a429a263a31dcb6ea73bd01ce88c6e19678a587b85ab4f1a5218ade904852c2d2708c603a9e5de0ee0b52808ecc0479b1cf11a1ca6eb2f75720513f8fd41adb29545593a306f38180c55f123b839746bcd4ca44bf0b514eb164c404a3f56403230888160c2a03bdc6d80907b20b81064f61353e006143f5e452ad07601801090b165ea38460ca9e5425bb1c4fc36404ef850d8d33154c84018679aaeeb746ad83554a8e4a880a2fde98433c638472151dd8fe3d8afd79a1e659c28ade807e43d4049b6c0200dcff3cc51a7e65a89c4377ebda929184889d3bcaae0ef0c8099df2030eaedf8cca5924001cebd9c827c7920da0ed6fc46c62e91b8caa36b11d318f67657569407fc781783e49b3a55c49f5f66b96f8afc5b0c0580eb354ba610bee39a8c28e287cad9796d8094922aeb18086f748671462076fb26e10618c54f62c8735f50a14a06c038d13d73139e4e3853cfbc94e7b0f96149babc55e76496417d0e932ad1b9625151c7123085a1048e00986b05cb3b1b54c3fe0bac00bdad0cc383973189c0c881b255b04ca24539f62f1ff20f2229ee098556f91709746efe09244f67baf10f194029124836cff0e62c7f21cfff1a423dfb4ccd20ff5cb63917f27d0fe53f14e140ad795e03a92708dff7d00ae48f5f1670991818f9184045bbf51c3e892b1b83df8fe3b3f21b82ae1807ca953ff241d7058b0ab801056a70ee5f5c585a2e2581570723cef7a00018be19bf7a6961b99c04deb223b7c105515d80025060829b6ecf2e3181d5d069f923c0c787b08d45f6904b08bd6a05e370bdc404822074c641d76d6a99411752188c0bce1ad5b8f5c8e5cb8f854179098c0f1d3a74e5caa143571f3be8d79a0d9df01444f73ac341affdc7a19fae5dfbf6cad5b74a4be0d0f7d7527c7fdd1e07edd69ae5fbaeebfad6dabaedfcc5cc59e8386e75713ccae87b874f9c8728b771a6528465cc532c330e1623172d4b195bd515458be205d340c378b3f73a9c745ea5e7387193eb1de6ffeeb0e1f7bb70064f120f52c4b635053eecac86426752e0a93c8e663f9066a3d831398a1493129a4d88669b16810f8340e80c0afc6f4d231a314d7846b4b4343b95374180801931628bb6ac9ccd19000179d1d0ac079a018bc58c453f161aa21d5b966dc7b02c1038b333400c43351ea8964160acc507f089790286a5251c1b04c2e1b3c41e9e0943427fad2986a31a96aaa51d623b4253fdac64dab29d7a27b5645928000943664edf03c9c7f9ffdaa205dbf781ada58116768120f000042cc930d2b3297975fd5924340aba9f3efcb3f58dbf33d9dc3de5812c6b1ac14d40b48420f0894588f24ec2481b1f5a24b99c2f144be54a35e25fe8e4f7348cdc98bd56aa17a89e9f83d681f9078e4a888ab5d22ba4d30206b1ada862c3da4a24e148da78c5b89bad375b6071e2123e7ca55d2c7418635cefce25f16fd2bf361ea414132720f5664c1090d2b26cc13292e5fb49ec059a771b8c72c6d022535e7f361a9499935b3891f55eb14019e3b4d371597e0ea8f0dfe7b046ac1416a14f7c7ebfc10a469f00bffa93f707f838071c4eed500e1ab490a955c3dec54f64f0239552dff5e0219472da981fb7652c389a829f711dfc9b4421b1b429c3d6569751d4ebb9e9728af1ae01126ebfbd1e396687196f902aa52c658c765c84c7b0c122128d0c149540f0b3402092040aaa73db53c567a4cbe83838153811d9e6faa82e1f1f7eb5dca78c233d9da471cfa3f2b8928aa6680f625b3ebad05b86b93039f21b9882a9e02519ebf47bd5e35140fc702533648ce29c4f05760062f95c97138984ff758468f07154ba317560f2554330c0894087e13f95a35740fc48adcf19477831fa40469effc0ae44a5e8d6895f993eeef6529ed160c081335a6f458e5601f09ff5b2706561e5f8029b8bc83321bbf3e636fc972f4c027bd99e6c02712d51c6b33554383afc70ade0151dba45f4c1ef17c45c8f6fc90ffd728281b3a9d32de3ada46c0bef7b44fc1b7d61ed886103e83f14d9dedec2207efd4240e0f7a080e0c058bf72140670856a8633c4dfb300b6cbbfce1f90bc78613128202a504633550038347f6dc8e06adb8737e6ee050dce470306f1b76e0427609ead704a775618b600e170fccf8a8cbb74c730f84a286870455c44d06e19e44fea6211da723b73967976188399d07a415c3d5b46ef2edd0e1a5c8e070a68907f2e2f2ea0edb642761d0c0eccbfd1612edd3dfa80800164cae24e7ceb023a3a6c61aeabd3bdc465ee06801c90bf45f95ef85756f44df9b68fe7835e8fbf5e40fd8f2e2c0df49515be27034e5b073308873628effc5bcc19ed24ae4561b8a7be086f727c86731243941125b1813bafb9e3294c7c035a922209f72a4d465469d2324a6824c808d25d409501509dc9acae8e0152a6ac2d177ef1c61bfbff7badff8764c752f4d76f1a8defb7f1443335f13055a6504053e692a96622116dddb51bf57d9de8e048103fa2ffb04c3a7ffdc6668c391de06e2dd14c4efee1f65f74e0beb804f0d43713ff6d6d74bb1119e8dd531d94b97380fda319a4fdb96148bbdd66ad4ea7f5106fee7a7abd325dc502f5d4c71f23dd9dbdedd8d6b604c8d23d718b0ced235d5423e9d7cd27f68eed9a000fb7fd145a8032c502c5c34f25a25f3623522cb61dfe8324b76923000735fe019c997a85207fbfce66b0d1c3ddff4dd70294e92a7e03dd6dc6b7baeb92fb86830952b8478c01083913443efda2451a80891be4f3d0eab4d6fa49b74cdd024af6d7229b7b70f43e60878823b0a015f91a885240c07e83cd01c7700b16507e7467479a275f921b608086c9db4425030dd023e01b83dde93cf493c9fee3e606ae8e1f7a0860042538569e0aad6002f822e0db249842b4bbee3ffce91098d414f054e98a50240e00221040dbfeb1ee3f7cfe10e0088a7403a210d20c7a0482e8c5e09cfdf087a06268216185be41ba4e8f40104e38088e10c04ad3774814aad401d4d972067a267d04a71c2128103f85210281d88ea2045bb8a71b28d0231cb2681330832360dbaca786031d7084c0d4f2c41088c2f9b50906283402f53b83e14856038620c94fe410d0bf93120c10320cf29d714610b2cfaaac28cba798d3805e062a0b083000dbe3bcbce2876728a7f8f76862c053b78872a5ac5f9f930d1cea866910d0ebf65fe50f8679d40f3f9937dca3f93564109f651a26c7042c4dd32ccb2a954e4e4e0a40ad562b02df5cae3c8e4fabd5cbe301b3e7c8b71d36caa0764014718fe65a50e483cba3cb8b8beae9f195073ea208c0230b00082895408aa67db5881300c41040b976cbfb0dd8b8fc59148e787348ff9c1705457d265e29a2a2a52fb401711a21ffe2d83ef9b8fcb3872582d7dc81df82a2be81d159f029c292bcffa185f7d063c79e51cf5cf9b8f9be3709a005582465c6406e41b74f09e173454c4bd661f6b47c36f6e4fb11710abf54353cf1a0782f92f85446e0c0050f7f30ca06dc33fee35a483f87d10322abb94fd60f4f1f0e1c8fc1389d41f90b2e69b339d7037290163e196cf9e1d8e53583bf53ae3a43d9dc9b4b0eab76497e03a2bdd702c46cc7720000000049454e44ae426082	image/png	\N	\N
3	Gloves interface	Integration	hard Arkansas	2022-03-31 21:17:23	2022-03-31 21:37:27	transmitter	Mississippi Granite strategize	\\x89504e470d0a1a0a0000000d49484452000000c0000000c0080300000065029c35000002fd504c5445000000cbaaa34b566cac9983baa78bb59885b08e7eb0907eb59584b08f7eb39282b19180b19180b1907fbc9986b99684b1907eb09080b59382b79685ae8d7cb08f7eb08f7eb1907eac8b7db49382b1907fb08f7ec6a18db29180b1907fb39282797277c9a38fd3ac97c29d8ab1907fb29281ad8b7ad8b09acea793b19080bf9b88ab8977aa8775c0a293ccb1a2d1b6a8d6bbadb99a8ac7aa9be5cdc0efd8ccf3ddd1f6e2d7f8e4d8f0dacedcc2b5bc9e8ee0c7baeed6caf5e0d4f8e3d6f6e1d5f4dfd3f2dcd0caad9febd4c7f4ded1e3cabdceb3a5e8d0c4d8bfb1c4a798fae5d9a88472f4dfd4fae3d5f1ded4f9e2d4d4ccd095abcb81a0c9a3b2cce6d7d2cfcad08aa4caebd9ce4189c60080c52083c51b82c52684c52e85c6007cc27b9eca4d8cc6478ac64a8bc60282c5cac6cf1181c44088c6aeb7ccacbfd8b5c9e1b2bacd6f99c8bdbfcefce5d5fdf7f4fffffffefdfdfff1e5fbf1ebfcf4efe7cbbe0981c5fae8defefbf8ebcfc3eed3c6f9fafbf9ece5ecd0c3dfe0e19292936c6f77d5d5d7f0f2f4aaaaab7d8186bfbec0eccfc2ebcfc2fadccef5d8cac7c5c7000000e8e8e9454545989b9ceed2c5eccfc2393939b5b6b8cbcccdebcfc2a3a4a4ebcfc2878d903c88c66294c7a9a7a64a4d599d9e9e535866ebcfc1edd5c7ebcfc3939799ebcfc2eacec2eccfc2ead0c3558fc7e6d4cc9caccbcabfba3884c1418ccb4189c6397eb8d2b9abacb1c84591d13982bf4189c64189c6c1a293bd9f8e3f6389f6e1d4f2ddd0f6e1d4decec5bdb6b1d5c8c08e9496b2afad9c9d9d979b9c464c5d484f5f4b556a474e60474e60d7d7da313c53484f60495061495061495061484f60495060494f614950614950613e465a585e6d4d55674a5264495061494f6148516349506149506124324c484f61485061132746495061484f61001a40465771406085406a9508598d7d9abedbe4ee226fa85081b13f77ac3373aa3373aa3679b30063a3007ac14082bb4761827194bb6c9dcf396fa1c6d3e40171b03372aa3374ab3678b13273aa4188c63372aa3272aa4189c64188c64089c69cd9201a000000ff74524e530003030205184270868f569be0ffffffe733fffffffbfda82564bffffffff17a0bffffffcbb6ffffffd6ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff69ffffff482effffc7fffffffffffffffebe7ffffffffffffffffffaffffffffffafffffffffffffffa011d6ffe7d1e08cffffffff6ffffb28dad9ff48eb842e4415dd9fa6fffffffffface037557da6d4e1fbddb29175462768befffffffffff9896183fcff71c9fff09bfffffffffffffffffffffefffffffffffffffffffffff2839fb7d0d45cb5dfde6f838fea0000193f494441547801d497d176b23a108583001635131b6762eb402b5025f2fe0f7816b3385d14e1ffcfcd01ba6f58e4eadbccde1355ffb3824def258c42f59bd401c7c9f6254dd3975ddc9efc2afc967eb73f681099e3fe55a920fc4d1f3fd91f2c9c10ad25226781ce6f4a45eb040e225110ca8b7cfcf70bc389094d965966d68e72f8f8bcae700861d4afea46f85ed38331da11daa2ac1859e4c8c257b2b6210441eb214e76dbed2e89852d7ebf1158470eb12a4b73e76f3932fcb9260752d5eb2efd3ab235c6eae3d7394d2f470b39116bcc8bdae7a8b927cae1f6b69e18054a5db70f0bc60aa5b606a07d21c7cc98fb017f2be7e098a8701d0e22a5760f308e9c732c708e8884bee3b7a879283ae9ad785f7ef5a8f87c328ef887102ccab3a84bf3cc2f313abd88fbc5e3931c80698088799663fbaceaba417e162213c33952d1e2f1d96a43cf7c4d26fca7b22e700c1fa0cd5a735bd481f0ef41d3086151ddbb00591cc1f7991c135c167510a9e80cec46f8ad6f01d19475854ff8c69715cab1a3456710a9f802e4f859f7cc23cb00bcc6a776d4fe74e74ed49ca5480bf17f01f18850976d82d096c30623425967dc3b74902a152ec4ff18e7676c24f9580d06a0516775d960ffcc39b35561b82a7e465fb4fcec070d40eb6b3f2cb5d3f65d452bca8f74d74885072b48e2a39107224bc9ec0e02155da6f8190bdf5d62d90ffe6a189f6f07c7b7591d48e9ce407a82df968d60fada60afbe592d831911c1e33aaf838dfa04c713ba57a546f1e1f907bfc47fc2c14da9cd9c0548584f1a409fdd25f1fd0a635617adad4907e98cab68a3ae0f4393fcb64d8a205becf167883c29a74f33aea240bd00f194d0f85c0c783fc13f2697bbd956d146bd7d58376da029843f2f25493cd847532273885534d306da03f11f0c54f87d198810fece2fbf4ce72972a05e29777f32d020b3be375e4a2b56fe033febb98a1ca8747a00c20b28cbb4e8f8755920f2dfe5b4dda96806fef8681d4f0bad18c0ace90c78dfe3d7b96e956b7e16d98f196ee4486dcd34bfb4d7c82333d8fd35d0f82f7ccefff0661eeaaddb3a00cebab713c73d127a963e76971da46dc992492f0e6f3bf1fb3f4f29d19667b758642748825fc42665bc120a70330ceeef1e8387f087eb1a00a5d416b52a8bbf275827d54a2541ce316e77ba699a7632ce006e107c7c0d103c87024990324631f19e81718c09c22b7f1cdf4658594f398b7b695ef485742206c311bb46780349e86a707ff7bef5e6ecff12e4341ab5dba3c8d98825034415974f492d2c1d87d3ac339e282d8551d6891272ea102881cb6ae0dabafbe06de8d9f3e7301bcf078bfe60beecb609e70850198f5540b792cafad57220a450b614e5c47d300e21e3486e344521015c1b149f0000b2de5a486d9c68a9ed7cb38d182fbd0908010064de7a2d8537fd2825c220050610da89fea08a01d2d468650fe220d47c38cb12c639638cb364543f7b7525d60abdde72847327faf018f00c9e2e42806da439b1cd31947e3e580fbb9dde76b6daaca7faa6f5b5beb42952727606ad907de9d359230abcabd585713e42a534aa6429f1acfa03b1462e6346ced6d601e3d81ded8fc72a4058bb6f6e995785aa319ee64fc45a391f9d11b83d4b4080a75fea3a0c98ace5e20f2cb3ea2f8995939ac047c10f4fa1a2e0e1ee7f9fd7658c3807b2aa01e9cb794ce13411bd0e75044f274908683c115635210bb94484e03ee4a779026f0e0790367200de8bba9c9c15b3f00080d1bc390031c8289cb474e1003e8dea143a13caaac68e60c3e13f71a1f70780848ea5554d8915933a8e217193d97da82cf4517c08e16c20ac6a4e4c8fd54710fd3f14c0fdddd72d7f194cf8ca4740081f0a0fe08435e7413e938e69bde3faf2757000a071211a3d01bd26081e20722bae87400087899ef09e528d028822a3709cca1e83ad24e27d12dd34ea41ca2abb65e4d00b3d3880b06914316f164059dde57b8057eee6f5316c21bb1d02d6c962f1e75d68a975a567e59841e8b1b86e25806dadb197cdb3115aca6729cc1f30f879e7d9bd68bfa0389ec03c42f037c75fdfdd8706b8a802d51066a6c53c1f8f9793be96e6364235a5a9221f3bb575313552d78ad6f4dbfb2070771d0fe100a06ae6d8509e4ec25a0ff274368a23a40ca37637ef3b845be64be3f6163132c6288947b3349f4a616d1d0410faaac3cd035f110780343fce62e56ea19b51ce29454c2041c6b13d9ccaab346b85c86791d34300a74629e7384a277b452b97147d1d0bb7e2bdf71319603c17f6d80aaf124e936a0fe4b7a024616c3416170456171de44848a9e5f588838d37cad89396fa4df485ab6301f75a2d07c046f5346fc5a4cdf168948720c0586ace08ac988f5ebc227835af882f2b5b295adde1107024f6008f3f54005beb8d2bdff75e08ec8d47a4b47410bf321d1e03dd07a953f48bde52b03eb0175f14ad1cd3c39df163d8b50ae12b713800b9c6a4348b00650c63270967401c01db567cc766a7b41d1c18c65996c5c0fc2a3821b46d8dadbb8937adcfbcfd01ef97084fa53d7491394348aaedf96c984f8a62926fda9c3aa4978e386f76220e4e2feae6c5603028d6c3d97e8dfa520138112b4eca792ce866eeeb0a60238fe97bc628c3ac379c08298513f93c4d33a46c3417e731308e29c6b3b5d7125a9af9b0972594c66351e7a10442af16ffef9e911f276b025797f24249b1ebdb4afac69585f1f26262dbed4491e713a3ed416d27a41aacddf7c4e14f4d478c00845c4fdf571734484e1612d63c3bd1a61c0bf7a2942ebfa5cc6e77b45f55dfd5a6d6aa7e434bf73dbb3b36746fca9bbefb80f703f7ee8aec7427fa1bade6f59d38b284711ceedd7dd99c779f37e720d8405b3d67274f0b81a304c8460267131c09ce3903e33439a77f73bbba918c35c26ffd3990be03f5a3aa54dd3a228a1c6a24a2a80ec13936cc6dec88f0c5c71fd031d0e21347005d0c27a56b226a38d2de501d9d3681dad57d8ead87db3042d7be7f5bdc18003543137c75c96e01a284353d1a8b1b1e8ac7a2bd7d2195305b97416d46235b7748e60481bfbea7d761b608bed4e6fd5fedcd00416a444f98565c4feaf4b7974b4f26752ac3322d3da510b0a16e6a33a3cce6f86c9b65ea5d60e3a3808e01672121685fffbe7380278874f75b0346f720d3d030d3087fd417d7ace4080390437dd153db08b70df147a371d3ec1f031b6fe3f7df140b00eb39673b09007aa23f42d28aa25ecf64b972e30a55baa72f9ed01d8058a2bf43069b3291abf926d32ab5758e1a89e429c095b761372096604a91eb32309dd053e9109166f2347410844630c1e931bd1ec08a85a9eda24c316d5fc62f51dba05e0720a39fe0bca25880023a0b304d0bfd6280060441c1bf5c761223a2b800e2618560c4e3afd9f27e4c94110700e40f16c402b434f98a521bae0748a6d22c3088ab44e3038cd98b9e001727f8eba51cb74d5e7401e0365cf4b50a9d03bec21c426e0069960534bfb0b8b0c4eee511f60090fc2cf0e595c5d5b5122398915c1940d27a013e465cfc1b9b5b12426e8049f8feb77740dbb5c8580f0caa84aa0690bec03877f7c0b69f03df841b4096368353c200a001b6ca950bb23b03721ebed8fdc56a756f676f9747566b621a1352ed0c4cc24b3717f7aa7bd59d03b89fc1ae1292ffac940f8bbe26610998dbac1cfee1065068694061975677aad59d25886c52525806d81288c01c00800c7d2957caaeec50d023485a9eb833f0c76165f3585411b5fa0a875441843c0040276701cc5bb7dbb912b7340ec0b40600773c0150f0f0b05c11958226da0115fa01d8dd037e28a1d2dac21e0deceeb25342a666c4a24cb74ccd29a1a57bf7a184c2ee12e22ad36f686bcad72aa8828e01e0109ac0a3890f764007bc8939806672699a76dac477c17694f56ce28b8787b4861e88c94093efe1a32d00f85376650022a39a3f3a399a67f7f2325600e0569cc9b8a5b10c04f861f4e6c9e3839cc7611436650c605d481300c0130610445e832ccba2e3e283cc8a46c25da0d4a861f241e6d83c071996ff0080adb9565f934880327601908b332c261be174299156d2f4576eaf2d25e48c6d035fdeef02801e0680a70f85024013b800904dc0e2cfc836c0a00a0751543b8c1284fd1930705b7ee6227201e0b2e00c3ce3007c1238004a881029e02ca727b0444848b10799b39460363291abd926fdcce600f01610d803f09eeb9b0ca07c5a4249a813555515559d99cce7f399f1ebec8192ee38b316a251dab6890cb54dcc709b1299e6004e0bb0a3508ba039f09c031c5eac03b8f562ac93e9e54bf6bf936b44bb65d50318b7539d5c676c83b7062c0070a680b8390000c543fe117fcad8d9526a46fcc5eb4ac46f9dd952529be1658b529bb3a5bcc812107c22a6877d7079ff039e8220e2523b7a13a665dd7a5d039665697cb74e901c69684bd0a763d0df6c25c72b6883c72fb28dcb1711a6226ae7a83eadebd31ed2e90baf0882c8a8ed76035b126c1dd402ef8782bc855b8401c07adaaea1b640a00d63b573e45543a5e07c0f889c67eb481199c055b06d08e22f3f298a3cb768f77190fcf3f3d57f03325615556928889f899c6b4304a3ff98b90aded88d201c50856f0af65e04d696bb855d1ff9c53edb39dbb93b1f561597b9c28aca2c2c9323a98ce2f63133fcb766ecbb0d7495e7427cfede0bd37cbb33a6f9be715af5fe4056f0beba283f40064917265cab47782cdf035b0f77f74214056dd713937a921e421796f7d7c2f1eec6dac6378945b18dd43ce844ff4173f0f0acfdda1d71461a56927cba7515b19f65906c243e458dba680c90c17f54aa84432a0cca3bc9472f1f7a5726d03e96c11b9b37c6712a72a31c7ca99fce2fd78d76880c5a9dd4475019fef9d293cf1c2ec40af7c6c6a79fd6536500256c2819448113b4b7b093cdf60fec40f6c1513b2d0008f0bb3f7fe987178e1c3db6b0540083777ffbe078663301c2ebb39eb66dd5ac702be210e51c928b1d6ef5c6adaa1f8651a6fdb632f53a90e3279e7ee1e8d193a70af0f32d6399fd3ef5728021320651e09309f165f7c95e5db751f681089df060cf8eb65ac6acda0b238c3fa60ce3afd0ca4da74e1e397af2f4b1620c89cb0b688a868c01af07ed081fee734d34c3593ac59e598d7b4e80ee9475bfa337d7ed682612257452b3317e9f309ae9b436fbdb678e3e7e1a37a02057f459147e4c190c8354394961d6de8e1c8b082698e976d75bdda1c7059974a65f0a5b1ea78458c1aae3b3990d483bb7f92b8f9d3a5fa4b15e1a9a802083f60809643b906e074d651f9ae751ce510c225c272310999c82e8db8e4f08cc84725313df7281c6f473da3637903b46a500642a8408951be9d252837046804e856ac12aee424a809b8e05b3f55fc9fa1a4b4b05e5cf56cb5532e0fe9a410c10f531cae1c63e93e4b6a429a263a31dcb6ea73bd01ce88c6e19678a587b85ab4f1a5218ade904852c2d2708c603a9e5de0ee0b52808ecc0479b1cf11a1ca6eb2f75720513f8fd41adb29545593a306f38180c55f123b839746bcd4ca44bf0b514eb164c404a3f56403230888160c2a03bdc6d80907b20b81064f61353e006143f5e452ad07601801090b165ea38460ca9e5425bb1c4fc36404ef850d8d33154c84018679aaeeb746ad83554a8e4a880a2fde98433c638472151dd8fe3d8afd79a1e659c28ade807e43d4049b6c0200dcff3cc51a7e65a89c4377ebda929184889d3bcaae0ef0c8099df2030eaedf8cca5924001cebd9c827c7920da0ed6fc46c62e91b8caa36b11d318f67657569407fc781783e49b3a55c49f5f66b96f8afc5b0c0580eb354ba610bee39a8c28e287cad9796d8094922aeb18086f748671462076fb26e10618c54f62c8735f50a14a06c038d13d73139e4e3853cfbc94e7b0f96149babc55e76496417d0e932ad1b9625151c7123085a1048e00986b05cb3b1b54c3fe0bac00bdad0cc383973189c0c881b255b04ca24539f62f1ff20f2229ee098556f91709746efe09244f67baf10f194029124836cff0e62c7f21cfff1a423dfb4ccd20ff5cb63917f27d0fe53f14e140ad795e03a92708dff7d00ae48f5f1670991818f9184045bbf51c3e892b1b83df8fe3b3f21b82ae1807ca953ff241d7058b0ab801056a70ee5f5c585a2e2581570723cef7a00018be19bf7a6961b99c04deb223b7c105515d80025060829b6ecf2e3181d5d069f923c0c787b08d45f6904b08bd6a05e370bdc404822074c641d76d6a99411752188c0bce1ad5b8f5c8e5cb8f854179098c0f1d3a74e5caa143571f3be8d79a0d9df01444f73ac341affdc7a19fae5dfbf6cad5b74a4be0d0f7d7527c7fdd1e07edd69ae5fbaeebfad6dabaedfcc5cc59e8386e75713ccae87b874f9c8728b771a6528465cc532c330e1623172d4b195bd515458be205d340c378b3f73a9c745ea5e7387193eb1de6ffeeb0e1f7bb70064f120f52c4b635053eecac86426752e0a93c8e663f9066a3d831398a1493129a4d88669b16810f8340e80c0afc6f4d231a314d7846b4b4343b95374180801931628bb6ac9ccd19000179d1d0ac079a018bc58c453f161aa21d5b966dc7b02c1038b333400c43351ea8964160acc507f089790286a5251c1b04c2e1b3c41e9e0943427fad2986a31a96aaa51d623b4253fdac64dab29d7a27b5645928000943664edf03c9c7f9ffdaa205dbf781ada58116768120f000042cc930d2b3297975fd5924340aba9f3efcb3f58dbf33d9dc3de5812c6b1ac14d40b48420f0894588f24ec2481b1f5a24b99c2f144be54a35e25fe8e4f7348cdc98bd56aa17a89e9f83d681f9078e4a888ab5d22ba4d30206b1ada862c3da4a24e148da78c5b89bad375b6071e2123e7ca55d2c7418635cefce25f16fd2bf361ea414132720f5664c1090d2b26cc13292e5fb49ec059a771b8c72c6d022535e7f361a9499935b3891f55eb14019e3b4d371597e0ea8f0dfe7b046ac1416a14f7c7ebfc10a469f00bffa93f707f838071c4eed500e1ab490a955c3dec54f64f0239552dff5e0219472da981fb7652c389a829f711dfc9b4421b1b429c3d6569751d4ebb9e9728af1ae01126ebfbd1e396687196f902aa52c658c765c84c7b0c122128d0c149540f0b3402092040aaa73db53c567a4cbe83838153811d9e6faa82e1f1f7eb5dca78c233d9da471cfa3f2b8928aa6680f625b3ebad05b86b93039f21b9882a9e02519ebf47bd5e35140fc702533648ce29c4f05760062f95c97138984ff758468f07154ba317560f2554330c0894087e13f95a35740fc48adcf19477831fa40469effc0ae44a5e8d6895f993eeef6529ed160c081335a6f458e5601f09ff5b2706561e5f8029b8bc83321bbf3e636fc972f4c027bd99e6c02712d51c6b33554383afc70ade0151dba45f4c1ef17c45c8f6fc90ffd728281b3a9d32de3ada46c0bef7b44fc1b7d61ed886103e83f14d9dedec2207efd4240e0f7a080e0c058bf72140670856a8633c4dfb300b6cbbfce1f90bc78613128202a504633550038347f6dc8e06adb8737e6ee050dce470306f1b76e0427609ead704a775618b600e170fccf8a8cbb74c730f84a286870455c44d06e19e44fea6211da723b73967976188399d07a415c3d5b46ef2edd0e1a5c8e070a68907f2e2f2ea0edb642761d0c0eccbfd1612edd3dfa80800164cae24e7ceb023a3a6c61aeabd3bdc465ee06801c90bf45f95ef85756f44df9b68fe7835e8fbf5e40fd8f2e2c0df49515be27034e5b073308873628effc5bcc19ed24ae4561b8a7be086f727c86731243941125b1813bafb9e3294c7c035a922209f72a4d465469d2324a6824c808d25d409501509dc9acae8e0152a6ac2d177ef1c61bfbff7badff8764c752f4d76f1a8defb7f1443335f13055a6504053e692a96622116dddb51bf57d9de8e048103fa2ffb04c3a7ffdc6668c391de06e2dd14c4efee1f65f74e0beb804f0d43713ff6d6d74bb1119e8dd531d94b97380fda319a4fdb96148bbdd66ad4ea7f5106fee7a7abd325dc502f5d4c71f23dd9dbdedd8d6b604c8d23d718b0ced235d5423e9d7cd27f68eed9a000fb7fd145a8032c502c5c34f25a25f3623522cb61dfe8324b76923000735fe019c997a85207fbfce66b0d1c3ddff4dd70294e92a7e03dd6dc6b7baeb92fb86830952b8478c01083913443efda2451a80891be4f3d0eab4d6fa49b74cdd024af6d7229b7b70f43e60878823b0a015f91a885240c07e83cd01c7700b16507e7467479a275f921b608086c9db4425030dd023e01b83dde93cf493c9fee3e606ae8e1f7a0860042538569e0aad6002f822e0db249842b4bbee3ffce91098d414f054e98a50240e00221040dbfeb1ee3f7cfe10e0088a7403a210d20c7a0482e8c5e09cfdf087a06268216185be41ba4e8f40104e38088e10c04ad3774814aad401d4d972067a267d04a71c2128103f85210281d88ea2045bb8a71b28d0231cb2681330832360dbaca786031d7084c0d4f2c41088c2f9b50906283402f53b83e14856038620c94fe410d0bf93120c10320cf29d714610b2cfaaac28cba798d3805e062a0b083000dbe3bcbce2876728a7f8f76862c053b78872a5ac5f9f930d1cea866910d0ebf65fe50f8679d40f3f9937dca3f93564109f651a26c7042c4dd32ccb2a954e4e4e0a40ad562b02df5cae3c8e4fabd5cbe301b3e7c8b71d36caa0764014718fe65a50e483cba3cb8b8beae9f195073ea208c0230b00082895408aa67db5881300c41040b976cbfb0dd8b8fc59148e787348ff9c1705457d265e29a2a2a52fb401711a21ffe2d83ef9b8fcb3872582d7dc81df82a2be81d159f029c292bcffa185f7d063c79e51cf5cf9b8f9be3709a005582465c6406e41b74f09e173454c4bd661f6b47c36f6e4fb11710abf54353cf1a0782f92f85446e0c0050f7f30ca06dc33fee35a483f87d10322abb94fd60f4f1f0e1c8fc1389d41f90b2e69b339d7037290163e196cf9e1d8e53583bf53ae3a43d9dc9b4b0eab76497e03a2bdd702c46cc7720000000049454e44ae426082	image/png	\N	\N
4	driver	Toys	morph	2022-03-31 06:30:38	2022-04-01 05:51:33	Station array invoice	Tools out-of-the-box embrace	\\x89504e470d0a1a0a0000000d49484452000000c0000000c0080300000065029c35000002fd504c5445000000cbaaa34b566cac9983baa78bb59885b08e7eb0907eb59584b08f7eb39282b19180b19180b1907fbc9986b99684b1907eb09080b59382b79685ae8d7cb08f7eb08f7eb1907eac8b7db49382b1907fb08f7ec6a18db29180b1907fb39282797277c9a38fd3ac97c29d8ab1907fb29281ad8b7ad8b09acea793b19080bf9b88ab8977aa8775c0a293ccb1a2d1b6a8d6bbadb99a8ac7aa9be5cdc0efd8ccf3ddd1f6e2d7f8e4d8f0dacedcc2b5bc9e8ee0c7baeed6caf5e0d4f8e3d6f6e1d5f4dfd3f2dcd0caad9febd4c7f4ded1e3cabdceb3a5e8d0c4d8bfb1c4a798fae5d9a88472f4dfd4fae3d5f1ded4f9e2d4d4ccd095abcb81a0c9a3b2cce6d7d2cfcad08aa4caebd9ce4189c60080c52083c51b82c52684c52e85c6007cc27b9eca4d8cc6478ac64a8bc60282c5cac6cf1181c44088c6aeb7ccacbfd8b5c9e1b2bacd6f99c8bdbfcefce5d5fdf7f4fffffffefdfdfff1e5fbf1ebfcf4efe7cbbe0981c5fae8defefbf8ebcfc3eed3c6f9fafbf9ece5ecd0c3dfe0e19292936c6f77d5d5d7f0f2f4aaaaab7d8186bfbec0eccfc2ebcfc2fadccef5d8cac7c5c7000000e8e8e9454545989b9ceed2c5eccfc2393939b5b6b8cbcccdebcfc2a3a4a4ebcfc2878d903c88c66294c7a9a7a64a4d599d9e9e535866ebcfc1edd5c7ebcfc3939799ebcfc2eacec2eccfc2ead0c3558fc7e6d4cc9caccbcabfba3884c1418ccb4189c6397eb8d2b9abacb1c84591d13982bf4189c64189c6c1a293bd9f8e3f6389f6e1d4f2ddd0f6e1d4decec5bdb6b1d5c8c08e9496b2afad9c9d9d979b9c464c5d484f5f4b556a474e60474e60d7d7da313c53484f60495061495061495061484f60495060494f614950614950613e465a585e6d4d55674a5264495061494f6148516349506149506124324c484f61485061132746495061484f61001a40465771406085406a9508598d7d9abedbe4ee226fa85081b13f77ac3373aa3373aa3679b30063a3007ac14082bb4761827194bb6c9dcf396fa1c6d3e40171b03372aa3374ab3678b13273aa4188c63372aa3272aa4189c64188c64089c69cd9201a000000ff74524e530003030205184270868f569be0ffffffe733fffffffbfda82564bffffffff17a0bffffffcbb6ffffffd6ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff69ffffff482effffc7fffffffffffffffebe7ffffffffffffffffffaffffffffffafffffffffffffffa011d6ffe7d1e08cffffffff6ffffb28dad9ff48eb842e4415dd9fa6fffffffffface037557da6d4e1fbddb29175462768befffffffffff9896183fcff71c9fff09bfffffffffffffffffffffefffffffffffffffffffffff2839fb7d0d45cb5dfde6f838fea0000193f494441547801d497d176b23a108583001635131b6762eb402b5025f2fe0f7816b3385d14e1ffcfcd01ba6f58e4eadbccde1355ffb3824def258c42f59bd401c7c9f6254dd3975ddc9efc2afc967eb73f681099e3fe55a920fc4d1f3fd91f2c9c10ad25226781ce6f4a45eb040e225110ca8b7cfcf70bc389094d965966d68e72f8f8bcae700861d4afea46f85ed38331da11daa2ac1859e4c8c257b2b6210441eb214e76dbed2e89852d7ebf1158470eb12a4b73e76f3932fcb9260752d5eb2efd3ab235c6eae3d7394d2f470b39116bcc8bdae7a8b927cae1f6b69e18054a5db70f0bc60aa5b606a07d21c7cc98fb017f2be7e098a8701d0e22a5760f308e9c732c708e8884bee3b7a879283ae9ad785f7ef5a8f87c328ef887102ccab3a84bf3cc2f313abd88fbc5e3931c80698088799663fbaceaba417e162213c33952d1e2f1d96a43cf7c4d26fca7b22e700c1fa0cd5a735bd481f0ef41d3086151ddbb00591cc1f7991c135c167510a9e80cec46f8ad6f01d19475854ff8c69715cab1a3456710a9f802e4f859f7cc23cb00bcc6a776d4fe74e74ed49ca5480bf17f01f18850976d82d096c30623425967dc3b74902a152ec4ff18e7676c24f9580d06a0516775d960ffcc39b35561b82a7e465fb4fcec070d40eb6b3f2cb5d3f65d452bca8f74d74885072b48e2a39107224bc9ec0e02155da6f8190bdf5d62d90ffe6a189f6f07c7b7591d48e9ce407a82df968d60fada60afbe592d831911c1e33aaf838dfa04c713ba57a546f1e1f907bfc47fc2c14da9cd9c0548584f1a409fdd25f1fd0a635617adad4907e98cab68a3ae0f4393fcb64d8a205becf167883c29a74f33aea240bd00f194d0f85c0c783fc13f2697bbd956d146bd7d58376da029843f2f25493cd847532273885534d306da03f11f0c54f87d198810fece2fbf4ce72972a05e29777f32d020b3be375e4a2b56fe033febb98a1ca8747a00c20b28cbb4e8f8755920f2dfe5b4dda96806fef8681d4f0bad18c0ace90c78dfe3d7b96e956b7e16d98f196ee4486dcd34bfb4d7c82333d8fd35d0f82f7ccefff0661eeaaddb3a00cebab713c73d127a963e76971da46dc992492f0e6f3bf1fb3f4f29d19667b758642748825fc42665bc120a70330ceeef1e8387f087eb1a00a5d416b52a8bbf275827d54a2541ce316e77ba699a7632ce006e107c7c0d103c87024990324631f19e81718c09c22b7f1cdf4658594f398b7b695ef485742206c311bb46780349e86a707ff7bef5e6ecff12e4341ab5dba3c8d98825034415974f492d2c1d87d3ac339e282d8551d6891272ea102881cb6ae0dabafbe06de8d9f3e7301bcf078bfe60beecb609e70850198f5540b792cafad57220a450b614e5c47d300e21e3486e344521015c1b149f0000b2de5a486d9c68a9ed7cb38d182fbd0908010064de7a2d8537fd2825c220050610da89fea08a01d2d468650fe220d47c38cb12c639638cb364543f7b7525d60abdde72847327faf018f00c9e2e42806da439b1cd31947e3e580fbb9dde76b6daaca7faa6f5b5beb42952727606ad907de9d359230abcabd585713e42a534aa6429f1acfa03b1462e6346ced6d601e3d81ded8fc72a4058bb6f6e995785aa319ee64fc45a391f9d11b83d4b4080a75fea3a0c98ace5e20f2cb3ea2f8995939ac047c10f4fa1a2e0e1ee7f9fd7658c3807b2aa01e9cb794ce13411bd0e75044f274908683c115635210bb94484e03ee4a779026f0e0790367200de8bba9c9c15b3f00080d1bc390031c8289cb474e1003e8dea143a13caaac68e60c3e13f71a1f70780848ea5554d8915933a8e217193d97da82cf4517c08e16c20ac6a4e4c8fd54710fd3f14c0fdddd72d7f194cf8ca4740081f0a0fe08435e7413e938e69bde3faf2757000a071211a3d01bd26081e20722bae87400087899ef09e528d028822a3709cca1e83ad24e27d12dd34ea41ca2abb65e4d00b3d3880b06914316f164059dde57b8057eee6f5316c21bb1d02d6c962f1e75d68a975a567e59841e8b1b86e25806dadb197cdb3115aca6729cc1f30f879e7d9bd68bfa0389ec03c42f037c75fdfdd8706b8a802d51066a6c53c1f8f9793be96e6364235a5a9221f3bb575313552d78ad6f4dbfb2070771d0fe100a06ae6d8509e4ec25a0ff274368a23a40ca37637ef3b845be64be3f6163132c6288947b3349f4a616d1d0410faaac3cd035f110780343fce62e56ea19b51ce29454c2041c6b13d9ccaab346b85c86791d34300a74629e7384a277b452b97147d1d0bb7e2bdf71319603c17f6d80aaf124e936a0fe4b7a024616c3416170456171de44848a9e5f588838d37cad89396fa4df485ab6301f75a2d07c046f5346fc5a4cdf168948720c0586ace08ac988f5ebc227835af882f2b5b295adde1107024f6008f3f54005beb8d2bdff75e08ec8d47a4b47410bf321d1e03dd07a953f48bde52b03eb0175f14ad1cd3c39df163d8b50ae12b713800b9c6a4348b00650c63270967401c01db567cc766a7b41d1c18c65996c5c0fc2a3821b46d8dadbb8937adcfbcfd01ef97084fa53d7491394348aaedf96c984f8a62926fda9c3aa4978e386f76220e4e2feae6c5603028d6c3d97e8dfa520138112b4eca792ce866eeeb0a60238fe97bc628c3ac379c08298513f93c4d33a46c3417e731308e29c6b3b5d7125a9af9b0972594c66351e7a10442af16ffef9e911f276b025797f24249b1ebdb4afac69585f1f26262dbed4491e713a3ed416d27a41aacddf7c4e14f4d478c00845c4fdf571734484e1612d63c3bd1a61c0bf7a2942ebfa5cc6e77b45f55dfd5a6d6aa7e434bf73dbb3b36746fca9bbefb80f703f7ee8aec7427fa1bade6f59d38b284711ceedd7dd99c779f37e720d8405b3d67274f0b81a304c8460267131c09ce3903e33439a77f73bbba918c35c26ffd3990be03f5a3aa54dd3a228a1c6a24a2a80ec13936cc6dec88f0c5c71fd031d0e21347005d0c27a56b226a38d2de501d9d3681dad57d8ead87db3042d7be7f5bdc18003543137c75c96e01a284353d1a8b1b1e8ac7a2bd7d2195305b97416d46235b7748e60481bfbea7d761b608bed4e6fd5fedcd00416a444f98565c4feaf4b7974b4f26752ac3322d3da510b0a16e6a33a3cce6f86c9b65ea5d60e3a3808e01672121685fffbe7380278874f75b0346f720d3d030d3087fd417d7ace4080390437dd153db08b70df147a371d3ec1f031b6fe3f7df140b00eb39673b09007aa23f42d28aa25ecf64b972e30a55baa72f9ed01d8058a2bf43069b3291abf926d32ab5758e1a89e429c095b761372096604a91eb32309dd053e9109166f2347410844630c1e931bd1ec08a85a9eda24c316d5fc62f51dba05e0720a39fe0bca25880023a0b304d0bfd6280060441c1bf5c761223a2b800e2618560c4e3afd9f27e4c94110700e40f16c402b434f98a521bae0748a6d22c3088ab44e3038cd98b9e001727f8eba51cb74d5e7401e0365cf4b50a9d03bec21c426e0069960534bfb0b8b0c4eee511f60090fc2cf0e595c5d5b5122398915c1940d27a013e465cfc1b9b5b12426e8049f8feb77740dbb5c8580f0caa84aa0690bec03877f7c0b69f03df841b4096368353c200a001b6ca950bb23b03721ebed8fdc56a756f676f9747566b621a1352ed0c4cc24b3717f7aa7bd59d03b89fc1ae1292ffac940f8bbe26610998dbac1cfee1065068694061975677aad59d25886c52525806d81288c01c00800c7d2957caaeec50d023485a9eb833f0c76165f3585411b5fa0a875441843c0040276701cc5bb7dbb912b7340ec0b40600773c0150f0f0b05c11958226da0115fa01d8dd037e28a1d2dac21e0deceeb25342a666c4a24cb74ccd29a1a57bf7a184c2ee12e22ad36f686bcad72aa8828e01e0109ac0a3890f764007bc8939806672699a76dac477c17694f56ce28b8787b4861e88c94093efe1a32d00f85376650022a39a3f3a399a67f7f2325600e0569cc9b8a5b10c04f861f4e6c9e3839cc7611436650c605d481300c0130610445e832ccba2e3e283cc8a46c25da0d4a861f241e6d83c071996ff0080adb9565f934880327601908b332c261be174299156d2f4576eaf2d25e48c6d035fdeef02801e0680a70f85024013b800904dc0e2cfc836c0a00a0751543b8c1284fd1930705b7ee6227201e0b2e00c3ce3007c1238004a881029e02ca727b0444848b10799b39460363291abd926fdcce600f01610d803f09eeb9b0ca07c5a4249a813555515559d99cce7f399f1ebec8192ee38b316a251dab6890cb54dcc709b1299e6004e0bb0a3508ba039f09c031c5eac03b8f562ac93e9e54bf6bf936b44bb65d50318b7539d5c676c83b7062c0070a680b8390000c543fe117fcad8d9526a46fcc5eb4ac46f9dd952529be1658b529bb3a5bcc812107c22a6877d7079ff039e8220e2523b7a13a665dd7a5d039665697cb74e901c69684bd0a763d0df6c25c72b6883c72fb28dcb1711a6226ae7a83eadebd31ed2e90baf0882c8a8ed76035b126c1dd402ef8782bc855b8401c07adaaea1b640a00d63b573e45543a5e07c0f889c67eb481199c055b06d08e22f3f298a3cb768f77190fcf3f3d57f03325615556928889f899c6b4304a3ff98b90aded88d201c50856f0af65e04d696bb855d1ff9c53edb39dbb93b1f561597b9c28aca2c2c9323a98ce2f63133fcb766ecbb0d7495e7427cfede0bd37cbb33a6f9be715af5fe4056f0beba283f40064917265cab47782cdf035b0f77f74214056dd713937a921e421796f7d7c2f1eec6dac6378945b18dd43ce844ff4173f0f0acfdda1d71461a56927cba7515b19f65906c243e458dba680c90c17f54aa84432a0cca3bc9472f1f7a5726d03e96c11b9b37c6712a72a31c7ca99fce2fd78d76880c5a9dd4475019fef9d293cf1c2ec40af7c6c6a79fd6536500256c2819448113b4b7b093cdf60fec40f6c1513b2d0008f0bb3f7fe987178e1c3db6b0540083777ffbe078663301c2ebb39eb66dd5ac702be210e51c928b1d6ef5c6adaa1f8651a6fdb632f53a90e3279e7ee1e8d193a70af0f32d6399fd3ef5728021320651e09309f165f7c95e5db751f681089df060cf8eb65ac6acda0b238c3fa60ce3afd0ca4da74e1e397af2f4b1620c89cb0b688a868c01af07ed081fee734d34c3593ac59e598d7b4e80ee9475bfa337d7ed682612257452b3317e9f309ae9b436fbdb678e3e7e1a37a02057f459147e4c190c8354394961d6de8e1c8b082698e976d75bdda1c7059974a65f0a5b1ea78458c1aae3b3990d483bb7f92b8f9d3a5fa4b15e1a9a802083f60809643b906e074d651f9ae751ce510c225c272310999c82e8db8e4f08cc84725313df7281c6f473da3637903b46a500642a8408951be9d252837046804e856ac12aee424a809b8e05b3f55fc9fa1a4b4b05e5cf56cb5532e0fe9a410c10f531cae1c63e93e4b6a429a263a31dcb6ea73bd01ce88c6e19678a587b85ab4f1a5218ade904852c2d2708c603a9e5de0ee0b52808ecc0479b1cf11a1ca6eb2f75720513f8fd41adb29545593a306f38180c55f123b839746bcd4ca44bf0b514eb164c404a3f56403230888160c2a03bdc6d80907b20b81064f61353e006143f5e452ad07601801090b165ea38460ca9e5425bb1c4fc36404ef850d8d33154c84018679aaeeb746ad83554a8e4a880a2fde98433c638472151dd8fe3d8afd79a1e659c28ade807e43d4049b6c0200dcff3cc51a7e65a89c4377ebda929184889d3bcaae0ef0c8099df2030eaedf8cca5924001cebd9c827c7920da0ed6fc46c62e91b8caa36b11d318f67657569407fc781783e49b3a55c49f5f66b96f8afc5b0c0580eb354ba610bee39a8c28e287cad9796d8094922aeb18086f748671462076fb26e10618c54f62c8735f50a14a06c038d13d73139e4e3853cfbc94e7b0f96149babc55e76496417d0e932ad1b9625151c7123085a1048e00986b05cb3b1b54c3fe0bac00bdad0cc383973189c0c881b255b04ca24539f62f1ff20f2229ee098556f91709746efe09244f67baf10f194029124836cff0e62c7f21cfff1a423dfb4ccd20ff5cb63917f27d0fe53f14e140ad795e03a92708dff7d00ae48f5f1670991818f9184045bbf51c3e892b1b83df8fe3b3f21b82ae1807ca953ff241d7058b0ab801056a70ee5f5c585a2e2581570723cef7a00018be19bf7a6961b99c04deb223b7c105515d80025060829b6ecf2e3181d5d069f923c0c787b08d45f6904b08bd6a05e370bdc404822074c641d76d6a99411752188c0bce1ad5b8f5c8e5cb8f854179098c0f1d3a74e5caa143571f3be8d79a0d9df01444f73ac341affdc7a19fae5dfbf6cad5b74a4be0d0f7d7527c7fdd1e07edd69ae5fbaeebfad6dabaedfcc5cc59e8386e75713ccae87b874f9c8728b771a6528465cc532c330e1623172d4b195bd515458be205d340c378b3f73a9c745ea5e7387193eb1de6ffeeb0e1f7bb70064f120f52c4b635053eecac86426752e0a93c8e663f9066a3d831398a1493129a4d88669b16810f8340e80c0afc6f4d231a314d7846b4b4343b95374180801931628bb6ac9ccd19000179d1d0ac079a018bc58c453f161aa21d5b966dc7b02c1038b333400c43351ea8964160acc507f089790286a5251c1b04c2e1b3c41e9e0943427fad2986a31a96aaa51d623b4253fdac64dab29d7a27b5645928000943664edf03c9c7f9ffdaa205dbf781ada58116768120f000042cc930d2b3297975fd5924340aba9f3efcb3f58dbf33d9dc3de5812c6b1ac14d40b48420f0894588f24ec2481b1f5a24b99c2f144be54a35e25fe8e4f7348cdc98bd56aa17a89e9f83d681f9078e4a888ab5d22ba4d30206b1ada862c3da4a24e148da78c5b89bad375b6071e2123e7ca55d2c7418635cefce25f16fd2bf361ea414132720f5664c1090d2b26cc13292e5fb49ec059a771b8c72c6d022535e7f361a9499935b3891f55eb14019e3b4d371597e0ea8f0dfe7b046ac1416a14f7c7ebfc10a469f00bffa93f707f838071c4eed500e1ab490a955c3dec54f64f0239552dff5e0219472da981fb7652c389a829f711dfc9b4421b1b429c3d6569751d4ebb9e9728af1ae01126ebfbd1e396687196f902aa52c658c765c84c7b0c122128d0c149540f0b3402092040aaa73db53c567a4cbe83838153811d9e6faa82e1f1f7eb5dca78c233d9da471cfa3f2b8928aa6680f625b3ebad05b86b93039f21b9882a9e02519ebf47bd5e35140fc702533648ce29c4f05760062f95c97138984ff758468f07154ba317560f2554330c0894087e13f95a35740fc48adcf19477831fa40469effc0ae44a5e8d6895f993eeef6529ed160c081335a6f458e5601f09ff5b2706561e5f8029b8bc83321bbf3e636fc972f4c027bd99e6c02712d51c6b33554383afc70ade0151dba45f4c1ef17c45c8f6fc90ffd728281b3a9d32de3ada46c0bef7b44fc1b7d61ed886103e83f14d9dedec2207efd4240e0f7a080e0c058bf72140670856a8633c4dfb300b6cbbfce1f90bc78613128202a504633550038347f6dc8e06adb8737e6ee050dce470306f1b76e0427609ead704a775618b600e170fccf8a8cbb74c730f84a286870455c44d06e19e44fea6211da723b73967976188399d07a415c3d5b46ef2edd0e1a5c8e070a68907f2e2f2ea0edb642761d0c0eccbfd1612edd3dfa80800164cae24e7ceb023a3a6c61aeabd3bdc465ee06801c90bf45f95ef85756f44df9b68fe7835e8fbf5e40fd8f2e2c0df49515be27034e5b073308873628effc5bcc19ed24ae4561b8a7be086f727c86731243941125b1813bafb9e3294c7c035a922209f72a4d465469d2324a6824c808d25d409501509dc9acae8e0152a6ac2d177ef1c61bfbff7badff8764c752f4d76f1a8defb7f1443335f13055a6504053e692a96622116dddb51bf57d9de8e048103fa2ffb04c3a7ffdc6668c391de06e2dd14c4efee1f65f74e0beb804f0d43713ff6d6d74bb1119e8dd531d94b97380fda319a4fdb96148bbdd66ad4ea7f5106fee7a7abd325dc502f5d4c71f23dd9dbdedd8d6b604c8d23d718b0ced235d5423e9d7cd27f68eed9a000fb7fd145a8032c502c5c34f25a25f3623522cb61dfe8324b76923000735fe019c997a85207fbfce66b0d1c3ddff4dd70294e92a7e03dd6dc6b7baeb92fb86830952b8478c01083913443efda2451a80891be4f3d0eab4d6fa49b74cdd024af6d7229b7b70f43e60878823b0a015f91a885240c07e83cd01c7700b16507e7467479a275f921b608086c9db4425030dd023e01b83dde93cf493c9fee3e606ae8e1f7a0860042538569e0aad6002f822e0db249842b4bbee3ffce91098d414f054e98a50240e00221040dbfeb1ee3f7cfe10e0088a7403a210d20c7a0482e8c5e09cfdf087a06268216185be41ba4e8f40104e38088e10c04ad3774814aad401d4d972067a267d04a71c2128103f85210281d88ea2045bb8a71b28d0231cb2681330832360dbaca786031d7084c0d4f2c41088c2f9b50906283402f53b83e14856038620c94fe410d0bf93120c10320cf29d714610b2cfaaac28cba798d3805e062a0b083000dbe3bcbce2876728a7f8f76862c053b78872a5ac5f9f930d1cea866910d0ebf65fe50f8679d40f3f9937dca3f93564109f651a26c7042c4dd32ccb2a954e4e4e0a40ad562b02df5cae3c8e4fabd5cbe301b3e7c8b71d36caa0764014718fe65a50e483cba3cb8b8beae9f195073ea208c0230b00082895408aa67db5881300c41040b976cbfb0dd8b8fc59148e787348ff9c1705457d265e29a2a2a52fb401711a21ffe2d83ef9b8fcb3872582d7dc81df82a2be81d159f029c292bcffa185f7d063c79e51cf5cf9b8f9be3709a005582465c6406e41b74f09e173454c4bd661f6b47c36f6e4fb11710abf54353cf1a0782f92f85446e0c0050f7f30ca06dc33fee35a483f87d10322abb94fd60f4f1f0e1c8fc1389d41f90b2e69b339d7037290163e196cf9e1d8e53583bf53ae3a43d9dc9b4b0eab76497e03a2bdd702c46cc7720000000049454e44ae426082	image/png	\N	\N
5	index Dynamic Computers	synthesizing Refined implement	Ohio channels	2022-04-01 03:01:34	2022-03-31 20:25:48	index microchip	open-source visualize	\\x89504e470d0a1a0a0000000d49484452000000c0000000c0080300000065029c35000002fd504c5445000000cbaaa34b566cac9983baa78bb59885b08e7eb0907eb59584b08f7eb39282b19180b19180b1907fbc9986b99684b1907eb09080b59382b79685ae8d7cb08f7eb08f7eb1907eac8b7db49382b1907fb08f7ec6a18db29180b1907fb39282797277c9a38fd3ac97c29d8ab1907fb29281ad8b7ad8b09acea793b19080bf9b88ab8977aa8775c0a293ccb1a2d1b6a8d6bbadb99a8ac7aa9be5cdc0efd8ccf3ddd1f6e2d7f8e4d8f0dacedcc2b5bc9e8ee0c7baeed6caf5e0d4f8e3d6f6e1d5f4dfd3f2dcd0caad9febd4c7f4ded1e3cabdceb3a5e8d0c4d8bfb1c4a798fae5d9a88472f4dfd4fae3d5f1ded4f9e2d4d4ccd095abcb81a0c9a3b2cce6d7d2cfcad08aa4caebd9ce4189c60080c52083c51b82c52684c52e85c6007cc27b9eca4d8cc6478ac64a8bc60282c5cac6cf1181c44088c6aeb7ccacbfd8b5c9e1b2bacd6f99c8bdbfcefce5d5fdf7f4fffffffefdfdfff1e5fbf1ebfcf4efe7cbbe0981c5fae8defefbf8ebcfc3eed3c6f9fafbf9ece5ecd0c3dfe0e19292936c6f77d5d5d7f0f2f4aaaaab7d8186bfbec0eccfc2ebcfc2fadccef5d8cac7c5c7000000e8e8e9454545989b9ceed2c5eccfc2393939b5b6b8cbcccdebcfc2a3a4a4ebcfc2878d903c88c66294c7a9a7a64a4d599d9e9e535866ebcfc1edd5c7ebcfc3939799ebcfc2eacec2eccfc2ead0c3558fc7e6d4cc9caccbcabfba3884c1418ccb4189c6397eb8d2b9abacb1c84591d13982bf4189c64189c6c1a293bd9f8e3f6389f6e1d4f2ddd0f6e1d4decec5bdb6b1d5c8c08e9496b2afad9c9d9d979b9c464c5d484f5f4b556a474e60474e60d7d7da313c53484f60495061495061495061484f60495060494f614950614950613e465a585e6d4d55674a5264495061494f6148516349506149506124324c484f61485061132746495061484f61001a40465771406085406a9508598d7d9abedbe4ee226fa85081b13f77ac3373aa3373aa3679b30063a3007ac14082bb4761827194bb6c9dcf396fa1c6d3e40171b03372aa3374ab3678b13273aa4188c63372aa3272aa4189c64188c64089c69cd9201a000000ff74524e530003030205184270868f569be0ffffffe733fffffffbfda82564bffffffff17a0bffffffcbb6ffffffd6ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff69ffffff482effffc7fffffffffffffffebe7ffffffffffffffffffaffffffffffafffffffffffffffa011d6ffe7d1e08cffffffff6ffffb28dad9ff48eb842e4415dd9fa6fffffffffface037557da6d4e1fbddb29175462768befffffffffff9896183fcff71c9fff09bfffffffffffffffffffffefffffffffffffffffffffff2839fb7d0d45cb5dfde6f838fea0000193f494441547801d497d176b23a108583001635131b6762eb402b5025f2fe0f7816b3385d14e1ffcfcd01ba6f58e4eadbccde1355ffb3824def258c42f59bd401c7c9f6254dd3975ddc9efc2afc967eb73f681099e3fe55a920fc4d1f3fd91f2c9c10ad25226781ce6f4a45eb040e225110ca8b7cfcf70bc389094d965966d68e72f8f8bcae700861d4afea46f85ed38331da11daa2ac1859e4c8c257b2b6210441eb214e76dbed2e89852d7ebf1158470eb12a4b73e76f3932fcb9260752d5eb2efd3ab235c6eae3d7394d2f470b39116bcc8bdae7a8b927cae1f6b69e18054a5db70f0bc60aa5b606a07d21c7cc98fb017f2be7e098a8701d0e22a5760f308e9c732c708e8884bee3b7a879283ae9ad785f7ef5a8f87c328ef887102ccab3a84bf3cc2f313abd88fbc5e3931c80698088799663fbaceaba417e162213c33952d1e2f1d96a43cf7c4d26fca7b22e700c1fa0cd5a735bd481f0ef41d3086151ddbb00591cc1f7991c135c167510a9e80cec46f8ad6f01d19475854ff8c69715cab1a3456710a9f802e4f859f7cc23cb00bcc6a776d4fe74e74ed49ca5480bf17f01f18850976d82d096c30623425967dc3b74902a152ec4ff18e7676c24f9580d06a0516775d960ffcc39b35561b82a7e465fb4fcec070d40eb6b3f2cb5d3f65d452bca8f74d74885072b48e2a39107224bc9ec0e02155da6f8190bdf5d62d90ffe6a189f6f07c7b7591d48e9ce407a82df968d60fada60afbe592d831911c1e33aaf838dfa04c713ba57a546f1e1f907bfc47fc2c14da9cd9c0548584f1a409fdd25f1fd0a635617adad4907e98cab68a3ae0f4393fcb64d8a205becf167883c29a74f33aea240bd00f194d0f85c0c783fc13f2697bbd956d146bd7d58376da029843f2f25493cd847532273885534d306da03f11f0c54f87d198810fece2fbf4ce72972a05e29777f32d020b3be375e4a2b56fe033febb98a1ca8747a00c20b28cbb4e8f8755920f2dfe5b4dda96806fef8681d4f0bad18c0ace90c78dfe3d7b96e956b7e16d98f196ee4486dcd34bfb4d7c82333d8fd35d0f82f7ccefff0661eeaaddb3a00cebab713c73d127a963e76971da46dc992492f0e6f3bf1fb3f4f29d19667b758642748825fc42665bc120a70330ceeef1e8387f087eb1a00a5d416b52a8bbf275827d54a2541ce316e77ba699a7632ce006e107c7c0d103c87024990324631f19e81718c09c22b7f1cdf4658594f398b7b695ef485742206c311bb46780349e86a707ff7bef5e6ecff12e4341ab5dba3c8d98825034415974f492d2c1d87d3ac339e282d8551d6891272ea102881cb6ae0dabafbe06de8d9f3e7301bcf078bfe60beecb609e70850198f5540b792cafad57220a450b614e5c47d300e21e3486e344521015c1b149f0000b2de5a486d9c68a9ed7cb38d182fbd0908010064de7a2d8537fd2825c220050610da89fea08a01d2d468650fe220d47c38cb12c639638cb364543f7b7525d60abdde72847327faf018f00c9e2e42806da439b1cd31947e3e580fbb9dde76b6daaca7faa6f5b5beb42952727606ad907de9d359230abcabd585713e42a534aa6429f1acfa03b1462e6346ced6d601e3d81ded8fc72a4058bb6f6e995785aa319ee64fc45a391f9d11b83d4b4080a75fea3a0c98ace5e20f2cb3ea2f8995939ac047c10f4fa1a2e0e1ee7f9fd7658c3807b2aa01e9cb794ce13411bd0e75044f274908683c115635210bb94484e03ee4a779026f0e0790367200de8bba9c9c15b3f00080d1bc390031c8289cb474e1003e8dea143a13caaac68e60c3e13f71a1f70780848ea5554d8915933a8e217193d97da82cf4517c08e16c20ac6a4e4c8fd54710fd3f14c0fdddd72d7f194cf8ca4740081f0a0fe08435e7413e938e69bde3faf2757000a071211a3d01bd26081e20722bae87400087899ef09e528d028822a3709cca1e83ad24e27d12dd34ea41ca2abb65e4d00b3d3880b06914316f164059dde57b8057eee6f5316c21bb1d02d6c962f1e75d68a975a567e59841e8b1b86e25806dadb197cdb3115aca6729cc1f30f879e7d9bd68bfa0389ec03c42f037c75fdfdd8706b8a802d51066a6c53c1f8f9793be96e6364235a5a9221f3bb575313552d78ad6f4dbfb2070771d0fe100a06ae6d8509e4ec25a0ff274368a23a40ca37637ef3b845be64be3f6163132c6288947b3349f4a616d1d0410faaac3cd035f110780343fce62e56ea19b51ce29454c2041c6b13d9ccaab346b85c86791d34300a74629e7384a277b452b97147d1d0bb7e2bdf71319603c17f6d80aaf124e936a0fe4b7a024616c3416170456171de44848a9e5f588838d37cad89396fa4df485ab6301f75a2d07c046f5346fc5a4cdf168948720c0586ace08ac988f5ebc227835af882f2b5b295adde1107024f6008f3f54005beb8d2bdff75e08ec8d47a4b47410bf321d1e03dd07a953f48bde52b03eb0175f14ad1cd3c39df163d8b50ae12b713800b9c6a4348b00650c63270967401c01db567cc766a7b41d1c18c65996c5c0fc2a3821b46d8dadbb8937adcfbcfd01ef97084fa53d7491394348aaedf96c984f8a62926fda9c3aa4978e386f76220e4e2feae6c5603028d6c3d97e8dfa520138112b4eca792ce866eeeb0a60238fe97bc628c3ac379c08298513f93c4d33a46c3417e731308e29c6b3b5d7125a9af9b0972594c66351e7a10442af16ffef9e911f276b025797f24249b1ebdb4afac69585f1f26262dbed4491e713a3ed416d27a41aacddf7c4e14f4d478c00845c4fdf571734484e1612d63c3bd1a61c0bf7a2942ebfa5cc6e77b45f55dfd5a6d6aa7e434bf73dbb3b36746fca9bbefb80f703f7ee8aec7427fa1bade6f59d38b284711ceedd7dd99c779f37e720d8405b3d67274f0b81a304c8460267131c09ce3903e33439a77f73bbba918c35c26ffd3990be03f5a3aa54dd3a228a1c6a24a2a80ec13936cc6dec88f0c5c71fd031d0e21347005d0c27a56b226a38d2de501d9d3681dad57d8ead87db3042d7be7f5bdc18003543137c75c96e01a284353d1a8b1b1e8ac7a2bd7d2195305b97416d46235b7748e60481bfbea7d761b608bed4e6fd5fedcd00416a444f98565c4feaf4b7974b4f26752ac3322d3da510b0a16e6a33a3cce6f86c9b65ea5d60e3a3808e01672121685fffbe7380278874f75b0346f720d3d030d3087fd417d7ace4080390437dd153db08b70df147a371d3ec1f031b6fe3f7df140b00eb39673b09007aa23f42d28aa25ecf64b972e30a55baa72f9ed01d8058a2bf43069b3291abf926d32ab5758e1a89e429c095b761372096604a91eb32309dd053e9109166f2347410844630c1e931bd1ec08a85a9eda24c316d5fc62f51dba05e0720a39fe0bca25880023a0b304d0bfd6280060441c1bf5c761223a2b800e2618560c4e3afd9f27e4c94110700e40f16c402b434f98a521bae0748a6d22c3088ab44e3038cd98b9e001727f8eba51cb74d5e7401e0365cf4b50a9d03bec21c426e0069960534bfb0b8b0c4eee511f60090fc2cf0e595c5d5b5122398915c1940d27a013e465cfc1b9b5b12426e8049f8feb77740dbb5c8580f0caa84aa0690bec03877f7c0b69f03df841b4096368353c200a001b6ca950bb23b03721ebed8fdc56a756f676f9747566b621a1352ed0c4cc24b3717f7aa7bd59d03b89fc1ae1292ffac940f8bbe26610998dbac1cfee1065068694061975677aad59d25886c52525806d81288c01c00800c7d2957caaeec50d023485a9eb833f0c76165f3585411b5fa0a875441843c0040276701cc5bb7dbb912b7340ec0b40600773c0150f0f0b05c11958226da0115fa01d8dd037e28a1d2dac21e0deceeb25342a666c4a24cb74ccd29a1a57bf7a184c2ee12e22ad36f686bcad72aa8828e01e0109ac0a3890f764007bc8939806672699a76dac477c17694f56ce28b8787b4861e88c94093efe1a32d00f85376650022a39a3f3a399a67f7f2325600e0569cc9b8a5b10c04f861f4e6c9e3839cc7611436650c605d481300c0130610445e832ccba2e3e283cc8a46c25da0d4a861f241e6d83c071996ff0080adb9565f934880327601908b332c261be174299156d2f4576eaf2d25e48c6d035fdeef02801e0680a70f85024013b800904dc0e2cfc836c0a00a0751543b8c1284fd1930705b7ee6227201e0b2e00c3ce3007c1238004a881029e02ca727b0444848b10799b39460363291abd926fdcce600f01610d803f09eeb9b0ca07c5a4249a813555515559d99cce7f399f1ebec8192ee38b316a251dab6890cb54dcc709b1299e6004e0bb0a3508ba039f09c031c5eac03b8f562ac93e9e54bf6bf936b44bb65d50318b7539d5c676c83b7062c0070a680b8390000c543fe117fcad8d9526a46fcc5eb4ac46f9dd952529be1658b529bb3a5bcc812107c22a6877d7079ff039e8220e2523b7a13a665dd7a5d039665697cb74e901c69684bd0a763d0df6c25c72b6883c72fb28dcb1711a6226ae7a83eadebd31ed2e90baf0882c8a8ed76035b126c1dd402ef8782bc855b8401c07adaaea1b640a00d63b573e45543a5e07c0f889c67eb481199c055b06d08e22f3f298a3cb768f77190fcf3f3d57f03325615556928889f899c6b4304a3ff98b90aded88d201c50856f0af65e04d696bb855d1ff9c53edb39dbb93b1f561597b9c28aca2c2c9323a98ce2f63133fcb766ecbb0d7495e7427cfede0bd37cbb33a6f9be715af5fe4056f0beba283f40064917265cab47782cdf035b0f77f74214056dd713937a921e421796f7d7c2f1eec6dac6378945b18dd43ce844ff4173f0f0acfdda1d71461a56927cba7515b19f65906c243e458dba680c90c17f54aa84432a0cca3bc9472f1f7a5726d03e96c11b9b37c6712a72a31c7ca99fce2fd78d76880c5a9dd4475019fef9d293cf1c2ec40af7c6c6a79fd6536500256c2819448113b4b7b093cdf60fec40f6c1513b2d0008f0bb3f7fe987178e1c3db6b0540083777ffbe078663301c2ebb39eb66dd5ac702be210e51c928b1d6ef5c6adaa1f8651a6fdb632f53a90e3279e7ee1e8d193a70af0f32d6399fd3ef5728021320651e09309f165f7c95e5db751f681089df060cf8eb65ac6acda0b238c3fa60ce3afd0ca4da74e1e397af2f4b1620c89cb0b688a868c01af07ed081fee734d34c3593ac59e598d7b4e80ee9475bfa337d7ed682612257452b3317e9f309ae9b436fbdb678e3e7e1a37a02057f459147e4c190c8354394961d6de8e1c8b082698e976d75bdda1c7059974a65f0a5b1ea78458c1aae3b3990d483bb7f92b8f9d3a5fa4b15e1a9a802083f60809643b906e074d651f9ae751ce510c225c272310999c82e8db8e4f08cc84725313df7281c6f473da3637903b46a500642a8408951be9d252837046804e856ac12aee424a809b8e05b3f55fc9fa1a4b4b05e5cf56cb5532e0fe9a410c10f531cae1c63e93e4b6a429a263a31dcb6ea73bd01ce88c6e19678a587b85ab4f1a5218ade904852c2d2708c603a9e5de0ee0b52808ecc0479b1cf11a1ca6eb2f75720513f8fd41adb29545593a306f38180c55f123b839746bcd4ca44bf0b514eb164c404a3f56403230888160c2a03bdc6d80907b20b81064f61353e006143f5e452ad07601801090b165ea38460ca9e5425bb1c4fc36404ef850d8d33154c84018679aaeeb746ad83554a8e4a880a2fde98433c638472151dd8fe3d8afd79a1e659c28ade807e43d4049b6c0200dcff3cc51a7e65a89c4377ebda929184889d3bcaae0ef0c8099df2030eaedf8cca5924001cebd9c827c7920da0ed6fc46c62e91b8caa36b11d318f67657569407fc781783e49b3a55c49f5f66b96f8afc5b0c0580eb354ba610bee39a8c28e287cad9796d8094922aeb18086f748671462076fb26e10618c54f62c8735f50a14a06c038d13d73139e4e3853cfbc94e7b0f96149babc55e76496417d0e932ad1b9625151c7123085a1048e00986b05cb3b1b54c3fe0bac00bdad0cc383973189c0c881b255b04ca24539f62f1ff20f2229ee098556f91709746efe09244f67baf10f194029124836cff0e62c7f21cfff1a423dfb4ccd20ff5cb63917f27d0fe53f14e140ad795e03a92708dff7d00ae48f5f1670991818f9184045bbf51c3e892b1b83df8fe3b3f21b82ae1807ca953ff241d7058b0ab801056a70ee5f5c585a2e2581570723cef7a00018be19bf7a6961b99c04deb223b7c105515d80025060829b6ecf2e3181d5d069f923c0c787b08d45f6904b08bd6a05e370bdc404822074c641d76d6a99411752188c0bce1ad5b8f5c8e5cb8f854179098c0f1d3a74e5caa143571f3be8d79a0d9df01444f73ac341affdc7a19fae5dfbf6cad5b74a4be0d0f7d7527c7fdd1e07edd69ae5fbaeebfad6dabaedfcc5cc59e8386e75713ccae87b874f9c8728b771a6528465cc532c330e1623172d4b195bd515458be205d340c378b3f73a9c745ea5e7387193eb1de6ffeeb0e1f7bb70064f120f52c4b635053eecac86426752e0a93c8e663f9066a3d831398a1493129a4d88669b16810f8340e80c0afc6f4d231a314d7846b4b4343b95374180801931628bb6ac9ccd19000179d1d0ac079a018bc58c453f161aa21d5b966dc7b02c1038b333400c43351ea8964160acc507f089790286a5251c1b04c2e1b3c41e9e0943427fad2986a31a96aaa51d623b4253fdac64dab29d7a27b5645928000943664edf03c9c7f9ffdaa205dbf781ada58116768120f000042cc930d2b3297975fd5924340aba9f3efcb3f58dbf33d9dc3de5812c6b1ac14d40b48420f0894588f24ec2481b1f5a24b99c2f144be54a35e25fe8e4f7348cdc98bd56aa17a89e9f83d681f9078e4a888ab5d22ba4d30206b1ada862c3da4a24e148da78c5b89bad375b6071e2123e7ca55d2c7418635cefce25f16fd2bf361ea414132720f5664c1090d2b26cc13292e5fb49ec059a771b8c72c6d022535e7f361a9499935b3891f55eb14019e3b4d371597e0ea8f0dfe7b046ac1416a14f7c7ebfc10a469f00bffa93f707f838071c4eed500e1ab490a955c3dec54f64f0239552dff5e0219472da981fb7652c389a829f711dfc9b4421b1b429c3d6569751d4ebb9e9728af1ae01126ebfbd1e396687196f902aa52c658c765c84c7b0c122128d0c149540f0b3402092040aaa73db53c567a4cbe83838153811d9e6faa82e1f1f7eb5dca78c233d9da471cfa3f2b8928aa6680f625b3ebad05b86b93039f21b9882a9e02519ebf47bd5e35140fc702533648ce29c4f05760062f95c97138984ff758468f07154ba317560f2554330c0894087e13f95a35740fc48adcf19477831fa40469effc0ae44a5e8d6895f993eeef6529ed160c081335a6f458e5601f09ff5b2706561e5f8029b8bc83321bbf3e636fc972f4c027bd99e6c02712d51c6b33554383afc70ade0151dba45f4c1ef17c45c8f6fc90ffd728281b3a9d32de3ada46c0bef7b44fc1b7d61ed886103e83f14d9dedec2207efd4240e0f7a080e0c058bf72140670856a8633c4dfb300b6cbbfce1f90bc78613128202a504633550038347f6dc8e06adb8737e6ee050dce470306f1b76e0427609ead704a775618b600e170fccf8a8cbb74c730f84a286870455c44d06e19e44fea6211da723b73967976188399d07a415c3d5b46ef2edd0e1a5c8e070a68907f2e2f2ea0edb642761d0c0eccbfd1612edd3dfa80800164cae24e7ceb023a3a6c61aeabd3bdc465ee06801c90bf45f95ef85756f44df9b68fe7835e8fbf5e40fd8f2e2c0df49515be27034e5b073308873628effc5bcc19ed24ae4561b8a7be086f727c86731243941125b1813bafb9e3294c7c035a922209f72a4d465469d2324a6824c808d25d409501509dc9acae8e0152a6ac2d177ef1c61bfbff7badff8764c752f4d76f1a8defb7f1443335f13055a6504053e692a96622116dddb51bf57d9de8e048103fa2ffb04c3a7ffdc6668c391de06e2dd14c4efee1f65f74e0beb804f0d43713ff6d6d74bb1119e8dd531d94b97380fda319a4fdb96148bbdd66ad4ea7f5106fee7a7abd325dc502f5d4c71f23dd9dbdedd8d6b604c8d23d718b0ced235d5423e9d7cd27f68eed9a000fb7fd145a8032c502c5c34f25a25f3623522cb61dfe8324b76923000735fe019c997a85207fbfce66b0d1c3ddff4dd70294e92a7e03dd6dc6b7baeb92fb86830952b8478c01083913443efda2451a80891be4f3d0eab4d6fa49b74cdd024af6d7229b7b70f43e60878823b0a015f91a885240c07e83cd01c7700b16507e7467479a275f921b608086c9db4425030dd023e01b83dde93cf493c9fee3e606ae8e1f7a0860042538569e0aad6002f822e0db249842b4bbee3ffce91098d414f054e98a50240e00221040dbfeb1ee3f7cfe10e0088a7403a210d20c7a0482e8c5e09cfdf087a06268216185be41ba4e8f40104e38088e10c04ad3774814aad401d4d972067a267d04a71c2128103f85210281d88ea2045bb8a71b28d0231cb2681330832360dbaca786031d7084c0d4f2c41088c2f9b50906283402f53b83e14856038620c94fe410d0bf93120c10320cf29d714610b2cfaaac28cba798d3805e062a0b083000dbe3bcbce2876728a7f8f76862c053b78872a5ac5f9f930d1cea866910d0ebf65fe50f8679d40f3f9937dca3f93564109f651a26c7042c4dd32ccb2a954e4e4e0a40ad562b02df5cae3c8e4fabd5cbe301b3e7c8b71d36caa0764014718fe65a50e483cba3cb8b8beae9f195073ea208c0230b00082895408aa67db5881300c41040b976cbfb0dd8b8fc59148e787348ff9c1705457d265e29a2a2a52fb401711a21ffe2d83ef9b8fcb3872582d7dc81df82a2be81d159f029c292bcffa185f7d063c79e51cf5cf9b8f9be3709a005582465c6406e41b74f09e173454c4bd661f6b47c36f6e4fb11710abf54353cf1a0782f92f85446e0c0050f7f30ca06dc33fee35a483f87d10322abb94fd60f4f1f0e1c8fc1389d41f90b2e69b339d7037290163e196cf9e1d8e53583bf53ae3a43d9dc9b4b0eab76497e03a2bdd702c46cc7720000000049454e44ae426082	image/png	\N	\N
6	auxiliary	partnerships driver SSL	Kina	2022-03-31 07:40:58	2022-04-01 03:27:49	firewall	application Dakota Steel	\\x89504e470d0a1a0a0000000d49484452000000c0000000c0080300000065029c35000002fd504c5445000000cbaaa34b566cac9983baa78bb59885b08e7eb0907eb59584b08f7eb39282b19180b19180b1907fbc9986b99684b1907eb09080b59382b79685ae8d7cb08f7eb08f7eb1907eac8b7db49382b1907fb08f7ec6a18db29180b1907fb39282797277c9a38fd3ac97c29d8ab1907fb29281ad8b7ad8b09acea793b19080bf9b88ab8977aa8775c0a293ccb1a2d1b6a8d6bbadb99a8ac7aa9be5cdc0efd8ccf3ddd1f6e2d7f8e4d8f0dacedcc2b5bc9e8ee0c7baeed6caf5e0d4f8e3d6f6e1d5f4dfd3f2dcd0caad9febd4c7f4ded1e3cabdceb3a5e8d0c4d8bfb1c4a798fae5d9a88472f4dfd4fae3d5f1ded4f9e2d4d4ccd095abcb81a0c9a3b2cce6d7d2cfcad08aa4caebd9ce4189c60080c52083c51b82c52684c52e85c6007cc27b9eca4d8cc6478ac64a8bc60282c5cac6cf1181c44088c6aeb7ccacbfd8b5c9e1b2bacd6f99c8bdbfcefce5d5fdf7f4fffffffefdfdfff1e5fbf1ebfcf4efe7cbbe0981c5fae8defefbf8ebcfc3eed3c6f9fafbf9ece5ecd0c3dfe0e19292936c6f77d5d5d7f0f2f4aaaaab7d8186bfbec0eccfc2ebcfc2fadccef5d8cac7c5c7000000e8e8e9454545989b9ceed2c5eccfc2393939b5b6b8cbcccdebcfc2a3a4a4ebcfc2878d903c88c66294c7a9a7a64a4d599d9e9e535866ebcfc1edd5c7ebcfc3939799ebcfc2eacec2eccfc2ead0c3558fc7e6d4cc9caccbcabfba3884c1418ccb4189c6397eb8d2b9abacb1c84591d13982bf4189c64189c6c1a293bd9f8e3f6389f6e1d4f2ddd0f6e1d4decec5bdb6b1d5c8c08e9496b2afad9c9d9d979b9c464c5d484f5f4b556a474e60474e60d7d7da313c53484f60495061495061495061484f60495060494f614950614950613e465a585e6d4d55674a5264495061494f6148516349506149506124324c484f61485061132746495061484f61001a40465771406085406a9508598d7d9abedbe4ee226fa85081b13f77ac3373aa3373aa3679b30063a3007ac14082bb4761827194bb6c9dcf396fa1c6d3e40171b03372aa3374ab3678b13273aa4188c63372aa3272aa4189c64188c64089c69cd9201a000000ff74524e530003030205184270868f569be0ffffffe733fffffffbfda82564bffffffff17a0bffffffcbb6ffffffd6ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff69ffffff482effffc7fffffffffffffffebe7ffffffffffffffffffaffffffffffafffffffffffffffa011d6ffe7d1e08cffffffff6ffffb28dad9ff48eb842e4415dd9fa6fffffffffface037557da6d4e1fbddb29175462768befffffffffff9896183fcff71c9fff09bfffffffffffffffffffffefffffffffffffffffffffff2839fb7d0d45cb5dfde6f838fea0000193f494441547801d497d176b23a108583001635131b6762eb402b5025f2fe0f7816b3385d14e1ffcfcd01ba6f58e4eadbccde1355ffb3824def258c42f59bd401c7c9f6254dd3975ddc9efc2afc967eb73f681099e3fe55a920fc4d1f3fd91f2c9c10ad25226781ce6f4a45eb040e225110ca8b7cfcf70bc389094d965966d68e72f8f8bcae700861d4afea46f85ed38331da11daa2ac1859e4c8c257b2b6210441eb214e76dbed2e89852d7ebf1158470eb12a4b73e76f3932fcb9260752d5eb2efd3ab235c6eae3d7394d2f470b39116bcc8bdae7a8b927cae1f6b69e18054a5db70f0bc60aa5b606a07d21c7cc98fb017f2be7e098a8701d0e22a5760f308e9c732c708e8884bee3b7a879283ae9ad785f7ef5a8f87c328ef887102ccab3a84bf3cc2f313abd88fbc5e3931c80698088799663fbaceaba417e162213c33952d1e2f1d96a43cf7c4d26fca7b22e700c1fa0cd5a735bd481f0ef41d3086151ddbb00591cc1f7991c135c167510a9e80cec46f8ad6f01d19475854ff8c69715cab1a3456710a9f802e4f859f7cc23cb00bcc6a776d4fe74e74ed49ca5480bf17f01f18850976d82d096c30623425967dc3b74902a152ec4ff18e7676c24f9580d06a0516775d960ffcc39b35561b82a7e465fb4fcec070d40eb6b3f2cb5d3f65d452bca8f74d74885072b48e2a39107224bc9ec0e02155da6f8190bdf5d62d90ffe6a189f6f07c7b7591d48e9ce407a82df968d60fada60afbe592d831911c1e33aaf838dfa04c713ba57a546f1e1f907bfc47fc2c14da9cd9c0548584f1a409fdd25f1fd0a635617adad4907e98cab68a3ae0f4393fcb64d8a205becf167883c29a74f33aea240bd00f194d0f85c0c783fc13f2697bbd956d146bd7d58376da029843f2f25493cd847532273885534d306da03f11f0c54f87d198810fece2fbf4ce72972a05e29777f32d020b3be375e4a2b56fe033febb98a1ca8747a00c20b28cbb4e8f8755920f2dfe5b4dda96806fef8681d4f0bad18c0ace90c78dfe3d7b96e956b7e16d98f196ee4486dcd34bfb4d7c82333d8fd35d0f82f7ccefff0661eeaaddb3a00cebab713c73d127a963e76971da46dc992492f0e6f3bf1fb3f4f29d19667b758642748825fc42665bc120a70330ceeef1e8387f087eb1a00a5d416b52a8bbf275827d54a2541ce316e77ba699a7632ce006e107c7c0d103c87024990324631f19e81718c09c22b7f1cdf4658594f398b7b695ef485742206c311bb46780349e86a707ff7bef5e6ecff12e4341ab5dba3c8d98825034415974f492d2c1d87d3ac339e282d8551d6891272ea102881cb6ae0dabafbe06de8d9f3e7301bcf078bfe60beecb609e70850198f5540b792cafad57220a450b614e5c47d300e21e3486e344521015c1b149f0000b2de5a486d9c68a9ed7cb38d182fbd0908010064de7a2d8537fd2825c220050610da89fea08a01d2d468650fe220d47c38cb12c639638cb364543f7b7525d60abdde72847327faf018f00c9e2e42806da439b1cd31947e3e580fbb9dde76b6daaca7faa6f5b5beb42952727606ad907de9d359230abcabd585713e42a534aa6429f1acfa03b1462e6346ced6d601e3d81ded8fc72a4058bb6f6e995785aa319ee64fc45a391f9d11b83d4b4080a75fea3a0c98ace5e20f2cb3ea2f8995939ac047c10f4fa1a2e0e1ee7f9fd7658c3807b2aa01e9cb794ce13411bd0e75044f274908683c115635210bb94484e03ee4a779026f0e0790367200de8bba9c9c15b3f00080d1bc390031c8289cb474e1003e8dea143a13caaac68e60c3e13f71a1f70780848ea5554d8915933a8e217193d97da82cf4517c08e16c20ac6a4e4c8fd54710fd3f14c0fdddd72d7f194cf8ca4740081f0a0fe08435e7413e938e69bde3faf2757000a071211a3d01bd26081e20722bae87400087899ef09e528d028822a3709cca1e83ad24e27d12dd34ea41ca2abb65e4d00b3d3880b06914316f164059dde57b8057eee6f5316c21bb1d02d6c962f1e75d68a975a567e59841e8b1b86e25806dadb197cdb3115aca6729cc1f30f879e7d9bd68bfa0389ec03c42f037c75fdfdd8706b8a802d51066a6c53c1f8f9793be96e6364235a5a9221f3bb575313552d78ad6f4dbfb2070771d0fe100a06ae6d8509e4ec25a0ff274368a23a40ca37637ef3b845be64be3f6163132c6288947b3349f4a616d1d0410faaac3cd035f110780343fce62e56ea19b51ce29454c2041c6b13d9ccaab346b85c86791d34300a74629e7384a277b452b97147d1d0bb7e2bdf71319603c17f6d80aaf124e936a0fe4b7a024616c3416170456171de44848a9e5f588838d37cad89396fa4df485ab6301f75a2d07c046f5346fc5a4cdf168948720c0586ace08ac988f5ebc227835af882f2b5b295adde1107024f6008f3f54005beb8d2bdff75e08ec8d47a4b47410bf321d1e03dd07a953f48bde52b03eb0175f14ad1cd3c39df163d8b50ae12b713800b9c6a4348b00650c63270967401c01db567cc766a7b41d1c18c65996c5c0fc2a3821b46d8dadbb8937adcfbcfd01ef97084fa53d7491394348aaedf96c984f8a62926fda9c3aa4978e386f76220e4e2feae6c5603028d6c3d97e8dfa520138112b4eca792ce866eeeb0a60238fe97bc628c3ac379c08298513f93c4d33a46c3417e731308e29c6b3b5d7125a9af9b0972594c66351e7a10442af16ffef9e911f276b025797f24249b1ebdb4afac69585f1f26262dbed4491e713a3ed416d27a41aacddf7c4e14f4d478c00845c4fdf571734484e1612d63c3bd1a61c0bf7a2942ebfa5cc6e77b45f55dfd5a6d6aa7e434bf73dbb3b36746fca9bbefb80f703f7ee8aec7427fa1bade6f59d38b284711ceedd7dd99c779f37e720d8405b3d67274f0b81a304c8460267131c09ce3903e33439a77f73bbba918c35c26ffd3990be03f5a3aa54dd3a228a1c6a24a2a80ec13936cc6dec88f0c5c71fd031d0e21347005d0c27a56b226a38d2de501d9d3681dad57d8ead87db3042d7be7f5bdc18003543137c75c96e01a284353d1a8b1b1e8ac7a2bd7d2195305b97416d46235b7748e60481bfbea7d761b608bed4e6fd5fedcd00416a444f98565c4feaf4b7974b4f26752ac3322d3da510b0a16e6a33a3cce6f86c9b65ea5d60e3a3808e01672121685fffbe7380278874f75b0346f720d3d030d3087fd417d7ace4080390437dd153db08b70df147a371d3ec1f031b6fe3f7df140b00eb39673b09007aa23f42d28aa25ecf64b972e30a55baa72f9ed01d8058a2bf43069b3291abf926d32ab5758e1a89e429c095b761372096604a91eb32309dd053e9109166f2347410844630c1e931bd1ec08a85a9eda24c316d5fc62f51dba05e0720a39fe0bca25880023a0b304d0bfd6280060441c1bf5c761223a2b800e2618560c4e3afd9f27e4c94110700e40f16c402b434f98a521bae0748a6d22c3088ab44e3038cd98b9e001727f8eba51cb74d5e7401e0365cf4b50a9d03bec21c426e0069960534bfb0b8b0c4eee511f60090fc2cf0e595c5d5b5122398915c1940d27a013e465cfc1b9b5b12426e8049f8feb77740dbb5c8580f0caa84aa0690bec03877f7c0b69f03df841b4096368353c200a001b6ca950bb23b03721ebed8fdc56a756f676f9747566b621a1352ed0c4cc24b3717f7aa7bd59d03b89fc1ae1292ffac940f8bbe26610998dbac1cfee1065068694061975677aad59d25886c52525806d81288c01c00800c7d2957caaeec50d023485a9eb833f0c76165f3585411b5fa0a875441843c0040276701cc5bb7dbb912b7340ec0b40600773c0150f0f0b05c11958226da0115fa01d8dd037e28a1d2dac21e0deceeb25342a666c4a24cb74ccd29a1a57bf7a184c2ee12e22ad36f686bcad72aa8828e01e0109ac0a3890f764007bc8939806672699a76dac477c17694f56ce28b8787b4861e88c94093efe1a32d00f85376650022a39a3f3a399a67f7f2325600e0569cc9b8a5b10c04f861f4e6c9e3839cc7611436650c605d481300c0130610445e832ccba2e3e283cc8a46c25da0d4a861f241e6d83c071996ff0080adb9565f934880327601908b332c261be174299156d2f4576eaf2d25e48c6d035fdeef02801e0680a70f85024013b800904dc0e2cfc836c0a00a0751543b8c1284fd1930705b7ee6227201e0b2e00c3ce3007c1238004a881029e02ca727b0444848b10799b39460363291abd926fdcce600f01610d803f09eeb9b0ca07c5a4249a813555515559d99cce7f399f1ebec8192ee38b316a251dab6890cb54dcc709b1299e6004e0bb0a3508ba039f09c031c5eac03b8f562ac93e9e54bf6bf936b44bb65d50318b7539d5c676c83b7062c0070a680b8390000c543fe117fcad8d9526a46fcc5eb4ac46f9dd952529be1658b529bb3a5bcc812107c22a6877d7079ff039e8220e2523b7a13a665dd7a5d039665697cb74e901c69684bd0a763d0df6c25c72b6883c72fb28dcb1711a6226ae7a83eadebd31ed2e90baf0882c8a8ed76035b126c1dd402ef8782bc855b8401c07adaaea1b640a00d63b573e45543a5e07c0f889c67eb481199c055b06d08e22f3f298a3cb768f77190fcf3f3d57f03325615556928889f899c6b4304a3ff98b90aded88d201c50856f0af65e04d696bb855d1ff9c53edb39dbb93b1f561597b9c28aca2c2c9323a98ce2f63133fcb766ecbb0d7495e7427cfede0bd37cbb33a6f9be715af5fe4056f0beba283f40064917265cab47782cdf035b0f77f74214056dd713937a921e421796f7d7c2f1eec6dac6378945b18dd43ce844ff4173f0f0acfdda1d71461a56927cba7515b19f65906c243e458dba680c90c17f54aa84432a0cca3bc9472f1f7a5726d03e96c11b9b37c6712a72a31c7ca99fce2fd78d76880c5a9dd4475019fef9d293cf1c2ec40af7c6c6a79fd6536500256c2819448113b4b7b093cdf60fec40f6c1513b2d0008f0bb3f7fe987178e1c3db6b0540083777ffbe078663301c2ebb39eb66dd5ac702be210e51c928b1d6ef5c6adaa1f8651a6fdb632f53a90e3279e7ee1e8d193a70af0f32d6399fd3ef5728021320651e09309f165f7c95e5db751f681089df060cf8eb65ac6acda0b238c3fa60ce3afd0ca4da74e1e397af2f4b1620c89cb0b688a868c01af07ed081fee734d34c3593ac59e598d7b4e80ee9475bfa337d7ed682612257452b3317e9f309ae9b436fbdb678e3e7e1a37a02057f459147e4c190c8354394961d6de8e1c8b082698e976d75bdda1c7059974a65f0a5b1ea78458c1aae3b3990d483bb7f92b8f9d3a5fa4b15e1a9a802083f60809643b906e074d651f9ae751ce510c225c272310999c82e8db8e4f08cc84725313df7281c6f473da3637903b46a500642a8408951be9d252837046804e856ac12aee424a809b8e05b3f55fc9fa1a4b4b05e5cf56cb5532e0fe9a410c10f531cae1c63e93e4b6a429a263a31dcb6ea73bd01ce88c6e19678a587b85ab4f1a5218ade904852c2d2708c603a9e5de0ee0b52808ecc0479b1cf11a1ca6eb2f75720513f8fd41adb29545593a306f38180c55f123b839746bcd4ca44bf0b514eb164c404a3f56403230888160c2a03bdc6d80907b20b81064f61353e006143f5e452ad07601801090b165ea38460ca9e5425bb1c4fc36404ef850d8d33154c84018679aaeeb746ad83554a8e4a880a2fde98433c638472151dd8fe3d8afd79a1e659c28ade807e43d4049b6c0200dcff3cc51a7e65a89c4377ebda929184889d3bcaae0ef0c8099df2030eaedf8cca5924001cebd9c827c7920da0ed6fc46c62e91b8caa36b11d318f67657569407fc781783e49b3a55c49f5f66b96f8afc5b0c0580eb354ba610bee39a8c28e287cad9796d8094922aeb18086f748671462076fb26e10618c54f62c8735f50a14a06c038d13d73139e4e3853cfbc94e7b0f96149babc55e76496417d0e932ad1b9625151c7123085a1048e00986b05cb3b1b54c3fe0bac00bdad0cc383973189c0c881b255b04ca24539f62f1ff20f2229ee098556f91709746efe09244f67baf10f194029124836cff0e62c7f21cfff1a423dfb4ccd20ff5cb63917f27d0fe53f14e140ad795e03a92708dff7d00ae48f5f1670991818f9184045bbf51c3e892b1b83df8fe3b3f21b82ae1807ca953ff241d7058b0ab801056a70ee5f5c585a2e2581570723cef7a00018be19bf7a6961b99c04deb223b7c105515d80025060829b6ecf2e3181d5d069f923c0c787b08d45f6904b08bd6a05e370bdc404822074c641d76d6a99411752188c0bce1ad5b8f5c8e5cb8f854179098c0f1d3a74e5caa143571f3be8d79a0d9df01444f73ac341affdc7a19fae5dfbf6cad5b74a4be0d0f7d7527c7fdd1e07edd69ae5fbaeebfad6dabaedfcc5cc59e8386e75713ccae87b874f9c8728b771a6528465cc532c330e1623172d4b195bd515458be205d340c378b3f73a9c745ea5e7387193eb1de6ffeeb0e1f7bb70064f120f52c4b635053eecac86426752e0a93c8e663f9066a3d831398a1493129a4d88669b16810f8340e80c0afc6f4d231a314d7846b4b4343b95374180801931628bb6ac9ccd19000179d1d0ac079a018bc58c453f161aa21d5b966dc7b02c1038b333400c43351ea8964160acc507f089790286a5251c1b04c2e1b3c41e9e0943427fad2986a31a96aaa51d623b4253fdac64dab29d7a27b5645928000943664edf03c9c7f9ffdaa205dbf781ada58116768120f000042cc930d2b3297975fd5924340aba9f3efcb3f58dbf33d9dc3de5812c6b1ac14d40b48420f0894588f24ec2481b1f5a24b99c2f144be54a35e25fe8e4f7348cdc98bd56aa17a89e9f83d681f9078e4a888ab5d22ba4d30206b1ada862c3da4a24e148da78c5b89bad375b6071e2123e7ca55d2c7418635cefce25f16fd2bf361ea414132720f5664c1090d2b26cc13292e5fb49ec059a771b8c72c6d022535e7f361a9499935b3891f55eb14019e3b4d371597e0ea8f0dfe7b046ac1416a14f7c7ebfc10a469f00bffa93f707f838071c4eed500e1ab490a955c3dec54f64f0239552dff5e0219472da981fb7652c389a829f711dfc9b4421b1b429c3d6569751d4ebb9e9728af1ae01126ebfbd1e396687196f902aa52c658c765c84c7b0c122128d0c149540f0b3402092040aaa73db53c567a4cbe83838153811d9e6faa82e1f1f7eb5dca78c233d9da471cfa3f2b8928aa6680f625b3ebad05b86b93039f21b9882a9e02519ebf47bd5e35140fc702533648ce29c4f05760062f95c97138984ff758468f07154ba317560f2554330c0894087e13f95a35740fc48adcf19477831fa40469effc0ae44a5e8d6895f993eeef6529ed160c081335a6f458e5601f09ff5b2706561e5f8029b8bc83321bbf3e636fc972f4c027bd99e6c02712d51c6b33554383afc70ade0151dba45f4c1ef17c45c8f6fc90ffd728281b3a9d32de3ada46c0bef7b44fc1b7d61ed886103e83f14d9dedec2207efd4240e0f7a080e0c058bf72140670856a8633c4dfb300b6cbbfce1f90bc78613128202a504633550038347f6dc8e06adb8737e6ee050dce470306f1b76e0427609ead704a775618b600e170fccf8a8cbb74c730f84a286870455c44d06e19e44fea6211da723b73967976188399d07a415c3d5b46ef2edd0e1a5c8e070a68907f2e2f2ea0edb642761d0c0eccbfd1612edd3dfa80800164cae24e7ceb023a3a6c61aeabd3bdc465ee06801c90bf45f95ef85756f44df9b68fe7835e8fbf5e40fd8f2e2c0df49515be27034e5b073308873628effc5bcc19ed24ae4561b8a7be086f727c86731243941125b1813bafb9e3294c7c035a922209f72a4d465469d2324a6824c808d25d409501509dc9acae8e0152a6ac2d177ef1c61bfbff7badff8764c752f4d76f1a8defb7f1443335f13055a6504053e692a96622116dddb51bf57d9de8e048103fa2ffb04c3a7ffdc6668c391de06e2dd14c4efee1f65f74e0beb804f0d43713ff6d6d74bb1119e8dd531d94b97380fda319a4fdb96148bbdd66ad4ea7f5106fee7a7abd325dc502f5d4c71f23dd9dbdedd8d6b604c8d23d718b0ced235d5423e9d7cd27f68eed9a000fb7fd145a8032c502c5c34f25a25f3623522cb61dfe8324b76923000735fe019c997a85207fbfce66b0d1c3ddff4dd70294e92a7e03dd6dc6b7baeb92fb86830952b8478c01083913443efda2451a80891be4f3d0eab4d6fa49b74cdd024af6d7229b7b70f43e60878823b0a015f91a885240c07e83cd01c7700b16507e7467479a275f921b608086c9db4425030dd023e01b83dde93cf493c9fee3e606ae8e1f7a0860042538569e0aad6002f822e0db249842b4bbee3ffce91098d414f054e98a50240e00221040dbfeb1ee3f7cfe10e0088a7403a210d20c7a0482e8c5e09cfdf087a06268216185be41ba4e8f40104e38088e10c04ad3774814aad401d4d972067a267d04a71c2128103f85210281d88ea2045bb8a71b28d0231cb2681330832360dbaca786031d7084c0d4f2c41088c2f9b50906283402f53b83e14856038620c94fe410d0bf93120c10320cf29d714610b2cfaaac28cba798d3805e062a0b083000dbe3bcbce2876728a7f8f76862c053b78872a5ac5f9f930d1cea866910d0ebf65fe50f8679d40f3f9937dca3f93564109f651a26c7042c4dd32ccb2a954e4e4e0a40ad562b02df5cae3c8e4fabd5cbe301b3e7c8b71d36caa0764014718fe65a50e483cba3cb8b8beae9f195073ea208c0230b00082895408aa67db5881300c41040b976cbfb0dd8b8fc59148e787348ff9c1705457d265e29a2a2a52fb401711a21ffe2d83ef9b8fcb3872582d7dc81df82a2be81d159f029c292bcffa185f7d063c79e51cf5cf9b8f9be3709a005582465c6406e41b74f09e173454c4bd661f6b47c36f6e4fb11710abf54353cf1a0782f92f85446e0c0050f7f30ca06dc33fee35a483f87d10322abb94fd60f4f1f0e1c8fc1389d41f90b2e69b339d7037290163e196cf9e1d8e53583bf53ae3a43d9dc9b4b0eab76497e03a2bdd702c46cc7720000000049454e44ae426082	image/png	\N	\N
7	open-source	Research circuit Soap	Automotive frictionless	2022-03-31 10:10:53	2022-03-31 19:29:03	Buckinghamshire HTTP	Shoes	\\x89504e470d0a1a0a0000000d49484452000000c0000000c0080300000065029c35000002fd504c5445000000cbaaa34b566cac9983baa78bb59885b08e7eb0907eb59584b08f7eb39282b19180b19180b1907fbc9986b99684b1907eb09080b59382b79685ae8d7cb08f7eb08f7eb1907eac8b7db49382b1907fb08f7ec6a18db29180b1907fb39282797277c9a38fd3ac97c29d8ab1907fb29281ad8b7ad8b09acea793b19080bf9b88ab8977aa8775c0a293ccb1a2d1b6a8d6bbadb99a8ac7aa9be5cdc0efd8ccf3ddd1f6e2d7f8e4d8f0dacedcc2b5bc9e8ee0c7baeed6caf5e0d4f8e3d6f6e1d5f4dfd3f2dcd0caad9febd4c7f4ded1e3cabdceb3a5e8d0c4d8bfb1c4a798fae5d9a88472f4dfd4fae3d5f1ded4f9e2d4d4ccd095abcb81a0c9a3b2cce6d7d2cfcad08aa4caebd9ce4189c60080c52083c51b82c52684c52e85c6007cc27b9eca4d8cc6478ac64a8bc60282c5cac6cf1181c44088c6aeb7ccacbfd8b5c9e1b2bacd6f99c8bdbfcefce5d5fdf7f4fffffffefdfdfff1e5fbf1ebfcf4efe7cbbe0981c5fae8defefbf8ebcfc3eed3c6f9fafbf9ece5ecd0c3dfe0e19292936c6f77d5d5d7f0f2f4aaaaab7d8186bfbec0eccfc2ebcfc2fadccef5d8cac7c5c7000000e8e8e9454545989b9ceed2c5eccfc2393939b5b6b8cbcccdebcfc2a3a4a4ebcfc2878d903c88c66294c7a9a7a64a4d599d9e9e535866ebcfc1edd5c7ebcfc3939799ebcfc2eacec2eccfc2ead0c3558fc7e6d4cc9caccbcabfba3884c1418ccb4189c6397eb8d2b9abacb1c84591d13982bf4189c64189c6c1a293bd9f8e3f6389f6e1d4f2ddd0f6e1d4decec5bdb6b1d5c8c08e9496b2afad9c9d9d979b9c464c5d484f5f4b556a474e60474e60d7d7da313c53484f60495061495061495061484f60495060494f614950614950613e465a585e6d4d55674a5264495061494f6148516349506149506124324c484f61485061132746495061484f61001a40465771406085406a9508598d7d9abedbe4ee226fa85081b13f77ac3373aa3373aa3679b30063a3007ac14082bb4761827194bb6c9dcf396fa1c6d3e40171b03372aa3374ab3678b13273aa4188c63372aa3272aa4189c64188c64089c69cd9201a000000ff74524e530003030205184270868f569be0ffffffe733fffffffbfda82564bffffffff17a0bffffffcbb6ffffffd6ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff69ffffff482effffc7fffffffffffffffebe7ffffffffffffffffffaffffffffffafffffffffffffffa011d6ffe7d1e08cffffffff6ffffb28dad9ff48eb842e4415dd9fa6fffffffffface037557da6d4e1fbddb29175462768befffffffffff9896183fcff71c9fff09bfffffffffffffffffffffefffffffffffffffffffffff2839fb7d0d45cb5dfde6f838fea0000193f494441547801d497d176b23a108583001635131b6762eb402b5025f2fe0f7816b3385d14e1ffcfcd01ba6f58e4eadbccde1355ffb3824def258c42f59bd401c7c9f6254dd3975ddc9efc2afc967eb73f681099e3fe55a920fc4d1f3fd91f2c9c10ad25226781ce6f4a45eb040e225110ca8b7cfcf70bc389094d965966d68e72f8f8bcae700861d4afea46f85ed38331da11daa2ac1859e4c8c257b2b6210441eb214e76dbed2e89852d7ebf1158470eb12a4b73e76f3932fcb9260752d5eb2efd3ab235c6eae3d7394d2f470b39116bcc8bdae7a8b927cae1f6b69e18054a5db70f0bc60aa5b606a07d21c7cc98fb017f2be7e098a8701d0e22a5760f308e9c732c708e8884bee3b7a879283ae9ad785f7ef5a8f87c328ef887102ccab3a84bf3cc2f313abd88fbc5e3931c80698088799663fbaceaba417e162213c33952d1e2f1d96a43cf7c4d26fca7b22e700c1fa0cd5a735bd481f0ef41d3086151ddbb00591cc1f7991c135c167510a9e80cec46f8ad6f01d19475854ff8c69715cab1a3456710a9f802e4f859f7cc23cb00bcc6a776d4fe74e74ed49ca5480bf17f01f18850976d82d096c30623425967dc3b74902a152ec4ff18e7676c24f9580d06a0516775d960ffcc39b35561b82a7e465fb4fcec070d40eb6b3f2cb5d3f65d452bca8f74d74885072b48e2a39107224bc9ec0e02155da6f8190bdf5d62d90ffe6a189f6f07c7b7591d48e9ce407a82df968d60fada60afbe592d831911c1e33aaf838dfa04c713ba57a546f1e1f907bfc47fc2c14da9cd9c0548584f1a409fdd25f1fd0a635617adad4907e98cab68a3ae0f4393fcb64d8a205becf167883c29a74f33aea240bd00f194d0f85c0c783fc13f2697bbd956d146bd7d58376da029843f2f25493cd847532273885534d306da03f11f0c54f87d198810fece2fbf4ce72972a05e29777f32d020b3be375e4a2b56fe033febb98a1ca8747a00c20b28cbb4e8f8755920f2dfe5b4dda96806fef8681d4f0bad18c0ace90c78dfe3d7b96e956b7e16d98f196ee4486dcd34bfb4d7c82333d8fd35d0f82f7ccefff0661eeaaddb3a00cebab713c73d127a963e76971da46dc992492f0e6f3bf1fb3f4f29d19667b758642748825fc42665bc120a70330ceeef1e8387f087eb1a00a5d416b52a8bbf275827d54a2541ce316e77ba699a7632ce006e107c7c0d103c87024990324631f19e81718c09c22b7f1cdf4658594f398b7b695ef485742206c311bb46780349e86a707ff7bef5e6ecff12e4341ab5dba3c8d98825034415974f492d2c1d87d3ac339e282d8551d6891272ea102881cb6ae0dabafbe06de8d9f3e7301bcf078bfe60beecb609e70850198f5540b792cafad57220a450b614e5c47d300e21e3486e344521015c1b149f0000b2de5a486d9c68a9ed7cb38d182fbd0908010064de7a2d8537fd2825c220050610da89fea08a01d2d468650fe220d47c38cb12c639638cb364543f7b7525d60abdde72847327faf018f00c9e2e42806da439b1cd31947e3e580fbb9dde76b6daaca7faa6f5b5beb42952727606ad907de9d359230abcabd585713e42a534aa6429f1acfa03b1462e6346ced6d601e3d81ded8fc72a4058bb6f6e995785aa319ee64fc45a391f9d11b83d4b4080a75fea3a0c98ace5e20f2cb3ea2f8995939ac047c10f4fa1a2e0e1ee7f9fd7658c3807b2aa01e9cb794ce13411bd0e75044f274908683c115635210bb94484e03ee4a779026f0e0790367200de8bba9c9c15b3f00080d1bc390031c8289cb474e1003e8dea143a13caaac68e60c3e13f71a1f70780848ea5554d8915933a8e217193d97da82cf4517c08e16c20ac6a4e4c8fd54710fd3f14c0fdddd72d7f194cf8ca4740081f0a0fe08435e7413e938e69bde3faf2757000a071211a3d01bd26081e20722bae87400087899ef09e528d028822a3709cca1e83ad24e27d12dd34ea41ca2abb65e4d00b3d3880b06914316f164059dde57b8057eee6f5316c21bb1d02d6c962f1e75d68a975a567e59841e8b1b86e25806dadb197cdb3115aca6729cc1f30f879e7d9bd68bfa0389ec03c42f037c75fdfdd8706b8a802d51066a6c53c1f8f9793be96e6364235a5a9221f3bb575313552d78ad6f4dbfb2070771d0fe100a06ae6d8509e4ec25a0ff274368a23a40ca37637ef3b845be64be3f6163132c6288947b3349f4a616d1d0410faaac3cd035f110780343fce62e56ea19b51ce29454c2041c6b13d9ccaab346b85c86791d34300a74629e7384a277b452b97147d1d0bb7e2bdf71319603c17f6d80aaf124e936a0fe4b7a024616c3416170456171de44848a9e5f588838d37cad89396fa4df485ab6301f75a2d07c046f5346fc5a4cdf168948720c0586ace08ac988f5ebc227835af882f2b5b295adde1107024f6008f3f54005beb8d2bdff75e08ec8d47a4b47410bf321d1e03dd07a953f48bde52b03eb0175f14ad1cd3c39df163d8b50ae12b713800b9c6a4348b00650c63270967401c01db567cc766a7b41d1c18c65996c5c0fc2a3821b46d8dadbb8937adcfbcfd01ef97084fa53d7491394348aaedf96c984f8a62926fda9c3aa4978e386f76220e4e2feae6c5603028d6c3d97e8dfa520138112b4eca792ce866eeeb0a60238fe97bc628c3ac379c08298513f93c4d33a46c3417e731308e29c6b3b5d7125a9af9b0972594c66351e7a10442af16ffef9e911f276b025797f24249b1ebdb4afac69585f1f26262dbed4491e713a3ed416d27a41aacddf7c4e14f4d478c00845c4fdf571734484e1612d63c3bd1a61c0bf7a2942ebfa5cc6e77b45f55dfd5a6d6aa7e434bf73dbb3b36746fca9bbefb80f703f7ee8aec7427fa1bade6f59d38b284711ceedd7dd99c779f37e720d8405b3d67274f0b81a304c8460267131c09ce3903e33439a77f73bbba918c35c26ffd3990be03f5a3aa54dd3a228a1c6a24a2a80ec13936cc6dec88f0c5c71fd031d0e21347005d0c27a56b226a38d2de501d9d3681dad57d8ead87db3042d7be7f5bdc18003543137c75c96e01a284353d1a8b1b1e8ac7a2bd7d2195305b97416d46235b7748e60481bfbea7d761b608bed4e6fd5fedcd00416a444f98565c4feaf4b7974b4f26752ac3322d3da510b0a16e6a33a3cce6f86c9b65ea5d60e3a3808e01672121685fffbe7380278874f75b0346f720d3d030d3087fd417d7ace4080390437dd153db08b70df147a371d3ec1f031b6fe3f7df140b00eb39673b09007aa23f42d28aa25ecf64b972e30a55baa72f9ed01d8058a2bf43069b3291abf926d32ab5758e1a89e429c095b761372096604a91eb32309dd053e9109166f2347410844630c1e931bd1ec08a85a9eda24c316d5fc62f51dba05e0720a39fe0bca25880023a0b304d0bfd6280060441c1bf5c761223a2b800e2618560c4e3afd9f27e4c94110700e40f16c402b434f98a521bae0748a6d22c3088ab44e3038cd98b9e001727f8eba51cb74d5e7401e0365cf4b50a9d03bec21c426e0069960534bfb0b8b0c4eee511f60090fc2cf0e595c5d5b5122398915c1940d27a013e465cfc1b9b5b12426e8049f8feb77740dbb5c8580f0caa84aa0690bec03877f7c0b69f03df841b4096368353c200a001b6ca950bb23b03721ebed8fdc56a756f676f9747566b621a1352ed0c4cc24b3717f7aa7bd59d03b89fc1ae1292ffac940f8bbe26610998dbac1cfee1065068694061975677aad59d25886c52525806d81288c01c00800c7d2957caaeec50d023485a9eb833f0c76165f3585411b5fa0a875441843c0040276701cc5bb7dbb912b7340ec0b40600773c0150f0f0b05c11958226da0115fa01d8dd037e28a1d2dac21e0deceeb25342a666c4a24cb74ccd29a1a57bf7a184c2ee12e22ad36f686bcad72aa8828e01e0109ac0a3890f764007bc8939806672699a76dac477c17694f56ce28b8787b4861e88c94093efe1a32d00f85376650022a39a3f3a399a67f7f2325600e0569cc9b8a5b10c04f861f4e6c9e3839cc7611436650c605d481300c0130610445e832ccba2e3e283cc8a46c25da0d4a861f241e6d83c071996ff0080adb9565f934880327601908b332c261be174299156d2f4576eaf2d25e48c6d035fdeef02801e0680a70f85024013b800904dc0e2cfc836c0a00a0751543b8c1284fd1930705b7ee6227201e0b2e00c3ce3007c1238004a881029e02ca727b0444848b10799b39460363291abd926fdcce600f01610d803f09eeb9b0ca07c5a4249a813555515559d99cce7f399f1ebec8192ee38b316a251dab6890cb54dcc709b1299e6004e0bb0a3508ba039f09c031c5eac03b8f562ac93e9e54bf6bf936b44bb65d50318b7539d5c676c83b7062c0070a680b8390000c543fe117fcad8d9526a46fcc5eb4ac46f9dd952529be1658b529bb3a5bcc812107c22a6877d7079ff039e8220e2523b7a13a665dd7a5d039665697cb74e901c69684bd0a763d0df6c25c72b6883c72fb28dcb1711a6226ae7a83eadebd31ed2e90baf0882c8a8ed76035b126c1dd402ef8782bc855b8401c07adaaea1b640a00d63b573e45543a5e07c0f889c67eb481199c055b06d08e22f3f298a3cb768f77190fcf3f3d57f03325615556928889f899c6b4304a3ff98b90aded88d201c50856f0af65e04d696bb855d1ff9c53edb39dbb93b1f561597b9c28aca2c2c9323a98ce2f63133fcb766ecbb0d7495e7427cfede0bd37cbb33a6f9be715af5fe4056f0beba283f40064917265cab47782cdf035b0f77f74214056dd713937a921e421796f7d7c2f1eec6dac6378945b18dd43ce844ff4173f0f0acfdda1d71461a56927cba7515b19f65906c243e458dba680c90c17f54aa84432a0cca3bc9472f1f7a5726d03e96c11b9b37c6712a72a31c7ca99fce2fd78d76880c5a9dd4475019fef9d293cf1c2ec40af7c6c6a79fd6536500256c2819448113b4b7b093cdf60fec40f6c1513b2d0008f0bb3f7fe987178e1c3db6b0540083777ffbe078663301c2ebb39eb66dd5ac702be210e51c928b1d6ef5c6adaa1f8651a6fdb632f53a90e3279e7ee1e8d193a70af0f32d6399fd3ef5728021320651e09309f165f7c95e5db751f681089df060cf8eb65ac6acda0b238c3fa60ce3afd0ca4da74e1e397af2f4b1620c89cb0b688a868c01af07ed081fee734d34c3593ac59e598d7b4e80ee9475bfa337d7ed682612257452b3317e9f309ae9b436fbdb678e3e7e1a37a02057f459147e4c190c8354394961d6de8e1c8b082698e976d75bdda1c7059974a65f0a5b1ea78458c1aae3b3990d483bb7f92b8f9d3a5fa4b15e1a9a802083f60809643b906e074d651f9ae751ce510c225c272310999c82e8db8e4f08cc84725313df7281c6f473da3637903b46a500642a8408951be9d252837046804e856ac12aee424a809b8e05b3f55fc9fa1a4b4b05e5cf56cb5532e0fe9a410c10f531cae1c63e93e4b6a429a263a31dcb6ea73bd01ce88c6e19678a587b85ab4f1a5218ade904852c2d2708c603a9e5de0ee0b52808ecc0479b1cf11a1ca6eb2f75720513f8fd41adb29545593a306f38180c55f123b839746bcd4ca44bf0b514eb164c404a3f56403230888160c2a03bdc6d80907b20b81064f61353e006143f5e452ad07601801090b165ea38460ca9e5425bb1c4fc36404ef850d8d33154c84018679aaeeb746ad83554a8e4a880a2fde98433c638472151dd8fe3d8afd79a1e659c28ade807e43d4049b6c0200dcff3cc51a7e65a89c4377ebda929184889d3bcaae0ef0c8099df2030eaedf8cca5924001cebd9c827c7920da0ed6fc46c62e91b8caa36b11d318f67657569407fc781783e49b3a55c49f5f66b96f8afc5b0c0580eb354ba610bee39a8c28e287cad9796d8094922aeb18086f748671462076fb26e10618c54f62c8735f50a14a06c038d13d73139e4e3853cfbc94e7b0f96149babc55e76496417d0e932ad1b9625151c7123085a1048e00986b05cb3b1b54c3fe0bac00bdad0cc383973189c0c881b255b04ca24539f62f1ff20f2229ee098556f91709746efe09244f67baf10f194029124836cff0e62c7f21cfff1a423dfb4ccd20ff5cb63917f27d0fe53f14e140ad795e03a92708dff7d00ae48f5f1670991818f9184045bbf51c3e892b1b83df8fe3b3f21b82ae1807ca953ff241d7058b0ab801056a70ee5f5c585a2e2581570723cef7a00018be19bf7a6961b99c04deb223b7c105515d80025060829b6ecf2e3181d5d069f923c0c787b08d45f6904b08bd6a05e370bdc404822074c641d76d6a99411752188c0bce1ad5b8f5c8e5cb8f854179098c0f1d3a74e5caa143571f3be8d79a0d9df01444f73ac341affdc7a19fae5dfbf6cad5b74a4be0d0f7d7527c7fdd1e07edd69ae5fbaeebfad6dabaedfcc5cc59e8386e75713ccae87b874f9c8728b771a6528465cc532c330e1623172d4b195bd515458be205d340c378b3f73a9c745ea5e7387193eb1de6ffeeb0e1f7bb70064f120f52c4b635053eecac86426752e0a93c8e663f9066a3d831398a1493129a4d88669b16810f8340e80c0afc6f4d231a314d7846b4b4343b95374180801931628bb6ac9ccd19000179d1d0ac079a018bc58c453f161aa21d5b966dc7b02c1038b333400c43351ea8964160acc507f089790286a5251c1b04c2e1b3c41e9e0943427fad2986a31a96aaa51d623b4253fdac64dab29d7a27b5645928000943664edf03c9c7f9ffdaa205dbf781ada58116768120f000042cc930d2b3297975fd5924340aba9f3efcb3f58dbf33d9dc3de5812c6b1ac14d40b48420f0894588f24ec2481b1f5a24b99c2f144be54a35e25fe8e4f7348cdc98bd56aa17a89e9f83d681f9078e4a888ab5d22ba4d30206b1ada862c3da4a24e148da78c5b89bad375b6071e2123e7ca55d2c7418635cefce25f16fd2bf361ea414132720f5664c1090d2b26cc13292e5fb49ec059a771b8c72c6d022535e7f361a9499935b3891f55eb14019e3b4d371597e0ea8f0dfe7b046ac1416a14f7c7ebfc10a469f00bffa93f707f838071c4eed500e1ab490a955c3dec54f64f0239552dff5e0219472da981fb7652c389a829f711dfc9b4421b1b429c3d6569751d4ebb9e9728af1ae01126ebfbd1e396687196f902aa52c658c765c84c7b0c122128d0c149540f0b3402092040aaa73db53c567a4cbe83838153811d9e6faa82e1f1f7eb5dca78c233d9da471cfa3f2b8928aa6680f625b3ebad05b86b93039f21b9882a9e02519ebf47bd5e35140fc702533648ce29c4f05760062f95c97138984ff758468f07154ba317560f2554330c0894087e13f95a35740fc48adcf19477831fa40469effc0ae44a5e8d6895f993eeef6529ed160c081335a6f458e5601f09ff5b2706561e5f8029b8bc83321bbf3e636fc972f4c027bd99e6c02712d51c6b33554383afc70ade0151dba45f4c1ef17c45c8f6fc90ffd728281b3a9d32de3ada46c0bef7b44fc1b7d61ed886103e83f14d9dedec2207efd4240e0f7a080e0c058bf72140670856a8633c4dfb300b6cbbfce1f90bc78613128202a504633550038347f6dc8e06adb8737e6ee050dce470306f1b76e0427609ead704a775618b600e170fccf8a8cbb74c730f84a286870455c44d06e19e44fea6211da723b73967976188399d07a415c3d5b46ef2edd0e1a5c8e070a68907f2e2f2ea0edb642761d0c0eccbfd1612edd3dfa80800164cae24e7ceb023a3a6c61aeabd3bdc465ee06801c90bf45f95ef85756f44df9b68fe7835e8fbf5e40fd8f2e2c0df49515be27034e5b073308873628effc5bcc19ed24ae4561b8a7be086f727c86731243941125b1813bafb9e3294c7c035a922209f72a4d465469d2324a6824c808d25d409501509dc9acae8e0152a6ac2d177ef1c61bfbff7badff8764c752f4d76f1a8defb7f1443335f13055a6504053e692a96622116dddb51bf57d9de8e048103fa2ffb04c3a7ffdc6668c391de06e2dd14c4efee1f65f74e0beb804f0d43713ff6d6d74bb1119e8dd531d94b97380fda319a4fdb96148bbdd66ad4ea7f5106fee7a7abd325dc502f5d4c71f23dd9dbdedd8d6b604c8d23d718b0ced235d5423e9d7cd27f68eed9a000fb7fd145a8032c502c5c34f25a25f3623522cb61dfe8324b76923000735fe019c997a85207fbfce66b0d1c3ddff4dd70294e92a7e03dd6dc6b7baeb92fb86830952b8478c01083913443efda2451a80891be4f3d0eab4d6fa49b74cdd024af6d7229b7b70f43e60878823b0a015f91a885240c07e83cd01c7700b16507e7467479a275f921b608086c9db4425030dd023e01b83dde93cf493c9fee3e606ae8e1f7a0860042538569e0aad6002f822e0db249842b4bbee3ffce91098d414f054e98a50240e00221040dbfeb1ee3f7cfe10e0088a7403a210d20c7a0482e8c5e09cfdf087a06268216185be41ba4e8f40104e38088e10c04ad3774814aad401d4d972067a267d04a71c2128103f85210281d88ea2045bb8a71b28d0231cb2681330832360dbaca786031d7084c0d4f2c41088c2f9b50906283402f53b83e14856038620c94fe410d0bf93120c10320cf29d714610b2cfaaac28cba798d3805e062a0b083000dbe3bcbce2876728a7f8f76862c053b78872a5ac5f9f930d1cea866910d0ebf65fe50f8679d40f3f9937dca3f93564109f651a26c7042c4dd32ccb2a954e4e4e0a40ad562b02df5cae3c8e4fabd5cbe301b3e7c8b71d36caa0764014718fe65a50e483cba3cb8b8beae9f195073ea208c0230b00082895408aa67db5881300c41040b976cbfb0dd8b8fc59148e787348ff9c1705457d265e29a2a2a52fb401711a21ffe2d83ef9b8fcb3872582d7dc81df82a2be81d159f029c292bcffa185f7d063c79e51cf5cf9b8f9be3709a005582465c6406e41b74f09e173454c4bd661f6b47c36f6e4fb11710abf54353cf1a0782f92f85446e0c0050f7f30ca06dc33fee35a483f87d10322abb94fd60f4f1f0e1c8fc1389d41f90b2e69b339d7037290163e196cf9e1d8e53583bf53ae3a43d9dc9b4b0eab76497e03a2bdd702c46cc7720000000049454e44ae426082	image/png	\N	\N
8	object-oriented Chief Polarised	paradigms Highway	invoice	2022-03-31 21:36:33	2022-03-31 08:46:50	Human evolve intelligence	Internal connect	\\x89504e470d0a1a0a0000000d49484452000000c0000000c0080300000065029c35000002fd504c5445000000cbaaa34b566cac9983baa78bb59885b08e7eb0907eb59584b08f7eb39282b19180b19180b1907fbc9986b99684b1907eb09080b59382b79685ae8d7cb08f7eb08f7eb1907eac8b7db49382b1907fb08f7ec6a18db29180b1907fb39282797277c9a38fd3ac97c29d8ab1907fb29281ad8b7ad8b09acea793b19080bf9b88ab8977aa8775c0a293ccb1a2d1b6a8d6bbadb99a8ac7aa9be5cdc0efd8ccf3ddd1f6e2d7f8e4d8f0dacedcc2b5bc9e8ee0c7baeed6caf5e0d4f8e3d6f6e1d5f4dfd3f2dcd0caad9febd4c7f4ded1e3cabdceb3a5e8d0c4d8bfb1c4a798fae5d9a88472f4dfd4fae3d5f1ded4f9e2d4d4ccd095abcb81a0c9a3b2cce6d7d2cfcad08aa4caebd9ce4189c60080c52083c51b82c52684c52e85c6007cc27b9eca4d8cc6478ac64a8bc60282c5cac6cf1181c44088c6aeb7ccacbfd8b5c9e1b2bacd6f99c8bdbfcefce5d5fdf7f4fffffffefdfdfff1e5fbf1ebfcf4efe7cbbe0981c5fae8defefbf8ebcfc3eed3c6f9fafbf9ece5ecd0c3dfe0e19292936c6f77d5d5d7f0f2f4aaaaab7d8186bfbec0eccfc2ebcfc2fadccef5d8cac7c5c7000000e8e8e9454545989b9ceed2c5eccfc2393939b5b6b8cbcccdebcfc2a3a4a4ebcfc2878d903c88c66294c7a9a7a64a4d599d9e9e535866ebcfc1edd5c7ebcfc3939799ebcfc2eacec2eccfc2ead0c3558fc7e6d4cc9caccbcabfba3884c1418ccb4189c6397eb8d2b9abacb1c84591d13982bf4189c64189c6c1a293bd9f8e3f6389f6e1d4f2ddd0f6e1d4decec5bdb6b1d5c8c08e9496b2afad9c9d9d979b9c464c5d484f5f4b556a474e60474e60d7d7da313c53484f60495061495061495061484f60495060494f614950614950613e465a585e6d4d55674a5264495061494f6148516349506149506124324c484f61485061132746495061484f61001a40465771406085406a9508598d7d9abedbe4ee226fa85081b13f77ac3373aa3373aa3679b30063a3007ac14082bb4761827194bb6c9dcf396fa1c6d3e40171b03372aa3374ab3678b13273aa4188c63372aa3272aa4189c64188c64089c69cd9201a000000ff74524e530003030205184270868f569be0ffffffe733fffffffbfda82564bffffffff17a0bffffffcbb6ffffffd6ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff69ffffff482effffc7fffffffffffffffebe7ffffffffffffffffffaffffffffffafffffffffffffffa011d6ffe7d1e08cffffffff6ffffb28dad9ff48eb842e4415dd9fa6fffffffffface037557da6d4e1fbddb29175462768befffffffffff9896183fcff71c9fff09bfffffffffffffffffffffefffffffffffffffffffffff2839fb7d0d45cb5dfde6f838fea0000193f494441547801d497d176b23a108583001635131b6762eb402b5025f2fe0f7816b3385d14e1ffcfcd01ba6f58e4eadbccde1355ffb3824def258c42f59bd401c7c9f6254dd3975ddc9efc2afc967eb73f681099e3fe55a920fc4d1f3fd91f2c9c10ad25226781ce6f4a45eb040e225110ca8b7cfcf70bc389094d965966d68e72f8f8bcae700861d4afea46f85ed38331da11daa2ac1859e4c8c257b2b6210441eb214e76dbed2e89852d7ebf1158470eb12a4b73e76f3932fcb9260752d5eb2efd3ab235c6eae3d7394d2f470b39116bcc8bdae7a8b927cae1f6b69e18054a5db70f0bc60aa5b606a07d21c7cc98fb017f2be7e098a8701d0e22a5760f308e9c732c708e8884bee3b7a879283ae9ad785f7ef5a8f87c328ef887102ccab3a84bf3cc2f313abd88fbc5e3931c80698088799663fbaceaba417e162213c33952d1e2f1d96a43cf7c4d26fca7b22e700c1fa0cd5a735bd481f0ef41d3086151ddbb00591cc1f7991c135c167510a9e80cec46f8ad6f01d19475854ff8c69715cab1a3456710a9f802e4f859f7cc23cb00bcc6a776d4fe74e74ed49ca5480bf17f01f18850976d82d096c30623425967dc3b74902a152ec4ff18e7676c24f9580d06a0516775d960ffcc39b35561b82a7e465fb4fcec070d40eb6b3f2cb5d3f65d452bca8f74d74885072b48e2a39107224bc9ec0e02155da6f8190bdf5d62d90ffe6a189f6f07c7b7591d48e9ce407a82df968d60fada60afbe592d831911c1e33aaf838dfa04c713ba57a546f1e1f907bfc47fc2c14da9cd9c0548584f1a409fdd25f1fd0a635617adad4907e98cab68a3ae0f4393fcb64d8a205becf167883c29a74f33aea240bd00f194d0f85c0c783fc13f2697bbd956d146bd7d58376da029843f2f25493cd847532273885534d306da03f11f0c54f87d198810fece2fbf4ce72972a05e29777f32d020b3be375e4a2b56fe033febb98a1ca8747a00c20b28cbb4e8f8755920f2dfe5b4dda96806fef8681d4f0bad18c0ace90c78dfe3d7b96e956b7e16d98f196ee4486dcd34bfb4d7c82333d8fd35d0f82f7ccefff0661eeaaddb3a00cebab713c73d127a963e76971da46dc992492f0e6f3bf1fb3f4f29d19667b758642748825fc42665bc120a70330ceeef1e8387f087eb1a00a5d416b52a8bbf275827d54a2541ce316e77ba699a7632ce006e107c7c0d103c87024990324631f19e81718c09c22b7f1cdf4658594f398b7b695ef485742206c311bb46780349e86a707ff7bef5e6ecff12e4341ab5dba3c8d98825034415974f492d2c1d87d3ac339e282d8551d6891272ea102881cb6ae0dabafbe06de8d9f3e7301bcf078bfe60beecb609e70850198f5540b792cafad57220a450b614e5c47d300e21e3486e344521015c1b149f0000b2de5a486d9c68a9ed7cb38d182fbd0908010064de7a2d8537fd2825c220050610da89fea08a01d2d468650fe220d47c38cb12c639638cb364543f7b7525d60abdde72847327faf018f00c9e2e42806da439b1cd31947e3e580fbb9dde76b6daaca7faa6f5b5beb42952727606ad907de9d359230abcabd585713e42a534aa6429f1acfa03b1462e6346ced6d601e3d81ded8fc72a4058bb6f6e995785aa319ee64fc45a391f9d11b83d4b4080a75fea3a0c98ace5e20f2cb3ea2f8995939ac047c10f4fa1a2e0e1ee7f9fd7658c3807b2aa01e9cb794ce13411bd0e75044f274908683c115635210bb94484e03ee4a779026f0e0790367200de8bba9c9c15b3f00080d1bc390031c8289cb474e1003e8dea143a13caaac68e60c3e13f71a1f70780848ea5554d8915933a8e217193d97da82cf4517c08e16c20ac6a4e4c8fd54710fd3f14c0fdddd72d7f194cf8ca4740081f0a0fe08435e7413e938e69bde3faf2757000a071211a3d01bd26081e20722bae87400087899ef09e528d028822a3709cca1e83ad24e27d12dd34ea41ca2abb65e4d00b3d3880b06914316f164059dde57b8057eee6f5316c21bb1d02d6c962f1e75d68a975a567e59841e8b1b86e25806dadb197cdb3115aca6729cc1f30f879e7d9bd68bfa0389ec03c42f037c75fdfdd8706b8a802d51066a6c53c1f8f9793be96e6364235a5a9221f3bb575313552d78ad6f4dbfb2070771d0fe100a06ae6d8509e4ec25a0ff274368a23a40ca37637ef3b845be64be3f6163132c6288947b3349f4a616d1d0410faaac3cd035f110780343fce62e56ea19b51ce29454c2041c6b13d9ccaab346b85c86791d34300a74629e7384a277b452b97147d1d0bb7e2bdf71319603c17f6d80aaf124e936a0fe4b7a024616c3416170456171de44848a9e5f588838d37cad89396fa4df485ab6301f75a2d07c046f5346fc5a4cdf168948720c0586ace08ac988f5ebc227835af882f2b5b295adde1107024f6008f3f54005beb8d2bdff75e08ec8d47a4b47410bf321d1e03dd07a953f48bde52b03eb0175f14ad1cd3c39df163d8b50ae12b713800b9c6a4348b00650c63270967401c01db567cc766a7b41d1c18c65996c5c0fc2a3821b46d8dadbb8937adcfbcfd01ef97084fa53d7491394348aaedf96c984f8a62926fda9c3aa4978e386f76220e4e2feae6c5603028d6c3d97e8dfa520138112b4eca792ce866eeeb0a60238fe97bc628c3ac379c08298513f93c4d33a46c3417e731308e29c6b3b5d7125a9af9b0972594c66351e7a10442af16ffef9e911f276b025797f24249b1ebdb4afac69585f1f26262dbed4491e713a3ed416d27a41aacddf7c4e14f4d478c00845c4fdf571734484e1612d63c3bd1a61c0bf7a2942ebfa5cc6e77b45f55dfd5a6d6aa7e434bf73dbb3b36746fca9bbefb80f703f7ee8aec7427fa1bade6f59d38b284711ceedd7dd99c779f37e720d8405b3d67274f0b81a304c8460267131c09ce3903e33439a77f73bbba918c35c26ffd3990be03f5a3aa54dd3a228a1c6a24a2a80ec13936cc6dec88f0c5c71fd031d0e21347005d0c27a56b226a38d2de501d9d3681dad57d8ead87db3042d7be7f5bdc18003543137c75c96e01a284353d1a8b1b1e8ac7a2bd7d2195305b97416d46235b7748e60481bfbea7d761b608bed4e6fd5fedcd00416a444f98565c4feaf4b7974b4f26752ac3322d3da510b0a16e6a33a3cce6f86c9b65ea5d60e3a3808e01672121685fffbe7380278874f75b0346f720d3d030d3087fd417d7ace4080390437dd153db08b70df147a371d3ec1f031b6fe3f7df140b00eb39673b09007aa23f42d28aa25ecf64b972e30a55baa72f9ed01d8058a2bf43069b3291abf926d32ab5758e1a89e429c095b761372096604a91eb32309dd053e9109166f2347410844630c1e931bd1ec08a85a9eda24c316d5fc62f51dba05e0720a39fe0bca25880023a0b304d0bfd6280060441c1bf5c761223a2b800e2618560c4e3afd9f27e4c94110700e40f16c402b434f98a521bae0748a6d22c3088ab44e3038cd98b9e001727f8eba51cb74d5e7401e0365cf4b50a9d03bec21c426e0069960534bfb0b8b0c4eee511f60090fc2cf0e595c5d5b5122398915c1940d27a013e465cfc1b9b5b12426e8049f8feb77740dbb5c8580f0caa84aa0690bec03877f7c0b69f03df841b4096368353c200a001b6ca950bb23b03721ebed8fdc56a756f676f9747566b621a1352ed0c4cc24b3717f7aa7bd59d03b89fc1ae1292ffac940f8bbe26610998dbac1cfee1065068694061975677aad59d25886c52525806d81288c01c00800c7d2957caaeec50d023485a9eb833f0c76165f3585411b5fa0a875441843c0040276701cc5bb7dbb912b7340ec0b40600773c0150f0f0b05c11958226da0115fa01d8dd037e28a1d2dac21e0deceeb25342a666c4a24cb74ccd29a1a57bf7a184c2ee12e22ad36f686bcad72aa8828e01e0109ac0a3890f764007bc8939806672699a76dac477c17694f56ce28b8787b4861e88c94093efe1a32d00f85376650022a39a3f3a399a67f7f2325600e0569cc9b8a5b10c04f861f4e6c9e3839cc7611436650c605d481300c0130610445e832ccba2e3e283cc8a46c25da0d4a861f241e6d83c071996ff0080adb9565f934880327601908b332c261be174299156d2f4576eaf2d25e48c6d035fdeef02801e0680a70f85024013b800904dc0e2cfc836c0a00a0751543b8c1284fd1930705b7ee6227201e0b2e00c3ce3007c1238004a881029e02ca727b0444848b10799b39460363291abd926fdcce600f01610d803f09eeb9b0ca07c5a4249a813555515559d99cce7f399f1ebec8192ee38b316a251dab6890cb54dcc709b1299e6004e0bb0a3508ba039f09c031c5eac03b8f562ac93e9e54bf6bf936b44bb65d50318b7539d5c676c83b7062c0070a680b8390000c543fe117fcad8d9526a46fcc5eb4ac46f9dd952529be1658b529bb3a5bcc812107c22a6877d7079ff039e8220e2523b7a13a665dd7a5d039665697cb74e901c69684bd0a763d0df6c25c72b6883c72fb28dcb1711a6226ae7a83eadebd31ed2e90baf0882c8a8ed76035b126c1dd402ef8782bc855b8401c07adaaea1b640a00d63b573e45543a5e07c0f889c67eb481199c055b06d08e22f3f298a3cb768f77190fcf3f3d57f03325615556928889f899c6b4304a3ff98b90aded88d201c50856f0af65e04d696bb855d1ff9c53edb39dbb93b1f561597b9c28aca2c2c9323a98ce2f63133fcb766ecbb0d7495e7427cfede0bd37cbb33a6f9be715af5fe4056f0beba283f40064917265cab47782cdf035b0f77f74214056dd713937a921e421796f7d7c2f1eec6dac6378945b18dd43ce844ff4173f0f0acfdda1d71461a56927cba7515b19f65906c243e458dba680c90c17f54aa84432a0cca3bc9472f1f7a5726d03e96c11b9b37c6712a72a31c7ca99fce2fd78d76880c5a9dd4475019fef9d293cf1c2ec40af7c6c6a79fd6536500256c2819448113b4b7b093cdf60fec40f6c1513b2d0008f0bb3f7fe987178e1c3db6b0540083777ffbe078663301c2ebb39eb66dd5ac702be210e51c928b1d6ef5c6adaa1f8651a6fdb632f53a90e3279e7ee1e8d193a70af0f32d6399fd3ef5728021320651e09309f165f7c95e5db751f681089df060cf8eb65ac6acda0b238c3fa60ce3afd0ca4da74e1e397af2f4b1620c89cb0b688a868c01af07ed081fee734d34c3593ac59e598d7b4e80ee9475bfa337d7ed682612257452b3317e9f309ae9b436fbdb678e3e7e1a37a02057f459147e4c190c8354394961d6de8e1c8b082698e976d75bdda1c7059974a65f0a5b1ea78458c1aae3b3990d483bb7f92b8f9d3a5fa4b15e1a9a802083f60809643b906e074d651f9ae751ce510c225c272310999c82e8db8e4f08cc84725313df7281c6f473da3637903b46a500642a8408951be9d252837046804e856ac12aee424a809b8e05b3f55fc9fa1a4b4b05e5cf56cb5532e0fe9a410c10f531cae1c63e93e4b6a429a263a31dcb6ea73bd01ce88c6e19678a587b85ab4f1a5218ade904852c2d2708c603a9e5de0ee0b52808ecc0479b1cf11a1ca6eb2f75720513f8fd41adb29545593a306f38180c55f123b839746bcd4ca44bf0b514eb164c404a3f56403230888160c2a03bdc6d80907b20b81064f61353e006143f5e452ad07601801090b165ea38460ca9e5425bb1c4fc36404ef850d8d33154c84018679aaeeb746ad83554a8e4a880a2fde98433c638472151dd8fe3d8afd79a1e659c28ade807e43d4049b6c0200dcff3cc51a7e65a89c4377ebda929184889d3bcaae0ef0c8099df2030eaedf8cca5924001cebd9c827c7920da0ed6fc46c62e91b8caa36b11d318f67657569407fc781783e49b3a55c49f5f66b96f8afc5b0c0580eb354ba610bee39a8c28e287cad9796d8094922aeb18086f748671462076fb26e10618c54f62c8735f50a14a06c038d13d73139e4e3853cfbc94e7b0f96149babc55e76496417d0e932ad1b9625151c7123085a1048e00986b05cb3b1b54c3fe0bac00bdad0cc383973189c0c881b255b04ca24539f62f1ff20f2229ee098556f91709746efe09244f67baf10f194029124836cff0e62c7f21cfff1a423dfb4ccd20ff5cb63917f27d0fe53f14e140ad795e03a92708dff7d00ae48f5f1670991818f9184045bbf51c3e892b1b83df8fe3b3f21b82ae1807ca953ff241d7058b0ab801056a70ee5f5c585a2e2581570723cef7a00018be19bf7a6961b99c04deb223b7c105515d80025060829b6ecf2e3181d5d069f923c0c787b08d45f6904b08bd6a05e370bdc404822074c641d76d6a99411752188c0bce1ad5b8f5c8e5cb8f854179098c0f1d3a74e5caa143571f3be8d79a0d9df01444f73ac341affdc7a19fae5dfbf6cad5b74a4be0d0f7d7527c7fdd1e07edd69ae5fbaeebfad6dabaedfcc5cc59e8386e75713ccae87b874f9c8728b771a6528465cc532c330e1623172d4b195bd515458be205d340c378b3f73a9c745ea5e7387193eb1de6ffeeb0e1f7bb70064f120f52c4b635053eecac86426752e0a93c8e663f9066a3d831398a1493129a4d88669b16810f8340e80c0afc6f4d231a314d7846b4b4343b95374180801931628bb6ac9ccd19000179d1d0ac079a018bc58c453f161aa21d5b966dc7b02c1038b333400c43351ea8964160acc507f089790286a5251c1b04c2e1b3c41e9e0943427fad2986a31a96aaa51d623b4253fdac64dab29d7a27b5645928000943664edf03c9c7f9ffdaa205dbf781ada58116768120f000042cc930d2b3297975fd5924340aba9f3efcb3f58dbf33d9dc3de5812c6b1ac14d40b48420f0894588f24ec2481b1f5a24b99c2f144be54a35e25fe8e4f7348cdc98bd56aa17a89e9f83d681f9078e4a888ab5d22ba4d30206b1ada862c3da4a24e148da78c5b89bad375b6071e2123e7ca55d2c7418635cefce25f16fd2bf361ea414132720f5664c1090d2b26cc13292e5fb49ec059a771b8c72c6d022535e7f361a9499935b3891f55eb14019e3b4d371597e0ea8f0dfe7b046ac1416a14f7c7ebfc10a469f00bffa93f707f838071c4eed500e1ab490a955c3dec54f64f0239552dff5e0219472da981fb7652c389a829f711dfc9b4421b1b429c3d6569751d4ebb9e9728af1ae01126ebfbd1e396687196f902aa52c658c765c84c7b0c122128d0c149540f0b3402092040aaa73db53c567a4cbe83838153811d9e6faa82e1f1f7eb5dca78c233d9da471cfa3f2b8928aa6680f625b3ebad05b86b93039f21b9882a9e02519ebf47bd5e35140fc702533648ce29c4f05760062f95c97138984ff758468f07154ba317560f2554330c0894087e13f95a35740fc48adcf19477831fa40469effc0ae44a5e8d6895f993eeef6529ed160c081335a6f458e5601f09ff5b2706561e5f8029b8bc83321bbf3e636fc972f4c027bd99e6c02712d51c6b33554383afc70ade0151dba45f4c1ef17c45c8f6fc90ffd728281b3a9d32de3ada46c0bef7b44fc1b7d61ed886103e83f14d9dedec2207efd4240e0f7a080e0c058bf72140670856a8633c4dfb300b6cbbfce1f90bc78613128202a504633550038347f6dc8e06adb8737e6ee050dce470306f1b76e0427609ead704a775618b600e170fccf8a8cbb74c730f84a286870455c44d06e19e44fea6211da723b73967976188399d07a415c3d5b46ef2edd0e1a5c8e070a68907f2e2f2ea0edb642761d0c0eccbfd1612edd3dfa80800164cae24e7ceb023a3a6c61aeabd3bdc465ee06801c90bf45f95ef85756f44df9b68fe7835e8fbf5e40fd8f2e2c0df49515be27034e5b073308873628effc5bcc19ed24ae4561b8a7be086f727c86731243941125b1813bafb9e3294c7c035a922209f72a4d465469d2324a6824c808d25d409501509dc9acae8e0152a6ac2d177ef1c61bfbff7badff8764c752f4d76f1a8defb7f1443335f13055a6504053e692a96622116dddb51bf57d9de8e048103fa2ffb04c3a7ffdc6668c391de06e2dd14c4efee1f65f74e0beb804f0d43713ff6d6d74bb1119e8dd531d94b97380fda319a4fdb96148bbdd66ad4ea7f5106fee7a7abd325dc502f5d4c71f23dd9dbdedd8d6b604c8d23d718b0ced235d5423e9d7cd27f68eed9a000fb7fd145a8032c502c5c34f25a25f3623522cb61dfe8324b76923000735fe019c997a85207fbfce66b0d1c3ddff4dd70294e92a7e03dd6dc6b7baeb92fb86830952b8478c01083913443efda2451a80891be4f3d0eab4d6fa49b74cdd024af6d7229b7b70f43e60878823b0a015f91a885240c07e83cd01c7700b16507e7467479a275f921b608086c9db4425030dd023e01b83dde93cf493c9fee3e606ae8e1f7a0860042538569e0aad6002f822e0db249842b4bbee3ffce91098d414f054e98a50240e00221040dbfeb1ee3f7cfe10e0088a7403a210d20c7a0482e8c5e09cfdf087a06268216185be41ba4e8f40104e38088e10c04ad3774814aad401d4d972067a267d04a71c2128103f85210281d88ea2045bb8a71b28d0231cb2681330832360dbaca786031d7084c0d4f2c41088c2f9b50906283402f53b83e14856038620c94fe410d0bf93120c10320cf29d714610b2cfaaac28cba798d3805e062a0b083000dbe3bcbce2876728a7f8f76862c053b78872a5ac5f9f930d1cea866910d0ebf65fe50f8679d40f3f9937dca3f93564109f651a26c7042c4dd32ccb2a954e4e4e0a40ad562b02df5cae3c8e4fabd5cbe301b3e7c8b71d36caa0764014718fe65a50e483cba3cb8b8beae9f195073ea208c0230b00082895408aa67db5881300c41040b976cbfb0dd8b8fc59148e787348ff9c1705457d265e29a2a2a52fb401711a21ffe2d83ef9b8fcb3872582d7dc81df82a2be81d159f029c292bcffa185f7d063c79e51cf5cf9b8f9be3709a005582465c6406e41b74f09e173454c4bd661f6b47c36f6e4fb11710abf54353cf1a0782f92f85446e0c0050f7f30ca06dc33fee35a483f87d10322abb94fd60f4f1f0e1c8fc1389d41f90b2e69b339d7037290163e196cf9e1d8e53583bf53ae3a43d9dc9b4b0eab76497e03a2bdd702c46cc7720000000049454e44ae426082	image/png	\N	\N
9	Berkshire Sausages Kids	Tactics payment global	THX niches	2022-03-31 14:27:41	2022-03-31 08:13:21	paradigm Frozen	redundant Phased	\\x89504e470d0a1a0a0000000d49484452000000c0000000c0080300000065029c35000002fd504c5445000000cbaaa34b566cac9983baa78bb59885b08e7eb0907eb59584b08f7eb39282b19180b19180b1907fbc9986b99684b1907eb09080b59382b79685ae8d7cb08f7eb08f7eb1907eac8b7db49382b1907fb08f7ec6a18db29180b1907fb39282797277c9a38fd3ac97c29d8ab1907fb29281ad8b7ad8b09acea793b19080bf9b88ab8977aa8775c0a293ccb1a2d1b6a8d6bbadb99a8ac7aa9be5cdc0efd8ccf3ddd1f6e2d7f8e4d8f0dacedcc2b5bc9e8ee0c7baeed6caf5e0d4f8e3d6f6e1d5f4dfd3f2dcd0caad9febd4c7f4ded1e3cabdceb3a5e8d0c4d8bfb1c4a798fae5d9a88472f4dfd4fae3d5f1ded4f9e2d4d4ccd095abcb81a0c9a3b2cce6d7d2cfcad08aa4caebd9ce4189c60080c52083c51b82c52684c52e85c6007cc27b9eca4d8cc6478ac64a8bc60282c5cac6cf1181c44088c6aeb7ccacbfd8b5c9e1b2bacd6f99c8bdbfcefce5d5fdf7f4fffffffefdfdfff1e5fbf1ebfcf4efe7cbbe0981c5fae8defefbf8ebcfc3eed3c6f9fafbf9ece5ecd0c3dfe0e19292936c6f77d5d5d7f0f2f4aaaaab7d8186bfbec0eccfc2ebcfc2fadccef5d8cac7c5c7000000e8e8e9454545989b9ceed2c5eccfc2393939b5b6b8cbcccdebcfc2a3a4a4ebcfc2878d903c88c66294c7a9a7a64a4d599d9e9e535866ebcfc1edd5c7ebcfc3939799ebcfc2eacec2eccfc2ead0c3558fc7e6d4cc9caccbcabfba3884c1418ccb4189c6397eb8d2b9abacb1c84591d13982bf4189c64189c6c1a293bd9f8e3f6389f6e1d4f2ddd0f6e1d4decec5bdb6b1d5c8c08e9496b2afad9c9d9d979b9c464c5d484f5f4b556a474e60474e60d7d7da313c53484f60495061495061495061484f60495060494f614950614950613e465a585e6d4d55674a5264495061494f6148516349506149506124324c484f61485061132746495061484f61001a40465771406085406a9508598d7d9abedbe4ee226fa85081b13f77ac3373aa3373aa3679b30063a3007ac14082bb4761827194bb6c9dcf396fa1c6d3e40171b03372aa3374ab3678b13273aa4188c63372aa3272aa4189c64188c64089c69cd9201a000000ff74524e530003030205184270868f569be0ffffffe733fffffffbfda82564bffffffff17a0bffffffcbb6ffffffd6ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff69ffffff482effffc7fffffffffffffffebe7ffffffffffffffffffaffffffffffafffffffffffffffa011d6ffe7d1e08cffffffff6ffffb28dad9ff48eb842e4415dd9fa6fffffffffface037557da6d4e1fbddb29175462768befffffffffff9896183fcff71c9fff09bfffffffffffffffffffffefffffffffffffffffffffff2839fb7d0d45cb5dfde6f838fea0000193f494441547801d497d176b23a108583001635131b6762eb402b5025f2fe0f7816b3385d14e1ffcfcd01ba6f58e4eadbccde1355ffb3824def258c42f59bd401c7c9f6254dd3975ddc9efc2afc967eb73f681099e3fe55a920fc4d1f3fd91f2c9c10ad25226781ce6f4a45eb040e225110ca8b7cfcf70bc389094d965966d68e72f8f8bcae700861d4afea46f85ed38331da11daa2ac1859e4c8c257b2b6210441eb214e76dbed2e89852d7ebf1158470eb12a4b73e76f3932fcb9260752d5eb2efd3ab235c6eae3d7394d2f470b39116bcc8bdae7a8b927cae1f6b69e18054a5db70f0bc60aa5b606a07d21c7cc98fb017f2be7e098a8701d0e22a5760f308e9c732c708e8884bee3b7a879283ae9ad785f7ef5a8f87c328ef887102ccab3a84bf3cc2f313abd88fbc5e3931c80698088799663fbaceaba417e162213c33952d1e2f1d96a43cf7c4d26fca7b22e700c1fa0cd5a735bd481f0ef41d3086151ddbb00591cc1f7991c135c167510a9e80cec46f8ad6f01d19475854ff8c69715cab1a3456710a9f802e4f859f7cc23cb00bcc6a776d4fe74e74ed49ca5480bf17f01f18850976d82d096c30623425967dc3b74902a152ec4ff18e7676c24f9580d06a0516775d960ffcc39b35561b82a7e465fb4fcec070d40eb6b3f2cb5d3f65d452bca8f74d74885072b48e2a39107224bc9ec0e02155da6f8190bdf5d62d90ffe6a189f6f07c7b7591d48e9ce407a82df968d60fada60afbe592d831911c1e33aaf838dfa04c713ba57a546f1e1f907bfc47fc2c14da9cd9c0548584f1a409fdd25f1fd0a635617adad4907e98cab68a3ae0f4393fcb64d8a205becf167883c29a74f33aea240bd00f194d0f85c0c783fc13f2697bbd956d146bd7d58376da029843f2f25493cd847532273885534d306da03f11f0c54f87d198810fece2fbf4ce72972a05e29777f32d020b3be375e4a2b56fe033febb98a1ca8747a00c20b28cbb4e8f8755920f2dfe5b4dda96806fef8681d4f0bad18c0ace90c78dfe3d7b96e956b7e16d98f196ee4486dcd34bfb4d7c82333d8fd35d0f82f7ccefff0661eeaaddb3a00cebab713c73d127a963e76971da46dc992492f0e6f3bf1fb3f4f29d19667b758642748825fc42665bc120a70330ceeef1e8387f087eb1a00a5d416b52a8bbf275827d54a2541ce316e77ba699a7632ce006e107c7c0d103c87024990324631f19e81718c09c22b7f1cdf4658594f398b7b695ef485742206c311bb46780349e86a707ff7bef5e6ecff12e4341ab5dba3c8d98825034415974f492d2c1d87d3ac339e282d8551d6891272ea102881cb6ae0dabafbe06de8d9f3e7301bcf078bfe60beecb609e70850198f5540b792cafad57220a450b614e5c47d300e21e3486e344521015c1b149f0000b2de5a486d9c68a9ed7cb38d182fbd0908010064de7a2d8537fd2825c220050610da89fea08a01d2d468650fe220d47c38cb12c639638cb364543f7b7525d60abdde72847327faf018f00c9e2e42806da439b1cd31947e3e580fbb9dde76b6daaca7faa6f5b5beb42952727606ad907de9d359230abcabd585713e42a534aa6429f1acfa03b1462e6346ced6d601e3d81ded8fc72a4058bb6f6e995785aa319ee64fc45a391f9d11b83d4b4080a75fea3a0c98ace5e20f2cb3ea2f8995939ac047c10f4fa1a2e0e1ee7f9fd7658c3807b2aa01e9cb794ce13411bd0e75044f274908683c115635210bb94484e03ee4a779026f0e0790367200de8bba9c9c15b3f00080d1bc390031c8289cb474e1003e8dea143a13caaac68e60c3e13f71a1f70780848ea5554d8915933a8e217193d97da82cf4517c08e16c20ac6a4e4c8fd54710fd3f14c0fdddd72d7f194cf8ca4740081f0a0fe08435e7413e938e69bde3faf2757000a071211a3d01bd26081e20722bae87400087899ef09e528d028822a3709cca1e83ad24e27d12dd34ea41ca2abb65e4d00b3d3880b06914316f164059dde57b8057eee6f5316c21bb1d02d6c962f1e75d68a975a567e59841e8b1b86e25806dadb197cdb3115aca6729cc1f30f879e7d9bd68bfa0389ec03c42f037c75fdfdd8706b8a802d51066a6c53c1f8f9793be96e6364235a5a9221f3bb575313552d78ad6f4dbfb2070771d0fe100a06ae6d8509e4ec25a0ff274368a23a40ca37637ef3b845be64be3f6163132c6288947b3349f4a616d1d0410faaac3cd035f110780343fce62e56ea19b51ce29454c2041c6b13d9ccaab346b85c86791d34300a74629e7384a277b452b97147d1d0bb7e2bdf71319603c17f6d80aaf124e936a0fe4b7a024616c3416170456171de44848a9e5f588838d37cad89396fa4df485ab6301f75a2d07c046f5346fc5a4cdf168948720c0586ace08ac988f5ebc227835af882f2b5b295adde1107024f6008f3f54005beb8d2bdff75e08ec8d47a4b47410bf321d1e03dd07a953f48bde52b03eb0175f14ad1cd3c39df163d8b50ae12b713800b9c6a4348b00650c63270967401c01db567cc766a7b41d1c18c65996c5c0fc2a3821b46d8dadbb8937adcfbcfd01ef97084fa53d7491394348aaedf96c984f8a62926fda9c3aa4978e386f76220e4e2feae6c5603028d6c3d97e8dfa520138112b4eca792ce866eeeb0a60238fe97bc628c3ac379c08298513f93c4d33a46c3417e731308e29c6b3b5d7125a9af9b0972594c66351e7a10442af16ffef9e911f276b025797f24249b1ebdb4afac69585f1f26262dbed4491e713a3ed416d27a41aacddf7c4e14f4d478c00845c4fdf571734484e1612d63c3bd1a61c0bf7a2942ebfa5cc6e77b45f55dfd5a6d6aa7e434bf73dbb3b36746fca9bbefb80f703f7ee8aec7427fa1bade6f59d38b284711ceedd7dd99c779f37e720d8405b3d67274f0b81a304c8460267131c09ce3903e33439a77f73bbba918c35c26ffd3990be03f5a3aa54dd3a228a1c6a24a2a80ec13936cc6dec88f0c5c71fd031d0e21347005d0c27a56b226a38d2de501d9d3681dad57d8ead87db3042d7be7f5bdc18003543137c75c96e01a284353d1a8b1b1e8ac7a2bd7d2195305b97416d46235b7748e60481bfbea7d761b608bed4e6fd5fedcd00416a444f98565c4feaf4b7974b4f26752ac3322d3da510b0a16e6a33a3cce6f86c9b65ea5d60e3a3808e01672121685fffbe7380278874f75b0346f720d3d030d3087fd417d7ace4080390437dd153db08b70df147a371d3ec1f031b6fe3f7df140b00eb39673b09007aa23f42d28aa25ecf64b972e30a55baa72f9ed01d8058a2bf43069b3291abf926d32ab5758e1a89e429c095b761372096604a91eb32309dd053e9109166f2347410844630c1e931bd1ec08a85a9eda24c316d5fc62f51dba05e0720a39fe0bca25880023a0b304d0bfd6280060441c1bf5c761223a2b800e2618560c4e3afd9f27e4c94110700e40f16c402b434f98a521bae0748a6d22c3088ab44e3038cd98b9e001727f8eba51cb74d5e7401e0365cf4b50a9d03bec21c426e0069960534bfb0b8b0c4eee511f60090fc2cf0e595c5d5b5122398915c1940d27a013e465cfc1b9b5b12426e8049f8feb77740dbb5c8580f0caa84aa0690bec03877f7c0b69f03df841b4096368353c200a001b6ca950bb23b03721ebed8fdc56a756f676f9747566b621a1352ed0c4cc24b3717f7aa7bd59d03b89fc1ae1292ffac940f8bbe26610998dbac1cfee1065068694061975677aad59d25886c52525806d81288c01c00800c7d2957caaeec50d023485a9eb833f0c76165f3585411b5fa0a875441843c0040276701cc5bb7dbb912b7340ec0b40600773c0150f0f0b05c11958226da0115fa01d8dd037e28a1d2dac21e0deceeb25342a666c4a24cb74ccd29a1a57bf7a184c2ee12e22ad36f686bcad72aa8828e01e0109ac0a3890f764007bc8939806672699a76dac477c17694f56ce28b8787b4861e88c94093efe1a32d00f85376650022a39a3f3a399a67f7f2325600e0569cc9b8a5b10c04f861f4e6c9e3839cc7611436650c605d481300c0130610445e832ccba2e3e283cc8a46c25da0d4a861f241e6d83c071996ff0080adb9565f934880327601908b332c261be174299156d2f4576eaf2d25e48c6d035fdeef02801e0680a70f85024013b800904dc0e2cfc836c0a00a0751543b8c1284fd1930705b7ee6227201e0b2e00c3ce3007c1238004a881029e02ca727b0444848b10799b39460363291abd926fdcce600f01610d803f09eeb9b0ca07c5a4249a813555515559d99cce7f399f1ebec8192ee38b316a251dab6890cb54dcc709b1299e6004e0bb0a3508ba039f09c031c5eac03b8f562ac93e9e54bf6bf936b44bb65d50318b7539d5c676c83b7062c0070a680b8390000c543fe117fcad8d9526a46fcc5eb4ac46f9dd952529be1658b529bb3a5bcc812107c22a6877d7079ff039e8220e2523b7a13a665dd7a5d039665697cb74e901c69684bd0a763d0df6c25c72b6883c72fb28dcb1711a6226ae7a83eadebd31ed2e90baf0882c8a8ed76035b126c1dd402ef8782bc855b8401c07adaaea1b640a00d63b573e45543a5e07c0f889c67eb481199c055b06d08e22f3f298a3cb768f77190fcf3f3d57f03325615556928889f899c6b4304a3ff98b90aded88d201c50856f0af65e04d696bb855d1ff9c53edb39dbb93b1f561597b9c28aca2c2c9323a98ce2f63133fcb766ecbb0d7495e7427cfede0bd37cbb33a6f9be715af5fe4056f0beba283f40064917265cab47782cdf035b0f77f74214056dd713937a921e421796f7d7c2f1eec6dac6378945b18dd43ce844ff4173f0f0acfdda1d71461a56927cba7515b19f65906c243e458dba680c90c17f54aa84432a0cca3bc9472f1f7a5726d03e96c11b9b37c6712a72a31c7ca99fce2fd78d76880c5a9dd4475019fef9d293cf1c2ec40af7c6c6a79fd6536500256c2819448113b4b7b093cdf60fec40f6c1513b2d0008f0bb3f7fe987178e1c3db6b0540083777ffbe078663301c2ebb39eb66dd5ac702be210e51c928b1d6ef5c6adaa1f8651a6fdb632f53a90e3279e7ee1e8d193a70af0f32d6399fd3ef5728021320651e09309f165f7c95e5db751f681089df060cf8eb65ac6acda0b238c3fa60ce3afd0ca4da74e1e397af2f4b1620c89cb0b688a868c01af07ed081fee734d34c3593ac59e598d7b4e80ee9475bfa337d7ed682612257452b3317e9f309ae9b436fbdb678e3e7e1a37a02057f459147e4c190c8354394961d6de8e1c8b082698e976d75bdda1c7059974a65f0a5b1ea78458c1aae3b3990d483bb7f92b8f9d3a5fa4b15e1a9a802083f60809643b906e074d651f9ae751ce510c225c272310999c82e8db8e4f08cc84725313df7281c6f473da3637903b46a500642a8408951be9d252837046804e856ac12aee424a809b8e05b3f55fc9fa1a4b4b05e5cf56cb5532e0fe9a410c10f531cae1c63e93e4b6a429a263a31dcb6ea73bd01ce88c6e19678a587b85ab4f1a5218ade904852c2d2708c603a9e5de0ee0b52808ecc0479b1cf11a1ca6eb2f75720513f8fd41adb29545593a306f38180c55f123b839746bcd4ca44bf0b514eb164c404a3f56403230888160c2a03bdc6d80907b20b81064f61353e006143f5e452ad07601801090b165ea38460ca9e5425bb1c4fc36404ef850d8d33154c84018679aaeeb746ad83554a8e4a880a2fde98433c638472151dd8fe3d8afd79a1e659c28ade807e43d4049b6c0200dcff3cc51a7e65a89c4377ebda929184889d3bcaae0ef0c8099df2030eaedf8cca5924001cebd9c827c7920da0ed6fc46c62e91b8caa36b11d318f67657569407fc781783e49b3a55c49f5f66b96f8afc5b0c0580eb354ba610bee39a8c28e287cad9796d8094922aeb18086f748671462076fb26e10618c54f62c8735f50a14a06c038d13d73139e4e3853cfbc94e7b0f96149babc55e76496417d0e932ad1b9625151c7123085a1048e00986b05cb3b1b54c3fe0bac00bdad0cc383973189c0c881b255b04ca24539f62f1ff20f2229ee098556f91709746efe09244f67baf10f194029124836cff0e62c7f21cfff1a423dfb4ccd20ff5cb63917f27d0fe53f14e140ad795e03a92708dff7d00ae48f5f1670991818f9184045bbf51c3e892b1b83df8fe3b3f21b82ae1807ca953ff241d7058b0ab801056a70ee5f5c585a2e2581570723cef7a00018be19bf7a6961b99c04deb223b7c105515d80025060829b6ecf2e3181d5d069f923c0c787b08d45f6904b08bd6a05e370bdc404822074c641d76d6a99411752188c0bce1ad5b8f5c8e5cb8f854179098c0f1d3a74e5caa143571f3be8d79a0d9df01444f73ac341affdc7a19fae5dfbf6cad5b74a4be0d0f7d7527c7fdd1e07edd69ae5fbaeebfad6dabaedfcc5cc59e8386e75713ccae87b874f9c8728b771a6528465cc532c330e1623172d4b195bd515458be205d340c378b3f73a9c745ea5e7387193eb1de6ffeeb0e1f7bb70064f120f52c4b635053eecac86426752e0a93c8e663f9066a3d831398a1493129a4d88669b16810f8340e80c0afc6f4d231a314d7846b4b4343b95374180801931628bb6ac9ccd19000179d1d0ac079a018bc58c453f161aa21d5b966dc7b02c1038b333400c43351ea8964160acc507f089790286a5251c1b04c2e1b3c41e9e0943427fad2986a31a96aaa51d623b4253fdac64dab29d7a27b5645928000943664edf03c9c7f9ffdaa205dbf781ada58116768120f000042cc930d2b3297975fd5924340aba9f3efcb3f58dbf33d9dc3de5812c6b1ac14d40b48420f0894588f24ec2481b1f5a24b99c2f144be54a35e25fe8e4f7348cdc98bd56aa17a89e9f83d681f9078e4a888ab5d22ba4d30206b1ada862c3da4a24e148da78c5b89bad375b6071e2123e7ca55d2c7418635cefce25f16fd2bf361ea414132720f5664c1090d2b26cc13292e5fb49ec059a771b8c72c6d022535e7f361a9499935b3891f55eb14019e3b4d371597e0ea8f0dfe7b046ac1416a14f7c7ebfc10a469f00bffa93f707f838071c4eed500e1ab490a955c3dec54f64f0239552dff5e0219472da981fb7652c389a829f711dfc9b4421b1b429c3d6569751d4ebb9e9728af1ae01126ebfbd1e396687196f902aa52c658c765c84c7b0c122128d0c149540f0b3402092040aaa73db53c567a4cbe83838153811d9e6faa82e1f1f7eb5dca78c233d9da471cfa3f2b8928aa6680f625b3ebad05b86b93039f21b9882a9e02519ebf47bd5e35140fc702533648ce29c4f05760062f95c97138984ff758468f07154ba317560f2554330c0894087e13f95a35740fc48adcf19477831fa40469effc0ae44a5e8d6895f993eeef6529ed160c081335a6f458e5601f09ff5b2706561e5f8029b8bc83321bbf3e636fc972f4c027bd99e6c02712d51c6b33554383afc70ade0151dba45f4c1ef17c45c8f6fc90ffd728281b3a9d32de3ada46c0bef7b44fc1b7d61ed886103e83f14d9dedec2207efd4240e0f7a080e0c058bf72140670856a8633c4dfb300b6cbbfce1f90bc78613128202a504633550038347f6dc8e06adb8737e6ee050dce470306f1b76e0427609ead704a775618b600e170fccf8a8cbb74c730f84a286870455c44d06e19e44fea6211da723b73967976188399d07a415c3d5b46ef2edd0e1a5c8e070a68907f2e2f2ea0edb642761d0c0eccbfd1612edd3dfa80800164cae24e7ceb023a3a6c61aeabd3bdc465ee06801c90bf45f95ef85756f44df9b68fe7835e8fbf5e40fd8f2e2c0df49515be27034e5b073308873628effc5bcc19ed24ae4561b8a7be086f727c86731243941125b1813bafb9e3294c7c035a922209f72a4d465469d2324a6824c808d25d409501509dc9acae8e0152a6ac2d177ef1c61bfbff7badff8764c752f4d76f1a8defb7f1443335f13055a6504053e692a96622116dddb51bf57d9de8e048103fa2ffb04c3a7ffdc6668c391de06e2dd14c4efee1f65f74e0beb804f0d43713ff6d6d74bb1119e8dd531d94b97380fda319a4fdb96148bbdd66ad4ea7f5106fee7a7abd325dc502f5d4c71f23dd9dbdedd8d6b604c8d23d718b0ced235d5423e9d7cd27f68eed9a000fb7fd145a8032c502c5c34f25a25f3623522cb61dfe8324b76923000735fe019c997a85207fbfce66b0d1c3ddff4dd70294e92a7e03dd6dc6b7baeb92fb86830952b8478c01083913443efda2451a80891be4f3d0eab4d6fa49b74cdd024af6d7229b7b70f43e60878823b0a015f91a885240c07e83cd01c7700b16507e7467479a275f921b608086c9db4425030dd023e01b83dde93cf493c9fee3e606ae8e1f7a0860042538569e0aad6002f822e0db249842b4bbee3ffce91098d414f054e98a50240e00221040dbfeb1ee3f7cfe10e0088a7403a210d20c7a0482e8c5e09cfdf087a06268216185be41ba4e8f40104e38088e10c04ad3774814aad401d4d972067a267d04a71c2128103f85210281d88ea2045bb8a71b28d0231cb2681330832360dbaca786031d7084c0d4f2c41088c2f9b50906283402f53b83e14856038620c94fe410d0bf93120c10320cf29d714610b2cfaaac28cba798d3805e062a0b083000dbe3bcbce2876728a7f8f76862c053b78872a5ac5f9f930d1cea866910d0ebf65fe50f8679d40f3f9937dca3f93564109f651a26c7042c4dd32ccb2a954e4e4e0a40ad562b02df5cae3c8e4fabd5cbe301b3e7c8b71d36caa0764014718fe65a50e483cba3cb8b8beae9f195073ea208c0230b00082895408aa67db5881300c41040b976cbfb0dd8b8fc59148e787348ff9c1705457d265e29a2a2a52fb401711a21ffe2d83ef9b8fcb3872582d7dc81df82a2be81d159f029c292bcffa185f7d063c79e51cf5cf9b8f9be3709a005582465c6406e41b74f09e173454c4bd661f6b47c36f6e4fb11710abf54353cf1a0782f92f85446e0c0050f7f30ca06dc33fee35a483f87d10322abb94fd60f4f1f0e1c8fc1389d41f90b2e69b339d7037290163e196cf9e1d8e53583bf53ae3a43d9dc9b4b0eab76497e03a2bdd702c46cc7720000000049454e44ae426082	image/png	\N	\N
10	sexy Drives	drive 1080p turquoise	teal	2022-04-01 03:31:51	2022-03-31 16:29:33	virtual Analyst	collaborative	\\x89504e470d0a1a0a0000000d49484452000000c0000000c0080300000065029c35000002fd504c5445000000cbaaa34b566cac9983baa78bb59885b08e7eb0907eb59584b08f7eb39282b19180b19180b1907fbc9986b99684b1907eb09080b59382b79685ae8d7cb08f7eb08f7eb1907eac8b7db49382b1907fb08f7ec6a18db29180b1907fb39282797277c9a38fd3ac97c29d8ab1907fb29281ad8b7ad8b09acea793b19080bf9b88ab8977aa8775c0a293ccb1a2d1b6a8d6bbadb99a8ac7aa9be5cdc0efd8ccf3ddd1f6e2d7f8e4d8f0dacedcc2b5bc9e8ee0c7baeed6caf5e0d4f8e3d6f6e1d5f4dfd3f2dcd0caad9febd4c7f4ded1e3cabdceb3a5e8d0c4d8bfb1c4a798fae5d9a88472f4dfd4fae3d5f1ded4f9e2d4d4ccd095abcb81a0c9a3b2cce6d7d2cfcad08aa4caebd9ce4189c60080c52083c51b82c52684c52e85c6007cc27b9eca4d8cc6478ac64a8bc60282c5cac6cf1181c44088c6aeb7ccacbfd8b5c9e1b2bacd6f99c8bdbfcefce5d5fdf7f4fffffffefdfdfff1e5fbf1ebfcf4efe7cbbe0981c5fae8defefbf8ebcfc3eed3c6f9fafbf9ece5ecd0c3dfe0e19292936c6f77d5d5d7f0f2f4aaaaab7d8186bfbec0eccfc2ebcfc2fadccef5d8cac7c5c7000000e8e8e9454545989b9ceed2c5eccfc2393939b5b6b8cbcccdebcfc2a3a4a4ebcfc2878d903c88c66294c7a9a7a64a4d599d9e9e535866ebcfc1edd5c7ebcfc3939799ebcfc2eacec2eccfc2ead0c3558fc7e6d4cc9caccbcabfba3884c1418ccb4189c6397eb8d2b9abacb1c84591d13982bf4189c64189c6c1a293bd9f8e3f6389f6e1d4f2ddd0f6e1d4decec5bdb6b1d5c8c08e9496b2afad9c9d9d979b9c464c5d484f5f4b556a474e60474e60d7d7da313c53484f60495061495061495061484f60495060494f614950614950613e465a585e6d4d55674a5264495061494f6148516349506149506124324c484f61485061132746495061484f61001a40465771406085406a9508598d7d9abedbe4ee226fa85081b13f77ac3373aa3373aa3679b30063a3007ac14082bb4761827194bb6c9dcf396fa1c6d3e40171b03372aa3374ab3678b13273aa4188c63372aa3272aa4189c64188c64089c69cd9201a000000ff74524e530003030205184270868f569be0ffffffe733fffffffbfda82564bffffffff17a0bffffffcbb6ffffffd6ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff69ffffff482effffc7fffffffffffffffebe7ffffffffffffffffffaffffffffffafffffffffffffffa011d6ffe7d1e08cffffffff6ffffb28dad9ff48eb842e4415dd9fa6fffffffffface037557da6d4e1fbddb29175462768befffffffffff9896183fcff71c9fff09bfffffffffffffffffffffefffffffffffffffffffffff2839fb7d0d45cb5dfde6f838fea0000193f494441547801d497d176b23a108583001635131b6762eb402b5025f2fe0f7816b3385d14e1ffcfcd01ba6f58e4eadbccde1355ffb3824def258c42f59bd401c7c9f6254dd3975ddc9efc2afc967eb73f681099e3fe55a920fc4d1f3fd91f2c9c10ad25226781ce6f4a45eb040e225110ca8b7cfcf70bc389094d965966d68e72f8f8bcae700861d4afea46f85ed38331da11daa2ac1859e4c8c257b2b6210441eb214e76dbed2e89852d7ebf1158470eb12a4b73e76f3932fcb9260752d5eb2efd3ab235c6eae3d7394d2f470b39116bcc8bdae7a8b927cae1f6b69e18054a5db70f0bc60aa5b606a07d21c7cc98fb017f2be7e098a8701d0e22a5760f308e9c732c708e8884bee3b7a879283ae9ad785f7ef5a8f87c328ef887102ccab3a84bf3cc2f313abd88fbc5e3931c80698088799663fbaceaba417e162213c33952d1e2f1d96a43cf7c4d26fca7b22e700c1fa0cd5a735bd481f0ef41d3086151ddbb00591cc1f7991c135c167510a9e80cec46f8ad6f01d19475854ff8c69715cab1a3456710a9f802e4f859f7cc23cb00bcc6a776d4fe74e74ed49ca5480bf17f01f18850976d82d096c30623425967dc3b74902a152ec4ff18e7676c24f9580d06a0516775d960ffcc39b35561b82a7e465fb4fcec070d40eb6b3f2cb5d3f65d452bca8f74d74885072b48e2a39107224bc9ec0e02155da6f8190bdf5d62d90ffe6a189f6f07c7b7591d48e9ce407a82df968d60fada60afbe592d831911c1e33aaf838dfa04c713ba57a546f1e1f907bfc47fc2c14da9cd9c0548584f1a409fdd25f1fd0a635617adad4907e98cab68a3ae0f4393fcb64d8a205becf167883c29a74f33aea240bd00f194d0f85c0c783fc13f2697bbd956d146bd7d58376da029843f2f25493cd847532273885534d306da03f11f0c54f87d198810fece2fbf4ce72972a05e29777f32d020b3be375e4a2b56fe033febb98a1ca8747a00c20b28cbb4e8f8755920f2dfe5b4dda96806fef8681d4f0bad18c0ace90c78dfe3d7b96e956b7e16d98f196ee4486dcd34bfb4d7c82333d8fd35d0f82f7ccefff0661eeaaddb3a00cebab713c73d127a963e76971da46dc992492f0e6f3bf1fb3f4f29d19667b758642748825fc42665bc120a70330ceeef1e8387f087eb1a00a5d416b52a8bbf275827d54a2541ce316e77ba699a7632ce006e107c7c0d103c87024990324631f19e81718c09c22b7f1cdf4658594f398b7b695ef485742206c311bb46780349e86a707ff7bef5e6ecff12e4341ab5dba3c8d98825034415974f492d2c1d87d3ac339e282d8551d6891272ea102881cb6ae0dabafbe06de8d9f3e7301bcf078bfe60beecb609e70850198f5540b792cafad57220a450b614e5c47d300e21e3486e344521015c1b149f0000b2de5a486d9c68a9ed7cb38d182fbd0908010064de7a2d8537fd2825c220050610da89fea08a01d2d468650fe220d47c38cb12c639638cb364543f7b7525d60abdde72847327faf018f00c9e2e42806da439b1cd31947e3e580fbb9dde76b6daaca7faa6f5b5beb42952727606ad907de9d359230abcabd585713e42a534aa6429f1acfa03b1462e6346ced6d601e3d81ded8fc72a4058bb6f6e995785aa319ee64fc45a391f9d11b83d4b4080a75fea3a0c98ace5e20f2cb3ea2f8995939ac047c10f4fa1a2e0e1ee7f9fd7658c3807b2aa01e9cb794ce13411bd0e75044f274908683c115635210bb94484e03ee4a779026f0e0790367200de8bba9c9c15b3f00080d1bc390031c8289cb474e1003e8dea143a13caaac68e60c3e13f71a1f70780848ea5554d8915933a8e217193d97da82cf4517c08e16c20ac6a4e4c8fd54710fd3f14c0fdddd72d7f194cf8ca4740081f0a0fe08435e7413e938e69bde3faf2757000a071211a3d01bd26081e20722bae87400087899ef09e528d028822a3709cca1e83ad24e27d12dd34ea41ca2abb65e4d00b3d3880b06914316f164059dde57b8057eee6f5316c21bb1d02d6c962f1e75d68a975a567e59841e8b1b86e25806dadb197cdb3115aca6729cc1f30f879e7d9bd68bfa0389ec03c42f037c75fdfdd8706b8a802d51066a6c53c1f8f9793be96e6364235a5a9221f3bb575313552d78ad6f4dbfb2070771d0fe100a06ae6d8509e4ec25a0ff274368a23a40ca37637ef3b845be64be3f6163132c6288947b3349f4a616d1d0410faaac3cd035f110780343fce62e56ea19b51ce29454c2041c6b13d9ccaab346b85c86791d34300a74629e7384a277b452b97147d1d0bb7e2bdf71319603c17f6d80aaf124e936a0fe4b7a024616c3416170456171de44848a9e5f588838d37cad89396fa4df485ab6301f75a2d07c046f5346fc5a4cdf168948720c0586ace08ac988f5ebc227835af882f2b5b295adde1107024f6008f3f54005beb8d2bdff75e08ec8d47a4b47410bf321d1e03dd07a953f48bde52b03eb0175f14ad1cd3c39df163d8b50ae12b713800b9c6a4348b00650c63270967401c01db567cc766a7b41d1c18c65996c5c0fc2a3821b46d8dadbb8937adcfbcfd01ef97084fa53d7491394348aaedf96c984f8a62926fda9c3aa4978e386f76220e4e2feae6c5603028d6c3d97e8dfa520138112b4eca792ce866eeeb0a60238fe97bc628c3ac379c08298513f93c4d33a46c3417e731308e29c6b3b5d7125a9af9b0972594c66351e7a10442af16ffef9e911f276b025797f24249b1ebdb4afac69585f1f26262dbed4491e713a3ed416d27a41aacddf7c4e14f4d478c00845c4fdf571734484e1612d63c3bd1a61c0bf7a2942ebfa5cc6e77b45f55dfd5a6d6aa7e434bf73dbb3b36746fca9bbefb80f703f7ee8aec7427fa1bade6f59d38b284711ceedd7dd99c779f37e720d8405b3d67274f0b81a304c8460267131c09ce3903e33439a77f73bbba918c35c26ffd3990be03f5a3aa54dd3a228a1c6a24a2a80ec13936cc6dec88f0c5c71fd031d0e21347005d0c27a56b226a38d2de501d9d3681dad57d8ead87db3042d7be7f5bdc18003543137c75c96e01a284353d1a8b1b1e8ac7a2bd7d2195305b97416d46235b7748e60481bfbea7d761b608bed4e6fd5fedcd00416a444f98565c4feaf4b7974b4f26752ac3322d3da510b0a16e6a33a3cce6f86c9b65ea5d60e3a3808e01672121685fffbe7380278874f75b0346f720d3d030d3087fd417d7ace4080390437dd153db08b70df147a371d3ec1f031b6fe3f7df140b00eb39673b09007aa23f42d28aa25ecf64b972e30a55baa72f9ed01d8058a2bf43069b3291abf926d32ab5758e1a89e429c095b761372096604a91eb32309dd053e9109166f2347410844630c1e931bd1ec08a85a9eda24c316d5fc62f51dba05e0720a39fe0bca25880023a0b304d0bfd6280060441c1bf5c761223a2b800e2618560c4e3afd9f27e4c94110700e40f16c402b434f98a521bae0748a6d22c3088ab44e3038cd98b9e001727f8eba51cb74d5e7401e0365cf4b50a9d03bec21c426e0069960534bfb0b8b0c4eee511f60090fc2cf0e595c5d5b5122398915c1940d27a013e465cfc1b9b5b12426e8049f8feb77740dbb5c8580f0caa84aa0690bec03877f7c0b69f03df841b4096368353c200a001b6ca950bb23b03721ebed8fdc56a756f676f9747566b621a1352ed0c4cc24b3717f7aa7bd59d03b89fc1ae1292ffac940f8bbe26610998dbac1cfee1065068694061975677aad59d25886c52525806d81288c01c00800c7d2957caaeec50d023485a9eb833f0c76165f3585411b5fa0a875441843c0040276701cc5bb7dbb912b7340ec0b40600773c0150f0f0b05c11958226da0115fa01d8dd037e28a1d2dac21e0deceeb25342a666c4a24cb74ccd29a1a57bf7a184c2ee12e22ad36f686bcad72aa8828e01e0109ac0a3890f764007bc8939806672699a76dac477c17694f56ce28b8787b4861e88c94093efe1a32d00f85376650022a39a3f3a399a67f7f2325600e0569cc9b8a5b10c04f861f4e6c9e3839cc7611436650c605d481300c0130610445e832ccba2e3e283cc8a46c25da0d4a861f241e6d83c071996ff0080adb9565f934880327601908b332c261be174299156d2f4576eaf2d25e48c6d035fdeef02801e0680a70f85024013b800904dc0e2cfc836c0a00a0751543b8c1284fd1930705b7ee6227201e0b2e00c3ce3007c1238004a881029e02ca727b0444848b10799b39460363291abd926fdcce600f01610d803f09eeb9b0ca07c5a4249a813555515559d99cce7f399f1ebec8192ee38b316a251dab6890cb54dcc709b1299e6004e0bb0a3508ba039f09c031c5eac03b8f562ac93e9e54bf6bf936b44bb65d50318b7539d5c676c83b7062c0070a680b8390000c543fe117fcad8d9526a46fcc5eb4ac46f9dd952529be1658b529bb3a5bcc812107c22a6877d7079ff039e8220e2523b7a13a665dd7a5d039665697cb74e901c69684bd0a763d0df6c25c72b6883c72fb28dcb1711a6226ae7a83eadebd31ed2e90baf0882c8a8ed76035b126c1dd402ef8782bc855b8401c07adaaea1b640a00d63b573e45543a5e07c0f889c67eb481199c055b06d08e22f3f298a3cb768f77190fcf3f3d57f03325615556928889f899c6b4304a3ff98b90aded88d201c50856f0af65e04d696bb855d1ff9c53edb39dbb93b1f561597b9c28aca2c2c9323a98ce2f63133fcb766ecbb0d7495e7427cfede0bd37cbb33a6f9be715af5fe4056f0beba283f40064917265cab47782cdf035b0f77f74214056dd713937a921e421796f7d7c2f1eec6dac6378945b18dd43ce844ff4173f0f0acfdda1d71461a56927cba7515b19f65906c243e458dba680c90c17f54aa84432a0cca3bc9472f1f7a5726d03e96c11b9b37c6712a72a31c7ca99fce2fd78d76880c5a9dd4475019fef9d293cf1c2ec40af7c6c6a79fd6536500256c2819448113b4b7b093cdf60fec40f6c1513b2d0008f0bb3f7fe987178e1c3db6b0540083777ffbe078663301c2ebb39eb66dd5ac702be210e51c928b1d6ef5c6adaa1f8651a6fdb632f53a90e3279e7ee1e8d193a70af0f32d6399fd3ef5728021320651e09309f165f7c95e5db751f681089df060cf8eb65ac6acda0b238c3fa60ce3afd0ca4da74e1e397af2f4b1620c89cb0b688a868c01af07ed081fee734d34c3593ac59e598d7b4e80ee9475bfa337d7ed682612257452b3317e9f309ae9b436fbdb678e3e7e1a37a02057f459147e4c190c8354394961d6de8e1c8b082698e976d75bdda1c7059974a65f0a5b1ea78458c1aae3b3990d483bb7f92b8f9d3a5fa4b15e1a9a802083f60809643b906e074d651f9ae751ce510c225c272310999c82e8db8e4f08cc84725313df7281c6f473da3637903b46a500642a8408951be9d252837046804e856ac12aee424a809b8e05b3f55fc9fa1a4b4b05e5cf56cb5532e0fe9a410c10f531cae1c63e93e4b6a429a263a31dcb6ea73bd01ce88c6e19678a587b85ab4f1a5218ade904852c2d2708c603a9e5de0ee0b52808ecc0479b1cf11a1ca6eb2f75720513f8fd41adb29545593a306f38180c55f123b839746bcd4ca44bf0b514eb164c404a3f56403230888160c2a03bdc6d80907b20b81064f61353e006143f5e452ad07601801090b165ea38460ca9e5425bb1c4fc36404ef850d8d33154c84018679aaeeb746ad83554a8e4a880a2fde98433c638472151dd8fe3d8afd79a1e659c28ade807e43d4049b6c0200dcff3cc51a7e65a89c4377ebda929184889d3bcaae0ef0c8099df2030eaedf8cca5924001cebd9c827c7920da0ed6fc46c62e91b8caa36b11d318f67657569407fc781783e49b3a55c49f5f66b96f8afc5b0c0580eb354ba610bee39a8c28e287cad9796d8094922aeb18086f748671462076fb26e10618c54f62c8735f50a14a06c038d13d73139e4e3853cfbc94e7b0f96149babc55e76496417d0e932ad1b9625151c7123085a1048e00986b05cb3b1b54c3fe0bac00bdad0cc383973189c0c881b255b04ca24539f62f1ff20f2229ee098556f91709746efe09244f67baf10f194029124836cff0e62c7f21cfff1a423dfb4ccd20ff5cb63917f27d0fe53f14e140ad795e03a92708dff7d00ae48f5f1670991818f9184045bbf51c3e892b1b83df8fe3b3f21b82ae1807ca953ff241d7058b0ab801056a70ee5f5c585a2e2581570723cef7a00018be19bf7a6961b99c04deb223b7c105515d80025060829b6ecf2e3181d5d069f923c0c787b08d45f6904b08bd6a05e370bdc404822074c641d76d6a99411752188c0bce1ad5b8f5c8e5cb8f854179098c0f1d3a74e5caa143571f3be8d79a0d9df01444f73ac341affdc7a19fae5dfbf6cad5b74a4be0d0f7d7527c7fdd1e07edd69ae5fbaeebfad6dabaedfcc5cc59e8386e75713ccae87b874f9c8728b771a6528465cc532c330e1623172d4b195bd515458be205d340c378b3f73a9c745ea5e7387193eb1de6ffeeb0e1f7bb70064f120f52c4b635053eecac86426752e0a93c8e663f9066a3d831398a1493129a4d88669b16810f8340e80c0afc6f4d231a314d7846b4b4343b95374180801931628bb6ac9ccd19000179d1d0ac079a018bc58c453f161aa21d5b966dc7b02c1038b333400c43351ea8964160acc507f089790286a5251c1b04c2e1b3c41e9e0943427fad2986a31a96aaa51d623b4253fdac64dab29d7a27b5645928000943664edf03c9c7f9ffdaa205dbf781ada58116768120f000042cc930d2b3297975fd5924340aba9f3efcb3f58dbf33d9dc3de5812c6b1ac14d40b48420f0894588f24ec2481b1f5a24b99c2f144be54a35e25fe8e4f7348cdc98bd56aa17a89e9f83d681f9078e4a888ab5d22ba4d30206b1ada862c3da4a24e148da78c5b89bad375b6071e2123e7ca55d2c7418635cefce25f16fd2bf361ea414132720f5664c1090d2b26cc13292e5fb49ec059a771b8c72c6d022535e7f361a9499935b3891f55eb14019e3b4d371597e0ea8f0dfe7b046ac1416a14f7c7ebfc10a469f00bffa93f707f838071c4eed500e1ab490a955c3dec54f64f0239552dff5e0219472da981fb7652c389a829f711dfc9b4421b1b429c3d6569751d4ebb9e9728af1ae01126ebfbd1e396687196f902aa52c658c765c84c7b0c122128d0c149540f0b3402092040aaa73db53c567a4cbe83838153811d9e6faa82e1f1f7eb5dca78c233d9da471cfa3f2b8928aa6680f625b3ebad05b86b93039f21b9882a9e02519ebf47bd5e35140fc702533648ce29c4f05760062f95c97138984ff758468f07154ba317560f2554330c0894087e13f95a35740fc48adcf19477831fa40469effc0ae44a5e8d6895f993eeef6529ed160c081335a6f458e5601f09ff5b2706561e5f8029b8bc83321bbf3e636fc972f4c027bd99e6c02712d51c6b33554383afc70ade0151dba45f4c1ef17c45c8f6fc90ffd728281b3a9d32de3ada46c0bef7b44fc1b7d61ed886103e83f14d9dedec2207efd4240e0f7a080e0c058bf72140670856a8633c4dfb300b6cbbfce1f90bc78613128202a504633550038347f6dc8e06adb8737e6ee050dce470306f1b76e0427609ead704a775618b600e170fccf8a8cbb74c730f84a286870455c44d06e19e44fea6211da723b73967976188399d07a415c3d5b46ef2edd0e1a5c8e070a68907f2e2f2ea0edb642761d0c0eccbfd1612edd3dfa80800164cae24e7ceb023a3a6c61aeabd3bdc465ee06801c90bf45f95ef85756f44df9b68fe7835e8fbf5e40fd8f2e2c0df49515be27034e5b073308873628effc5bcc19ed24ae4561b8a7be086f727c86731243941125b1813bafb9e3294c7c035a922209f72a4d465469d2324a6824c808d25d409501509dc9acae8e0152a6ac2d177ef1c61bfbff7badff8764c752f4d76f1a8defb7f1443335f13055a6504053e692a96622116dddb51bf57d9de8e048103fa2ffb04c3a7ffdc6668c391de06e2dd14c4efee1f65f74e0beb804f0d43713ff6d6d74bb1119e8dd531d94b97380fda319a4fdb96148bbdd66ad4ea7f5106fee7a7abd325dc502f5d4c71f23dd9dbdedd8d6b604c8d23d718b0ced235d5423e9d7cd27f68eed9a000fb7fd145a8032c502c5c34f25a25f3623522cb61dfe8324b76923000735fe019c997a85207fbfce66b0d1c3ddff4dd70294e92a7e03dd6dc6b7baeb92fb86830952b8478c01083913443efda2451a80891be4f3d0eab4d6fa49b74cdd024af6d7229b7b70f43e60878823b0a015f91a885240c07e83cd01c7700b16507e7467479a275f921b608086c9db4425030dd023e01b83dde93cf493c9fee3e606ae8e1f7a0860042538569e0aad6002f822e0db249842b4bbee3ffce91098d414f054e98a50240e00221040dbfeb1ee3f7cfe10e0088a7403a210d20c7a0482e8c5e09cfdf087a06268216185be41ba4e8f40104e38088e10c04ad3774814aad401d4d972067a267d04a71c2128103f85210281d88ea2045bb8a71b28d0231cb2681330832360dbaca786031d7084c0d4f2c41088c2f9b50906283402f53b83e14856038620c94fe410d0bf93120c10320cf29d714610b2cfaaac28cba798d3805e062a0b083000dbe3bcbce2876728a7f8f76862c053b78872a5ac5f9f930d1cea866910d0ebf65fe50f8679d40f3f9937dca3f93564109f651a26c7042c4dd32ccb2a954e4e4e0a40ad562b02df5cae3c8e4fabd5cbe301b3e7c8b71d36caa0764014718fe65a50e483cba3cb8b8beae9f195073ea208c0230b00082895408aa67db5881300c41040b976cbfb0dd8b8fc59148e787348ff9c1705457d265e29a2a2a52fb401711a21ffe2d83ef9b8fcb3872582d7dc81df82a2be81d159f029c292bcffa185f7d063c79e51cf5cf9b8f9be3709a005582465c6406e41b74f09e173454c4bd661f6b47c36f6e4fb11710abf54353cf1a0782f92f85446e0c0050f7f30ca06dc33fee35a483f87d10322abb94fd60f4f1f0e1c8fc1389d41f90b2e69b339d7037290163e196cf9e1d8e53583bf53ae3a43d9dc9b4b0eab76497e03a2bdd702c46cc7720000000049454e44ae426082	image/png	\N	\N
\.


--
-- Data for Name: cloud_environment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cloud_environment (id, name, description, account_id, access_key, secret_key, region, vault_id, org_id, status, created_on, updated_on, updated_by, created_by, cloud_id, department_id) FROM stdin;
351	Test Client 1	Dummy customer's AWS account. Test Client 1	657907747545	AKIAZSLS3RLMTWWI2H5J	evHxxbX2O+qemOy9jJMmu6il9JeC5PPOZ4QdSS2I	us-east-1	\N	78	ACTIVE	2022-04-11 06:33:27.212919	2022-04-11 06:33:27.212919	Postman	Postman	251	302
352	Test Client 2	Dummy customer's AWS account. Test Client 2	657907747545	AKIAZSLS3RLMTWWI2H5J	evHxxbX2O+qemOy9jJMmu6il9JeC5PPOZ4QdSS2I	us-east-1	\N	78	ACTIVE	2022-04-11 06:33:48.819249	2022-04-11 06:33:48.819249	Postman	Postman	251	303
\.


--
-- Data for Name: data_source; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.data_source (id, name, description, type, status, created_on, updated_on, updated_by, created_by, cloud_environment_id) FROM stdin;
1	Home Automated	metrics Car Cotton	Table	Cliff	2022-04-01 01:22:06	2022-03-31 15:29:06	6th Luxembourg	database	\N
2	Assurance Handmade Plastic	compressing	copy PCI	reboot	2022-04-01 01:00:34	2022-03-31 14:40:23	seamless Industrial	brand Village Samoa	\N
3	Rustic Creative	COM program	Oklahoma Secured	morph Chicken	2022-03-31 15:43:05	2022-04-01 01:48:13	black Accounts	Regional	\N
4	extend Analyst	back-end	Liaison	Solutions Ball Chips	2022-03-31 15:29:49	2022-03-31 17:31:43	platforms Shoes	Shoes UAE	\N
5	IB Rubber	maximized	Soap Escudo Salad	visionary	2022-03-31 20:11:08	2022-03-31 15:46:01	deliverables Tasty mint	Renminbi heuristic	\N
6	Lock Research	black invoice	Chicken Unbranded Shirt	Mouse Wooden	2022-03-31 17:13:44	2022-03-31 22:30:10	haptic	Solutions Facilitator Exclusive	\N
7	Plastic open-source circuit	non-volatile Concrete Generic	drive	Gorgeous backing	2022-03-31 08:59:08	2022-04-01 00:11:19	gold	cross-platform Planner maroon	\N
8	quantify	facilitate parsing	Home	Games Managed	2022-04-01 02:27:57	2022-03-31 19:18:31	maximize	tertiary Mouse	\N
9	Investor	Ergonomic	Checking interface	monetize Incredible	2022-03-31 17:07:15	2022-04-01 00:04:03	indexing Rustic value-added	Stream	\N
10	Nicaragua	Industrial Avenue Paradigm	eyeballs	calculate	2022-03-31 14:53:09	2022-04-01 04:38:04	visualize	Customer killer	\N
\.


--
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
00000000000000	jhipster	config/liquibase/changelog/00000000000000_initial_schema.xml	2022-04-11 02:38:57.284475	1	EXECUTED	8:948c32d98014976847f08b37a00c7ab0	createSequence sequenceName=sequence_generator		\N	3.9.0	\N	\N	9624937170
00000000000001	jhipster	config/liquibase/changelog/00000000000000_initial_schema.xml	2022-04-11 02:38:57.309088	2	EXECUTED	8:3c2fb2f2606417392082d55679e608bd	createTable tableName=jhi_persistent_audit_event; createTable tableName=jhi_persistent_audit_evt_data; addPrimaryKey tableName=jhi_persistent_audit_evt_data; createIndex indexName=idx_persistent_audit_event, tableName=jhi_persistent_audit_event; c...		\N	3.9.0	\N	\N	9624937170
20220401055847-1	jhipster	config/liquibase/changelog/20220401055847_added_entity_ServiceProviderCloudAccount.xml	2022-04-11 02:38:57.323302	3	EXECUTED	8:ec8b636511af390cb1b02ed1ad6d2b29	createTable tableName=service_provider_cloud_account; dropDefaultValue columnName=created_on, tableName=service_provider_cloud_account; dropDefaultValue columnName=updated_on, tableName=service_provider_cloud_account		\N	3.9.0	\N	\N	9624937170
20220401055847-1-data	jhipster	config/liquibase/changelog/20220401055847_added_entity_ServiceProviderCloudAccount.xml	2022-04-11 02:38:57.343043	4	EXECUTED	8:a175ace85ef7407d40bfe161ad06edf7	loadData tableName=service_provider_cloud_account		\N	3.9.0	faker	\N	9624937170
20220401055848-1	jhipster	config/liquibase/changelog/20220401055848_added_entity_Department.xml	2022-04-11 02:38:57.353315	5	EXECUTED	8:f0eb51c39e6a0f2c4f3ba200b793fec3	createTable tableName=department; dropDefaultValue columnName=created_on, tableName=department; dropDefaultValue columnName=updated_on, tableName=department		\N	3.9.0	\N	\N	9624937170
20220401055848-1-data	jhipster	config/liquibase/changelog/20220401055848_added_entity_Department.xml	2022-04-11 02:38:57.365193	6	EXECUTED	8:674c1acfde8f2f7626c26fc45b131960	loadData tableName=department		\N	3.9.0	faker	\N	9624937170
20220401055849-1	jhipster	config/liquibase/changelog/20220401055849_added_entity_Cloud.xml	2022-04-11 02:38:57.374868	7	EXECUTED	8:49e14d6ad92626e938de32e185e422be	createTable tableName=cloud; dropDefaultValue columnName=created_on, tableName=cloud; dropDefaultValue columnName=updated_on, tableName=cloud		\N	3.9.0	\N	\N	9624937170
20220401055849-1-data	jhipster	config/liquibase/changelog/20220401055849_added_entity_Cloud.xml	2022-04-11 02:38:57.382967	8	EXECUTED	8:f26894c7b1024e728b1f710f47d073bc	loadData tableName=cloud		\N	3.9.0	faker	\N	9624937170
20220401055850-1	jhipster	config/liquibase/changelog/20220401055850_added_entity_CloudEnvironment.xml	2022-04-11 02:38:57.392661	9	EXECUTED	8:53ac38e04e8ae70cff4e4ebda992ecc2	createTable tableName=cloud_environment; dropDefaultValue columnName=created_on, tableName=cloud_environment; dropDefaultValue columnName=updated_on, tableName=cloud_environment		\N	3.9.0	\N	\N	9624937170
20220401055850-1-data	jhipster	config/liquibase/changelog/20220401055850_added_entity_CloudEnvironment.xml	2022-04-11 02:38:57.401003	10	EXECUTED	8:e8c1ae215a808a23550619536e5e8551	loadData tableName=cloud_environment		\N	3.9.0	faker	\N	9624937170
20220401055851-1	jhipster	config/liquibase/changelog/20220401055851_added_entity_ProductEnclave.xml	2022-04-11 02:38:57.411096	11	EXECUTED	8:2c9e2abf010fa746cfa9161e29bb53c4	createTable tableName=product_enclave; dropDefaultValue columnName=created_on, tableName=product_enclave; dropDefaultValue columnName=updated_on, tableName=product_enclave		\N	3.9.0	\N	\N	9624937170
20220401055851-1-data	jhipster	config/liquibase/changelog/20220401055851_added_entity_ProductEnclave.xml	2022-04-11 02:38:57.418476	12	EXECUTED	8:d02316fe3d701b3478f7f824cb344e65	loadData tableName=product_enclave		\N	3.9.0	faker	\N	9624937170
20220401055852-1	jhipster	config/liquibase/changelog/20220401055852_added_entity_CloudElement.xml	2022-04-11 02:38:57.429536	13	EXECUTED	8:00e9d00cc1172277b9d4c7053d92593b	createTable tableName=cloud_element; dropDefaultValue columnName=created_on, tableName=cloud_element; dropDefaultValue columnName=updated_on, tableName=cloud_element		\N	3.9.0	\N	\N	9624937170
20220401055852-1-data	jhipster	config/liquibase/changelog/20220401055852_added_entity_CloudElement.xml	2022-04-11 02:38:57.445068	14	EXECUTED	8:473dde2edd7cc1bfa3fed8a0962a3187	loadData tableName=cloud_element		\N	3.9.0	faker	\N	9624937170
20220401055853-1	jhipster	config/liquibase/changelog/20220401055853_added_entity_Catalogue.xml	2022-04-11 02:38:57.455971	15	EXECUTED	8:468ea2b36481ecf339c0ebfab9d044f6	createTable tableName=catalogue; dropDefaultValue columnName=created_on, tableName=catalogue; dropDefaultValue columnName=updated_on, tableName=catalogue		\N	3.9.0	\N	\N	9624937170
20220401055853-1-data	jhipster	config/liquibase/changelog/20220401055853_added_entity_Catalogue.xml	2022-04-11 02:38:57.463245	16	EXECUTED	8:df1967829035f2a5e145f50961d654dc	loadData tableName=catalogue		\N	3.9.0	faker	\N	9624937170
20220401055854-1	jhipster	config/liquibase/changelog/20220401055854_added_entity_DataSource.xml	2022-04-11 02:38:57.474209	17	EXECUTED	8:a628b094a82c1e7cc78780b0416607be	createTable tableName=data_source; dropDefaultValue columnName=created_on, tableName=data_source; dropDefaultValue columnName=updated_on, tableName=data_source		\N	3.9.0	\N	\N	9624937170
20220401055854-1-data	jhipster	config/liquibase/changelog/20220401055854_added_entity_DataSource.xml	2022-04-11 02:38:57.480974	18	EXECUTED	8:2fd1c7b8f8318f66cb3ce646fb2c9b73	loadData tableName=data_source		\N	3.9.0	faker	\N	9624937170
20220408082926-1	jhipster	config/liquibase/changelog/20220408082926_added_entity_Product.xml	2022-04-11 02:38:57.491041	19	EXECUTED	8:974ba707f9675fbcc85d5e6f346a6262	createTable tableName=product; dropDefaultValue columnName=created_on, tableName=product; dropDefaultValue columnName=updated_on, tableName=product		\N	3.9.0	\N	\N	9624937170
20220408082926-1-data	jhipster	config/liquibase/changelog/20220408082926_added_entity_Product.xml	2022-04-11 02:38:57.49739	20	EXECUTED	8:0c548e46367ed9216a6182b6a0248044	loadData tableName=product		\N	3.9.0	faker	\N	9624937170
20220408082927-1	jhipster	config/liquibase/changelog/20220408082927_added_entity_Services.xml	2022-04-11 02:38:57.506779	21	EXECUTED	8:1ad58731839d6dee04228234f5ce72d3	createTable tableName=services; dropDefaultValue columnName=created_on, tableName=services; dropDefaultValue columnName=updated_on, tableName=services		\N	3.9.0	\N	\N	9624937170
20220408082927-1-data	jhipster	config/liquibase/changelog/20220408082927_added_entity_Services.xml	2022-04-11 02:38:57.513099	22	EXECUTED	8:93d6c3a854dd754ba696d105b51d3f3d	loadData tableName=services		\N	3.9.0	faker	\N	9624937170
20220408082928-1	jhipster	config/liquibase/changelog/20220408082928_added_entity_ProductService.xml	2022-04-11 02:38:57.523734	23	EXECUTED	8:a43a30d38ac17c53359b367bbb7a28e5	createTable tableName=product_service; dropDefaultValue columnName=created_on, tableName=product_service; dropDefaultValue columnName=updated_on, tableName=product_service		\N	3.9.0	\N	\N	9624937170
20220408082928-1-data	jhipster	config/liquibase/changelog/20220408082928_added_entity_ProductService.xml	2022-04-11 02:38:57.529764	24	EXECUTED	8:cacd4379718413f89496a8ca252ae969	loadData tableName=product_service		\N	3.9.0	faker	\N	9624937170
20220408082929-1	jhipster	config/liquibase/changelog/20220408082929_added_entity_DepartmentProduct.xml	2022-04-11 02:38:57.539754	25	EXECUTED	8:1b5d6ea91ae11deb4e687bb5f3d98866	createTable tableName=department_product; dropDefaultValue columnName=created_on, tableName=department_product; dropDefaultValue columnName=updated_on, tableName=department_product		\N	3.9.0	\N	\N	9624937170
20220408082929-1-data	jhipster	config/liquibase/changelog/20220408082929_added_entity_DepartmentProduct.xml	2022-04-11 02:38:57.546009	26	EXECUTED	8:1b1397fd3774ba610d1707a8101e3391	loadData tableName=department_product		\N	3.9.0	faker	\N	9624937170
20220408082930-1	jhipster	config/liquibase/changelog/20220408082930_added_entity_ProductDeployment.xml	2022-04-11 02:38:57.554976	27	EXECUTED	8:0ff6f917484da480c0a5963a862e8832	createTable tableName=product_deployment; dropDefaultValue columnName=created_on, tableName=product_deployment; dropDefaultValue columnName=updated_on, tableName=product_deployment		\N	3.9.0	\N	\N	9624937170
20220408082930-1-data	jhipster	config/liquibase/changelog/20220408082930_added_entity_ProductDeployment.xml	2022-04-11 02:38:57.561335	28	EXECUTED	8:b832fa099f1beb4d42cc1bd39b63d0e3	loadData tableName=product_deployment		\N	3.9.0	faker	\N	9624937170
20220408082931-1	jhipster	config/liquibase/changelog/20220408082931_added_entity_ProductBilling.xml	2022-04-11 02:38:57.573404	29	EXECUTED	8:43ca61a9c8df05706d604bee4bed19b9	createTable tableName=product_billing; dropDefaultValue columnName=created_on, tableName=product_billing; dropDefaultValue columnName=updated_on, tableName=product_billing		\N	3.9.0	\N	\N	9624937170
20220408082931-1-data	jhipster	config/liquibase/changelog/20220408082931_added_entity_ProductBilling.xml	2022-04-11 02:38:57.581081	30	EXECUTED	8:b9c1a1a2c52d6ab915279f5f5c6cf3d2	loadData tableName=product_billing		\N	3.9.0	faker	\N	9624937170
20220408082932-1	jhipster	config/liquibase/changelog/20220408082932_added_entity_ServiceBilling.xml	2022-04-11 02:38:57.591331	31	EXECUTED	8:7c87c8a5970cb28fdd1fc907d573b9ae	createTable tableName=service_billing; dropDefaultValue columnName=created_on, tableName=service_billing; dropDefaultValue columnName=updated_on, tableName=service_billing		\N	3.9.0	\N	\N	9624937170
20220408082932-1-data	jhipster	config/liquibase/changelog/20220408082932_added_entity_ServiceBilling.xml	2022-04-11 02:38:57.598816	32	EXECUTED	8:7f23656b9090443f69b6181ffb116540	loadData tableName=service_billing		\N	3.9.0	faker	\N	9624937170
20220410083743-1	jhipster	config/liquibase/changelog/20220410083743_added_entity_DeploymentEnvironment.xml	2022-04-11 02:38:57.608707	33	EXECUTED	8:78247229da3aa0b6534e88a3bcb15653	createTable tableName=deployment_environment; dropDefaultValue columnName=created_on, tableName=deployment_environment; dropDefaultValue columnName=updated_on, tableName=deployment_environment		\N	3.9.0	\N	\N	9624937170
20220410083743-1-data	jhipster	config/liquibase/changelog/20220410083743_added_entity_DeploymentEnvironment.xml	2022-04-11 02:38:57.615621	34	EXECUTED	8:3146fabd1e145ccfd70b0509fdb2dfa0	loadData tableName=deployment_environment		\N	3.9.0	faker	\N	9624937170
20220401055850-2	jhipster	config/liquibase/changelog/20220401055850_added_entity_constraints_CloudEnvironment.xml	2022-04-11 02:38:57.621722	35	EXECUTED	8:3ad236c0e9efb5da302ef240137c3c73	addForeignKeyConstraint baseTableName=cloud_environment, constraintName=fk_cloud_environment__cloud_id, referencedTableName=cloud; addForeignKeyConstraint baseTableName=cloud_environment, constraintName=fk_cloud_environment__department_id, referen...		\N	3.9.0	\N	\N	9624937170
20220401055851-2	jhipster	config/liquibase/changelog/20220401055851_added_entity_constraints_ProductEnclave.xml	2022-04-11 02:38:57.625963	36	EXECUTED	8:432987d0f3449b6dda7589eacdfeae19	addForeignKeyConstraint baseTableName=product_enclave, constraintName=fk_product_enclave__cloud_environment_id_id, referencedTableName=cloud_environment		\N	3.9.0	\N	\N	9624937170
20220401055852-2	jhipster	config/liquibase/changelog/20220401055852_added_entity_constraints_CloudElement.xml	2022-04-11 02:38:57.632967	37	EXECUTED	8:7acfa67e0a5950f29492f1f37d295c0e	addForeignKeyConstraint baseTableName=cloud_element, constraintName=fk_cloud_element__product_enclave_id_id, referencedTableName=product_enclave; addForeignKeyConstraint baseTableName=cloud_element, constraintName=fk_cloud_element__cloud_environme...		\N	3.9.0	\N	\N	9624937170
20220401055854-2	jhipster	config/liquibase/changelog/20220401055854_added_entity_constraints_DataSource.xml	2022-04-11 02:38:57.636715	38	EXECUTED	8:899ec261be724fe9473f67f318ae7076	addForeignKeyConstraint baseTableName=data_source, constraintName=fk_data_source__cloud_environment_id, referencedTableName=cloud_environment		\N	3.9.0	\N	\N	9624937170
20220408082928-2	jhipster	config/liquibase/changelog/20220408082928_added_entity_constraints_ProductService.xml	2022-04-11 02:38:57.642954	39	EXECUTED	8:14b14d776c28942f52442b31469e8b6d	addForeignKeyConstraint baseTableName=product_service, constraintName=fk_product_service__product_id, referencedTableName=product; addForeignKeyConstraint baseTableName=product_service, constraintName=fk_product_service__services_id, referencedTab...		\N	3.9.0	\N	\N	9624937170
20220408082929-2	jhipster	config/liquibase/changelog/20220408082929_added_entity_constraints_DepartmentProduct.xml	2022-04-11 02:38:57.652453	40	EXECUTED	8:043c34267d036cbb91e4c925285b04cc	addForeignKeyConstraint baseTableName=department_product, constraintName=fk_department_product__product_id, referencedTableName=product; addForeignKeyConstraint baseTableName=department_product, constraintName=fk_department_product__department_id,...		\N	3.9.0	\N	\N	9624937170
20220408082930-2	jhipster	config/liquibase/changelog/20220408082930_added_entity_constraints_ProductDeployment.xml	2022-04-11 02:38:57.663481	41	EXECUTED	8:c7e7550a258f9125de80518804412bce	addForeignKeyConstraint baseTableName=product_deployment, constraintName=fk_product_deployment__department_id, referencedTableName=department; addForeignKeyConstraint baseTableName=product_deployment, constraintName=fk_product_deployment__product_...		\N	3.9.0	\N	\N	9624937170
20220408082931-2	jhipster	config/liquibase/changelog/20220408082931_added_entity_constraints_ProductBilling.xml	2022-04-11 02:38:57.67252	42	EXECUTED	8:11ce8d50eb4ac4c2c5a7f2655f141517	addForeignKeyConstraint baseTableName=product_billing, constraintName=fk_product_billing__product_id, referencedTableName=product; addForeignKeyConstraint baseTableName=product_billing, constraintName=fk_product_billing__department_id, referencedT...		\N	3.9.0	\N	\N	9624937170
20220408082932-2	jhipster	config/liquibase/changelog/20220408082932_added_entity_constraints_ServiceBilling.xml	2022-04-11 02:38:57.681318	43	EXECUTED	8:53f0ae88ac50f6647023ca740f20ce4c	addForeignKeyConstraint baseTableName=service_billing, constraintName=fk_service_billing__product_id, referencedTableName=product; addForeignKeyConstraint baseTableName=service_billing, constraintName=fk_service_billing__service_id, referencedTabl...		\N	3.9.0	\N	\N	9624937170
\.


--
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
\.


--
-- Data for Name: demo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.demo (id, details, view_json) FROM stdin;
\.


--
-- Data for Name: demo_catalogues_detail; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.demo_catalogues_detail (id, details) FROM stdin;
\.


--
-- Data for Name: department; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.department (id, name, description, org_id, status, created_on, updated_on, updated_by, created_by) FROM stdin;
302	HR	HR	78	ACTIVE	2022-04-11 06:31:31.197029	2022-04-11 06:31:31.197029	Postman	Postman
303	Finance	Finance	78	ACTIVE	2022-04-11 06:31:48.821421	2022-04-11 06:31:48.821421	Postman	Postman
1302	IT Development	IT Development	78	ACTIVE	2022-04-19 09:18:58.37775	2022-04-19 09:18:58.37775	Postman	Postman
1303	Marketing	Purchase	78	ACTIVE	2022-04-19 09:19:15.808718	2022-04-23 08:57:40.036431	Postman	Postman
1301	Admin	IT Infra	78	ACTIVE	2022-04-19 09:18:46.372166	2022-04-23 09:02:39.206486	Postman	Postman
\.


--
-- Data for Name: department_product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.department_product (id, description, status, created_on, updated_on, updated_by, created_by, product_id, department_id, cloud_environment_id) FROM stdin;
651	HR is associated with product EMS	ACTIVE	2022-04-11 06:52:35.216467	2022-04-11 06:52:35.216467	\N	\N	451	302	351
652	Finance is associated with product Procurement	ACTIVE	2022-04-11 06:53:37.196224	2022-04-11 06:53:37.196224	\N	\N	452	303	352
1601	IT Development is associated with product VS Code	ACTIVE	2022-04-20 08:31:52.055501	2022-04-20 08:31:52.055501	\N	\N	1353	1302	351
1602	IT Development is associated with product Android Studio	ACTIVE	2022-04-20 08:32:04.9171	2022-04-20 08:32:04.9171	\N	\N	1354	1302	351
1605	Purchase is associated with product Sales Report	ACTIVE	2022-04-20 08:37:33.857412	2022-04-20 08:37:33.857412	\N	\N	1651	1303	351
1606	Purchase is associated with product Purchase Report	ACTIVE	2022-04-20 08:37:45.56205	2022-04-20 08:37:45.56205	\N	\N	1652	1303	351
1851	IT Infra is associated with product Firewall-Product	ACTIVE	2022-04-20 09:57:59.807635	2022-04-20 09:57:59.807635	\N	\N	1801	1301	351
1853	IT Infra is associated with product Gateway-Product	ACTIVE	2022-04-20 09:59:35.630164	2022-04-20 09:59:35.630164	\N	\N	1803	1301	351
\.


--
-- Data for Name: deployment_environment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.deployment_environment (id, name, description, status, created_on, updated_on, updated_by, created_by) FROM stdin;
401	Production	Production	ACTIVE	2022-04-11 06:35:55.65386	2022-04-11 06:35:55.65386	Postman	Postman
402	Development	Development	ACTIVE	2022-04-11 06:36:14.738531	2022-04-11 06:36:14.738531	Postman	Postman
403	Stage	Stage	ACTIVE	2022-04-11 06:36:25.577388	2022-04-11 06:36:25.577388	Postman	Postman
404	Test	Test	ACTIVE	2022-04-11 06:36:34.216318	2022-04-11 06:36:34.216318	Postman	Postman
\.


--
-- Data for Name: jhi_persistent_audit_event; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jhi_persistent_audit_event (event_id, principal, event_date, event_type) FROM stdin;
\.


--
-- Data for Name: jhi_persistent_audit_evt_data; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jhi_persistent_audit_evt_data (event_id, name, value) FROM stdin;
\.


--
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product (id, name, description, status, created_on, updated_on, updated_by, created_by) FROM stdin;
451	EMS	EMS	ACTIVE	2022-04-11 06:37:34.788372	2022-04-11 06:37:34.788372	Postman	Postman
452	Procurement	Procurement	ACTIVE	2022-04-11 06:37:49.116337	2022-04-11 06:37:49.116337	Postman	Postman
1351	IBM Power	IBM Power	ACTIVE	2022-04-19 09:23:36.749399	2022-04-19 09:23:36.749399	Postman	Postman
1352	Linux Server	Linux Server	ACTIVE	2022-04-19 09:25:01.355493	2022-04-19 09:25:01.355493	Postman	Postman
1651	Sales Report	Sales Report	ACTIVE	2022-04-20 08:34:56.389995	2022-04-20 08:34:56.389995	Postman	Postman
1652	Purchase Report	Purchase Report	ACTIVE	2022-04-20 08:35:17.708178	2022-04-20 08:35:17.708178	Postman	Postman
1802	Load-Balancer-Product	Load-Balancer-Product	ACTIVE	2022-04-20 09:54:55.297927	2022-04-20 09:54:55.297927	Postman	Postman
1354	Grafana Analytics	Grafana Analytics	ACTIVE	2022-04-19 09:28:14.708987	2022-04-23 17:00:45.655076	Postman	Postman
1353	AppkubeCloud	AppkubeCloud is a cloud management product	ACTIVE	2022-04-19 09:27:16.596617	2022-04-23 17:04:51.195473	Postman	Postman
1803	Timecamp	Timecamp is a one-solution-fits-all business management solution that comes with a time tracker with computer activities, productivity monitoring, attendance tracking, integrations and more	ACTIVE	2022-04-20 09:55:21.14255	2022-04-23 17:36:49.797997	Postman	Postman
1801	HoneyBook	HoneyBook is an all-in-one business management platform and company management system	ACTIVE	2022-04-20 09:54:37.338067	2022-04-23 17:39:53.400774	Postman	Postman
\.


--
-- Data for Name: product_billing; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_billing (id, period_from, period_to, due_date, amount, description, status, created_on, updated_on, updated_by, created_by, product_id, department_id, deployment_environment_id) FROM stdin;
751	2022-04-08	2022-04-07	2022-04-07	378.34	web-enabled Nevada	UNPAID	2022-04-11 07:01:12.535706	2022-04-11 07:01:12.535706	Postman	Postman	451	302	401
752	2022-04-08	2022-04-07	2022-04-07	378.34	web-enabled Nevada	UNPAID	2022-04-11 07:01:41.311076	2022-04-11 07:01:41.311076	Postman	Postman	451	302	404
753	2022-04-08	2022-04-07	2022-04-07	378.34	web-enabled Nevada	UNPAID	2022-04-11 07:01:55.577792	2022-04-11 07:01:55.577792	Postman	Postman	451	302	403
754	2022-04-08	2022-04-07	2022-04-07	378.34	web-enabled Nevada	UNPAID	2022-04-11 07:02:14.247086	2022-04-11 07:02:14.247086	Postman	Postman	451	302	402
755	2022-04-08	2022-04-07	2022-04-07	378.34	web-enabled Nevada	UNPAID	2022-04-11 07:03:02.364758	2022-04-11 07:03:02.364758	Postman	Postman	452	303	401
756	2022-04-08	2022-04-07	2022-04-07	378.34	web-enabled Nevada	UNPAID	2022-04-11 07:03:21.986835	2022-04-11 07:03:21.986835	Postman	Postman	452	303	404
757	2022-04-08	2022-04-07	2022-04-07	378.34	web-enabled Nevada	UNPAID	2022-04-11 07:03:42.71344	2022-04-11 07:03:42.71344	Postman	Postman	452	303	403
758	2022-04-08	2022-04-07	2022-04-07	378.34	web-enabled Nevada	UNPAID	2022-04-11 07:04:02.318181	2022-04-11 07:04:02.318181	Postman	Postman	452	303	402
\.


--
-- Data for Name: product_deployment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_deployment (id, description, billing_frequency, status, created_on, updated_on, updated_by, created_by, department_id, product_id, deployment_environment_id) FROM stdin;
701	Production is associated with product EMS	\N	ACTIVE	2022-04-11 06:56:46.793141	2022-04-11 06:56:46.793141	\N	\N	302	451	401
702	Test is associated with product EMS	\N	ACTIVE	2022-04-11 06:57:22.952633	2022-04-11 06:57:22.952633	\N	\N	302	451	404
703	Stage is associated with product EMS	\N	ACTIVE	2022-04-11 06:57:41.610982	2022-04-11 06:57:41.610982	\N	\N	302	451	403
704	Development is associated with product EMS	\N	ACTIVE	2022-04-11 06:57:56.402857	2022-04-11 06:57:56.402857	\N	\N	302	451	402
705	Development is associated with product Procurement	\N	ACTIVE	2022-04-11 06:58:53.993108	2022-04-11 06:58:53.993108	\N	\N	303	452	402
706	Test is associated with product Procurement	\N	ACTIVE	2022-04-11 06:59:09.345249	2022-04-11 06:59:09.345249	\N	\N	303	452	404
2001	Production is associated with product IBM Power in environment Production	\N	ACTIVE	2022-04-21 10:09:05.081555	2022-04-21 10:09:05.081555	\N	\N	1301	1351	401
2002	Development is associated with product IBM Power in environment Development	\N	ACTIVE	2022-04-21 10:10:05.301692	2022-04-21 10:10:05.301692	\N	\N	1301	1351	402
2003	Stage is associated with product IBM Power in environment Stage	\N	ACTIVE	2022-04-21 10:10:11.891966	2022-04-21 10:10:11.891966	\N	\N	1301	1351	403
2004	Test is associated with product IBM Power in environment Test	\N	ACTIVE	2022-04-21 10:10:16.680891	2022-04-21 10:10:16.680891	\N	\N	1301	1351	404
2005	Production is associated with product Linux Server in environment Production	\N	ACTIVE	2022-04-21 10:12:00.197458	2022-04-21 10:12:00.197458	\N	\N	1301	1352	401
2006	Development is associated with product Linux Server in environment Development	\N	ACTIVE	2022-04-21 10:12:04.711262	2022-04-21 10:12:04.711262	\N	\N	1301	1352	402
2007	Stage is associated with product Linux Server in environment Stage	\N	ACTIVE	2022-04-21 10:12:09.042777	2022-04-21 10:12:09.042777	\N	\N	1301	1352	403
2008	Test is associated with product Linux Server in environment Test	\N	ACTIVE	2022-04-21 10:12:13.86862	2022-04-21 10:12:13.86862	\N	\N	1301	1352	404
2009	Production is associated with product Firewall-Product in environment Production	\N	ACTIVE	2022-04-21 10:12:26.946769	2022-04-21 10:12:26.946769	\N	\N	1301	1801	401
2010	Development is associated with product Firewall-Product in environment Development	\N	ACTIVE	2022-04-21 10:12:34.345604	2022-04-21 10:12:34.345604	\N	\N	1301	1801	402
2011	Stage is associated with product Firewall-Product in environment Stage	\N	ACTIVE	2022-04-21 10:12:40.696646	2022-04-21 10:12:40.696646	\N	\N	1301	1801	403
2012	Test is associated with product Firewall-Product in environment Test	\N	ACTIVE	2022-04-21 10:12:45.049783	2022-04-21 10:12:45.049783	\N	\N	1301	1801	404
2013	Production is associated with product Gateway-Product in environment Production	\N	ACTIVE	2022-04-21 10:13:09.633981	2022-04-21 10:13:09.633981	\N	\N	1301	1803	401
2014	Development is associated with product Gateway-Product in environment Development	\N	ACTIVE	2022-04-21 10:13:13.143533	2022-04-21 10:13:13.143533	\N	\N	1301	1803	402
2015	Stage is associated with product Gateway-Product in environment Stage	\N	ACTIVE	2022-04-21 10:13:16.596883	2022-04-21 10:13:16.596883	\N	\N	1301	1803	403
2016	Test is associated with product Gateway-Product in environment Test	\N	ACTIVE	2022-04-21 10:13:21.365189	2022-04-21 10:13:21.365189	\N	\N	1301	1803	404
2101	Production is associated with product VS Code in environment Production	\N	ACTIVE	2022-04-22 06:24:39.907174	2022-04-22 06:24:39.907174	\N	\N	1302	1353	401
2102	Development is associated with product VS Code in environment Development	\N	ACTIVE	2022-04-22 06:25:01.280185	2022-04-22 06:25:01.280185	\N	\N	1302	1353	402
2103	Stage is associated with product VS Code in environment Stage	\N	ACTIVE	2022-04-22 06:25:07.002384	2022-04-22 06:25:07.002384	\N	\N	1302	1353	403
2104	Test is associated with product VS Code in environment Test	\N	ACTIVE	2022-04-22 06:25:12.155183	2022-04-22 06:25:12.155183	\N	\N	1302	1353	404
2105	Production is associated with product Android Studio in environment Production	\N	ACTIVE	2022-04-22 06:25:25.684901	2022-04-22 06:25:25.684901	\N	\N	1302	1354	401
2106	Development is associated with product Android Studio in environment Development	\N	ACTIVE	2022-04-22 06:25:30.96447	2022-04-22 06:25:30.96447	\N	\N	1302	1354	402
2107	Stage is associated with product Android Studio in environment Stage	\N	ACTIVE	2022-04-22 06:25:34.942991	2022-04-22 06:25:34.942991	\N	\N	1302	1354	403
2108	Test is associated with product Android Studio in environment Test	\N	ACTIVE	2022-04-22 06:25:40.816367	2022-04-22 06:25:40.816367	\N	\N	1302	1354	404
2109	Production is associated with product Sales Report in environment Production	\N	ACTIVE	2022-04-22 06:26:55.242249	2022-04-22 06:26:55.242249	\N	\N	1303	1651	401
2110	Development is associated with product Sales Report in environment Development	\N	ACTIVE	2022-04-22 06:26:59.394333	2022-04-22 06:26:59.394333	\N	\N	1303	1651	402
2111	Stage is associated with product Sales Report in environment Stage	\N	ACTIVE	2022-04-22 06:27:03.739975	2022-04-22 06:27:03.739975	\N	\N	1303	1651	403
2112	Test is associated with product Sales Report in environment Test	\N	ACTIVE	2022-04-22 06:27:10.13874	2022-04-22 06:27:10.13874	\N	\N	1303	1651	404
2113	Production is associated with product Purchase Report in environment Production	\N	ACTIVE	2022-04-22 06:27:22.479813	2022-04-22 06:27:22.479813	\N	\N	1303	1652	401
2114	Development is associated with product Purchase Report in environment Development	\N	ACTIVE	2022-04-22 06:27:26.437571	2022-04-22 06:27:26.437571	\N	\N	1303	1652	402
2115	Stage is associated with product Purchase Report in environment Stage	\N	ACTIVE	2022-04-22 06:27:30.469455	2022-04-22 06:27:30.469455	\N	\N	1303	1652	403
2116	Test is associated with product Purchase Report in environment Test	\N	ACTIVE	2022-04-22 06:27:36.468579	2022-04-22 06:27:36.468579	\N	\N	1303	1652	404
2117	Production is associated with product Load-Balancer-Product in environment Production	\N	ACTIVE	2022-04-22 07:27:12.281167	2022-04-22 07:27:12.281167	\N	\N	1302	1802	401
2118	Development is associated with product Load-Balancer-Product in environment Development	\N	ACTIVE	2022-04-22 07:27:17.564323	2022-04-22 07:27:17.564323	\N	\N	1302	1802	402
2119	Stage is associated with product Load-Balancer-Product in environment Stage	\N	ACTIVE	2022-04-22 07:27:21.823315	2022-04-22 07:27:21.823315	\N	\N	1302	1802	403
2120	Test is associated with product Load-Balancer-Product in environment Test	\N	ACTIVE	2022-04-22 07:27:27.01495	2022-04-22 07:27:27.01495	\N	\N	1302	1802	404
\.


--
-- Data for Name: product_enclave; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_enclave (id, name, status, created_on, updated_on, updated_by, created_by, cloud_environment_id_id) FROM stdin;
1	Track Jamaican Stand-alone	Account payment	2022-03-31 11:51:46	2022-03-31 19:36:37	plum Borders Branch	Forges Balboa Organized	\N
2	Associate blue black	sensor efficient	2022-03-31 10:31:47	2022-04-01 04:39:30	Small Representative Pizza	Buckinghamshire	\N
3	Sports digital Optimization	info-mediaries Lead Program	2022-03-31 10:48:54	2022-03-31 22:00:54	Jewelery algorithm Benin	Rubber	\N
4	Supervisor	Steel application	2022-04-01 01:02:48	2022-03-31 22:35:59	Berkshire Investment	Djibouti Unbranded Kansas	\N
5	plug-and-play generating e-enable	Awesome Account Interface	2022-04-01 04:53:02	2022-03-31 08:45:56	Account Garden USB	killer Practical	\N
6	Division Interactions Washington	Executive back-end	2022-03-31 17:19:33	2022-03-31 14:34:22	violet next-generation Market	1080p	\N
7	transmit	fuchsia	2022-04-01 03:53:07	2022-03-31 08:20:42	Gorgeous	IB	\N
8	Response	SAS 1080p	2022-03-31 11:39:41	2022-04-01 05:20:33	back-end Ergonomic	Jewelery copy Credit	\N
9	Cotton	Optimization calculate	2022-03-31 06:01:30	2022-03-31 07:37:07	Liaison Auto	Auto green back-end	\N
10	Saint architectures	e-commerce	2022-03-31 22:30:27	2022-03-31 18:05:37	Books South	Electronics Jewelery sensor	\N
\.


--
-- Data for Name: product_service; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_service (id, description, status, created_on, updated_on, updated_by, created_by, product_id, services_id, deployment_environment_id) FROM stdin;
551	Profile service is associated with product EMS	ACTIVE	2022-04-11 06:42:18.228205	2022-04-11 06:42:18.228205	\N	\N	451	502	401
552	Preferences service is associated with product EMS	ACTIVE	2022-04-11 06:42:45.068244	2022-04-11 06:42:45.068244	\N	\N	451	503	401
553	Security service is associated with product EMS	ACTIVE	2022-04-11 06:43:01.770851	2022-04-11 06:43:01.770851	\N	\N	451	501	401
555	Security service is associated with product Procurement	ACTIVE	2022-04-11 06:44:08.526642	2022-04-11 06:44:08.526642	\N	\N	452	501	404
556	ProcurementService service is associated with product Procurement	ACTIVE	2022-04-11 06:44:34.41295	2022-04-11 06:44:34.41295	\N	\N	452	504	404
801	Security service is associated with product EMS	ACTIVE	2022-04-12 09:35:14.16454	2022-04-12 09:35:14.16454	\N	\N	451	501	403
802	Profile service is associated with product EMS	ACTIVE	2022-04-12 09:36:06.298732	2022-04-12 09:36:06.298732	\N	\N	451	502	403
803	Preferences service is associated with product EMS	ACTIVE	2022-04-12 09:36:10.608213	2022-04-12 09:36:10.608213	\N	\N	451	503	403
805	Security service is associated with product EMS	ACTIVE	2022-04-12 09:38:04.054821	2022-04-12 09:38:04.054821	\N	\N	451	501	404
806	Profile service is associated with product EMS	ACTIVE	2022-04-12 09:38:08.083194	2022-04-12 09:38:08.083194	\N	\N	451	502	404
807	Preferences service is associated with product EMS	ACTIVE	2022-04-12 09:38:12.03848	2022-04-12 09:38:12.03848	\N	\N	451	503	404
809	Security service is associated with product EMS	ACTIVE	2022-04-12 09:39:26.981809	2022-04-12 09:39:26.981809	\N	\N	451	501	402
810	Profile service is associated with product EMS	ACTIVE	2022-04-12 09:39:30.823678	2022-04-12 09:39:30.823678	\N	\N	451	502	402
811	Preferences service is associated with product EMS	ACTIVE	2022-04-12 09:39:34.430214	2022-04-12 09:39:34.430214	\N	\N	451	503	402
813	ProcurementService service is associated with product Procurement	ACTIVE	2022-04-12 09:41:48.584539	2022-04-12 09:41:48.584539	\N	\N	452	504	402
1751	IBM-Power-service service is associated with product IBM Power	ACTIVE	2022-04-20 09:06:03.735727	2022-04-20 09:06:03.735727	\N	\N	1351	1701	401
1752	Linux-Server-service service is associated with product Linux Server	ACTIVE	2022-04-20 09:06:50.852478	2022-04-20 09:06:50.852478	\N	\N	1352	1702	401
1753	VS-Code-service service is associated with product VS Code	ACTIVE	2022-04-20 09:07:11.091581	2022-04-20 09:07:11.091581	\N	\N	1353	1703	401
1754	Android-Studio-service service is associated with product Android Studio	ACTIVE	2022-04-20 09:07:32.312419	2022-04-20 09:07:32.312419	\N	\N	1354	1704	401
1755	Sales-Report-service service is associated with product Sales Report	ACTIVE	2022-04-20 09:07:55.399093	2022-04-20 09:07:55.399093	\N	\N	1651	1705	401
1756	Purchase-Report-service service is associated with product Purchase Report	ACTIVE	2022-04-20 09:08:26.188528	2022-04-20 09:08:26.188528	\N	\N	1652	1706	401
1757	Fee service is associated with product EMS	ACTIVE	2022-04-20 09:17:37.843561	2022-04-20 09:17:37.843561	\N	\N	451	1454	401
1758	Fee service is associated with product EMS	ACTIVE	2022-04-20 09:19:06.824276	2022-04-20 09:19:06.824276	\N	\N	451	1454	402
1759	Fee service is associated with product EMS	ACTIVE	2022-04-20 09:20:25.385422	2022-04-20 09:20:25.385422	\N	\N	451	1454	403
1760	Fee service is associated with product EMS	ACTIVE	2022-04-20 09:21:51.3546	2022-04-20 09:21:51.3546	\N	\N	451	1454	404
1901	Firewall-Service service is associated with product Firewall-Product	ACTIVE	2022-04-21 03:34:30.440464	2022-04-21 03:34:30.440464	\N	\N	1801	1451	401
1902	Firewall-Service service is associated with product Firewall-Product	ACTIVE	2022-04-21 03:34:49.888321	2022-04-21 03:34:49.888321	\N	\N	1801	1451	402
1903	Firewall-Service service is associated with product Firewall-Product	ACTIVE	2022-04-21 03:35:02.874285	2022-04-21 03:35:02.874285	\N	\N	1801	1451	403
1904	Firewall-Service service is associated with product Firewall-Product	ACTIVE	2022-04-21 03:35:20.294024	2022-04-21 03:35:20.294024	\N	\N	1801	1451	404
1905	Load-Balancer-service service is associated with product Load-Balancer-Product	ACTIVE	2022-04-21 03:37:06.170726	2022-04-21 03:37:06.170726	\N	\N	1802	1452	401
1906	Load-Balancer-service service is associated with product Load-Balancer-Product	ACTIVE	2022-04-21 03:37:16.324347	2022-04-21 03:37:16.324347	\N	\N	1802	1452	402
1907	Load-Balancer-service service is associated with product Load-Balancer-Product	ACTIVE	2022-04-21 03:37:31.543806	2022-04-21 03:37:31.543806	\N	\N	1802	1452	403
1908	Load-Balancer-service service is associated with product Load-Balancer-Product	ACTIVE	2022-04-21 03:37:50.139465	2022-04-21 03:37:50.139465	\N	\N	1802	1452	404
1909	Gateway-Service service is associated with product Gateway-Product	ACTIVE	2022-04-21 03:38:50.101661	2022-04-21 03:38:50.101661	\N	\N	1803	1453	401
1910	Gateway-Service service is associated with product Gateway-Product	ACTIVE	2022-04-21 03:39:04.156272	2022-04-21 03:39:04.156272	\N	\N	1803	1453	402
1911	Gateway-Service service is associated with product Gateway-Product	ACTIVE	2022-04-21 03:39:17.453208	2022-04-21 03:39:17.453208	\N	\N	1803	1453	403
1912	Gateway-Service service is associated with product Gateway-Product	ACTIVE	2022-04-21 03:39:35.286374	2022-04-21 03:39:35.286374	\N	\N	1803	1453	404
1913	IBM-Power-service service is associated with product IBM Power	ACTIVE	2022-04-21 03:41:33.812394	2022-04-21 03:41:33.812394	\N	\N	1351	1701	402
1914	IBM-Power-service service is associated with product IBM Power	ACTIVE	2022-04-21 03:41:49.644164	2022-04-21 03:41:49.644164	\N	\N	1351	1701	403
1915	IBM-Power-service service is associated with product IBM Power	ACTIVE	2022-04-21 03:42:07.813653	2022-04-21 03:42:07.813653	\N	\N	1351	1701	404
1916	Linux-Server-service service is associated with product Linux Server	ACTIVE	2022-04-21 03:43:15.48947	2022-04-21 03:43:15.48947	\N	\N	1352	1702	402
1917	Linux-Server-service service is associated with product Linux Server	ACTIVE	2022-04-21 05:24:14.901091	2022-04-21 05:24:14.901091	\N	\N	1352	1702	403
1918	Linux-Server-service service is associated with product Linux Server	ACTIVE	2022-04-21 05:24:30.373091	2022-04-21 05:24:30.373091	\N	\N	1352	1702	404
1919	VS-Code-service service is associated with product VS Code	ACTIVE	2022-04-21 06:10:47.958058	2022-04-21 06:10:47.958058	\N	\N	1353	1703	402
1920	VS-Code-service service is associated with product VS Code	ACTIVE	2022-04-21 06:11:00.760078	2022-04-21 06:11:00.760078	\N	\N	1353	1703	403
1921	VS-Code-service service is associated with product VS Code	ACTIVE	2022-04-21 06:11:19.05725	2022-04-21 06:11:19.05725	\N	\N	1353	1703	404
1922	Android-Studio-service service is associated with product Android Studio	ACTIVE	2022-04-21 06:12:24.745521	2022-04-21 06:12:24.745521	\N	\N	1354	1704	402
1923	Android-Studio-service service is associated with product Android Studio	ACTIVE	2022-04-21 06:12:37.758982	2022-04-21 06:12:37.758982	\N	\N	1354	1704	403
1924	Android-Studio-service service is associated with product Android Studio	ACTIVE	2022-04-21 06:13:18.549748	2022-04-21 06:13:18.549748	\N	\N	1354	1704	404
1925	Sales-Report-service service is associated with product Sales Report	ACTIVE	2022-04-21 06:14:42.414213	2022-04-21 06:14:42.414213	\N	\N	1651	1705	402
1926	Sales-Report-service service is associated with product Sales Report	ACTIVE	2022-04-21 06:14:56.169869	2022-04-21 06:14:56.169869	\N	\N	1651	1705	403
1927	Sales-Report-service service is associated with product Sales Report	ACTIVE	2022-04-21 06:15:14.06049	2022-04-21 06:15:14.06049	\N	\N	1651	1705	404
1928	Purchase-Report-service service is associated with product Purchase Report	ACTIVE	2022-04-21 06:15:55.826196	2022-04-21 06:15:55.826196	\N	\N	1652	1706	402
1929	Purchase-Report-service service is associated with product Purchase Report	ACTIVE	2022-04-21 06:16:09.910682	2022-04-21 06:16:09.910682	\N	\N	1652	1706	403
1930	Purchase-Report-service service is associated with product Purchase Report	ACTIVE	2022-04-21 06:16:27.112987	2022-04-21 06:16:27.112987	\N	\N	1652	1706	404
1931	ProcurementService service is associated with product Procurement	ACTIVE	2022-04-21 06:21:11.073007	2022-04-21 06:21:11.073007	\N	\N	452	504	401
1932	ProcurementService service is associated with product Procurement	ACTIVE	2022-04-21 06:22:13.418182	2022-04-21 06:22:13.418182	\N	\N	452	504	403
2401	Gateway service is associated with product Purchase Report	ACTIVE	2022-04-23 16:16:16.464588	2022-04-23 16:16:16.464588	\N	\N	1652	1453	401
2402	Gateway service is associated with product Purchase Report	ACTIVE	2022-04-23 16:16:20.548917	2022-04-23 16:16:20.548917	\N	\N	1652	1453	402
2403	Gateway service is associated with product Purchase Report	ACTIVE	2022-04-23 16:16:23.899665	2022-04-23 16:16:23.899665	\N	\N	1652	1453	403
2404	Gateway service is associated with product Purchase Report	ACTIVE	2022-04-23 16:16:26.977851	2022-04-23 16:16:26.977851	\N	\N	1652	1453	404
2405	Firewall service is associated with product Purchase Report	ACTIVE	2022-04-23 16:19:57.77899	2022-04-23 16:19:57.77899	\N	\N	1652	1451	401
2406	Firewall service is associated with product Purchase Report	ACTIVE	2022-04-23 16:20:04.514227	2022-04-23 16:20:04.514227	\N	\N	1652	1451	402
2407	Firewall service is associated with product Purchase Report	ACTIVE	2022-04-23 16:20:08.416746	2022-04-23 16:20:08.416746	\N	\N	1652	1451	403
2408	Firewall service is associated with product Purchase Report	ACTIVE	2022-04-23 16:20:12.270826	2022-04-23 16:20:12.270826	\N	\N	1652	1451	404
2409	Load Balancer service is associated with product Purchase Report	ACTIVE	2022-04-23 16:21:42.878261	2022-04-23 16:21:42.878261	\N	\N	1652	1452	401
2410	Load Balancer service is associated with product Purchase Report	ACTIVE	2022-04-23 16:21:46.999621	2022-04-23 16:21:46.999621	\N	\N	1652	1452	402
2411	Load Balancer service is associated with product Purchase Report	ACTIVE	2022-04-23 16:21:50.439027	2022-04-23 16:21:50.439027	\N	\N	1652	1452	403
2412	Load Balancer service is associated with product Purchase Report	ACTIVE	2022-04-23 16:21:53.815285	2022-04-23 16:21:53.815285	\N	\N	1652	1452	404
2413	Gateway service is associated with product Sales Report	ACTIVE	2022-04-23 16:24:05.215555	2022-04-23 16:24:05.215555	\N	\N	1651	1453	401
2414	Gateway service is associated with product Sales Report	ACTIVE	2022-04-23 16:24:08.512559	2022-04-23 16:24:08.512559	\N	\N	1651	1453	402
2415	Gateway service is associated with product Sales Report	ACTIVE	2022-04-23 16:24:11.706246	2022-04-23 16:24:11.706246	\N	\N	1651	1453	403
2416	Gateway service is associated with product Sales Report	ACTIVE	2022-04-23 16:24:14.855829	2022-04-23 16:24:14.855829	\N	\N	1651	1453	404
2417	Firewall service is associated with product Sales Report	ACTIVE	2022-04-23 16:24:35.857954	2022-04-23 16:24:35.857954	\N	\N	1651	1451	401
2418	Firewall service is associated with product Sales Report	ACTIVE	2022-04-23 16:24:39.41001	2022-04-23 16:24:39.41001	\N	\N	1651	1451	402
2419	Firewall service is associated with product Sales Report	ACTIVE	2022-04-23 16:24:42.538966	2022-04-23 16:24:42.538966	\N	\N	1651	1451	403
2420	Firewall service is associated with product Sales Report	ACTIVE	2022-04-23 16:24:45.806333	2022-04-23 16:24:45.806333	\N	\N	1651	1451	404
2421	Load Balancer service is associated with product Sales Report	ACTIVE	2022-04-23 16:25:02.796974	2022-04-23 16:25:02.796974	\N	\N	1651	1452	401
2422	Load Balancer service is associated with product Sales Report	ACTIVE	2022-04-23 16:25:05.73198	2022-04-23 16:25:05.73198	\N	\N	1651	1452	402
2423	Load Balancer service is associated with product Sales Report	ACTIVE	2022-04-23 16:25:08.792433	2022-04-23 16:25:08.792433	\N	\N	1651	1452	403
2424	Load Balancer service is associated with product Sales Report	ACTIVE	2022-04-23 16:25:11.76721	2022-04-23 16:25:11.76721	\N	\N	1651	1452	404
2425	Gateway service is associated with product Android Studio	ACTIVE	2022-04-23 16:31:09.195438	2022-04-23 16:31:09.195438	\N	\N	1354	1453	401
2426	Gateway service is associated with product Android Studio	ACTIVE	2022-04-23 16:31:13.58275	2022-04-23 16:31:13.58275	\N	\N	1354	1453	402
2427	Gateway service is associated with product Android Studio	ACTIVE	2022-04-23 16:31:17.072422	2022-04-23 16:31:17.072422	\N	\N	1354	1453	403
2428	Gateway service is associated with product Android Studio	ACTIVE	2022-04-23 16:31:20.452214	2022-04-23 16:31:20.452214	\N	\N	1354	1453	404
2429	Firewall service is associated with product Android Studio	ACTIVE	2022-04-23 16:50:31.797549	2022-04-23 16:50:31.797549	\N	\N	1354	1451	401
2430	Firewall service is associated with product Android Studio	ACTIVE	2022-04-23 16:50:35.188663	2022-04-23 16:50:35.188663	\N	\N	1354	1451	402
2431	Firewall service is associated with product Android Studio	ACTIVE	2022-04-23 16:50:38.395968	2022-04-23 16:50:38.395968	\N	\N	1354	1451	403
2432	Firewall service is associated with product Android Studio	ACTIVE	2022-04-23 16:50:41.469363	2022-04-23 16:50:41.469363	\N	\N	1354	1451	404
2433	Load Balancer service is associated with product Android Studio	ACTIVE	2022-04-23 16:51:02.145162	2022-04-23 16:51:02.145162	\N	\N	1354	1452	401
2434	Load Balancer service is associated with product Android Studio	ACTIVE	2022-04-23 16:51:05.622943	2022-04-23 16:51:05.622943	\N	\N	1354	1452	402
2435	Load Balancer service is associated with product Android Studio	ACTIVE	2022-04-23 16:51:08.911825	2022-04-23 16:51:08.911825	\N	\N	1354	1452	403
2436	Load Balancer service is associated with product Android Studio	ACTIVE	2022-04-23 16:51:12.401415	2022-04-23 16:51:12.401415	\N	\N	1354	1452	404
2437	Gateway service is associated with product AppkubeCloud	ACTIVE	2022-04-23 17:13:48.336442	2022-04-23 17:13:48.336442	\N	\N	1353	1453	401
2438	Gateway service is associated with product AppkubeCloud	ACTIVE	2022-04-23 17:13:51.996939	2022-04-23 17:13:51.996939	\N	\N	1353	1453	402
2439	Gateway service is associated with product AppkubeCloud	ACTIVE	2022-04-23 17:13:55.877581	2022-04-23 17:13:55.877581	\N	\N	1353	1453	403
2440	Gateway service is associated with product AppkubeCloud	ACTIVE	2022-04-23 17:13:59.142667	2022-04-23 17:13:59.142667	\N	\N	1353	1453	404
2441	Firewall service is associated with product AppkubeCloud	ACTIVE	2022-04-23 17:14:18.855234	2022-04-23 17:14:18.855234	\N	\N	1353	1451	401
2442	Firewall service is associated with product AppkubeCloud	ACTIVE	2022-04-23 17:14:22.076414	2022-04-23 17:14:22.076414	\N	\N	1353	1451	402
2443	Firewall service is associated with product AppkubeCloud	ACTIVE	2022-04-23 17:14:25.600355	2022-04-23 17:14:25.600355	\N	\N	1353	1451	403
2444	Firewall service is associated with product AppkubeCloud	ACTIVE	2022-04-23 17:14:28.913903	2022-04-23 17:14:28.913903	\N	\N	1353	1451	404
2445	Load Balancer service is associated with product AppkubeCloud	ACTIVE	2022-04-23 17:14:41.536027	2022-04-23 17:14:41.536027	\N	\N	1353	1452	401
2446	Load Balancer service is associated with product AppkubeCloud	ACTIVE	2022-04-23 17:14:44.732338	2022-04-23 17:14:44.732338	\N	\N	1353	1452	402
2447	Load Balancer service is associated with product AppkubeCloud	ACTIVE	2022-04-23 17:14:47.958931	2022-04-23 17:14:47.958931	\N	\N	1353	1452	403
2448	Load Balancer service is associated with product AppkubeCloud	ACTIVE	2022-04-23 17:14:51.276924	2022-04-23 17:14:51.276924	\N	\N	1353	1452	404
2449	Firewall service is associated with product Timecamp	ACTIVE	2022-04-23 17:46:05.869149	2022-04-23 17:46:05.869149	\N	\N	1803	1451	401
2450	Firewall service is associated with product Timecamp	ACTIVE	2022-04-23 17:46:10.18967	2022-04-23 17:46:10.18967	\N	\N	1803	1451	402
2451	Firewall service is associated with product Timecamp	ACTIVE	2022-04-23 17:46:13.61497	2022-04-23 17:46:13.61497	\N	\N	1803	1451	403
2452	Firewall service is associated with product Timecamp	ACTIVE	2022-04-23 17:46:16.914546	2022-04-23 17:46:16.914546	\N	\N	1803	1451	404
2453	Load Balancer service is associated with product Timecamp	ACTIVE	2022-04-23 17:46:28.358468	2022-04-23 17:46:28.358468	\N	\N	1803	1452	401
2454	Load Balancer service is associated with product Timecamp	ACTIVE	2022-04-23 17:46:31.171565	2022-04-23 17:46:31.171565	\N	\N	1803	1452	402
2455	Load Balancer service is associated with product Timecamp	ACTIVE	2022-04-23 17:46:34.178219	2022-04-23 17:46:34.178219	\N	\N	1803	1452	403
2456	Load Balancer service is associated with product Timecamp	ACTIVE	2022-04-23 17:46:40.37624	2022-04-23 17:46:40.37624	\N	\N	1803	1452	404
2457	Gateway service is associated with product HoneyBook	ACTIVE	2022-04-23 17:49:10.503505	2022-04-23 17:49:10.503505	\N	\N	1801	1453	401
2458	Gateway service is associated with product HoneyBook	ACTIVE	2022-04-23 17:49:15.017249	2022-04-23 17:49:15.017249	\N	\N	1801	1453	402
2459	Gateway service is associated with product HoneyBook	ACTIVE	2022-04-23 17:49:19.518384	2022-04-23 17:49:19.518384	\N	\N	1801	1453	403
2460	Gateway service is associated with product HoneyBook	ACTIVE	2022-04-23 17:49:24.820739	2022-04-23 17:49:24.820739	\N	\N	1801	1453	404
2461	Load Balancer service is associated with product HoneyBook	ACTIVE	2022-04-23 17:49:47.973203	2022-04-23 17:49:47.973203	\N	\N	1801	1452	401
2462	Load Balancer service is associated with product HoneyBook	ACTIVE	2022-04-23 17:49:53.901162	2022-04-23 17:49:53.901162	\N	\N	1801	1452	402
2463	Load Balancer service is associated with product HoneyBook	ACTIVE	2022-04-23 17:49:57.195153	2022-04-23 17:49:57.195153	\N	\N	1801	1452	403
2464	Load Balancer service is associated with product HoneyBook	ACTIVE	2022-04-23 17:50:01.251634	2022-04-23 17:50:01.251634	\N	\N	1801	1452	404
2465	Gateway service is associated with product Procurement	ACTIVE	2022-04-23 17:53:20.618095	2022-04-23 17:53:20.618095	\N	\N	452	1453	404
2466	Firewall service is associated with product Procurement	ACTIVE	2022-04-23 17:53:37.741565	2022-04-23 17:53:37.741565	\N	\N	452	1451	404
2467	Load Balancer service is associated with product Procurement	ACTIVE	2022-04-23 17:53:46.202701	2022-04-23 17:53:46.202701	\N	\N	452	1452	404
2468	Gateway service is associated with product Procurement	ACTIVE	2022-04-23 17:56:32.634679	2022-04-23 17:56:32.634679	\N	\N	452	1453	401
2469	Firewall service is associated with product Procurement	ACTIVE	2022-04-23 17:56:43.887529	2022-04-23 17:56:43.887529	\N	\N	452	1451	401
2470	Load Balancer service is associated with product Procurement	ACTIVE	2022-04-23 17:56:54.456184	2022-04-23 17:56:54.456184	\N	\N	452	1452	401
2471	Gateway service is associated with product Procurement	ACTIVE	2022-04-23 17:58:20.215106	2022-04-23 17:58:20.215106	\N	\N	452	1453	402
2472	Firewall service is associated with product Procurement	ACTIVE	2022-04-23 17:58:31.149734	2022-04-23 17:58:31.149734	\N	\N	452	1451	402
2473	Load Balancer service is associated with product Procurement	ACTIVE	2022-04-23 17:58:38.451474	2022-04-23 17:58:38.451474	\N	\N	452	1452	402
2474	Gateway service is associated with product EMS	ACTIVE	2022-04-23 18:02:00.201156	2022-04-23 18:02:00.201156	\N	\N	451	1453	401
2475	Gateway service is associated with product EMS	ACTIVE	2022-04-23 18:02:03.907034	2022-04-23 18:02:03.907034	\N	\N	451	1453	402
2476	Gateway service is associated with product EMS	ACTIVE	2022-04-23 18:02:07.388469	2022-04-23 18:02:07.388469	\N	\N	451	1453	403
2477	Gateway service is associated with product EMS	ACTIVE	2022-04-23 18:02:10.843622	2022-04-23 18:02:10.843622	\N	\N	451	1453	404
2478	Firewall service is associated with product EMS	ACTIVE	2022-04-23 18:02:22.71645	2022-04-23 18:02:22.71645	\N	\N	451	1451	401
2479	Firewall service is associated with product EMS	ACTIVE	2022-04-23 18:02:26.046953	2022-04-23 18:02:26.046953	\N	\N	451	1451	402
2480	Firewall service is associated with product EMS	ACTIVE	2022-04-23 18:02:30.522508	2022-04-23 18:02:30.522508	\N	\N	451	1451	403
2481	Firewall service is associated with product EMS	ACTIVE	2022-04-23 18:02:33.999853	2022-04-23 18:02:33.999853	\N	\N	451	1451	404
2482	Load Balancer service is associated with product EMS	ACTIVE	2022-04-23 18:02:55.06608	2022-04-23 18:02:55.06608	\N	\N	451	1452	401
2483	Load Balancer service is associated with product EMS	ACTIVE	2022-04-23 18:03:03.298326	2022-04-23 18:03:03.298326	\N	\N	451	1452	402
2484	Load Balancer service is associated with product EMS	ACTIVE	2022-04-23 18:03:06.872114	2022-04-23 18:03:06.872114	\N	\N	451	1452	403
2485	Load Balancer service is associated with product EMS	ACTIVE	2022-04-23 18:03:10.548143	2022-04-23 18:03:10.548143	\N	\N	451	1452	404
\.


--
-- Data for Name: product_services_detail; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_services_detail (id, product_name, env, master_services_details) FROM stdin;
\.


--
-- Data for Name: service_analytics; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.service_analytics (id, time_interval, service_detail_id, type, score, rate_of_growth) FROM stdin;
33601	2022-09-05 09:53:00	3952	performance	94	100.0
33602	2022-09-05 09:53:10	3952	performance	95	1.0526316
33603	2022-09-05 09:53:20	3952	performance	96	1.0416667
33604	2022-09-05 09:53:30	3952	performance	95	-1.0526316
33605	2022-09-05 09:53:40	3952	performance	100	5.0
33606	2022-09-05 09:53:50	3952	performance	92	-8.695652
33607	2022-09-05 09:54:00	3952	performance	90	-2.2222223
33608	2022-09-05 09:53:00	3996	performance	96	100.0
33609	2022-09-05 09:53:10	3996	performance	92	-4.347826
33610	2022-09-05 09:53:20	3996	performance	90	-2.2222223
33611	2022-09-05 09:53:30	3996	performance	99	9.090909
33612	2022-09-05 09:53:40	3996	performance	92	-7.6086955
33613	2022-09-05 09:53:50	3996	performance	97	5.1546392
33614	2022-09-05 09:54:00	3996	performance	100	3.0
33615	2022-09-05 09:53:00	4465	performance	92	100.0
33616	2022-09-05 09:53:10	4465	performance	93	1.0752689
33617	2022-09-05 09:53:20	4465	performance	100	7.0
33618	2022-09-05 09:53:30	4465	performance	92	-8.695652
33619	2022-09-05 09:53:40	4465	performance	94	2.1276596
33620	2022-09-05 09:53:50	4465	performance	92	-2.173913
33621	2022-09-05 09:54:00	4465	performance	100	8.0
33622	2022-09-05 09:53:00	3953	performance	99	100.0
33623	2022-09-05 09:53:10	3953	performance	93	-6.4516125
33624	2022-09-05 09:53:20	3953	performance	91	-2.1978023
33625	2022-09-05 09:53:30	3953	performance	99	8.080808
33626	2022-09-05 09:53:40	3953	performance	100	1.0
33627	2022-09-05 09:53:50	3953	performance	96	-4.166667
33628	2022-09-05 09:54:00	3953	performance	93	-3.2258062
33629	2022-09-05 09:53:00	4354	performance	97	100.0
33630	2022-09-05 09:53:10	4354	performance	96	-1.0416667
33631	2022-09-05 09:53:20	4354	performance	98	2.0408163
33632	2022-09-05 09:53:30	4354	performance	92	-6.521739
33633	2022-09-05 09:53:40	4354	performance	96	4.166667
33634	2022-09-05 09:53:50	4354	performance	92	-4.347826
33635	2022-09-05 09:54:00	4354	performance	98	6.122449
33636	2022-09-05 09:53:00	3954	performance	94	100.0
33637	2022-09-05 09:53:10	3954	performance	93	-1.0752689
33638	2022-09-05 09:53:20	3954	performance	91	-2.1978023
33639	2022-09-05 09:53:30	3954	performance	94	3.1914895
33640	2022-09-05 09:53:40	3954	performance	94	0.0
33641	2022-09-05 09:53:50	3954	performance	92	-2.173913
33642	2022-09-05 09:54:00	3954	performance	98	6.122449
33643	2022-09-05 09:53:00	4591	performance	94	100.0
33644	2022-09-05 09:53:10	4591	performance	92	-2.173913
33645	2022-09-05 09:53:20	4591	performance	98	6.122449
33646	2022-09-05 09:53:30	4591	performance	96	-2.0833335
33647	2022-09-05 09:53:40	4591	performance	98	2.0408163
33648	2022-09-05 09:53:50	4591	performance	94	-4.255319
33649	2022-09-05 09:54:00	4591	performance	93	-1.0752689
33650	2022-09-05 09:53:00	4118	performance	93	100.0
33651	2022-09-05 09:53:10	4118	performance	94	1.0638298
33652	2022-09-05 09:53:20	4118	performance	90	-4.4444447
33653	2022-09-05 09:53:30	4118	performance	95	5.263158
33654	2022-09-05 09:53:40	4118	performance	100	5.0
33655	2022-09-05 09:53:50	4118	performance	94	-6.382979
33656	2022-09-05 09:54:00	4118	performance	93	-1.0752689
33657	2022-09-05 09:53:00	4119	performance	92	100.0
33658	2022-09-05 09:53:10	4119	performance	93	1.0752689
33659	2022-09-05 09:53:20	4119	performance	93	0.0
33660	2022-09-05 09:53:30	4119	performance	96	3.125
33661	2022-09-05 09:53:40	4119	performance	99	3.030303
33662	2022-09-05 09:53:50	4119	performance	98	-1.0204082
33663	2022-09-05 09:54:00	4119	performance	90	-8.888889
33664	2022-09-05 09:53:00	4355	performance	98	100.0
33665	2022-09-05 09:53:10	4355	performance	93	-5.376344
33666	2022-09-05 09:53:20	4355	performance	99	6.060606
33667	2022-09-05 09:53:30	4355	performance	97	-2.0618556
33668	2022-09-05 09:53:40	4355	performance	93	-4.3010755
33669	2022-09-05 09:53:50	4355	performance	90	-3.3333335
33670	2022-09-05 09:54:00	4355	performance	90	0.0
33671	2022-09-05 09:53:00	4356	performance	98	100.0
33672	2022-09-05 09:53:10	4356	performance	99	1.010101
33673	2022-09-05 09:53:20	4356	performance	92	-7.6086955
33674	2022-09-05 09:53:30	4356	performance	98	6.122449
33675	2022-09-05 09:53:40	4356	performance	93	-5.376344
33676	2022-09-05 09:53:50	4356	performance	97	4.123711
33677	2022-09-05 09:54:00	4356	performance	98	1.0204082
33678	2022-09-05 09:53:00	4592	performance	100	100.0
33679	2022-09-05 09:53:10	4592	performance	94	-6.382979
33680	2022-09-05 09:53:20	4592	performance	100	6.0
33681	2022-09-05 09:53:30	4592	performance	92	-8.695652
33682	2022-09-05 09:53:40	4592	performance	96	4.166667
33683	2022-09-05 09:53:50	4592	performance	92	-4.347826
33684	2022-09-05 09:54:00	4592	performance	90	-2.2222223
33685	2022-09-05 09:53:00	4593	performance	94	100.0
33686	2022-09-05 09:53:10	4593	performance	96	2.0833335
33687	2022-09-05 09:53:20	4593	performance	94	-2.1276596
33688	2022-09-05 09:53:30	4593	performance	93	-1.0752689
33689	2022-09-05 09:53:40	4593	performance	93	0.0
33690	2022-09-05 09:53:50	4593	performance	91	-2.1978023
33691	2022-09-05 09:54:00	4593	performance	98	7.1428576
33692	2022-09-05 09:53:00	4594	performance	93	100.0
33693	2022-09-05 09:53:10	4594	performance	96	3.125
33694	2022-09-05 09:53:20	4594	performance	96	0.0
33695	2022-09-05 09:53:30	4594	performance	98	2.0408163
33696	2022-09-05 09:53:40	4594	performance	95	-3.1578946
33697	2022-09-05 09:53:50	4594	performance	95	0.0
33698	2022-09-05 09:54:00	4594	performance	94	-1.0638298
33699	2022-09-05 09:53:00	3955	performance	96	100.0
33700	2022-09-05 09:53:10	3955	performance	90	-6.666667
33701	2022-09-05 09:53:20	3955	performance	98	8.163265
33702	2022-09-05 09:53:30	3955	performance	100	2.0
33703	2022-09-05 09:53:40	3955	performance	91	-9.89011
33704	2022-09-05 09:53:50	3955	performance	99	8.080808
33705	2022-09-05 09:54:00	3955	performance	96	-3.125
33706	2022-09-05 09:53:00	3956	performance	92	100.0
33707	2022-09-05 09:53:10	3956	performance	93	1.0752689
33708	2022-09-05 09:53:20	3956	performance	98	5.102041
33709	2022-09-05 09:53:30	3956	performance	95	-3.1578946
33710	2022-09-05 09:53:40	3956	performance	90	-5.555556
33711	2022-09-05 09:53:50	3956	performance	94	4.255319
33712	2022-09-05 09:54:00	3956	performance	98	4.0816326
33713	2022-09-05 09:53:00	4120	performance	93	100.0
33714	2022-09-05 09:53:10	4120	performance	94	1.0638298
33715	2022-09-05 09:53:20	4120	performance	90	-4.4444447
33716	2022-09-05 09:53:30	4120	performance	90	0.0
33717	2022-09-05 09:53:40	4120	performance	92	2.173913
33718	2022-09-05 09:53:50	4120	performance	100	8.0
33719	2022-09-05 09:54:00	4120	performance	92	-8.695652
33720	2022-09-05 09:53:00	4121	performance	92	100.0
33721	2022-09-05 09:53:10	4121	performance	99	7.070707
33722	2022-09-05 09:53:20	4121	performance	100	1.0
33723	2022-09-05 09:53:30	4121	performance	95	-5.263158
33724	2022-09-05 09:53:40	4121	performance	96	1.0416667
33725	2022-09-05 09:53:50	4121	performance	95	-1.0526316
33726	2022-09-05 09:54:00	4121	performance	91	-4.3956046
33727	2022-09-05 09:53:00	4595	performance	99	100.0
33728	2022-09-05 09:53:10	4595	performance	96	-3.125
33729	2022-09-05 09:53:20	4595	performance	98	2.0408163
33730	2022-09-05 09:53:30	4595	performance	90	-8.888889
33731	2022-09-05 09:53:40	4595	performance	94	4.255319
33732	2022-09-05 09:53:50	4595	performance	98	4.0816326
33733	2022-09-05 09:54:00	4595	performance	90	-8.888889
33734	2022-09-05 09:53:00	4357	performance	95	100.0
33735	2022-09-05 09:53:10	4357	performance	97	2.0618556
33736	2022-09-05 09:53:20	4357	performance	99	2.020202
33737	2022-09-05 09:53:30	4357	performance	99	0.0
33738	2022-09-05 09:53:40	4357	performance	95	-4.2105265
33739	2022-09-05 09:53:50	4357	performance	98	3.0612245
33740	2022-09-05 09:54:00	4357	performance	100	2.0
33741	2022-09-05 09:53:00	4358	performance	93	100.0
33742	2022-09-05 09:53:10	4358	performance	99	6.060606
33743	2022-09-05 09:53:20	4358	performance	98	-1.0204082
33744	2022-09-05 09:53:30	4358	performance	92	-6.521739
33745	2022-09-05 09:53:40	4358	performance	98	6.122449
33746	2022-09-05 09:53:50	4358	performance	95	-3.1578946
33747	2022-09-05 09:54:00	4358	performance	98	3.0612245
33748	2022-09-05 09:53:00	4596	performance	95	100.0
33749	2022-09-05 09:53:10	4596	performance	92	-3.2608695
33750	2022-09-05 09:53:20	4596	performance	98	6.122449
33751	2022-09-05 09:53:30	4596	performance	99	1.010101
33752	2022-09-05 09:53:40	4596	performance	100	1.0
33753	2022-09-05 09:53:50	4596	performance	92	-8.695652
33754	2022-09-05 09:54:00	4596	performance	90	-2.2222223
33755	2022-09-05 09:53:00	4597	performance	97	100.0
33756	2022-09-05 09:53:10	4597	performance	93	-4.3010755
33757	2022-09-05 09:53:20	4597	performance	99	6.060606
33758	2022-09-05 09:53:30	4597	performance	92	-7.6086955
33759	2022-09-05 09:53:40	4597	performance	91	-1.0989012
33760	2022-09-05 09:53:50	4597	performance	96	5.208333
33761	2022-09-05 09:54:00	4597	performance	100	4.0
33762	2022-09-05 09:53:00	4122	performance	97	100.0
33763	2022-09-05 09:53:10	4122	performance	95	-2.1052632
33764	2022-09-05 09:53:20	4122	performance	100	5.0
33765	2022-09-05 09:53:30	4122	performance	93	-7.526882
33766	2022-09-05 09:53:40	4122	performance	97	4.123711
33767	2022-09-05 09:53:50	4122	performance	100	3.0
33768	2022-09-05 09:54:00	4122	performance	95	-5.263158
33769	2022-09-05 09:53:00	4359	performance	98	100.0
33770	2022-09-05 09:53:10	4359	performance	100	2.0
33771	2022-09-05 09:53:20	4359	performance	99	-1.010101
33772	2022-09-05 09:53:30	4359	performance	95	-4.2105265
33773	2022-09-05 09:53:40	4359	performance	95	0.0
33774	2022-09-05 09:53:50	4359	performance	90	-5.555556
33775	2022-09-05 09:54:00	4359	performance	96	6.25
33776	2022-09-05 09:53:00	3957	performance	95	100.0
33777	2022-09-05 09:53:10	3957	performance	91	-4.3956046
33778	2022-09-05 09:53:20	3957	performance	93	2.1505377
33779	2022-09-05 09:53:30	3957	performance	94	1.0638298
33780	2022-09-05 09:53:40	3957	performance	99	5.050505
33781	2022-09-05 09:53:50	3957	performance	93	-6.4516125
33782	2022-09-05 09:54:00	3957	performance	98	5.102041
33783	2022-09-05 09:53:00	4123	performance	95	100.0
33784	2022-09-05 09:53:10	4123	performance	97	2.0618556
33785	2022-09-05 09:53:20	4123	performance	94	-3.1914895
33786	2022-09-05 09:53:30	4123	performance	93	-1.0752689
33787	2022-09-05 09:53:40	4123	performance	99	6.060606
33788	2022-09-05 09:53:50	4123	performance	99	0.0
33789	2022-09-05 09:54:00	4123	performance	99	0.0
33790	2022-09-05 09:53:00	4598	performance	92	100.0
33791	2022-09-05 09:53:10	4598	performance	93	1.0752689
33792	2022-09-05 09:53:20	4598	performance	95	2.1052632
33793	2022-09-05 09:53:30	4598	performance	94	-1.0638298
33794	2022-09-05 09:53:40	4598	performance	93	-1.0752689
33795	2022-09-05 09:53:50	4598	performance	98	5.102041
33796	2022-09-05 09:54:00	4598	performance	98	0.0
33797	2022-09-05 09:53:00	4599	performance	90	100.0
33798	2022-09-05 09:53:10	4599	performance	95	5.263158
33799	2022-09-05 09:53:20	4599	performance	95	0.0
33800	2022-09-05 09:53:30	4599	performance	92	-3.2608695
33801	2022-09-05 09:53:40	4599	performance	92	0.0
33802	2022-09-05 09:53:50	4599	performance	90	-2.2222223
33803	2022-09-05 09:54:00	4599	performance	99	9.090909
33804	2022-09-05 09:53:00	3958	performance	99	100.0
33805	2022-09-05 09:53:10	3958	performance	96	-3.125
33806	2022-09-05 09:53:20	3958	performance	99	3.030303
33807	2022-09-05 09:53:30	3958	performance	96	-3.125
33808	2022-09-05 09:53:40	3958	performance	93	-3.2258062
33809	2022-09-05 09:53:50	3958	performance	94	1.0638298
33810	2022-09-05 09:54:00	3958	performance	99	5.050505
33811	2022-09-05 09:53:00	4360	performance	90	100.0
33812	2022-09-05 09:53:10	4360	performance	94	4.255319
33813	2022-09-05 09:53:20	4360	performance	100	6.0
33814	2022-09-05 09:53:30	4360	performance	93	-7.526882
33815	2022-09-05 09:53:40	4360	performance	91	-2.1978023
33816	2022-09-05 09:53:50	4360	performance	97	6.185567
33817	2022-09-05 09:54:00	4360	performance	90	-7.777778
33818	2022-09-05 09:53:00	4600	performance	94	100.0
33819	2022-09-05 09:53:10	4600	performance	94	0.0
33820	2022-09-05 09:53:20	4600	performance	91	-3.2967036
33821	2022-09-05 09:53:30	4600	performance	98	7.1428576
33822	2022-09-05 09:53:40	4600	performance	97	-1.0309278
33823	2022-09-05 09:53:50	4600	performance	91	-6.593407
33824	2022-09-05 09:54:00	4600	performance	97	6.185567
33825	2022-09-05 09:53:00	4124	performance	95	100.0
33826	2022-09-05 09:53:10	4124	performance	96	1.0416667
33827	2022-09-05 09:53:20	4124	performance	100	4.0
33828	2022-09-05 09:53:30	4124	performance	92	-8.695652
33829	2022-09-05 09:53:40	4124	performance	98	6.122449
33830	2022-09-05 09:53:50	4124	performance	93	-5.376344
33831	2022-09-05 09:54:00	4124	performance	93	0.0
33832	2022-09-05 09:53:00	4125	performance	93	100.0
33833	2022-09-05 09:53:10	4125	performance	91	-2.1978023
33834	2022-09-05 09:53:20	4125	performance	93	2.1505377
33835	2022-09-05 09:53:30	4125	performance	94	1.0638298
33836	2022-09-05 09:53:40	4125	performance	93	-1.0752689
33837	2022-09-05 09:53:50	4125	performance	91	-2.1978023
33838	2022-09-05 09:54:00	4125	performance	95	4.2105265
33839	2022-09-05 09:53:00	4361	performance	91	100.0
33840	2022-09-05 09:53:10	4361	performance	92	1.0869565
33841	2022-09-05 09:53:20	4361	performance	93	1.0752689
33842	2022-09-05 09:53:30	4361	performance	90	-3.3333335
33843	2022-09-05 09:53:40	4361	performance	93	3.2258062
33844	2022-09-05 09:53:50	4361	performance	94	1.0638298
33845	2022-09-05 09:54:00	4361	performance	93	-1.0752689
33846	2022-09-05 09:53:00	4362	performance	97	100.0
33847	2022-09-05 09:53:10	4362	performance	96	-1.0416667
33848	2022-09-05 09:53:20	4362	performance	95	-1.0526316
33849	2022-09-05 09:53:30	4362	performance	100	5.0
33850	2022-09-05 09:53:40	4362	performance	97	-3.0927835
33851	2022-09-05 09:53:50	4362	performance	91	-6.593407
33852	2022-09-05 09:54:00	4362	performance	96	5.208333
33853	2022-09-05 09:53:00	4601	performance	97	100.0
33854	2022-09-05 09:53:10	4601	performance	93	-4.3010755
33855	2022-09-05 09:53:20	4601	performance	93	0.0
33856	2022-09-05 09:53:30	4601	performance	90	-3.3333335
33857	2022-09-05 09:53:40	4601	performance	98	8.163265
33858	2022-09-05 09:53:50	4601	performance	97	-1.0309278
33859	2022-09-05 09:54:00	4601	performance	99	2.020202
33860	2022-09-05 09:53:00	4602	performance	98	100.0
33861	2022-09-05 09:53:10	4602	performance	94	-4.255319
33862	2022-09-05 09:53:20	4602	performance	90	-4.4444447
33863	2022-09-05 09:53:30	4602	performance	90	0.0
33864	2022-09-05 09:53:40	4602	performance	97	7.2164946
33865	2022-09-05 09:53:50	4602	performance	100	3.0
33866	2022-09-05 09:54:00	4602	performance	91	-9.89011
33867	2022-09-05 09:53:00	4603	performance	91	100.0
33868	2022-09-05 09:53:10	4603	performance	90	-1.1111112
33869	2022-09-05 09:53:20	4603	performance	95	5.263158
33870	2022-09-05 09:53:30	4603	performance	96	1.0416667
33871	2022-09-05 09:53:40	4603	performance	99	3.030303
33872	2022-09-05 09:53:50	4603	performance	96	-3.125
33873	2022-09-05 09:54:00	4603	performance	99	3.030303
33874	2022-09-05 09:53:00	3959	performance	98	100.0
33875	2022-09-05 09:53:10	3959	performance	94	-4.255319
33876	2022-09-05 09:53:20	3959	performance	90	-4.4444447
33877	2022-09-05 09:53:30	3959	performance	92	2.173913
33878	2022-09-05 09:53:40	3959	performance	93	1.0752689
33879	2022-09-05 09:53:50	3959	performance	93	0.0
33880	2022-09-05 09:54:00	3959	performance	100	7.0
33881	2022-09-05 09:53:00	3960	performance	96	100.0
33882	2022-09-05 09:53:10	3960	performance	91	-5.4945054
33883	2022-09-05 09:53:20	3960	performance	98	7.1428576
33884	2022-09-05 09:53:30	3960	performance	99	1.010101
33885	2022-09-05 09:53:40	3960	performance	96	-3.125
33886	2022-09-05 09:53:50	3960	performance	98	2.0408163
33887	2022-09-05 09:54:00	3960	performance	95	-3.1578946
33888	2022-09-05 09:53:00	4126	performance	99	100.0
33889	2022-09-05 09:53:10	4126	performance	95	-4.2105265
33890	2022-09-05 09:53:20	4126	performance	93	-2.1505377
33891	2022-09-05 09:53:30	4126	performance	93	0.0
33892	2022-09-05 09:53:40	4126	performance	100	7.0
33893	2022-09-05 09:53:50	4126	performance	92	-8.695652
33894	2022-09-05 09:54:00	4126	performance	92	0.0
33895	2022-09-05 09:53:00	4127	performance	92	100.0
33896	2022-09-05 09:53:10	4127	performance	98	6.122449
33897	2022-09-05 09:53:20	4127	performance	99	1.010101
33898	2022-09-05 09:53:30	4127	performance	97	-2.0618556
33899	2022-09-05 09:53:40	4127	performance	99	2.020202
33900	2022-09-05 09:53:50	4127	performance	92	-7.6086955
33901	2022-09-05 09:54:00	4127	performance	99	7.070707
33902	2022-09-05 09:53:00	4604	performance	97	100.0
33903	2022-09-05 09:53:10	4604	performance	92	-5.4347825
33904	2022-09-05 09:53:20	4604	performance	95	3.1578946
33905	2022-09-05 09:53:30	4604	performance	92	-3.2608695
33906	2022-09-05 09:53:40	4604	performance	92	0.0
33907	2022-09-05 09:53:50	4604	performance	98	6.122449
33908	2022-09-05 09:54:00	4604	performance	91	-7.692308
33909	2022-09-05 09:53:00	4363	performance	100	100.0
33910	2022-09-05 09:53:10	4363	performance	92	-8.695652
33911	2022-09-05 09:53:20	4363	performance	97	5.1546392
33912	2022-09-05 09:53:30	4363	performance	96	-1.0416667
33913	2022-09-05 09:53:40	4363	performance	95	-1.0526316
33914	2022-09-05 09:53:50	4363	performance	94	-1.0638298
33915	2022-09-05 09:54:00	4363	performance	92	-2.173913
33916	2022-09-05 09:53:00	4364	performance	97	100.0
33917	2022-09-05 09:53:10	4364	performance	97	0.0
33918	2022-09-05 09:53:20	4364	performance	93	-4.3010755
33919	2022-09-05 09:53:30	4364	performance	100	7.0
33920	2022-09-05 09:53:40	4364	performance	91	-9.89011
33921	2022-09-05 09:53:50	4364	performance	91	0.0
33922	2022-09-05 09:54:00	4364	performance	94	3.1914895
33923	2022-09-05 09:53:00	4605	performance	100	100.0
33924	2022-09-05 09:53:10	4605	performance	95	-5.263158
33925	2022-09-05 09:53:20	4605	performance	91	-4.3956046
33926	2022-09-05 09:53:30	4605	performance	99	8.080808
33927	2022-09-05 09:53:40	4605	performance	93	-6.4516125
33928	2022-09-05 09:53:50	4605	performance	92	-1.0869565
33929	2022-09-05 09:54:00	4605	performance	93	1.0752689
33930	2022-09-05 09:53:00	4606	performance	91	100.0
33931	2022-09-05 09:53:10	4606	performance	96	5.208333
33932	2022-09-05 09:53:20	4606	performance	91	-5.4945054
33933	2022-09-05 09:53:30	4606	performance	100	9.0
33934	2022-09-05 09:53:40	4606	performance	90	-11.111112
33935	2022-09-05 09:53:50	4606	performance	99	9.090909
33936	2022-09-05 09:54:00	4606	performance	93	-6.4516125
33937	2022-09-05 09:53:00	4128	performance	92	100.0
33938	2022-09-05 09:53:10	4128	performance	97	5.1546392
33939	2022-09-05 09:53:20	4128	performance	93	-4.3010755
33940	2022-09-05 09:53:30	4128	performance	93	0.0
33941	2022-09-05 09:53:40	4128	performance	92	-1.0869565
33942	2022-09-05 09:53:50	4128	performance	93	1.0752689
33943	2022-09-05 09:54:00	4128	performance	95	2.1052632
33944	2022-09-05 09:53:00	4365	performance	94	100.0
33945	2022-09-05 09:53:10	4365	performance	92	-2.173913
33946	2022-09-05 09:53:20	4365	performance	100	8.0
33947	2022-09-05 09:53:30	4365	performance	90	-11.111112
33948	2022-09-05 09:53:40	4365	performance	99	9.090909
33949	2022-09-05 09:53:50	4365	performance	97	-2.0618556
33950	2022-09-05 09:54:00	4365	performance	92	-5.4347825
33951	2022-09-05 09:53:00	3961	performance	91	100.0
33952	2022-09-05 09:53:10	3961	performance	91	0.0
33953	2022-09-05 09:53:20	3961	performance	97	6.185567
33954	2022-09-05 09:53:30	3961	performance	91	-6.593407
33955	2022-09-05 09:53:40	3961	performance	95	4.2105265
33956	2022-09-05 09:53:50	3961	performance	95	0.0
33957	2022-09-05 09:54:00	3961	performance	97	2.0618556
33958	2022-09-05 09:53:00	4129	performance	100	100.0
33959	2022-09-05 09:53:10	4129	performance	98	-2.0408163
33960	2022-09-05 09:53:20	4129	performance	90	-8.888889
33961	2022-09-05 09:53:30	4129	performance	94	4.255319
33962	2022-09-05 09:53:40	4129	performance	98	4.0816326
33963	2022-09-05 09:53:50	4129	performance	95	-3.1578946
33964	2022-09-05 09:54:00	4129	performance	94	-1.0638298
33965	2022-09-05 09:53:00	4607	performance	97	100.0
33966	2022-09-05 09:53:10	4607	performance	93	-4.3010755
33967	2022-09-05 09:53:20	4607	performance	91	-2.1978023
33968	2022-09-05 09:53:30	4607	performance	95	4.2105265
33969	2022-09-05 09:53:40	4607	performance	90	-5.555556
33970	2022-09-05 09:53:50	4607	performance	96	6.25
33971	2022-09-05 09:54:00	4607	performance	98	2.0408163
33972	2022-09-05 09:53:00	4608	performance	99	100.0
33973	2022-09-05 09:53:10	4608	performance	94	-5.319149
33974	2022-09-05 09:53:20	4608	performance	90	-4.4444447
33975	2022-09-05 09:53:30	4608	performance	92	2.173913
33976	2022-09-05 09:53:40	4608	performance	95	3.1578946
33977	2022-09-05 09:53:50	4608	performance	100	5.0
33978	2022-09-05 09:54:00	4608	performance	90	-11.111112
33979	2022-09-05 09:53:00	3962	performance	90	100.0
33980	2022-09-05 09:53:10	3962	performance	94	4.255319
33981	2022-09-05 09:53:20	3962	performance	91	-3.2967036
33982	2022-09-05 09:53:30	3962	performance	93	2.1505377
33983	2022-09-05 09:53:40	3962	performance	100	7.0
33984	2022-09-05 09:53:50	3962	performance	94	-6.382979
33985	2022-09-05 09:54:00	3962	performance	96	2.0833335
33986	2022-09-05 09:53:00	4366	performance	91	100.0
33987	2022-09-05 09:53:10	4366	performance	92	1.0869565
33988	2022-09-05 09:53:20	4366	performance	98	6.122449
33989	2022-09-05 09:53:30	4366	performance	98	0.0
33990	2022-09-05 09:53:40	4366	performance	97	-1.0309278
33991	2022-09-05 09:53:50	4366	performance	90	-7.777778
33992	2022-09-05 09:54:00	4366	performance	98	8.163265
33993	2022-09-05 09:53:00	4609	performance	96	100.0
33994	2022-09-05 09:53:10	4609	performance	94	-2.1276596
33995	2022-09-05 09:53:20	4609	performance	98	4.0816326
33996	2022-09-05 09:53:30	4609	performance	92	-6.521739
33997	2022-09-05 09:53:40	4609	performance	97	5.1546392
33998	2022-09-05 09:53:50	4609	performance	97	0.0
33999	2022-09-05 09:54:00	4609	performance	99	2.020202
34000	2022-09-05 09:53:00	4130	performance	96	100.0
34001	2022-09-05 09:53:10	4130	performance	93	-3.2258062
34002	2022-09-05 09:53:20	4130	performance	95	2.1052632
34003	2022-09-05 09:53:30	4130	performance	99	4.040404
34004	2022-09-05 09:53:40	4130	performance	95	-4.2105265
34005	2022-09-05 09:53:50	4130	performance	94	-1.0638298
34006	2022-09-05 09:54:00	4130	performance	100	6.0
34007	2022-09-05 09:53:00	4131	performance	93	100.0
34008	2022-09-05 09:53:10	4131	performance	92	-1.0869565
34009	2022-09-05 09:53:20	4131	performance	99	7.070707
34010	2022-09-05 09:53:30	4131	performance	94	-5.319149
34011	2022-09-05 09:53:40	4131	performance	98	4.0816326
34012	2022-09-05 09:53:50	4131	performance	94	-4.255319
34013	2022-09-05 09:54:00	4131	performance	91	-3.2967036
34014	2022-09-05 09:53:00	4367	performance	97	100.0
34015	2022-09-05 09:53:10	4367	performance	97	0.0
34016	2022-09-05 09:53:20	4367	performance	92	-5.4347825
34017	2022-09-05 09:53:30	4367	performance	94	2.1276596
34018	2022-09-05 09:53:40	4367	performance	99	5.050505
34019	2022-09-05 09:53:50	4367	performance	92	-7.6086955
34020	2022-09-05 09:54:00	4367	performance	91	-1.0989012
34021	2022-09-05 09:53:00	4368	performance	97	100.0
34022	2022-09-05 09:53:10	4368	performance	94	-3.1914895
34023	2022-09-05 09:53:20	4368	performance	98	4.0816326
34024	2022-09-05 09:53:30	4368	performance	97	-1.0309278
34025	2022-09-05 09:53:40	4368	performance	95	-2.1052632
34026	2022-09-05 09:53:50	4368	performance	96	1.0416667
34027	2022-09-05 09:54:00	4368	performance	90	-6.666667
34028	2022-09-05 09:53:00	4610	performance	90	100.0
34029	2022-09-05 09:53:10	4610	performance	92	2.173913
34030	2022-09-05 09:53:20	4610	performance	94	2.1276596
34031	2022-09-05 09:53:30	4610	performance	93	-1.0752689
34032	2022-09-05 09:53:40	4610	performance	99	6.060606
34033	2022-09-05 09:53:50	4610	performance	92	-7.6086955
34034	2022-09-05 09:54:00	4610	performance	91	-1.0989012
34035	2022-09-05 09:53:00	4611	performance	92	100.0
34036	2022-09-05 09:53:10	4611	performance	90	-2.2222223
34037	2022-09-05 09:53:20	4611	performance	99	9.090909
34038	2022-09-05 09:53:30	4611	performance	96	-3.125
34039	2022-09-05 09:53:40	4611	performance	97	1.0309278
34040	2022-09-05 09:53:50	4611	performance	92	-5.4347825
34041	2022-09-05 09:54:00	4611	performance	93	1.0752689
34042	2022-09-05 09:53:00	4612	performance	99	100.0
34043	2022-09-05 09:53:10	4612	performance	95	-4.2105265
34044	2022-09-05 09:53:20	4612	performance	100	5.0
34045	2022-09-05 09:53:30	4612	performance	94	-6.382979
34046	2022-09-05 09:53:40	4612	performance	96	2.0833335
34047	2022-09-05 09:53:50	4612	performance	97	1.0309278
34048	2022-09-05 09:54:00	4612	performance	100	3.0
34049	2022-09-05 09:53:00	3963	performance	98	100.0
34050	2022-09-05 09:53:10	3963	performance	92	-6.521739
34051	2022-09-05 09:53:20	3963	performance	97	5.1546392
34052	2022-09-05 09:53:30	3963	performance	92	-5.4347825
34053	2022-09-05 09:53:40	3963	performance	99	7.070707
34054	2022-09-05 09:53:50	3963	performance	97	-2.0618556
34055	2022-09-05 09:54:00	3963	performance	97	0.0
34056	2022-09-05 09:53:00	3964	performance	98	100.0
34057	2022-09-05 09:53:10	3964	performance	100	2.0
34058	2022-09-05 09:53:20	3964	performance	94	-6.382979
34059	2022-09-05 09:53:30	3964	performance	97	3.0927835
34060	2022-09-05 09:53:40	3964	performance	92	-5.4347825
34061	2022-09-05 09:53:50	3964	performance	91	-1.0989012
34062	2022-09-05 09:54:00	3964	performance	96	5.208333
34063	2022-09-05 09:53:00	4132	performance	99	100.0
34064	2022-09-05 09:53:10	4132	performance	96	-3.125
34065	2022-09-05 09:53:20	4132	performance	97	1.0309278
34066	2022-09-05 09:53:30	4132	performance	96	-1.0416667
34067	2022-09-05 09:53:40	4132	performance	99	3.030303
34068	2022-09-05 09:53:50	4132	performance	90	-10.0
34069	2022-09-05 09:54:00	4132	performance	96	6.25
34070	2022-09-05 09:53:00	4133	performance	97	100.0
34071	2022-09-05 09:53:10	4133	performance	96	-1.0416667
34072	2022-09-05 09:53:20	4133	performance	94	-2.1276596
34073	2022-09-05 09:53:30	4133	performance	95	1.0526316
34074	2022-09-05 09:53:40	4133	performance	94	-1.0638298
34075	2022-09-05 09:53:50	4133	performance	93	-1.0752689
34076	2022-09-05 09:54:00	4133	performance	96	3.125
34077	2022-09-05 09:53:00	4613	performance	99	100.0
34078	2022-09-05 09:53:10	4613	performance	97	-2.0618556
34079	2022-09-05 09:53:20	4613	performance	92	-5.4347825
34080	2022-09-05 09:53:30	4613	performance	94	2.1276596
34081	2022-09-05 09:53:40	4613	performance	99	5.050505
34082	2022-09-05 09:53:50	4613	performance	96	-3.125
34083	2022-09-05 09:54:00	4613	performance	90	-6.666667
34084	2022-09-05 09:53:00	4369	performance	93	100.0
34085	2022-09-05 09:53:10	4369	performance	99	6.060606
34086	2022-09-05 09:53:20	4369	performance	97	-2.0618556
34087	2022-09-05 09:53:30	4369	performance	100	3.0
34088	2022-09-05 09:53:40	4369	performance	91	-9.89011
34089	2022-09-05 09:53:50	4369	performance	97	6.185567
34090	2022-09-05 09:54:00	4369	performance	97	0.0
34091	2022-09-05 09:53:00	4370	performance	93	100.0
34092	2022-09-05 09:53:10	4370	performance	98	5.102041
34093	2022-09-05 09:53:20	4370	performance	99	1.010101
34094	2022-09-05 09:53:30	4370	performance	97	-2.0618556
34095	2022-09-05 09:53:40	4370	performance	96	-1.0416667
34096	2022-09-05 09:53:50	4370	performance	94	-2.1276596
34097	2022-09-05 09:54:00	4370	performance	94	0.0
34098	2022-09-05 09:53:00	4614	performance	99	100.0
34099	2022-09-05 09:53:10	4614	performance	93	-6.4516125
34100	2022-09-05 09:53:20	4614	performance	91	-2.1978023
34101	2022-09-05 09:53:30	4614	performance	100	9.0
34102	2022-09-05 09:53:40	4614	performance	97	-3.0927835
34103	2022-09-05 09:53:50	4614	performance	90	-7.777778
34104	2022-09-05 09:54:00	4614	performance	91	1.0989012
34105	2022-09-05 09:53:00	4615	performance	99	100.0
34106	2022-09-05 09:53:10	4615	performance	93	-6.4516125
34107	2022-09-05 09:53:20	4615	performance	95	2.1052632
34108	2022-09-05 09:53:30	4615	performance	100	5.0
34109	2022-09-05 09:53:40	4615	performance	91	-9.89011
34110	2022-09-05 09:53:50	4615	performance	94	3.1914895
34111	2022-09-05 09:54:00	4615	performance	98	4.0816326
34112	2022-09-05 09:53:00	4134	performance	97	100.0
34113	2022-09-05 09:53:10	4134	performance	94	-3.1914895
34114	2022-09-05 09:53:20	4134	performance	95	1.0526316
34115	2022-09-05 09:53:30	4134	performance	93	-2.1505377
34116	2022-09-05 09:53:40	4134	performance	96	3.125
34117	2022-09-05 09:53:50	4134	performance	97	1.0309278
34118	2022-09-05 09:54:00	4134	performance	97	0.0
34119	2022-09-05 09:53:00	4371	performance	91	100.0
34120	2022-09-05 09:53:10	4371	performance	92	1.0869565
34121	2022-09-05 09:53:20	4371	performance	93	1.0752689
34122	2022-09-05 09:53:30	4371	performance	96	3.125
34123	2022-09-05 09:53:40	4371	performance	96	0.0
34124	2022-09-05 09:53:50	4371	performance	94	-2.1276596
34125	2022-09-05 09:54:00	4371	performance	95	1.0526316
34126	2022-09-05 09:53:00	3965	performance	97	100.0
34127	2022-09-05 09:53:10	3965	performance	100	3.0
34128	2022-09-05 09:53:20	3965	performance	96	-4.166667
34129	2022-09-05 09:53:30	3965	performance	94	-2.1276596
34130	2022-09-05 09:53:40	3965	performance	90	-4.4444447
34131	2022-09-05 09:53:50	3965	performance	95	5.263158
34132	2022-09-05 09:54:00	3965	performance	97	2.0618556
34133	2022-09-05 09:53:00	4135	performance	90	100.0
34134	2022-09-05 09:53:10	4135	performance	95	5.263158
34135	2022-09-05 09:53:20	4135	performance	92	-3.2608695
34136	2022-09-05 09:53:30	4135	performance	96	4.166667
34137	2022-09-05 09:53:40	4135	performance	94	-2.1276596
34138	2022-09-05 09:53:50	4135	performance	95	1.0526316
34139	2022-09-05 09:54:00	4135	performance	97	2.0618556
34140	2022-09-05 09:53:00	4616	performance	90	100.0
34141	2022-09-05 09:53:10	4616	performance	93	3.2258062
34142	2022-09-05 09:53:20	4616	performance	98	5.102041
34143	2022-09-05 09:53:30	4616	performance	98	0.0
34144	2022-09-05 09:53:40	4616	performance	93	-5.376344
34145	2022-09-05 09:53:50	4616	performance	98	5.102041
34146	2022-09-05 09:54:00	4616	performance	100	2.0
34147	2022-09-05 09:53:00	4617	performance	99	100.0
34148	2022-09-05 09:53:10	4617	performance	100	1.0
34149	2022-09-05 09:53:20	4617	performance	91	-9.89011
34150	2022-09-05 09:53:30	4617	performance	96	5.208333
34151	2022-09-05 09:53:40	4617	performance	97	1.0309278
34152	2022-09-05 09:53:50	4617	performance	98	1.0204082
34153	2022-09-05 09:54:00	4617	performance	98	0.0
34154	2022-09-05 09:53:00	3966	performance	96	100.0
34155	2022-09-05 09:53:10	3966	performance	99	3.030303
34156	2022-09-05 09:53:20	3966	performance	96	-3.125
34157	2022-09-05 09:53:30	3966	performance	92	-4.347826
34158	2022-09-05 09:53:40	3966	performance	98	6.122449
34159	2022-09-05 09:53:50	3966	performance	97	-1.0309278
34160	2022-09-05 09:54:00	3966	performance	95	-2.1052632
34161	2022-09-05 09:53:00	4372	performance	92	100.0
34162	2022-09-05 09:53:10	4372	performance	95	3.1578946
34163	2022-09-05 09:53:20	4372	performance	92	-3.2608695
34164	2022-09-05 09:53:30	4372	performance	92	0.0
34165	2022-09-05 09:53:40	4372	performance	97	5.1546392
34166	2022-09-05 09:53:50	4372	performance	95	-2.1052632
34167	2022-09-05 09:54:00	4372	performance	94	-1.0638298
34168	2022-09-05 09:53:00	4618	performance	90	100.0
34169	2022-09-05 09:53:10	4618	performance	93	3.2258062
34170	2022-09-05 09:53:20	4618	performance	93	0.0
34171	2022-09-05 09:53:30	4618	performance	98	5.102041
34172	2022-09-05 09:53:40	4618	performance	98	0.0
34173	2022-09-05 09:53:50	4618	performance	95	-3.1578946
34174	2022-09-05 09:54:00	4618	performance	91	-4.3956046
34175	2022-09-05 09:53:00	4136	performance	99	100.0
34176	2022-09-05 09:53:10	4136	performance	90	-10.0
34177	2022-09-05 09:53:20	4136	performance	100	10.0
34178	2022-09-05 09:53:30	4136	performance	92	-8.695652
34179	2022-09-05 09:53:40	4136	performance	96	4.166667
34180	2022-09-05 09:53:50	4136	performance	97	1.0309278
34181	2022-09-05 09:54:00	4136	performance	95	-2.1052632
34182	2022-09-05 09:53:00	4137	performance	95	100.0
34183	2022-09-05 09:53:10	4137	performance	93	-2.1505377
34184	2022-09-05 09:53:20	4137	performance	97	4.123711
34185	2022-09-05 09:53:30	4137	performance	99	2.020202
34186	2022-09-05 09:53:40	4137	performance	99	0.0
34187	2022-09-05 09:53:50	4137	performance	90	-10.0
34188	2022-09-05 09:54:00	4137	performance	94	4.255319
34189	2022-09-05 09:53:00	4373	performance	98	100.0
34190	2022-09-05 09:53:10	4373	performance	92	-6.521739
34191	2022-09-05 09:53:20	4373	performance	97	5.1546392
34192	2022-09-05 09:53:30	4373	performance	98	1.0204082
34193	2022-09-05 09:53:40	4373	performance	98	0.0
34194	2022-09-05 09:53:50	4373	performance	94	-4.255319
34195	2022-09-05 09:54:00	4373	performance	94	0.0
34196	2022-09-05 09:53:00	4374	performance	90	100.0
34197	2022-09-05 09:53:10	4374	performance	100	10.0
34198	2022-09-05 09:53:20	4374	performance	93	-7.526882
34199	2022-09-05 09:53:30	4374	performance	93	0.0
34200	2022-09-05 09:53:40	4374	performance	90	-3.3333335
34201	2022-09-05 09:53:50	4374	performance	96	6.25
34202	2022-09-05 09:54:00	4374	performance	91	-5.4945054
34203	2022-09-05 09:53:00	4619	performance	97	100.0
34204	2022-09-05 09:53:10	4619	performance	92	-5.4347825
34205	2022-09-05 09:53:20	4619	performance	100	8.0
34206	2022-09-05 09:53:30	4619	performance	98	-2.0408163
34207	2022-09-05 09:53:40	4619	performance	92	-6.521739
34208	2022-09-05 09:53:50	4619	performance	99	7.070707
34209	2022-09-05 09:54:00	4619	performance	95	-4.2105265
34210	2022-09-05 09:53:00	4620	performance	100	100.0
34211	2022-09-05 09:53:10	4620	performance	95	-5.263158
34212	2022-09-05 09:53:20	4620	performance	91	-4.3956046
34213	2022-09-05 09:53:30	4620	performance	94	3.1914895
34214	2022-09-05 09:53:40	4620	performance	99	5.050505
34215	2022-09-05 09:53:50	4620	performance	95	-4.2105265
34216	2022-09-05 09:54:00	4620	performance	97	2.0618556
34217	2022-09-05 09:53:00	4621	performance	91	100.0
34218	2022-09-05 09:53:10	4621	performance	99	8.080808
34219	2022-09-05 09:53:20	4621	performance	92	-7.6086955
34220	2022-09-05 09:53:30	4621	performance	99	7.070707
34221	2022-09-05 09:53:40	4621	performance	96	-3.125
34222	2022-09-05 09:53:50	4621	performance	98	2.0408163
34223	2022-09-05 09:54:00	4621	performance	92	-6.521739
34224	2022-09-05 09:53:00	3967	performance	90	100.0
34225	2022-09-05 09:53:10	3967	performance	98	8.163265
34226	2022-09-05 09:53:20	3967	performance	93	-5.376344
34227	2022-09-05 09:53:30	3967	performance	90	-3.3333335
34228	2022-09-05 09:53:40	3967	performance	90	0.0
34229	2022-09-05 09:53:50	3967	performance	97	7.2164946
34230	2022-09-05 09:54:00	3967	performance	95	-2.1052632
34231	2022-09-05 09:53:00	3968	performance	97	100.0
34232	2022-09-05 09:53:10	3968	performance	95	-2.1052632
34233	2022-09-05 09:53:20	3968	performance	96	1.0416667
34234	2022-09-05 09:53:30	3968	performance	100	4.0
34235	2022-09-05 09:53:40	3968	performance	96	-4.166667
34236	2022-09-05 09:53:50	3968	performance	99	3.030303
34237	2022-09-05 09:54:00	3968	performance	100	1.0
34238	2022-09-05 09:53:00	4138	performance	99	100.0
34239	2022-09-05 09:53:10	4138	performance	97	-2.0618556
34240	2022-09-05 09:53:20	4138	performance	94	-3.1914895
34241	2022-09-05 09:53:30	4138	performance	99	5.050505
34242	2022-09-05 09:53:40	4138	performance	94	-5.319149
34243	2022-09-05 09:53:50	4138	performance	97	3.0927835
34244	2022-09-05 09:54:00	4138	performance	97	0.0
34245	2022-09-05 09:53:00	4139	performance	100	100.0
34246	2022-09-05 09:53:10	4139	performance	98	-2.0408163
34247	2022-09-05 09:53:20	4139	performance	91	-7.692308
34248	2022-09-05 09:53:30	4139	performance	96	5.208333
34249	2022-09-05 09:53:40	4139	performance	100	4.0
34250	2022-09-05 09:53:50	4139	performance	97	-3.0927835
34251	2022-09-05 09:54:00	4139	performance	96	-1.0416667
34252	2022-09-05 09:53:00	4140	performance	97	100.0
34253	2022-09-05 09:53:10	4140	performance	93	-4.3010755
34254	2022-09-05 09:53:20	4140	performance	91	-2.1978023
34255	2022-09-05 09:53:30	4140	performance	98	7.1428576
34256	2022-09-05 09:53:40	4140	performance	100	2.0
34257	2022-09-05 09:53:50	4140	performance	99	-1.010101
34258	2022-09-05 09:54:00	4140	performance	92	-7.6086955
34259	2022-09-05 09:53:00	4142	performance	97	100.0
34260	2022-09-05 09:53:10	4142	performance	91	-6.593407
34261	2022-09-05 09:53:20	4142	performance	91	0.0
34262	2022-09-05 09:53:30	4142	performance	93	2.1505377
34263	2022-09-05 09:53:40	4142	performance	94	1.0638298
34264	2022-09-05 09:53:50	4142	performance	93	-1.0752689
34265	2022-09-05 09:54:00	4142	performance	92	-1.0869565
34266	2022-09-05 09:53:00	4143	performance	91	100.0
34267	2022-09-05 09:53:10	4143	performance	97	6.185567
34268	2022-09-05 09:53:20	4143	performance	99	2.020202
34269	2022-09-05 09:53:30	4143	performance	97	-2.0618556
34270	2022-09-05 09:53:40	4143	performance	98	1.0204082
34271	2022-09-05 09:53:50	4143	performance	95	-3.1578946
34272	2022-09-05 09:54:00	4143	performance	96	1.0416667
34273	2022-09-05 09:53:00	4144	performance	94	100.0
34274	2022-09-05 09:53:10	4144	performance	90	-4.4444447
34275	2022-09-05 09:53:20	4144	performance	97	7.2164946
34276	2022-09-05 09:53:30	4144	performance	99	2.020202
34277	2022-09-05 09:53:40	4144	performance	90	-10.0
34278	2022-09-05 09:53:50	4144	performance	100	10.0
34279	2022-09-05 09:54:00	4144	performance	99	-1.010101
34280	2022-09-05 09:53:00	4377	performance	95	100.0
34281	2022-09-05 09:53:10	4377	performance	98	3.0612245
34282	2022-09-05 09:53:20	4377	performance	91	-7.692308
34283	2022-09-05 09:53:30	4377	performance	91	0.0
34284	2022-09-05 09:53:40	4377	performance	90	-1.1111112
34285	2022-09-05 09:53:50	4377	performance	90	0.0
34286	2022-09-05 09:54:00	4377	performance	94	4.255319
34287	2022-09-05 09:53:00	3969	performance	95	100.0
34288	2022-09-05 09:53:10	3969	performance	96	1.0416667
34289	2022-09-05 09:53:20	3969	performance	97	1.0309278
34290	2022-09-05 09:53:30	3969	performance	100	3.0
34291	2022-09-05 09:53:40	3969	performance	94	-6.382979
34292	2022-09-05 09:53:50	3969	performance	92	-2.173913
34293	2022-09-05 09:54:00	3969	performance	98	6.122449
34294	2022-09-05 09:53:00	4622	performance	95	100.0
34295	2022-09-05 09:53:10	4622	performance	96	1.0416667
34296	2022-09-05 09:53:20	4622	performance	98	2.0408163
34297	2022-09-05 09:53:30	4622	performance	94	-4.255319
34298	2022-09-05 09:53:40	4622	performance	90	-4.4444447
34299	2022-09-05 09:53:50	4622	performance	92	2.173913
34300	2022-09-05 09:54:00	4622	performance	94	2.1276596
34301	2022-09-05 09:53:00	4145	performance	97	100.0
34302	2022-09-05 09:53:10	4145	performance	98	1.0204082
34303	2022-09-05 09:53:20	4145	performance	99	1.010101
34304	2022-09-05 09:53:30	4145	performance	100	1.0
34305	2022-09-05 09:53:40	4145	performance	91	-9.89011
34306	2022-09-05 09:53:50	4145	performance	96	5.208333
34307	2022-09-05 09:54:00	4145	performance	96	0.0
34308	2022-09-05 09:53:00	4146	performance	98	100.0
34309	2022-09-05 09:53:10	4146	performance	99	1.010101
34310	2022-09-05 09:53:20	4146	performance	92	-7.6086955
34311	2022-09-05 09:53:30	4146	performance	94	2.1276596
34312	2022-09-05 09:53:40	4146	performance	97	3.0927835
34313	2022-09-05 09:53:50	4146	performance	93	-4.3010755
34314	2022-09-05 09:54:00	4146	performance	97	4.123711
34315	2022-09-05 09:53:00	3970	performance	96	100.0
34316	2022-09-05 09:53:10	3970	performance	95	-1.0526316
34317	2022-09-05 09:53:20	3970	performance	96	1.0416667
34318	2022-09-05 09:53:30	3970	performance	90	-6.666667
34319	2022-09-05 09:53:40	3970	performance	93	3.2258062
34320	2022-09-05 09:53:50	3970	performance	97	4.123711
34321	2022-09-05 09:54:00	3970	performance	94	-3.1914895
34322	2022-09-05 09:53:00	4378	performance	95	100.0
34323	2022-09-05 09:53:10	4378	performance	98	3.0612245
34324	2022-09-05 09:53:20	4378	performance	98	0.0
34325	2022-09-05 09:53:30	4378	performance	96	-2.0833335
34326	2022-09-05 09:53:40	4378	performance	92	-4.347826
34327	2022-09-05 09:53:50	4378	performance	90	-2.2222223
34328	2022-09-05 09:54:00	4378	performance	99	9.090909
34329	2022-09-05 09:53:00	4623	performance	92	100.0
34330	2022-09-05 09:53:10	4623	performance	99	7.070707
34331	2022-09-05 09:53:20	4623	performance	97	-2.0618556
34332	2022-09-05 09:53:30	4623	performance	93	-4.3010755
34333	2022-09-05 09:53:40	4623	performance	95	2.1052632
34334	2022-09-05 09:53:50	4623	performance	99	4.040404
34335	2022-09-05 09:54:00	4623	performance	93	-6.4516125
34336	2022-09-05 09:53:00	4624	performance	96	100.0
34337	2022-09-05 09:53:10	4624	performance	92	-4.347826
34338	2022-09-05 09:53:20	4624	performance	99	7.070707
34339	2022-09-05 09:53:30	4624	performance	91	-8.791209
34340	2022-09-05 09:53:40	4624	performance	98	7.1428576
34341	2022-09-05 09:53:50	4624	performance	97	-1.0309278
34342	2022-09-05 09:54:00	4624	performance	96	-1.0416667
34343	2022-09-05 09:53:00	4625	performance	93	100.0
34344	2022-09-05 09:53:10	4625	performance	100	7.0
34345	2022-09-05 09:53:20	4625	performance	99	-1.010101
34346	2022-09-05 09:53:30	4625	performance	91	-8.791209
34347	2022-09-05 09:53:40	4625	performance	96	5.208333
34348	2022-09-05 09:53:50	4625	performance	91	-5.4945054
34349	2022-09-05 09:54:00	4625	performance	93	2.1505377
34350	2022-09-05 09:53:00	4380	performance	95	100.0
34351	2022-09-05 09:53:10	4380	performance	92	-3.2608695
34352	2022-09-05 09:53:20	4380	performance	99	7.070707
34353	2022-09-05 09:53:30	4380	performance	93	-6.4516125
34354	2022-09-05 09:53:40	4380	performance	96	3.125
34355	2022-09-05 09:53:50	4380	performance	99	3.030303
34356	2022-09-05 09:54:00	4380	performance	97	-2.0618556
34357	2022-09-05 09:53:00	4147	performance	99	100.0
34358	2022-09-05 09:53:10	4147	performance	91	-8.791209
34359	2022-09-05 09:53:20	4147	performance	97	6.185567
34360	2022-09-05 09:53:30	4147	performance	92	-5.4347825
34361	2022-09-05 09:53:40	4147	performance	93	1.0752689
34362	2022-09-05 09:53:50	4147	performance	93	0.0
34363	2022-09-05 09:54:00	4147	performance	96	3.125
34364	2022-09-05 09:53:00	4148	performance	97	100.0
34365	2022-09-05 09:53:10	4148	performance	99	2.020202
34366	2022-09-05 09:53:20	4148	performance	93	-6.4516125
34367	2022-09-05 09:53:30	4148	performance	95	2.1052632
34368	2022-09-05 09:53:40	4148	performance	93	-2.1505377
34369	2022-09-05 09:53:50	4148	performance	96	3.125
34370	2022-09-05 09:54:00	4148	performance	91	-5.4945054
34371	2022-09-05 09:53:00	4626	performance	100	100.0
34372	2022-09-05 09:53:10	4626	performance	90	-11.111112
34373	2022-09-05 09:53:20	4626	performance	96	6.25
34374	2022-09-05 09:53:30	4626	performance	99	3.030303
34375	2022-09-05 09:53:40	4626	performance	93	-6.4516125
34376	2022-09-05 09:53:50	4626	performance	100	7.0
34377	2022-09-05 09:54:00	4626	performance	98	-2.0408163
34378	2022-09-05 09:53:00	3971	performance	91	100.0
34379	2022-09-05 09:53:10	3971	performance	98	7.1428576
34380	2022-09-05 09:53:20	3971	performance	90	-8.888889
34381	2022-09-05 09:53:30	3971	performance	91	1.0989012
34382	2022-09-05 09:53:40	3971	performance	98	7.1428576
34383	2022-09-05 09:53:50	3971	performance	100	2.0
34384	2022-09-05 09:54:00	3971	performance	96	-4.166667
34385	2022-09-05 09:53:00	3972	performance	99	100.0
34386	2022-09-05 09:53:10	3972	performance	94	-5.319149
34387	2022-09-05 09:53:20	3972	performance	100	6.0
34388	2022-09-05 09:53:30	3972	performance	98	-2.0408163
34389	2022-09-05 09:53:40	3972	performance	92	-6.521739
34390	2022-09-05 09:53:50	3972	performance	95	3.1578946
34391	2022-09-05 09:54:00	3972	performance	99	4.040404
34392	2022-09-05 09:53:00	4627	performance	90	100.0
34393	2022-09-05 09:53:10	4627	performance	90	0.0
34394	2022-09-05 09:53:20	4627	performance	98	8.163265
34395	2022-09-05 09:53:30	4627	performance	91	-7.692308
34396	2022-09-05 09:53:40	4627	performance	98	7.1428576
34397	2022-09-05 09:53:50	4627	performance	93	-5.376344
34398	2022-09-05 09:54:00	4627	performance	94	1.0638298
34399	2022-09-05 09:53:00	4628	performance	98	100.0
34400	2022-09-05 09:53:10	4628	performance	96	-2.0833335
34401	2022-09-05 09:53:20	4628	performance	93	-3.2258062
34402	2022-09-05 09:53:30	4628	performance	97	4.123711
34403	2022-09-05 09:53:40	4628	performance	100	3.0
34404	2022-09-05 09:53:50	4628	performance	97	-3.0927835
34405	2022-09-05 09:54:00	4628	performance	92	-5.4347825
34406	2022-09-05 09:53:00	4149	performance	97	100.0
34407	2022-09-05 09:53:10	4149	performance	96	-1.0416667
34408	2022-09-05 09:53:20	4149	performance	92	-4.347826
34409	2022-09-05 09:53:30	4149	performance	91	-1.0989012
34410	2022-09-05 09:53:40	4149	performance	97	6.185567
34411	2022-09-05 09:53:50	4149	performance	91	-6.593407
34412	2022-09-05 09:54:00	4149	performance	90	-1.1111112
34413	2022-09-05 09:53:00	4381	performance	95	100.0
34414	2022-09-05 09:53:10	4381	performance	91	-4.3956046
34415	2022-09-05 09:53:20	4381	performance	95	4.2105265
34416	2022-09-05 09:53:30	4381	performance	94	-1.0638298
34417	2022-09-05 09:53:40	4381	performance	93	-1.0752689
34418	2022-09-05 09:53:50	4381	performance	97	4.123711
34419	2022-09-05 09:54:00	4381	performance	93	-4.3010755
34420	2022-09-05 09:53:00	4382	performance	94	100.0
34421	2022-09-05 09:53:10	4382	performance	90	-4.4444447
34422	2022-09-05 09:53:20	4382	performance	95	5.263158
34423	2022-09-05 09:53:30	4382	performance	93	-2.1505377
34424	2022-09-05 09:53:40	4382	performance	93	0.0
34425	2022-09-05 09:53:50	4382	performance	92	-1.0869565
34426	2022-09-05 09:54:00	4382	performance	90	-2.2222223
34427	2022-09-05 09:53:00	4150	performance	94	100.0
34428	2022-09-05 09:53:10	4150	performance	90	-4.4444447
34429	2022-09-05 09:53:20	4150	performance	93	3.2258062
34430	2022-09-05 09:53:30	4150	performance	92	-1.0869565
34431	2022-09-05 09:53:40	4150	performance	94	2.1276596
34432	2022-09-05 09:53:50	4150	performance	100	6.0
34433	2022-09-05 09:54:00	4150	performance	93	-7.526882
34434	2022-09-05 09:53:00	4629	performance	93	100.0
34435	2022-09-05 09:53:10	4629	performance	95	2.1052632
34436	2022-09-05 09:53:20	4629	performance	100	5.0
34437	2022-09-05 09:53:30	4629	performance	92	-8.695652
34438	2022-09-05 09:53:40	4629	performance	95	3.1578946
34439	2022-09-05 09:53:50	4629	performance	94	-1.0638298
34440	2022-09-05 09:54:00	4629	performance	92	-2.173913
34441	2022-09-05 09:53:00	4630	performance	93	100.0
34442	2022-09-05 09:53:10	4630	performance	96	3.125
34443	2022-09-05 09:53:20	4630	performance	95	-1.0526316
34444	2022-09-05 09:53:30	4630	performance	92	-3.2608695
34445	2022-09-05 09:53:40	4630	performance	91	-1.0989012
34446	2022-09-05 09:53:50	4630	performance	99	8.080808
34447	2022-09-05 09:54:00	4630	performance	98	-1.0204082
34448	2022-09-05 09:53:00	4383	performance	98	100.0
34449	2022-09-05 09:53:10	4383	performance	97	-1.0309278
34450	2022-09-05 09:53:20	4383	performance	90	-7.777778
34451	2022-09-05 09:53:30	4383	performance	93	3.2258062
34452	2022-09-05 09:53:40	4383	performance	92	-1.0869565
34453	2022-09-05 09:53:50	4383	performance	95	3.1578946
34454	2022-09-05 09:54:00	4383	performance	91	-4.3956046
34455	2022-09-05 09:53:00	3973	performance	96	100.0
34456	2022-09-05 09:53:10	3973	performance	99	3.030303
34457	2022-09-05 09:53:20	3973	performance	94	-5.319149
34458	2022-09-05 09:53:30	3973	performance	90	-4.4444447
34459	2022-09-05 09:53:40	3973	performance	91	1.0989012
34460	2022-09-05 09:53:50	3973	performance	96	5.208333
34461	2022-09-05 09:54:00	3973	performance	100	4.0
34462	2022-09-05 09:53:00	4631	performance	98	100.0
34463	2022-09-05 09:53:10	4631	performance	90	-8.888889
34464	2022-09-05 09:53:20	4631	performance	92	2.173913
34465	2022-09-05 09:53:30	4631	performance	100	8.0
34466	2022-09-05 09:53:40	4631	performance	95	-5.263158
34467	2022-09-05 09:53:50	4631	performance	90	-5.555556
34468	2022-09-05 09:54:00	4631	performance	98	8.163265
34469	2022-09-05 09:53:00	4151	performance	90	100.0
34470	2022-09-05 09:53:10	4151	performance	100	10.0
34471	2022-09-05 09:53:20	4151	performance	95	-5.263158
34472	2022-09-05 09:53:30	4151	performance	96	1.0416667
34473	2022-09-05 09:53:40	4151	performance	94	-2.1276596
34474	2022-09-05 09:53:50	4151	performance	94	0.0
34475	2022-09-05 09:54:00	4151	performance	95	1.0526316
34476	2022-09-05 09:53:00	4152	performance	92	100.0
34477	2022-09-05 09:53:10	4152	performance	96	4.166667
34478	2022-09-05 09:53:20	4152	performance	90	-6.666667
34479	2022-09-05 09:53:30	4152	performance	99	9.090909
34480	2022-09-05 09:53:40	4152	performance	96	-3.125
34481	2022-09-05 09:53:50	4152	performance	100	4.0
34482	2022-09-05 09:54:00	4152	performance	94	-6.382979
34483	2022-09-05 09:53:00	3974	performance	99	100.0
34484	2022-09-05 09:53:10	3974	performance	93	-6.4516125
34485	2022-09-05 09:53:20	3974	performance	97	4.123711
34486	2022-09-05 09:53:30	3974	performance	100	3.0
34487	2022-09-05 09:53:40	3974	performance	92	-8.695652
34488	2022-09-05 09:53:50	3974	performance	100	8.0
34489	2022-09-05 09:54:00	3974	performance	94	-6.382979
34490	2022-09-05 09:53:00	4384	performance	99	100.0
34491	2022-09-05 09:53:10	4384	performance	100	1.0
34492	2022-09-05 09:53:20	4384	performance	98	-2.0408163
34493	2022-09-05 09:53:30	4384	performance	94	-4.255319
34494	2022-09-05 09:53:40	4384	performance	95	1.0526316
34495	2022-09-05 09:53:50	4384	performance	98	3.0612245
34496	2022-09-05 09:54:00	4384	performance	91	-7.692308
34497	2022-09-05 09:53:00	4632	performance	97	100.0
34498	2022-09-05 09:53:10	4632	performance	100	3.0
34499	2022-09-05 09:53:20	4632	performance	91	-9.89011
34500	2022-09-05 09:53:30	4632	performance	92	1.0869565
34501	2022-09-05 09:53:40	4632	performance	96	4.166667
34502	2022-09-05 09:53:50	4632	performance	92	-4.347826
34503	2022-09-05 09:54:00	4632	performance	91	-1.0989012
34504	2022-09-05 09:53:00	4633	performance	98	100.0
34505	2022-09-05 09:53:10	4633	performance	96	-2.0833335
34506	2022-09-05 09:53:20	4633	performance	99	3.030303
34507	2022-09-05 09:53:30	4633	performance	95	-4.2105265
34508	2022-09-05 09:53:40	4633	performance	97	2.0618556
34509	2022-09-05 09:53:50	4633	performance	97	0.0
34510	2022-09-05 09:54:00	4633	performance	92	-5.4347825
34511	2022-09-05 09:53:00	4634	performance	98	100.0
34512	2022-09-05 09:53:10	4634	performance	97	-1.0309278
34513	2022-09-05 09:53:20	4634	performance	98	1.0204082
34514	2022-09-05 09:53:30	4634	performance	95	-3.1578946
34515	2022-09-05 09:53:40	4634	performance	100	5.0
34516	2022-09-05 09:53:50	4634	performance	99	-1.010101
34517	2022-09-05 09:54:00	4634	performance	98	-1.0204082
34518	2022-09-05 09:53:00	4385	performance	96	100.0
34519	2022-09-05 09:53:10	4385	performance	99	3.030303
34520	2022-09-05 09:53:20	4385	performance	91	-8.791209
34521	2022-09-05 09:53:30	4385	performance	92	1.0869565
34522	2022-09-05 09:53:40	4385	performance	94	2.1276596
34523	2022-09-05 09:53:50	4385	performance	100	6.0
34524	2022-09-05 09:54:00	4385	performance	92	-8.695652
34525	2022-09-05 09:53:00	4386	performance	91	100.0
34526	2022-09-05 09:53:10	4386	performance	94	3.1914895
34527	2022-09-05 09:53:20	4386	performance	100	6.0
34528	2022-09-05 09:53:30	4386	performance	95	-5.263158
34529	2022-09-05 09:53:40	4386	performance	97	2.0618556
34530	2022-09-05 09:53:50	4386	performance	94	-3.1914895
34531	2022-09-05 09:54:00	4386	performance	98	4.0816326
34532	2022-09-05 09:53:00	4153	performance	97	100.0
34533	2022-09-05 09:53:10	4153	performance	90	-7.777778
34534	2022-09-05 09:53:20	4153	performance	93	3.2258062
34535	2022-09-05 09:53:30	4153	performance	100	7.0
34536	2022-09-05 09:53:40	4153	performance	90	-11.111112
34537	2022-09-05 09:53:50	4153	performance	95	5.263158
34538	2022-09-05 09:54:00	4153	performance	95	0.0
34539	2022-09-05 09:53:00	4154	performance	90	100.0
34540	2022-09-05 09:53:10	4154	performance	93	3.2258062
34541	2022-09-05 09:53:20	4154	performance	91	-2.1978023
34542	2022-09-05 09:53:30	4154	performance	95	4.2105265
34543	2022-09-05 09:53:40	4154	performance	96	1.0416667
34544	2022-09-05 09:53:50	4154	performance	91	-5.4945054
34545	2022-09-05 09:54:00	4154	performance	94	3.1914895
34546	2022-09-05 09:53:00	4635	performance	100	100.0
34547	2022-09-05 09:53:10	4635	performance	98	-2.0408163
34548	2022-09-05 09:53:20	4635	performance	93	-5.376344
34549	2022-09-05 09:53:30	4635	performance	93	0.0
34550	2022-09-05 09:53:40	4635	performance	98	5.102041
34551	2022-09-05 09:53:50	4635	performance	100	2.0
34552	2022-09-05 09:54:00	4635	performance	97	-3.0927835
34553	2022-09-05 09:53:00	3975	performance	91	100.0
34554	2022-09-05 09:53:10	3975	performance	94	3.1914895
34555	2022-09-05 09:53:20	3975	performance	98	4.0816326
34556	2022-09-05 09:53:30	3975	performance	93	-5.376344
34557	2022-09-05 09:53:40	3975	performance	90	-3.3333335
34558	2022-09-05 09:53:50	3975	performance	98	8.163265
34559	2022-09-05 09:54:00	3975	performance	92	-6.521739
34560	2022-09-05 09:53:00	3976	performance	99	100.0
34561	2022-09-05 09:53:10	3976	performance	90	-10.0
34562	2022-09-05 09:53:20	3976	performance	90	0.0
34563	2022-09-05 09:53:30	3976	performance	93	3.2258062
34564	2022-09-05 09:53:40	3976	performance	98	5.102041
34565	2022-09-05 09:53:50	3976	performance	97	-1.0309278
34566	2022-09-05 09:54:00	3976	performance	92	-5.4347825
34567	2022-09-05 09:53:00	4636	performance	90	100.0
34568	2022-09-05 09:53:10	4636	performance	94	4.255319
34569	2022-09-05 09:53:20	4636	performance	98	4.0816326
34570	2022-09-05 09:53:30	4636	performance	91	-7.692308
34571	2022-09-05 09:53:40	4636	performance	90	-1.1111112
34572	2022-09-05 09:53:50	4636	performance	94	4.255319
34573	2022-09-05 09:54:00	4636	performance	92	-2.173913
34574	2022-09-05 09:53:00	4637	performance	97	100.0
34575	2022-09-05 09:53:10	4637	performance	99	2.020202
34576	2022-09-05 09:53:20	4637	performance	95	-4.2105265
34577	2022-09-05 09:53:30	4637	performance	100	5.0
34578	2022-09-05 09:53:40	4637	performance	98	-2.0408163
34579	2022-09-05 09:53:50	4637	performance	92	-6.521739
34580	2022-09-05 09:54:00	4637	performance	94	2.1276596
34581	2022-09-05 09:53:00	4155	performance	94	100.0
34582	2022-09-05 09:53:10	4155	performance	100	6.0
34583	2022-09-05 09:53:20	4155	performance	98	-2.0408163
34584	2022-09-05 09:53:30	4155	performance	91	-7.692308
34585	2022-09-05 09:53:40	4155	performance	98	7.1428576
34586	2022-09-05 09:53:50	4155	performance	96	-2.0833335
34587	2022-09-05 09:54:00	4155	performance	92	-4.347826
34588	2022-09-05 09:53:00	4387	performance	96	100.0
34589	2022-09-05 09:53:10	4387	performance	94	-2.1276596
34590	2022-09-05 09:53:20	4387	performance	92	-2.173913
34591	2022-09-05 09:53:30	4387	performance	92	0.0
34592	2022-09-05 09:53:40	4387	performance	94	2.1276596
34593	2022-09-05 09:53:50	4387	performance	97	3.0927835
34594	2022-09-05 09:54:00	4387	performance	96	-1.0416667
34595	2022-09-05 09:53:00	4388	performance	100	100.0
34596	2022-09-05 09:53:10	4388	performance	90	-11.111112
34597	2022-09-05 09:53:20	4388	performance	96	6.25
34598	2022-09-05 09:53:30	4388	performance	97	1.0309278
34599	2022-09-05 09:53:40	4388	performance	91	-6.593407
34600	2022-09-05 09:53:50	4388	performance	99	8.080808
34601	2022-09-05 09:54:00	4388	performance	94	-5.319149
34602	2022-09-05 09:53:00	4156	performance	100	100.0
34603	2022-09-05 09:53:10	4156	performance	96	-4.166667
34604	2022-09-05 09:53:20	4156	performance	96	0.0
34605	2022-09-05 09:53:30	4156	performance	96	0.0
34606	2022-09-05 09:53:40	4156	performance	97	1.0309278
34607	2022-09-05 09:53:50	4156	performance	97	0.0
34608	2022-09-05 09:54:00	4156	performance	99	2.020202
34609	2022-09-05 09:53:00	4638	performance	91	100.0
34610	2022-09-05 09:53:10	4638	performance	100	9.0
34611	2022-09-05 09:53:20	4638	performance	99	-1.010101
34612	2022-09-05 09:53:30	4638	performance	96	-3.125
34613	2022-09-05 09:53:40	4638	performance	93	-3.2258062
34614	2022-09-05 09:53:50	4638	performance	95	2.1052632
34615	2022-09-05 09:54:00	4638	performance	97	2.0618556
34616	2022-09-05 09:53:00	4639	performance	92	100.0
34617	2022-09-05 09:53:10	4639	performance	100	8.0
34618	2022-09-05 09:53:20	4639	performance	97	-3.0927835
34619	2022-09-05 09:53:30	4639	performance	92	-5.4347825
34620	2022-09-05 09:53:40	4639	performance	92	0.0
34621	2022-09-05 09:53:50	4639	performance	94	2.1276596
34622	2022-09-05 09:54:00	4639	performance	94	0.0
34623	2022-09-05 09:53:00	4389	performance	96	100.0
34624	2022-09-05 09:53:10	4389	performance	95	-1.0526316
34625	2022-09-05 09:53:20	4389	performance	98	3.0612245
34626	2022-09-05 09:53:30	4389	performance	98	0.0
34627	2022-09-05 09:53:40	4389	performance	98	0.0
34628	2022-09-05 09:53:50	4389	performance	96	-2.0833335
34629	2022-09-05 09:54:00	4389	performance	98	2.0408163
34630	2022-09-05 09:53:00	3977	performance	100	100.0
34631	2022-09-05 09:53:10	3977	performance	91	-9.89011
34632	2022-09-05 09:53:20	3977	performance	90	-1.1111112
34633	2022-09-05 09:53:30	3977	performance	98	8.163265
34634	2022-09-05 09:53:40	3977	performance	91	-7.692308
34635	2022-09-05 09:53:50	3977	performance	98	7.1428576
34636	2022-09-05 09:54:00	3977	performance	94	-4.255319
34637	2022-09-05 09:53:00	4640	performance	97	100.0
34638	2022-09-05 09:53:10	4640	performance	98	1.0204082
34639	2022-09-05 09:53:20	4640	performance	92	-6.521739
34640	2022-09-05 09:53:30	4640	performance	93	1.0752689
34641	2022-09-05 09:53:40	4640	performance	97	4.123711
34642	2022-09-05 09:53:50	4640	performance	92	-5.4347825
34643	2022-09-05 09:54:00	4640	performance	92	0.0
34644	2022-09-05 09:53:00	4157	performance	90	100.0
34645	2022-09-05 09:53:10	4157	performance	98	8.163265
34646	2022-09-05 09:53:20	4157	performance	97	-1.0309278
34647	2022-09-05 09:53:30	4157	performance	94	-3.1914895
34648	2022-09-05 09:53:40	4157	performance	98	4.0816326
34649	2022-09-05 09:53:50	4157	performance	99	1.010101
34650	2022-09-05 09:54:00	4157	performance	96	-3.125
34651	2022-09-05 09:53:00	4158	performance	90	100.0
34652	2022-09-05 09:53:10	4158	performance	100	10.0
34653	2022-09-05 09:53:20	4158	performance	91	-9.89011
34654	2022-09-05 09:53:30	4158	performance	94	3.1914895
34655	2022-09-05 09:53:40	4158	performance	96	2.0833335
34656	2022-09-05 09:53:50	4158	performance	91	-5.4945054
34657	2022-09-05 09:54:00	4158	performance	94	3.1914895
34658	2022-09-05 09:53:00	3978	performance	99	100.0
34659	2022-09-05 09:53:10	3978	performance	97	-2.0618556
34660	2022-09-05 09:53:20	3978	performance	98	1.0204082
34661	2022-09-05 09:53:30	3978	performance	93	-5.376344
34662	2022-09-05 09:53:40	3978	performance	90	-3.3333335
34663	2022-09-05 09:53:50	3978	performance	92	2.173913
34664	2022-09-05 09:54:00	3978	performance	100	8.0
34665	2022-09-05 09:53:00	4390	performance	95	100.0
34666	2022-09-05 09:53:10	4390	performance	94	-1.0638298
34667	2022-09-05 09:53:20	4390	performance	97	3.0927835
34668	2022-09-05 09:53:30	4390	performance	100	3.0
34669	2022-09-05 09:53:40	4390	performance	96	-4.166667
34670	2022-09-05 09:53:50	4390	performance	95	-1.0526316
34671	2022-09-05 09:54:00	4390	performance	93	-2.1505377
34672	2022-09-05 09:53:00	4641	performance	93	100.0
34673	2022-09-05 09:53:10	4641	performance	94	1.0638298
34674	2022-09-05 09:53:20	4641	performance	90	-4.4444447
34675	2022-09-05 09:53:30	4641	performance	94	4.255319
34676	2022-09-05 09:53:40	4641	performance	93	-1.0752689
34677	2022-09-05 09:53:50	4641	performance	99	6.060606
34678	2022-09-05 09:54:00	4641	performance	92	-7.6086955
34679	2022-09-05 09:53:00	4642	performance	92	100.0
34680	2022-09-05 09:53:10	4642	performance	99	7.070707
34681	2022-09-05 09:53:20	4642	performance	94	-5.319149
34682	2022-09-05 09:53:30	4642	performance	95	1.0526316
34683	2022-09-05 09:53:40	4642	performance	94	-1.0638298
34684	2022-09-05 09:53:50	4642	performance	100	6.0
34685	2022-09-05 09:54:00	4642	performance	90	-11.111112
34686	2022-09-05 09:53:00	4643	performance	90	100.0
34687	2022-09-05 09:53:10	4643	performance	90	0.0
34688	2022-09-05 09:53:20	4643	performance	98	8.163265
34689	2022-09-05 09:53:30	4643	performance	95	-3.1578946
34690	2022-09-05 09:53:40	4643	performance	90	-5.555556
34691	2022-09-05 09:53:50	4643	performance	91	1.0989012
34692	2022-09-05 09:54:00	4643	performance	92	1.0869565
34693	2022-09-05 09:53:00	4391	performance	91	100.0
34694	2022-09-05 09:53:10	4391	performance	94	3.1914895
34695	2022-09-05 09:53:20	4391	performance	95	1.0526316
34696	2022-09-05 09:53:30	4391	performance	95	0.0
34697	2022-09-05 09:53:40	4391	performance	97	2.0618556
34698	2022-09-05 09:53:50	4391	performance	99	2.020202
34699	2022-09-05 09:54:00	4391	performance	95	-4.2105265
34700	2022-09-05 09:53:00	4392	performance	94	100.0
34701	2022-09-05 09:53:10	4392	performance	90	-4.4444447
34702	2022-09-05 09:53:20	4392	performance	95	5.263158
34703	2022-09-05 09:53:30	4392	performance	98	3.0612245
34704	2022-09-05 09:53:40	4392	performance	90	-8.888889
34705	2022-09-05 09:53:50	4392	performance	94	4.255319
34706	2022-09-05 09:54:00	4392	performance	96	2.0833335
34707	2022-09-05 09:53:00	4159	performance	100	100.0
34708	2022-09-05 09:53:10	4159	performance	98	-2.0408163
34709	2022-09-05 09:53:20	4159	performance	94	-4.255319
34710	2022-09-05 09:53:30	4159	performance	100	6.0
34711	2022-09-05 09:53:40	4159	performance	92	-8.695652
34712	2022-09-05 09:53:50	4159	performance	99	7.070707
34713	2022-09-05 09:54:00	4159	performance	93	-6.4516125
34714	2022-09-05 09:53:00	4160	performance	93	100.0
34715	2022-09-05 09:53:10	4160	performance	94	1.0638298
34716	2022-09-05 09:53:20	4160	performance	96	2.0833335
34717	2022-09-05 09:53:30	4160	performance	90	-6.666667
34718	2022-09-05 09:53:40	4160	performance	93	3.2258062
34719	2022-09-05 09:53:50	4160	performance	94	1.0638298
34720	2022-09-05 09:54:00	4160	performance	94	0.0
34721	2022-09-05 09:53:00	4644	performance	99	100.0
34722	2022-09-05 09:53:10	4644	performance	93	-6.4516125
34723	2022-09-05 09:53:20	4644	performance	90	-3.3333335
34724	2022-09-05 09:53:30	4644	performance	95	5.263158
34725	2022-09-05 09:53:40	4644	performance	99	4.040404
34726	2022-09-05 09:53:50	4644	performance	93	-6.4516125
34727	2022-09-05 09:54:00	4644	performance	94	1.0638298
34728	2022-09-05 09:53:00	3979	performance	92	100.0
34729	2022-09-05 09:53:10	3979	performance	91	-1.0989012
34730	2022-09-05 09:53:20	3979	performance	99	8.080808
34731	2022-09-05 09:53:30	3979	performance	93	-6.4516125
34732	2022-09-05 09:53:40	3979	performance	92	-1.0869565
34733	2022-09-05 09:53:50	3979	performance	92	0.0
34734	2022-09-05 09:54:00	3979	performance	99	7.070707
34735	2022-09-05 09:53:00	3980	performance	93	100.0
34736	2022-09-05 09:53:10	3980	performance	97	4.123711
34737	2022-09-05 09:53:20	3980	performance	99	2.020202
34738	2022-09-05 09:53:30	3980	performance	98	-1.0204082
34739	2022-09-05 09:53:40	3980	performance	94	-4.255319
34740	2022-09-05 09:53:50	3980	performance	93	-1.0752689
34741	2022-09-05 09:54:00	3980	performance	95	2.1052632
34742	2022-09-05 09:53:00	4645	performance	92	100.0
34743	2022-09-05 09:53:10	4645	performance	100	8.0
34744	2022-09-05 09:53:20	4645	performance	94	-6.382979
34745	2022-09-05 09:53:30	4645	performance	97	3.0927835
34746	2022-09-05 09:53:40	4645	performance	94	-3.1914895
34747	2022-09-05 09:53:50	4645	performance	99	5.050505
34748	2022-09-05 09:54:00	4645	performance	95	-4.2105265
34749	2022-09-05 09:53:00	4646	performance	94	100.0
34750	2022-09-05 09:53:10	4646	performance	95	1.0526316
34751	2022-09-05 09:53:20	4646	performance	90	-5.555556
34752	2022-09-05 09:53:30	4646	performance	96	6.25
34753	2022-09-05 09:53:40	4646	performance	98	2.0408163
34754	2022-09-05 09:53:50	4646	performance	99	1.010101
34755	2022-09-05 09:54:00	4646	performance	94	-5.319149
34756	2022-09-05 09:53:00	4161	performance	99	100.0
34757	2022-09-05 09:53:10	4161	performance	94	-5.319149
34758	2022-09-05 09:53:20	4161	performance	100	6.0
34759	2022-09-05 09:53:30	4161	performance	92	-8.695652
34760	2022-09-05 09:53:40	4161	performance	95	3.1578946
34761	2022-09-05 09:53:50	4161	performance	94	-1.0638298
34762	2022-09-05 09:54:00	4161	performance	90	-4.4444447
34763	2022-09-05 09:53:00	4393	performance	100	100.0
34764	2022-09-05 09:53:10	4393	performance	96	-4.166667
34765	2022-09-05 09:53:20	4393	performance	97	1.0309278
34766	2022-09-05 09:53:30	4393	performance	90	-7.777778
34767	2022-09-05 09:53:40	4393	performance	95	5.263158
34768	2022-09-05 09:53:50	4393	performance	90	-5.555556
34769	2022-09-05 09:54:00	4393	performance	99	9.090909
34770	2022-09-05 09:53:00	4394	performance	94	100.0
34771	2022-09-05 09:53:10	4394	performance	95	1.0526316
34772	2022-09-05 09:53:20	4394	performance	93	-2.1505377
34773	2022-09-05 09:53:30	4394	performance	96	3.125
34774	2022-09-05 09:53:40	4394	performance	100	4.0
34775	2022-09-05 09:53:50	4394	performance	99	-1.010101
34776	2022-09-05 09:54:00	4394	performance	95	-4.2105265
34777	2022-09-05 09:53:00	4162	performance	91	100.0
34778	2022-09-05 09:53:10	4162	performance	93	2.1505377
34779	2022-09-05 09:53:20	4162	performance	91	-2.1978023
34780	2022-09-05 09:53:30	4162	performance	94	3.1914895
34781	2022-09-05 09:53:40	4162	performance	96	2.0833335
34782	2022-09-05 09:53:50	4162	performance	91	-5.4945054
34783	2022-09-05 09:54:00	4162	performance	95	4.2105265
34784	2022-09-05 09:53:00	4647	performance	92	100.0
34785	2022-09-05 09:53:10	4647	performance	96	4.166667
34786	2022-09-05 09:53:20	4647	performance	100	4.0
34787	2022-09-05 09:53:30	4647	performance	91	-9.89011
34788	2022-09-05 09:53:40	4647	performance	99	8.080808
34789	2022-09-05 09:53:50	4647	performance	95	-4.2105265
34790	2022-09-05 09:54:00	4647	performance	95	0.0
34791	2022-09-05 09:53:00	4648	performance	94	100.0
34792	2022-09-05 09:53:10	4648	performance	100	6.0
34793	2022-09-05 09:53:20	4648	performance	96	-4.166667
34794	2022-09-05 09:53:30	4648	performance	95	-1.0526316
34795	2022-09-05 09:53:40	4648	performance	94	-1.0638298
34796	2022-09-05 09:53:50	4648	performance	90	-4.4444447
34797	2022-09-05 09:54:00	4648	performance	95	5.263158
34798	2022-09-05 09:53:00	4395	performance	99	100.0
34799	2022-09-05 09:53:10	4395	performance	99	0.0
34800	2022-09-05 09:53:20	4395	performance	98	-1.0204082
34801	2022-09-05 09:53:30	4395	performance	92	-6.521739
34802	2022-09-05 09:53:40	4395	performance	98	6.122449
34803	2022-09-05 09:53:50	4395	performance	94	-4.255319
34804	2022-09-05 09:54:00	4395	performance	98	4.0816326
34805	2022-09-05 09:53:00	3981	performance	98	100.0
34806	2022-09-05 09:53:10	3981	performance	92	-6.521739
34807	2022-09-05 09:53:20	3981	performance	90	-2.2222223
34808	2022-09-05 09:53:30	3981	performance	91	1.0989012
34809	2022-09-05 09:53:40	3981	performance	91	0.0
34810	2022-09-05 09:53:50	3981	performance	92	1.0869565
34811	2022-09-05 09:54:00	3981	performance	95	3.1578946
34812	2022-09-05 09:53:00	4649	performance	92	100.0
34813	2022-09-05 09:53:10	4649	performance	98	6.122449
34814	2022-09-05 09:53:20	4649	performance	97	-1.0309278
34815	2022-09-05 09:53:30	4649	performance	97	0.0
34816	2022-09-05 09:53:40	4649	performance	92	-5.4347825
34817	2022-09-05 09:53:50	4649	performance	100	8.0
34818	2022-09-05 09:54:00	4649	performance	91	-9.89011
34819	2022-09-05 09:53:00	4163	performance	97	100.0
34820	2022-09-05 09:53:10	4163	performance	99	2.020202
34821	2022-09-05 09:53:20	4163	performance	94	-5.319149
34822	2022-09-05 09:53:30	4163	performance	99	5.050505
34823	2022-09-05 09:53:40	4163	performance	100	1.0
34824	2022-09-05 09:53:50	4163	performance	97	-3.0927835
34825	2022-09-05 09:54:00	4163	performance	98	1.0204082
34826	2022-09-05 09:53:00	4164	performance	98	100.0
34827	2022-09-05 09:53:10	4164	performance	95	-3.1578946
34828	2022-09-05 09:53:20	4164	performance	94	-1.0638298
34829	2022-09-05 09:53:30	4164	performance	91	-3.2967036
34830	2022-09-05 09:53:40	4164	performance	100	9.0
34831	2022-09-05 09:53:50	4164	performance	91	-9.89011
34832	2022-09-05 09:54:00	4164	performance	97	6.185567
34833	2022-09-05 09:53:00	3982	performance	95	100.0
34834	2022-09-05 09:53:10	3982	performance	98	3.0612245
34835	2022-09-05 09:53:20	3982	performance	99	1.010101
34836	2022-09-05 09:53:30	3982	performance	92	-7.6086955
34837	2022-09-05 09:53:40	3982	performance	94	2.1276596
34838	2022-09-05 09:53:50	3982	performance	99	5.050505
34839	2022-09-05 09:54:00	3982	performance	90	-10.0
34840	2022-09-05 09:53:00	4396	performance	98	100.0
34841	2022-09-05 09:53:10	4396	performance	93	-5.376344
34842	2022-09-05 09:53:20	4396	performance	95	2.1052632
34843	2022-09-05 09:53:30	4396	performance	93	-2.1505377
34844	2022-09-05 09:53:40	4396	performance	97	4.123711
34845	2022-09-05 09:53:50	4396	performance	100	3.0
34846	2022-09-05 09:54:00	4396	performance	97	-3.0927835
34847	2022-09-05 09:53:00	4650	performance	99	100.0
34848	2022-09-05 09:53:10	4650	performance	91	-8.791209
34849	2022-09-05 09:53:20	4650	performance	100	9.0
34850	2022-09-05 09:53:30	4650	performance	94	-6.382979
34851	2022-09-05 09:53:40	4650	performance	90	-4.4444447
34852	2022-09-05 09:53:50	4650	performance	94	4.255319
34853	2022-09-05 09:54:00	4650	performance	93	-1.0752689
34854	2022-09-05 09:53:00	4651	performance	90	100.0
34855	2022-09-05 09:53:10	4651	performance	100	10.0
34856	2022-09-05 09:53:20	4651	performance	91	-9.89011
34857	2022-09-05 09:53:30	4651	performance	90	-1.1111112
34858	2022-09-05 09:53:40	4651	performance	93	3.2258062
34859	2022-09-05 09:53:50	4651	performance	98	5.102041
34860	2022-09-05 09:54:00	4651	performance	98	0.0
34861	2022-09-05 09:53:00	4652	performance	97	100.0
34862	2022-09-05 09:53:10	4652	performance	92	-5.4347825
34863	2022-09-05 09:53:20	4652	performance	100	8.0
34864	2022-09-05 09:53:30	4652	performance	92	-8.695652
34865	2022-09-05 09:53:40	4652	performance	99	7.070707
34866	2022-09-05 09:53:50	4652	performance	90	-10.0
34867	2022-09-05 09:54:00	4652	performance	92	2.173913
34868	2022-09-05 09:53:00	4397	performance	90	100.0
34869	2022-09-05 09:53:10	4397	performance	96	6.25
34870	2022-09-05 09:53:20	4397	performance	98	2.0408163
34871	2022-09-05 09:53:30	4397	performance	94	-4.255319
34872	2022-09-05 09:53:40	4397	performance	96	2.0833335
34873	2022-09-05 09:53:50	4397	performance	96	0.0
34874	2022-09-05 09:54:00	4397	performance	96	0.0
34875	2022-09-05 09:53:00	4398	performance	91	100.0
34876	2022-09-05 09:53:10	4398	performance	100	9.0
34877	2022-09-05 09:53:20	4398	performance	92	-8.695652
34878	2022-09-05 09:53:30	4398	performance	94	2.1276596
34879	2022-09-05 09:53:40	4398	performance	97	3.0927835
34880	2022-09-05 09:53:50	4398	performance	93	-4.3010755
34881	2022-09-05 09:54:00	4398	performance	100	7.0
34882	2022-09-05 09:53:00	4165	performance	98	100.0
34883	2022-09-05 09:53:10	4165	performance	94	-4.255319
34884	2022-09-05 09:53:20	4165	performance	96	2.0833335
34885	2022-09-05 09:53:30	4165	performance	90	-6.666667
34886	2022-09-05 09:53:40	4165	performance	97	7.2164946
34887	2022-09-05 09:53:50	4165	performance	92	-5.4347825
34888	2022-09-05 09:54:00	4165	performance	91	-1.0989012
34889	2022-09-05 09:53:00	4166	performance	92	100.0
34890	2022-09-05 09:53:10	4166	performance	94	2.1276596
34891	2022-09-05 09:53:20	4166	performance	92	-2.173913
34892	2022-09-05 09:53:30	4166	performance	90	-2.2222223
34893	2022-09-05 09:53:40	4166	performance	93	3.2258062
34894	2022-09-05 09:53:50	4166	performance	92	-1.0869565
34895	2022-09-05 09:54:00	4166	performance	100	8.0
34896	2022-09-05 09:53:00	4653	performance	96	100.0
34897	2022-09-05 09:53:10	4653	performance	100	4.0
34898	2022-09-05 09:53:20	4653	performance	95	-5.263158
34899	2022-09-05 09:53:30	4653	performance	95	0.0
34900	2022-09-05 09:53:40	4653	performance	93	-2.1505377
34901	2022-09-05 09:53:50	4653	performance	98	5.102041
34902	2022-09-05 09:54:00	4653	performance	94	-4.255319
34903	2022-09-05 09:53:00	3983	performance	94	100.0
34904	2022-09-05 09:53:10	3983	performance	97	3.0927835
34905	2022-09-05 09:53:20	3983	performance	90	-7.777778
34906	2022-09-05 09:53:30	3983	performance	91	1.0989012
34907	2022-09-05 09:53:40	3983	performance	93	2.1505377
34908	2022-09-05 09:53:50	3983	performance	95	2.1052632
34909	2022-09-05 09:54:00	3983	performance	92	-3.2608695
34910	2022-09-05 09:53:00	4654	performance	90	100.0
34911	2022-09-05 09:53:10	4654	performance	93	3.2258062
34912	2022-09-05 09:53:20	4654	performance	94	1.0638298
34913	2022-09-05 09:53:30	4654	performance	92	-2.173913
34914	2022-09-05 09:53:40	4654	performance	97	5.1546392
34915	2022-09-05 09:53:50	4654	performance	98	1.0204082
34916	2022-09-05 09:54:00	4654	performance	99	1.010101
34917	2022-09-05 09:53:00	4655	performance	90	100.0
34918	2022-09-05 09:53:10	4655	performance	98	8.163265
34919	2022-09-05 09:53:20	4655	performance	90	-8.888889
34920	2022-09-05 09:53:30	4655	performance	100	10.0
34921	2022-09-05 09:53:40	4655	performance	97	-3.0927835
34922	2022-09-05 09:53:50	4655	performance	94	-3.1914895
34923	2022-09-05 09:54:00	4655	performance	97	3.0927835
34924	2022-09-05 09:53:00	4167	performance	99	100.0
34925	2022-09-05 09:53:10	4167	performance	92	-7.6086955
34926	2022-09-05 09:53:20	4167	performance	97	5.1546392
34927	2022-09-05 09:53:30	4167	performance	96	-1.0416667
34928	2022-09-05 09:53:40	4167	performance	91	-5.4945054
34929	2022-09-05 09:53:50	4167	performance	91	0.0
34930	2022-09-05 09:54:00	4167	performance	100	9.0
34931	2022-09-05 09:53:00	4399	performance	99	100.0
34932	2022-09-05 09:53:10	4399	performance	99	0.0
34933	2022-09-05 09:53:20	4399	performance	91	-8.791209
34934	2022-09-05 09:53:30	4399	performance	98	7.1428576
34935	2022-09-05 09:53:40	4399	performance	96	-2.0833335
34936	2022-09-05 09:53:50	4399	performance	97	1.0309278
34937	2022-09-05 09:54:00	4399	performance	94	-3.1914895
34938	2022-09-05 09:53:00	4400	performance	90	100.0
34939	2022-09-05 09:53:10	4400	performance	93	3.2258062
34940	2022-09-05 09:53:20	4400	performance	98	5.102041
34941	2022-09-05 09:53:30	4400	performance	94	-4.255319
34942	2022-09-05 09:53:40	4400	performance	92	-2.173913
34943	2022-09-05 09:53:50	4400	performance	100	8.0
34944	2022-09-05 09:54:00	4400	performance	97	-3.0927835
34945	2022-09-05 09:53:00	4168	performance	90	100.0
34946	2022-09-05 09:53:10	4168	performance	92	2.173913
34947	2022-09-05 09:53:20	4168	performance	100	8.0
34948	2022-09-05 09:53:30	4168	performance	95	-5.263158
34949	2022-09-05 09:53:40	4168	performance	96	1.0416667
34950	2022-09-05 09:53:50	4168	performance	90	-6.666667
34951	2022-09-05 09:54:00	4168	performance	91	1.0989012
34952	2022-09-05 09:53:00	4656	performance	100	100.0
34953	2022-09-05 09:53:10	4656	performance	97	-3.0927835
34954	2022-09-05 09:53:20	4656	performance	92	-5.4347825
34955	2022-09-05 09:53:30	4656	performance	96	4.166667
34956	2022-09-05 09:53:40	4656	performance	96	0.0
34957	2022-09-05 09:53:50	4656	performance	93	-3.2258062
34958	2022-09-05 09:54:00	4656	performance	97	4.123711
34959	2022-09-05 09:53:00	4657	performance	98	100.0
34960	2022-09-05 09:53:10	4657	performance	90	-8.888889
34961	2022-09-05 09:53:20	4657	performance	100	10.0
34962	2022-09-05 09:53:30	4657	performance	90	-11.111112
34963	2022-09-05 09:53:40	4657	performance	90	0.0
34964	2022-09-05 09:53:50	4657	performance	91	1.0989012
34965	2022-09-05 09:54:00	4657	performance	99	8.080808
34966	2022-09-05 09:53:00	4401	performance	99	100.0
34967	2022-09-05 09:53:10	4401	performance	92	-7.6086955
34968	2022-09-05 09:53:20	4401	performance	95	3.1578946
34969	2022-09-05 09:53:30	4401	performance	97	2.0618556
34970	2022-09-05 09:53:40	4401	performance	98	1.0204082
34971	2022-09-05 09:53:50	4401	performance	92	-6.521739
34972	2022-09-05 09:54:00	4401	performance	100	8.0
34973	2022-09-05 09:53:00	3985	performance	97	100.0
34974	2022-09-05 09:53:10	3985	performance	96	-1.0416667
34975	2022-09-05 09:53:20	3985	performance	94	-2.1276596
34976	2022-09-05 09:53:30	3985	performance	94	0.0
34977	2022-09-05 09:53:40	3985	performance	92	-2.173913
34978	2022-09-05 09:53:50	3985	performance	100	8.0
34979	2022-09-05 09:54:00	3985	performance	96	-4.166667
34980	2022-09-05 09:53:00	4658	performance	96	100.0
34981	2022-09-05 09:53:10	4658	performance	99	3.030303
34982	2022-09-05 09:53:20	4658	performance	97	-2.0618556
34983	2022-09-05 09:53:30	4658	performance	99	2.020202
34984	2022-09-05 09:53:40	4658	performance	99	0.0
34985	2022-09-05 09:53:50	4658	performance	96	-3.125
34986	2022-09-05 09:54:00	4658	performance	98	2.0408163
34987	2022-09-05 09:53:00	4169	performance	100	100.0
34988	2022-09-05 09:53:10	4169	performance	93	-7.526882
34989	2022-09-05 09:53:20	4169	performance	95	2.1052632
34990	2022-09-05 09:53:30	4169	performance	99	4.040404
34991	2022-09-05 09:53:40	4169	performance	96	-3.125
34992	2022-09-05 09:53:50	4169	performance	90	-6.666667
34993	2022-09-05 09:54:00	4169	performance	98	8.163265
34994	2022-09-05 09:53:00	4170	performance	96	100.0
34995	2022-09-05 09:53:10	4170	performance	96	0.0
34996	2022-09-05 09:53:20	4170	performance	100	4.0
34997	2022-09-05 09:53:30	4170	performance	99	-1.010101
34998	2022-09-05 09:53:40	4170	performance	94	-5.319149
34999	2022-09-05 09:53:50	4170	performance	90	-4.4444447
35000	2022-09-05 09:54:00	4170	performance	96	6.25
35001	2022-09-05 09:53:00	3986	performance	98	100.0
35002	2022-09-05 09:53:10	3986	performance	95	-3.1578946
35003	2022-09-05 09:53:20	3986	performance	100	5.0
35004	2022-09-05 09:53:30	3986	performance	100	0.0
35005	2022-09-05 09:53:40	3986	performance	97	-3.0927835
35006	2022-09-05 09:53:50	3986	performance	95	-2.1052632
35007	2022-09-05 09:54:00	3986	performance	92	-3.2608695
35008	2022-09-05 09:53:00	4402	performance	99	100.0
35009	2022-09-05 09:53:10	4402	performance	97	-2.0618556
35010	2022-09-05 09:53:20	4402	performance	98	1.0204082
35011	2022-09-05 09:53:30	4402	performance	91	-7.692308
35012	2022-09-05 09:53:40	4402	performance	94	3.1914895
35013	2022-09-05 09:53:50	4402	performance	100	6.0
35014	2022-09-05 09:54:00	4402	performance	93	-7.526882
35015	2022-09-05 09:53:00	4659	performance	96	100.0
35016	2022-09-05 09:53:10	4659	performance	93	-3.2258062
35017	2022-09-05 09:53:20	4659	performance	100	7.0
35018	2022-09-05 09:53:30	4659	performance	99	-1.010101
35019	2022-09-05 09:53:40	4659	performance	95	-4.2105265
35020	2022-09-05 09:53:50	4659	performance	99	4.040404
35021	2022-09-05 09:54:00	4659	performance	97	-2.0618556
35022	2022-09-05 09:53:00	4660	performance	99	100.0
35023	2022-09-05 09:53:10	4660	performance	91	-8.791209
35024	2022-09-05 09:53:20	4660	performance	91	0.0
35025	2022-09-05 09:53:30	4660	performance	90	-1.1111112
35026	2022-09-05 09:53:40	4660	performance	94	4.255319
35027	2022-09-05 09:53:50	4660	performance	92	-2.173913
35028	2022-09-05 09:54:00	4660	performance	95	3.1578946
35029	2022-09-05 09:53:00	4661	performance	94	100.0
35030	2022-09-05 09:53:10	4661	performance	100	6.0
35031	2022-09-05 09:53:20	4661	performance	91	-9.89011
35032	2022-09-05 09:53:30	4661	performance	92	1.0869565
35033	2022-09-05 09:53:40	4661	performance	93	1.0752689
35034	2022-09-05 09:53:50	4661	performance	100	7.0
35035	2022-09-05 09:54:00	4661	performance	97	-3.0927835
35036	2022-09-05 09:53:00	4403	performance	92	100.0
35037	2022-09-05 09:53:10	4403	performance	90	-2.2222223
35038	2022-09-05 09:53:20	4403	performance	94	4.255319
35039	2022-09-05 09:53:30	4403	performance	98	4.0816326
35040	2022-09-05 09:53:40	4403	performance	94	-4.255319
35041	2022-09-05 09:53:50	4403	performance	96	2.0833335
35042	2022-09-05 09:54:00	4403	performance	91	-5.4945054
35043	2022-09-05 09:53:00	4404	performance	93	100.0
35044	2022-09-05 09:53:10	4404	performance	99	6.060606
35045	2022-09-05 09:53:20	4404	performance	90	-10.0
35046	2022-09-05 09:53:30	4404	performance	98	8.163265
35047	2022-09-05 09:53:40	4404	performance	92	-6.521739
35048	2022-09-05 09:53:50	4404	performance	94	2.1276596
35049	2022-09-05 09:54:00	4404	performance	97	3.0927835
35050	2022-09-05 09:53:00	4171	performance	96	100.0
35051	2022-09-05 09:53:10	4171	performance	94	-2.1276596
35052	2022-09-05 09:53:20	4171	performance	91	-3.2967036
35053	2022-09-05 09:53:30	4171	performance	97	6.185567
35054	2022-09-05 09:53:40	4171	performance	95	-2.1052632
35055	2022-09-05 09:53:50	4171	performance	99	4.040404
35056	2022-09-05 09:54:00	4171	performance	90	-10.0
35057	2022-09-05 09:53:00	4172	performance	90	100.0
35058	2022-09-05 09:53:10	4172	performance	94	4.255319
35059	2022-09-05 09:53:20	4172	performance	93	-1.0752689
35060	2022-09-05 09:53:30	4172	performance	99	6.060606
35061	2022-09-05 09:53:40	4172	performance	100	1.0
35062	2022-09-05 09:53:50	4172	performance	95	-5.263158
35063	2022-09-05 09:54:00	4172	performance	92	-3.2608695
35064	2022-09-05 09:53:00	4662	performance	99	100.0
35065	2022-09-05 09:53:10	4662	performance	91	-8.791209
35066	2022-09-05 09:53:20	4662	performance	96	5.208333
35067	2022-09-05 09:53:30	4662	performance	94	-2.1276596
35068	2022-09-05 09:53:40	4662	performance	98	4.0816326
35069	2022-09-05 09:53:50	4662	performance	91	-7.692308
35070	2022-09-05 09:54:00	4662	performance	94	3.1914895
35071	2022-09-05 09:53:00	3987	performance	100	100.0
35072	2022-09-05 09:53:10	3987	performance	91	-9.89011
35073	2022-09-05 09:53:20	3987	performance	90	-1.1111112
35074	2022-09-05 09:53:30	3987	performance	90	0.0
35075	2022-09-05 09:53:40	3987	performance	94	4.255319
35076	2022-09-05 09:53:50	3987	performance	92	-2.173913
35077	2022-09-05 09:54:00	3987	performance	96	4.166667
35078	2022-09-05 09:53:00	3988	performance	95	100.0
35079	2022-09-05 09:53:10	3988	performance	100	5.0
35080	2022-09-05 09:53:20	3988	performance	94	-6.382979
35081	2022-09-05 09:53:30	3988	performance	90	-4.4444447
35082	2022-09-05 09:53:40	3988	performance	95	5.263158
35083	2022-09-05 09:53:50	3988	performance	95	0.0
35084	2022-09-05 09:54:00	3988	performance	95	0.0
35085	2022-09-05 09:53:00	4663	performance	96	100.0
35086	2022-09-05 09:53:10	4663	performance	92	-4.347826
35087	2022-09-05 09:53:20	4663	performance	90	-2.2222223
35088	2022-09-05 09:53:30	4663	performance	97	7.2164946
35089	2022-09-05 09:53:40	4663	performance	92	-5.4347825
35090	2022-09-05 09:53:50	4663	performance	90	-2.2222223
35091	2022-09-05 09:54:00	4663	performance	97	7.2164946
35092	2022-09-05 09:53:00	4664	performance	95	100.0
35093	2022-09-05 09:53:10	4664	performance	99	4.040404
35094	2022-09-05 09:53:20	4664	performance	92	-7.6086955
35095	2022-09-05 09:53:30	4664	performance	96	4.166667
35096	2022-09-05 09:53:40	4664	performance	90	-6.666667
35097	2022-09-05 09:53:50	4664	performance	96	6.25
35098	2022-09-05 09:54:00	4664	performance	91	-5.4945054
35099	2022-09-05 09:53:00	4173	performance	93	100.0
35100	2022-09-05 09:53:10	4173	performance	90	-3.3333335
35101	2022-09-05 09:53:20	4173	performance	91	1.0989012
35102	2022-09-05 09:53:30	4173	performance	98	7.1428576
35103	2022-09-05 09:53:40	4173	performance	95	-3.1578946
35104	2022-09-05 09:53:50	4173	performance	94	-1.0638298
35105	2022-09-05 09:54:00	4173	performance	99	5.050505
35106	2022-09-05 09:53:00	4405	performance	97	100.0
35107	2022-09-05 09:53:10	4405	performance	99	2.020202
35108	2022-09-05 09:53:20	4405	performance	91	-8.791209
35109	2022-09-05 09:53:30	4405	performance	91	0.0
35110	2022-09-05 09:53:40	4405	performance	98	7.1428576
35111	2022-09-05 09:53:50	4405	performance	98	0.0
35112	2022-09-05 09:54:00	4405	performance	95	-3.1578946
35113	2022-09-05 09:53:00	4406	performance	98	100.0
35114	2022-09-05 09:53:10	4406	performance	94	-4.255319
35115	2022-09-05 09:53:20	4406	performance	91	-3.2967036
35116	2022-09-05 09:53:30	4406	performance	100	9.0
35117	2022-09-05 09:53:40	4406	performance	95	-5.263158
35118	2022-09-05 09:53:50	4406	performance	94	-1.0638298
35119	2022-09-05 09:54:00	4406	performance	95	1.0526316
35120	2022-09-05 09:53:00	4174	performance	91	100.0
35121	2022-09-05 09:53:10	4174	performance	90	-1.1111112
35122	2022-09-05 09:53:20	4174	performance	100	10.0
35123	2022-09-05 09:53:30	4174	performance	97	-3.0927835
35124	2022-09-05 09:53:40	4174	performance	92	-5.4347825
35125	2022-09-05 09:53:50	4174	performance	97	5.1546392
35126	2022-09-05 09:54:00	4174	performance	100	3.0
35127	2022-09-05 09:53:00	4665	performance	98	100.0
35128	2022-09-05 09:53:10	4665	performance	96	-2.0833335
35129	2022-09-05 09:53:20	4665	performance	92	-4.347826
35130	2022-09-05 09:53:30	4665	performance	93	1.0752689
35131	2022-09-05 09:53:40	4665	performance	94	1.0638298
35132	2022-09-05 09:53:50	4665	performance	100	6.0
35133	2022-09-05 09:54:00	4665	performance	97	-3.0927835
35134	2022-09-05 09:53:00	4666	performance	93	100.0
35135	2022-09-05 09:53:10	4666	performance	95	2.1052632
35136	2022-09-05 09:53:20	4666	performance	94	-1.0638298
35137	2022-09-05 09:53:30	4666	performance	96	2.0833335
35138	2022-09-05 09:53:40	4666	performance	95	-1.0526316
35139	2022-09-05 09:53:50	4666	performance	92	-3.2608695
35140	2022-09-05 09:54:00	4666	performance	92	0.0
35141	2022-09-05 09:53:00	4407	performance	96	100.0
35142	2022-09-05 09:53:10	4407	performance	95	-1.0526316
35143	2022-09-05 09:53:20	4407	performance	90	-5.555556
35144	2022-09-05 09:53:30	4407	performance	91	1.0989012
35145	2022-09-05 09:53:40	4407	performance	90	-1.1111112
35146	2022-09-05 09:53:50	4407	performance	97	7.2164946
35147	2022-09-05 09:54:00	4407	performance	98	1.0204082
35148	2022-09-05 09:53:00	3989	performance	96	100.0
35149	2022-09-05 09:53:10	3989	performance	90	-6.666667
35150	2022-09-05 09:53:20	3989	performance	96	6.25
35151	2022-09-05 09:53:30	3989	performance	98	2.0408163
35152	2022-09-05 09:53:40	3989	performance	91	-7.692308
35153	2022-09-05 09:53:50	3989	performance	100	9.0
35154	2022-09-05 09:54:00	3989	performance	99	-1.010101
35155	2022-09-05 09:53:00	4667	performance	92	100.0
35156	2022-09-05 09:53:10	4667	performance	92	0.0
35157	2022-09-05 09:53:20	4667	performance	93	1.0752689
35158	2022-09-05 09:53:30	4667	performance	96	3.125
35159	2022-09-05 09:53:40	4667	performance	90	-6.666667
35160	2022-09-05 09:53:50	4667	performance	91	1.0989012
35161	2022-09-05 09:54:00	4667	performance	100	9.0
35162	2022-09-05 09:53:00	4175	performance	96	100.0
35163	2022-09-05 09:53:10	4175	performance	96	0.0
35164	2022-09-05 09:53:20	4175	performance	98	2.0408163
35165	2022-09-05 09:53:30	4175	performance	99	1.010101
35166	2022-09-05 09:53:40	4175	performance	99	0.0
35167	2022-09-05 09:53:50	4175	performance	100	1.0
35168	2022-09-05 09:54:00	4175	performance	94	-6.382979
35169	2022-09-05 09:53:00	4176	performance	100	100.0
35170	2022-09-05 09:53:10	4176	performance	97	-3.0927835
35171	2022-09-05 09:53:20	4176	performance	94	-3.1914895
35172	2022-09-05 09:53:30	4176	performance	90	-4.4444447
35173	2022-09-05 09:53:40	4176	performance	97	7.2164946
35174	2022-09-05 09:53:50	4176	performance	100	3.0
35175	2022-09-05 09:54:00	4176	performance	94	-6.382979
35176	2022-09-05 09:53:00	3990	performance	94	100.0
35177	2022-09-05 09:53:10	3990	performance	98	4.0816326
35178	2022-09-05 09:53:20	3990	performance	100	2.0
35179	2022-09-05 09:53:30	3990	performance	90	-11.111112
35180	2022-09-05 09:53:40	3990	performance	98	8.163265
35181	2022-09-05 09:53:50	3990	performance	97	-1.0309278
35182	2022-09-05 09:54:00	3990	performance	94	-3.1914895
35183	2022-09-05 09:53:00	4669	performance	93	100.0
35184	2022-09-05 09:53:10	4669	performance	90	-3.3333335
35185	2022-09-05 09:53:20	4669	performance	96	6.25
35186	2022-09-05 09:53:30	4669	performance	92	-4.347826
35187	2022-09-05 09:53:40	4669	performance	94	2.1276596
35188	2022-09-05 09:53:50	4669	performance	97	3.0927835
35189	2022-09-05 09:54:00	4669	performance	91	-6.593407
35190	2022-09-05 09:53:00	4670	performance	91	100.0
35191	2022-09-05 09:53:10	4670	performance	95	4.2105265
35192	2022-09-05 09:53:20	4670	performance	99	4.040404
35193	2022-09-05 09:53:30	4670	performance	97	-2.0618556
35194	2022-09-05 09:53:40	4670	performance	96	-1.0416667
35195	2022-09-05 09:53:50	4670	performance	98	2.0408163
35196	2022-09-05 09:54:00	4670	performance	98	0.0
35197	2022-09-05 09:53:00	4409	performance	94	100.0
35198	2022-09-05 09:53:10	4409	performance	94	0.0
35199	2022-09-05 09:53:20	4409	performance	99	5.050505
35200	2022-09-05 09:53:30	4409	performance	98	-1.0204082
35201	2022-09-05 09:53:40	4409	performance	93	-5.376344
35202	2022-09-05 09:53:50	4409	performance	98	5.102041
35203	2022-09-05 09:54:00	4409	performance	94	-4.255319
35204	2022-09-05 09:53:00	4410	performance	100	100.0
35205	2022-09-05 09:53:10	4410	performance	98	-2.0408163
35206	2022-09-05 09:53:20	4410	performance	93	-5.376344
35207	2022-09-05 09:53:30	4410	performance	91	-2.1978023
35208	2022-09-05 09:53:40	4410	performance	96	5.208333
35209	2022-09-05 09:53:50	4410	performance	97	1.0309278
35210	2022-09-05 09:54:00	4410	performance	92	-5.4347825
35211	2022-09-05 09:53:00	4177	performance	99	100.0
35212	2022-09-05 09:53:10	4177	performance	98	-1.0204082
35213	2022-09-05 09:53:20	4177	performance	91	-7.692308
35214	2022-09-05 09:53:30	4177	performance	92	1.0869565
35215	2022-09-05 09:53:40	4177	performance	92	0.0
35216	2022-09-05 09:53:50	4177	performance	100	8.0
35217	2022-09-05 09:54:00	4177	performance	92	-8.695652
35218	2022-09-05 09:53:00	4178	performance	95	100.0
35219	2022-09-05 09:53:10	4178	performance	96	1.0416667
35220	2022-09-05 09:53:20	4178	performance	91	-5.4945054
35221	2022-09-05 09:53:30	4178	performance	96	5.208333
35222	2022-09-05 09:53:40	4178	performance	95	-1.0526316
35223	2022-09-05 09:53:50	4178	performance	98	3.0612245
35224	2022-09-05 09:54:00	4178	performance	94	-4.255319
35225	2022-09-05 09:53:00	4671	performance	97	100.0
35226	2022-09-05 09:53:10	4671	performance	96	-1.0416667
35227	2022-09-05 09:53:20	4671	performance	90	-6.666667
35228	2022-09-05 09:53:30	4671	performance	90	0.0
35229	2022-09-05 09:53:40	4671	performance	97	7.2164946
35230	2022-09-05 09:53:50	4671	performance	96	-1.0416667
35231	2022-09-05 09:54:00	4671	performance	96	0.0
35232	2022-09-05 09:53:00	3991	performance	99	100.0
35233	2022-09-05 09:53:10	3991	performance	96	-3.125
35234	2022-09-05 09:53:20	3991	performance	99	3.030303
35235	2022-09-05 09:53:30	3991	performance	95	-4.2105265
35236	2022-09-05 09:53:40	3991	performance	97	2.0618556
35237	2022-09-05 09:53:50	3991	performance	94	-3.1914895
35238	2022-09-05 09:54:00	3991	performance	94	0.0
35239	2022-09-05 09:53:00	3992	performance	96	100.0
35240	2022-09-05 09:53:10	3992	performance	97	1.0309278
35241	2022-09-05 09:53:20	3992	performance	94	-3.1914895
35242	2022-09-05 09:53:30	3992	performance	97	3.0927835
35243	2022-09-05 09:53:40	3992	performance	93	-4.3010755
35244	2022-09-05 09:53:50	3992	performance	93	0.0
35245	2022-09-05 09:54:00	3992	performance	92	-1.0869565
35246	2022-09-05 09:53:00	4672	performance	96	100.0
35247	2022-09-05 09:53:10	4672	performance	97	1.0309278
35248	2022-09-05 09:53:20	4672	performance	99	2.020202
35249	2022-09-05 09:53:30	4672	performance	99	0.0
35250	2022-09-05 09:53:40	4672	performance	100	1.0
35251	2022-09-05 09:53:50	4672	performance	91	-9.89011
35252	2022-09-05 09:54:00	4672	performance	97	6.185567
35253	2022-09-05 09:53:00	4673	performance	99	100.0
35254	2022-09-05 09:53:10	4673	performance	99	0.0
35255	2022-09-05 09:53:20	4673	performance	97	-2.0618556
35256	2022-09-05 09:53:30	4673	performance	95	-2.1052632
35257	2022-09-05 09:53:40	4673	performance	90	-5.555556
35258	2022-09-05 09:53:50	4673	performance	92	2.173913
35259	2022-09-05 09:54:00	4673	performance	96	4.166667
35260	2022-09-05 09:53:00	4179	performance	95	100.0
35261	2022-09-05 09:53:10	4179	performance	97	2.0618556
35262	2022-09-05 09:53:20	4179	performance	93	-4.3010755
35263	2022-09-05 09:53:30	4179	performance	96	3.125
35264	2022-09-05 09:53:40	4179	performance	93	-3.2258062
35265	2022-09-05 09:53:50	4179	performance	95	2.1052632
35266	2022-09-05 09:54:00	4179	performance	94	-1.0638298
35267	2022-09-05 09:53:00	4411	performance	100	100.0
35268	2022-09-05 09:53:10	4411	performance	98	-2.0408163
35269	2022-09-05 09:53:20	4411	performance	93	-5.376344
35270	2022-09-05 09:53:30	4411	performance	90	-3.3333335
35271	2022-09-05 09:53:40	4411	performance	98	8.163265
35272	2022-09-05 09:53:50	4411	performance	95	-3.1578946
35273	2022-09-05 09:54:00	4411	performance	95	0.0
35274	2022-09-05 09:53:00	4412	performance	93	100.0
35275	2022-09-05 09:53:10	4412	performance	98	5.102041
35276	2022-09-05 09:53:20	4412	performance	95	-3.1578946
35277	2022-09-05 09:53:30	4412	performance	97	2.0618556
35278	2022-09-05 09:53:40	4412	performance	96	-1.0416667
35279	2022-09-05 09:53:50	4412	performance	93	-3.2258062
35280	2022-09-05 09:54:00	4412	performance	95	2.1052632
35281	2022-09-05 09:53:00	4180	performance	93	100.0
35282	2022-09-05 09:53:10	4180	performance	92	-1.0869565
35283	2022-09-05 09:53:20	4180	performance	92	0.0
35284	2022-09-05 09:53:30	4180	performance	95	3.1578946
35285	2022-09-05 09:53:40	4180	performance	100	5.0
35286	2022-09-05 09:53:50	4180	performance	98	-2.0408163
35287	2022-09-05 09:54:00	4180	performance	98	0.0
35288	2022-09-05 09:53:00	4674	performance	92	100.0
35289	2022-09-05 09:53:10	4674	performance	100	8.0
35290	2022-09-05 09:53:20	4674	performance	97	-3.0927835
35291	2022-09-05 09:53:30	4674	performance	97	0.0
35292	2022-09-05 09:53:40	4674	performance	91	-6.593407
35293	2022-09-05 09:53:50	4674	performance	98	7.1428576
35294	2022-09-05 09:54:00	4674	performance	90	-8.888889
35295	2022-09-05 09:53:00	4675	performance	94	100.0
35296	2022-09-05 09:53:10	4675	performance	92	-2.173913
35297	2022-09-05 09:53:20	4675	performance	91	-1.0989012
35298	2022-09-05 09:53:30	4675	performance	93	2.1505377
35299	2022-09-05 09:53:40	4675	performance	92	-1.0869565
35300	2022-09-05 09:53:50	4675	performance	93	1.0752689
35301	2022-09-05 09:54:00	4675	performance	98	5.102041
35302	2022-09-05 09:53:00	4413	performance	95	100.0
35303	2022-09-05 09:53:10	4413	performance	94	-1.0638298
35304	2022-09-05 09:53:20	4413	performance	97	3.0927835
35305	2022-09-05 09:53:30	4413	performance	100	3.0
35306	2022-09-05 09:53:40	4413	performance	95	-5.263158
35307	2022-09-05 09:53:50	4413	performance	99	4.040404
35308	2022-09-05 09:54:00	4413	performance	95	-4.2105265
35309	2022-09-05 09:53:00	3993	performance	98	100.0
35310	2022-09-05 09:53:10	3993	performance	98	0.0
35311	2022-09-05 09:53:20	3993	performance	97	-1.0309278
35312	2022-09-05 09:53:30	3993	performance	98	1.0204082
35313	2022-09-05 09:53:40	3993	performance	95	-3.1578946
35314	2022-09-05 09:53:50	3993	performance	91	-4.3956046
35315	2022-09-05 09:54:00	3993	performance	95	4.2105265
35316	2022-09-05 09:53:00	4676	performance	98	100.0
35317	2022-09-05 09:53:10	4676	performance	96	-2.0833335
35318	2022-09-05 09:53:20	4676	performance	95	-1.0526316
35319	2022-09-05 09:53:30	4676	performance	98	3.0612245
35320	2022-09-05 09:53:40	4676	performance	97	-1.0309278
35321	2022-09-05 09:53:50	4676	performance	100	3.0
35322	2022-09-05 09:54:00	4676	performance	92	-8.695652
35323	2022-09-05 09:53:00	4181	performance	99	100.0
35324	2022-09-05 09:53:10	4181	performance	95	-4.2105265
35325	2022-09-05 09:53:20	4181	performance	92	-3.2608695
35326	2022-09-05 09:53:30	4181	performance	95	3.1578946
35327	2022-09-05 09:53:40	4181	performance	100	5.0
35328	2022-09-05 09:53:50	4181	performance	97	-3.0927835
35329	2022-09-05 09:54:00	4181	performance	90	-7.777778
35330	2022-09-05 09:53:00	4182	performance	98	100.0
35331	2022-09-05 09:53:10	4182	performance	93	-5.376344
35332	2022-09-05 09:53:20	4182	performance	93	0.0
35333	2022-09-05 09:53:30	4182	performance	98	5.102041
35334	2022-09-05 09:53:40	4182	performance	96	-2.0833335
35335	2022-09-05 09:53:50	4182	performance	93	-3.2258062
35336	2022-09-05 09:54:00	4182	performance	96	3.125
35337	2022-09-05 09:53:00	3994	performance	94	100.0
35338	2022-09-05 09:53:10	3994	performance	97	3.0927835
35339	2022-09-05 09:53:20	3994	performance	98	1.0204082
35340	2022-09-05 09:53:30	3994	performance	95	-3.1578946
35341	2022-09-05 09:53:40	3994	performance	93	-2.1505377
35342	2022-09-05 09:53:50	3994	performance	97	4.123711
35343	2022-09-05 09:54:00	3994	performance	94	-3.1914895
35344	2022-09-05 09:53:00	4414	performance	99	100.0
35345	2022-09-05 09:53:10	4414	performance	91	-8.791209
35346	2022-09-05 09:53:20	4414	performance	91	0.0
35347	2022-09-05 09:53:30	4414	performance	92	1.0869565
35348	2022-09-05 09:53:40	4414	performance	90	-2.2222223
35349	2022-09-05 09:53:50	4414	performance	95	5.263158
35350	2022-09-05 09:54:00	4414	performance	96	1.0416667
35351	2022-09-05 09:53:00	4677	performance	96	100.0
35352	2022-09-05 09:53:10	4677	performance	95	-1.0526316
35353	2022-09-05 09:53:20	4677	performance	99	4.040404
35354	2022-09-05 09:53:30	4677	performance	93	-6.4516125
35355	2022-09-05 09:53:40	4677	performance	91	-2.1978023
35356	2022-09-05 09:53:50	4677	performance	91	0.0
35357	2022-09-05 09:54:00	4677	performance	96	5.208333
35358	2022-09-05 09:53:00	4678	performance	93	100.0
35359	2022-09-05 09:53:10	4678	performance	95	2.1052632
35360	2022-09-05 09:53:20	4678	performance	98	3.0612245
35361	2022-09-05 09:53:30	4678	performance	92	-6.521739
35362	2022-09-05 09:53:40	4678	performance	91	-1.0989012
35363	2022-09-05 09:53:50	4678	performance	99	8.080808
35364	2022-09-05 09:54:00	4678	performance	97	-2.0618556
35365	2022-09-05 09:53:00	4679	performance	98	100.0
35366	2022-09-05 09:53:10	4679	performance	100	2.0
35367	2022-09-05 09:53:20	4679	performance	91	-9.89011
35368	2022-09-05 09:53:30	4679	performance	100	9.0
35369	2022-09-05 09:53:40	4679	performance	92	-8.695652
35370	2022-09-05 09:53:50	4679	performance	95	3.1578946
35371	2022-09-05 09:54:00	4679	performance	92	-3.2608695
35372	2022-09-05 09:53:00	4415	performance	95	100.0
35373	2022-09-05 09:53:10	4415	performance	94	-1.0638298
35374	2022-09-05 09:53:20	4415	performance	94	0.0
35375	2022-09-05 09:53:30	4415	performance	95	1.0526316
35376	2022-09-05 09:53:40	4415	performance	100	5.0
35377	2022-09-05 09:53:50	4415	performance	94	-6.382979
35378	2022-09-05 09:54:00	4415	performance	99	5.050505
35379	2022-09-05 09:53:00	4416	performance	94	100.0
35380	2022-09-05 09:53:10	4416	performance	100	6.0
35381	2022-09-05 09:53:20	4416	performance	96	-4.166667
35382	2022-09-05 09:53:30	4416	performance	96	0.0
35383	2022-09-05 09:53:40	4416	performance	93	-3.2258062
35384	2022-09-05 09:53:50	4416	performance	91	-2.1978023
35385	2022-09-05 09:54:00	4416	performance	96	5.208333
35386	2022-09-05 09:53:00	3995	performance	93	100.0
35387	2022-09-05 09:53:10	3995	performance	98	5.102041
35388	2022-09-05 09:53:20	3995	performance	92	-6.521739
35389	2022-09-05 09:53:30	3995	performance	91	-1.0989012
35390	2022-09-05 09:53:40	3995	performance	93	2.1505377
35391	2022-09-05 09:53:50	3995	performance	99	6.060606
35392	2022-09-05 09:54:00	3995	performance	92	-7.6086955
35393	2022-09-05 09:53:00	4417	performance	96	100.0
35394	2022-09-05 09:53:10	4417	performance	97	1.0309278
35395	2022-09-05 09:53:20	4417	performance	91	-6.593407
35396	2022-09-05 09:53:30	4417	performance	90	-1.1111112
35397	2022-09-05 09:53:40	4417	performance	92	2.173913
35398	2022-09-05 09:53:50	4417	performance	95	3.1578946
35399	2022-09-05 09:54:00	4417	performance	92	-3.2608695
35400	2022-09-05 09:53:00	4418	performance	93	100.0
35401	2022-09-05 09:53:10	4418	performance	90	-3.3333335
35402	2022-09-05 09:53:20	4418	performance	97	7.2164946
35403	2022-09-05 09:53:30	4418	performance	98	1.0204082
35404	2022-09-05 09:53:40	4418	performance	92	-6.521739
35405	2022-09-05 09:53:50	4418	performance	99	7.070707
35406	2022-09-05 09:54:00	4418	performance	100	1.0
35407	2022-09-05 09:53:00	4419	performance	92	100.0
35408	2022-09-05 09:53:10	4419	performance	100	8.0
35409	2022-09-05 09:53:20	4419	performance	91	-9.89011
35410	2022-09-05 09:53:30	4419	performance	100	9.0
35411	2022-09-05 09:53:40	4419	performance	95	-5.263158
35412	2022-09-05 09:53:50	4419	performance	97	2.0618556
35413	2022-09-05 09:54:00	4419	performance	100	3.0
35414	2022-09-05 09:53:00	4183	performance	94	100.0
35415	2022-09-05 09:53:10	4183	performance	91	-3.2967036
35416	2022-09-05 09:53:20	4183	performance	100	9.0
35417	2022-09-05 09:53:30	4183	performance	96	-4.166667
35418	2022-09-05 09:53:40	4183	performance	97	1.0309278
35419	2022-09-05 09:53:50	4183	performance	97	0.0
35420	2022-09-05 09:54:00	4183	performance	95	-2.1052632
35421	2022-09-05 09:53:00	3997	performance	94	100.0
35422	2022-09-05 09:53:10	3997	performance	94	0.0
35423	2022-09-05 09:53:20	3997	performance	90	-4.4444447
35424	2022-09-05 09:53:30	3997	performance	93	3.2258062
35425	2022-09-05 09:53:40	3997	performance	95	2.1052632
35426	2022-09-05 09:53:50	3997	performance	98	3.0612245
35427	2022-09-05 09:54:00	3997	performance	94	-4.255319
35428	2022-09-05 09:53:00	3998	performance	90	100.0
35429	2022-09-05 09:53:10	3998	performance	98	8.163265
35430	2022-09-05 09:53:20	3998	performance	97	-1.0309278
35431	2022-09-05 09:53:30	3998	performance	92	-5.4347825
35432	2022-09-05 09:53:40	3998	performance	95	3.1578946
35433	2022-09-05 09:53:50	3998	performance	98	3.0612245
35434	2022-09-05 09:54:00	3998	performance	100	2.0
35435	2022-09-05 09:53:00	4184	performance	92	100.0
35436	2022-09-05 09:53:10	4184	performance	94	2.1276596
35437	2022-09-05 09:53:20	4184	performance	90	-4.4444447
35438	2022-09-05 09:53:30	4184	performance	93	3.2258062
35439	2022-09-05 09:53:40	4184	performance	96	3.125
35440	2022-09-05 09:53:50	4184	performance	99	3.030303
35441	2022-09-05 09:54:00	4184	performance	98	-1.0204082
35442	2022-09-05 09:53:00	4680	performance	94	100.0
35443	2022-09-05 09:53:10	4680	performance	92	-2.173913
35444	2022-09-05 09:53:20	4680	performance	98	6.122449
35445	2022-09-05 09:53:30	4680	performance	94	-4.255319
35446	2022-09-05 09:53:40	4680	performance	90	-4.4444447
35447	2022-09-05 09:53:50	4680	performance	92	2.173913
35448	2022-09-05 09:54:00	4680	performance	98	6.122449
35449	2022-09-05 09:53:00	4681	performance	100	100.0
35450	2022-09-05 09:53:10	4681	performance	90	-11.111112
35451	2022-09-05 09:53:20	4681	performance	97	7.2164946
35452	2022-09-05 09:53:30	4681	performance	90	-7.777778
35453	2022-09-05 09:53:40	4681	performance	91	1.0989012
35454	2022-09-05 09:53:50	4681	performance	97	6.185567
35455	2022-09-05 09:54:00	4681	performance	94	-3.1914895
35456	2022-09-05 09:53:00	4420	performance	94	100.0
35457	2022-09-05 09:53:10	4420	performance	97	3.0927835
35458	2022-09-05 09:53:20	4420	performance	100	3.0
35459	2022-09-05 09:53:30	4420	performance	92	-8.695652
35460	2022-09-05 09:53:40	4420	performance	92	0.0
35461	2022-09-05 09:53:50	4420	performance	97	5.1546392
35462	2022-09-05 09:54:00	4420	performance	98	1.0204082
35463	2022-09-05 09:53:00	4421	performance	97	100.0
35464	2022-09-05 09:53:10	4421	performance	96	-1.0416667
35465	2022-09-05 09:53:20	4421	performance	95	-1.0526316
35466	2022-09-05 09:53:30	4421	performance	96	1.0416667
35467	2022-09-05 09:53:40	4421	performance	97	1.0309278
35468	2022-09-05 09:53:50	4421	performance	96	-1.0416667
35469	2022-09-05 09:54:00	4421	performance	96	0.0
35470	2022-09-05 09:53:00	4682	performance	93	100.0
35471	2022-09-05 09:53:10	4682	performance	92	-1.0869565
35472	2022-09-05 09:53:20	4682	performance	97	5.1546392
35473	2022-09-05 09:53:30	4682	performance	99	2.020202
35474	2022-09-05 09:53:40	4682	performance	92	-7.6086955
35475	2022-09-05 09:53:50	4682	performance	92	0.0
35476	2022-09-05 09:54:00	4682	performance	94	2.1276596
35477	2022-09-05 09:53:00	4185	performance	99	100.0
35478	2022-09-05 09:53:10	4185	performance	99	0.0
35479	2022-09-05 09:53:20	4185	performance	95	-4.2105265
35480	2022-09-05 09:53:30	4185	performance	90	-5.555556
35481	2022-09-05 09:53:40	4185	performance	91	1.0989012
35482	2022-09-05 09:53:50	4185	performance	92	1.0869565
35483	2022-09-05 09:54:00	4185	performance	98	6.122449
35484	2022-09-05 09:53:00	4186	performance	91	100.0
35485	2022-09-05 09:53:10	4186	performance	97	6.185567
35486	2022-09-05 09:53:20	4186	performance	90	-7.777778
35487	2022-09-05 09:53:30	4186	performance	93	3.2258062
35488	2022-09-05 09:53:40	4186	performance	93	0.0
35489	2022-09-05 09:53:50	4186	performance	91	-2.1978023
35490	2022-09-05 09:54:00	4186	performance	98	7.1428576
35491	2022-09-05 09:53:00	4422	performance	99	100.0
35492	2022-09-05 09:53:10	4422	performance	99	0.0
35493	2022-09-05 09:53:20	4422	performance	93	-6.4516125
35494	2022-09-05 09:53:30	4422	performance	97	4.123711
35495	2022-09-05 09:53:40	4422	performance	90	-7.777778
35496	2022-09-05 09:53:50	4422	performance	90	0.0
35497	2022-09-05 09:54:00	4422	performance	98	8.163265
35498	2022-09-05 09:53:00	3999	performance	99	100.0
35499	2022-09-05 09:53:10	3999	performance	95	-4.2105265
35500	2022-09-05 09:53:20	3999	performance	95	0.0
35501	2022-09-05 09:53:30	3999	performance	95	0.0
35502	2022-09-05 09:53:40	3999	performance	95	0.0
35503	2022-09-05 09:53:50	3999	performance	95	0.0
35504	2022-09-05 09:54:00	3999	performance	95	0.0
35505	2022-09-05 09:53:00	4683	performance	99	100.0
35506	2022-09-05 09:53:10	4683	performance	93	-6.4516125
35507	2022-09-05 09:53:20	4683	performance	96	3.125
35508	2022-09-05 09:53:30	4683	performance	97	1.0309278
35509	2022-09-05 09:53:40	4683	performance	99	2.020202
35510	2022-09-05 09:53:50	4683	performance	90	-10.0
35511	2022-09-05 09:54:00	4683	performance	95	5.263158
35512	2022-09-05 09:53:00	4684	performance	91	100.0
35513	2022-09-05 09:53:10	4684	performance	97	6.185567
35514	2022-09-05 09:53:20	4684	performance	92	-5.4347825
35515	2022-09-05 09:53:30	4684	performance	98	6.122449
35516	2022-09-05 09:53:40	4684	performance	92	-6.521739
35517	2022-09-05 09:53:50	4684	performance	99	7.070707
35518	2022-09-05 09:54:00	4684	performance	90	-10.0
35519	2022-09-05 09:53:00	4685	performance	98	100.0
35520	2022-09-05 09:53:10	4685	performance	91	-7.692308
35521	2022-09-05 09:53:20	4685	performance	100	9.0
35522	2022-09-05 09:53:30	4685	performance	92	-8.695652
35523	2022-09-05 09:53:40	4685	performance	91	-1.0989012
35524	2022-09-05 09:53:50	4685	performance	99	8.080808
35525	2022-09-05 09:54:00	4685	performance	100	1.0
35526	2022-09-05 09:53:00	4000	performance	94	100.0
35527	2022-09-05 09:53:10	4000	performance	100	6.0
35528	2022-09-05 09:53:20	4000	performance	100	0.0
35529	2022-09-05 09:53:30	4000	performance	97	-3.0927835
35530	2022-09-05 09:53:40	4000	performance	94	-3.1914895
35531	2022-09-05 09:53:50	4000	performance	90	-4.4444447
35532	2022-09-05 09:54:00	4000	performance	92	2.173913
35533	2022-09-05 09:53:00	4423	performance	93	100.0
35534	2022-09-05 09:53:10	4423	performance	98	5.102041
35535	2022-09-05 09:53:20	4423	performance	100	2.0
35536	2022-09-05 09:53:30	4423	performance	100	0.0
35537	2022-09-05 09:53:40	4423	performance	94	-6.382979
35538	2022-09-05 09:53:50	4423	performance	95	1.0526316
35539	2022-09-05 09:54:00	4423	performance	99	4.040404
35540	2022-09-05 09:53:00	4187	performance	90	100.0
35541	2022-09-05 09:53:10	4187	performance	98	8.163265
35542	2022-09-05 09:53:20	4187	performance	96	-2.0833335
35543	2022-09-05 09:53:30	4187	performance	99	3.030303
35544	2022-09-05 09:53:40	4187	performance	95	-4.2105265
35545	2022-09-05 09:53:50	4187	performance	94	-1.0638298
35546	2022-09-05 09:54:00	4187	performance	91	-3.2967036
35547	2022-09-05 09:53:00	4188	performance	99	100.0
35548	2022-09-05 09:53:10	4188	performance	90	-10.0
35549	2022-09-05 09:53:20	4188	performance	92	2.173913
35550	2022-09-05 09:53:30	4188	performance	93	1.0752689
35551	2022-09-05 09:53:40	4188	performance	98	5.102041
35552	2022-09-05 09:53:50	4188	performance	98	0.0
35553	2022-09-05 09:54:00	4188	performance	90	-8.888889
35554	2022-09-05 09:53:00	4686	performance	91	100.0
35555	2022-09-05 09:53:10	4686	performance	97	6.185567
35556	2022-09-05 09:53:20	4686	performance	98	1.0204082
35557	2022-09-05 09:53:30	4686	performance	97	-1.0309278
35558	2022-09-05 09:53:40	4686	performance	93	-4.3010755
35559	2022-09-05 09:53:50	4686	performance	94	1.0638298
35560	2022-09-05 09:54:00	4686	performance	91	-3.2967036
35561	2022-09-05 09:53:00	4424	performance	98	100.0
35562	2022-09-05 09:53:10	4424	performance	95	-3.1578946
35563	2022-09-05 09:53:20	4424	performance	95	0.0
35564	2022-09-05 09:53:30	4424	performance	91	-4.3956046
35565	2022-09-05 09:53:40	4424	performance	93	2.1505377
35566	2022-09-05 09:53:50	4424	performance	100	7.0
35567	2022-09-05 09:54:00	4424	performance	94	-6.382979
35568	2022-09-05 09:53:00	4425	performance	95	100.0
35569	2022-09-05 09:53:10	4425	performance	91	-4.3956046
35570	2022-09-05 09:53:20	4425	performance	95	4.2105265
35571	2022-09-05 09:53:30	4425	performance	94	-1.0638298
35572	2022-09-05 09:53:40	4425	performance	100	6.0
35573	2022-09-05 09:53:50	4425	performance	95	-5.263158
35574	2022-09-05 09:54:00	4425	performance	100	5.0
35575	2022-09-05 09:53:00	4687	performance	90	100.0
35576	2022-09-05 09:53:10	4687	performance	94	4.255319
35577	2022-09-05 09:53:20	4687	performance	97	3.0927835
35578	2022-09-05 09:53:30	4687	performance	96	-1.0416667
35579	2022-09-05 09:53:40	4687	performance	99	3.030303
35580	2022-09-05 09:53:50	4687	performance	94	-5.319149
35581	2022-09-05 09:54:00	4687	performance	96	2.0833335
35582	2022-09-05 09:53:00	4688	performance	92	100.0
35583	2022-09-05 09:53:10	4688	performance	97	5.1546392
35584	2022-09-05 09:53:20	4688	performance	98	1.0204082
35585	2022-09-05 09:53:30	4688	performance	99	1.010101
35586	2022-09-05 09:53:40	4688	performance	91	-8.791209
35587	2022-09-05 09:53:50	4688	performance	92	1.0869565
35588	2022-09-05 09:54:00	4688	performance	92	0.0
35589	2022-09-05 09:53:00	4189	performance	100	100.0
35590	2022-09-05 09:53:10	4189	performance	98	-2.0408163
35591	2022-09-05 09:53:20	4189	performance	94	-4.255319
35592	2022-09-05 09:53:30	4189	performance	90	-4.4444447
35593	2022-09-05 09:53:40	4189	performance	95	5.263158
35594	2022-09-05 09:53:50	4189	performance	95	0.0
35595	2022-09-05 09:54:00	4189	performance	97	2.0618556
35596	2022-09-05 09:53:00	4001	performance	91	100.0
35597	2022-09-05 09:53:10	4001	performance	96	5.208333
35598	2022-09-05 09:53:20	4001	performance	96	0.0
35599	2022-09-05 09:53:30	4001	performance	93	-3.2258062
35600	2022-09-05 09:53:40	4001	performance	91	-2.1978023
35601	2022-09-05 09:53:50	4001	performance	93	2.1505377
35602	2022-09-05 09:54:00	4001	performance	92	-1.0869565
35603	2022-09-05 09:53:00	4002	performance	98	100.0
35604	2022-09-05 09:53:10	4002	performance	99	1.010101
35605	2022-09-05 09:53:20	4002	performance	98	-1.0204082
35606	2022-09-05 09:53:30	4002	performance	94	-4.255319
35607	2022-09-05 09:53:40	4002	performance	91	-3.2967036
35608	2022-09-05 09:53:50	4002	performance	99	8.080808
35609	2022-09-05 09:54:00	4002	performance	93	-6.4516125
35610	2022-09-05 09:53:00	4190	performance	91	100.0
35611	2022-09-05 09:53:10	4190	performance	93	2.1505377
35612	2022-09-05 09:53:20	4190	performance	98	5.102041
35613	2022-09-05 09:53:30	4190	performance	97	-1.0309278
35614	2022-09-05 09:53:40	4190	performance	100	3.0
35615	2022-09-05 09:53:50	4190	performance	96	-4.166667
35616	2022-09-05 09:54:00	4190	performance	99	3.030303
35617	2022-09-05 09:53:00	4689	performance	99	100.0
35618	2022-09-05 09:53:10	4689	performance	96	-3.125
35619	2022-09-05 09:53:20	4689	performance	96	0.0
35620	2022-09-05 09:53:30	4689	performance	97	1.0309278
35621	2022-09-05 09:53:40	4689	performance	99	2.020202
35622	2022-09-05 09:53:50	4689	performance	95	-4.2105265
35623	2022-09-05 09:54:00	4689	performance	92	-3.2608695
35624	2022-09-05 09:53:00	4690	performance	98	100.0
35625	2022-09-05 09:53:10	4690	performance	94	-4.255319
35626	2022-09-05 09:53:20	4690	performance	97	3.0927835
35627	2022-09-05 09:53:30	4690	performance	99	2.020202
35628	2022-09-05 09:53:40	4690	performance	100	1.0
35629	2022-09-05 09:53:50	4690	performance	95	-5.263158
35630	2022-09-05 09:54:00	4690	performance	92	-3.2608695
35631	2022-09-05 09:53:00	4426	performance	94	100.0
35632	2022-09-05 09:53:10	4426	performance	98	4.0816326
35633	2022-09-05 09:53:20	4426	performance	94	-4.255319
35634	2022-09-05 09:53:30	4426	performance	96	2.0833335
35635	2022-09-05 09:53:40	4426	performance	93	-3.2258062
35636	2022-09-05 09:53:50	4426	performance	95	2.1052632
35637	2022-09-05 09:54:00	4426	performance	98	3.0612245
35638	2022-09-05 09:53:00	4427	performance	98	100.0
35639	2022-09-05 09:53:10	4427	performance	94	-4.255319
35640	2022-09-05 09:53:20	4427	performance	100	6.0
35641	2022-09-05 09:53:30	4427	performance	92	-8.695652
35642	2022-09-05 09:53:40	4427	performance	96	4.166667
35643	2022-09-05 09:53:50	4427	performance	96	0.0
35644	2022-09-05 09:54:00	4427	performance	91	-5.4945054
35645	2022-09-05 09:53:00	4691	performance	98	100.0
35646	2022-09-05 09:53:10	4691	performance	90	-8.888889
35647	2022-09-05 09:53:20	4691	performance	92	2.173913
35648	2022-09-05 09:53:30	4691	performance	94	2.1276596
35649	2022-09-05 09:53:40	4691	performance	99	5.050505
35650	2022-09-05 09:53:50	4691	performance	98	-1.0204082
35651	2022-09-05 09:54:00	4691	performance	100	2.0
35652	2022-09-05 09:53:00	4191	performance	97	100.0
35653	2022-09-05 09:53:10	4191	performance	94	-3.1914895
35654	2022-09-05 09:53:20	4191	performance	100	6.0
35655	2022-09-05 09:53:30	4191	performance	97	-3.0927835
35656	2022-09-05 09:53:40	4191	performance	95	-2.1052632
35657	2022-09-05 09:53:50	4191	performance	94	-1.0638298
35658	2022-09-05 09:54:00	4191	performance	93	-1.0752689
35659	2022-09-05 09:53:00	4192	performance	90	100.0
35660	2022-09-05 09:53:10	4192	performance	91	1.0989012
35661	2022-09-05 09:53:20	4192	performance	97	6.185567
35662	2022-09-05 09:53:30	4192	performance	93	-4.3010755
35663	2022-09-05 09:53:40	4192	performance	93	0.0
35664	2022-09-05 09:53:50	4192	performance	98	5.102041
35665	2022-09-05 09:54:00	4192	performance	95	-3.1578946
35666	2022-09-05 09:53:00	4428	performance	94	100.0
35667	2022-09-05 09:53:10	4428	performance	91	-3.2967036
35668	2022-09-05 09:53:20	4428	performance	92	1.0869565
35669	2022-09-05 09:53:30	4428	performance	91	-1.0989012
35670	2022-09-05 09:53:40	4428	performance	90	-1.1111112
35671	2022-09-05 09:53:50	4428	performance	93	3.2258062
35672	2022-09-05 09:54:00	4428	performance	94	1.0638298
35673	2022-09-05 09:53:00	4003	performance	93	100.0
35674	2022-09-05 09:53:10	4003	performance	95	2.1052632
35675	2022-09-05 09:53:20	4003	performance	97	2.0618556
35676	2022-09-05 09:53:30	4003	performance	96	-1.0416667
35677	2022-09-05 09:53:40	4003	performance	90	-6.666667
35678	2022-09-05 09:53:50	4003	performance	97	7.2164946
35679	2022-09-05 09:54:00	4003	performance	98	1.0204082
35680	2022-09-05 09:53:00	4692	performance	97	100.0
35681	2022-09-05 09:53:10	4692	performance	96	-1.0416667
35682	2022-09-05 09:53:20	4692	performance	95	-1.0526316
35683	2022-09-05 09:53:30	4692	performance	93	-2.1505377
35684	2022-09-05 09:53:40	4692	performance	93	0.0
35685	2022-09-05 09:53:50	4692	performance	97	4.123711
35686	2022-09-05 09:54:00	4692	performance	95	-2.1052632
35687	2022-09-05 09:53:00	4693	performance	96	100.0
35688	2022-09-05 09:53:10	4693	performance	92	-4.347826
35689	2022-09-05 09:53:20	4693	performance	96	4.166667
35690	2022-09-05 09:53:30	4693	performance	99	3.030303
35691	2022-09-05 09:53:40	4693	performance	90	-10.0
35692	2022-09-05 09:53:50	4693	performance	96	6.25
35693	2022-09-05 09:54:00	4693	performance	90	-6.666667
35694	2022-09-05 09:53:00	4694	performance	99	100.0
35695	2022-09-05 09:53:10	4694	performance	99	0.0
35696	2022-09-05 09:53:20	4694	performance	92	-7.6086955
35697	2022-09-05 09:53:30	4694	performance	93	1.0752689
35698	2022-09-05 09:53:40	4694	performance	94	1.0638298
35699	2022-09-05 09:53:50	4694	performance	91	-3.2967036
35700	2022-09-05 09:54:00	4694	performance	100	9.0
35701	2022-09-05 09:53:00	4004	performance	91	100.0
35702	2022-09-05 09:53:10	4004	performance	91	0.0
35703	2022-09-05 09:53:20	4004	performance	97	6.185567
35704	2022-09-05 09:53:30	4004	performance	98	1.0204082
35705	2022-09-05 09:53:40	4004	performance	100	2.0
35706	2022-09-05 09:53:50	4004	performance	96	-4.166667
35707	2022-09-05 09:54:00	4004	performance	100	4.0
35708	2022-09-05 09:53:00	4429	performance	91	100.0
35709	2022-09-05 09:53:10	4429	performance	96	5.208333
35710	2022-09-05 09:53:20	4429	performance	96	0.0
35711	2022-09-05 09:53:30	4429	performance	90	-6.666667
35712	2022-09-05 09:53:40	4429	performance	97	7.2164946
35713	2022-09-05 09:53:50	4429	performance	92	-5.4347825
35714	2022-09-05 09:54:00	4429	performance	92	0.0
35715	2022-09-05 09:53:00	4193	performance	96	100.0
35716	2022-09-05 09:53:10	4193	performance	93	-3.2258062
35717	2022-09-05 09:53:20	4193	performance	96	3.125
35718	2022-09-05 09:53:30	4193	performance	92	-4.347826
35719	2022-09-05 09:53:40	4193	performance	97	5.1546392
35720	2022-09-05 09:53:50	4193	performance	97	0.0
35721	2022-09-05 09:54:00	4193	performance	95	-2.1052632
35722	2022-09-05 09:53:00	4194	performance	90	100.0
35723	2022-09-05 09:53:10	4194	performance	97	7.2164946
35724	2022-09-05 09:53:20	4194	performance	90	-7.777778
35725	2022-09-05 09:53:30	4194	performance	93	3.2258062
35726	2022-09-05 09:53:40	4194	performance	100	7.0
35727	2022-09-05 09:53:50	4194	performance	95	-5.263158
35728	2022-09-05 09:54:00	4194	performance	94	-1.0638298
35729	2022-09-05 09:53:00	4695	performance	93	100.0
35730	2022-09-05 09:53:10	4695	performance	91	-2.1978023
35731	2022-09-05 09:53:20	4695	performance	92	1.0869565
35732	2022-09-05 09:53:30	4695	performance	100	8.0
35733	2022-09-05 09:53:40	4695	performance	91	-9.89011
35734	2022-09-05 09:53:50	4695	performance	92	1.0869565
35735	2022-09-05 09:54:00	4695	performance	93	1.0752689
35736	2022-09-05 09:53:00	4430	performance	96	100.0
35737	2022-09-05 09:53:10	4430	performance	90	-6.666667
35738	2022-09-05 09:53:20	4430	performance	92	2.173913
35739	2022-09-05 09:53:30	4430	performance	94	2.1276596
35740	2022-09-05 09:53:40	4430	performance	95	1.0526316
35741	2022-09-05 09:53:50	4430	performance	96	1.0416667
35742	2022-09-05 09:54:00	4430	performance	97	1.0309278
35743	2022-09-05 09:53:00	4431	performance	96	100.0
35744	2022-09-05 09:53:10	4431	performance	98	2.0408163
35745	2022-09-05 09:53:20	4431	performance	100	2.0
35746	2022-09-05 09:53:30	4431	performance	94	-6.382979
35747	2022-09-05 09:53:40	4431	performance	94	0.0
35748	2022-09-05 09:53:50	4431	performance	91	-3.2967036
35749	2022-09-05 09:54:00	4431	performance	93	2.1505377
35750	2022-09-05 09:53:00	4696	performance	93	100.0
35751	2022-09-05 09:53:10	4696	performance	97	4.123711
35752	2022-09-05 09:53:20	4696	performance	99	2.020202
35753	2022-09-05 09:53:30	4696	performance	92	-7.6086955
35754	2022-09-05 09:53:40	4696	performance	96	4.166667
35755	2022-09-05 09:53:50	4696	performance	98	2.0408163
35756	2022-09-05 09:54:00	4696	performance	97	-1.0309278
35757	2022-09-05 09:53:00	4697	performance	99	100.0
35758	2022-09-05 09:53:10	4697	performance	90	-10.0
35759	2022-09-05 09:53:20	4697	performance	96	6.25
35760	2022-09-05 09:53:30	4697	performance	98	2.0408163
35761	2022-09-05 09:53:40	4697	performance	97	-1.0309278
35762	2022-09-05 09:53:50	4697	performance	94	-3.1914895
35763	2022-09-05 09:54:00	4697	performance	90	-4.4444447
35764	2022-09-05 09:53:00	4195	performance	98	100.0
35765	2022-09-05 09:53:10	4195	performance	96	-2.0833335
35766	2022-09-05 09:53:20	4195	performance	94	-2.1276596
35767	2022-09-05 09:53:30	4195	performance	100	6.0
35768	2022-09-05 09:53:40	4195	performance	96	-4.166667
35769	2022-09-05 09:53:50	4195	performance	96	0.0
35770	2022-09-05 09:54:00	4195	performance	100	4.0
35771	2022-09-05 09:53:00	4005	performance	93	100.0
35772	2022-09-05 09:53:10	4005	performance	92	-1.0869565
35773	2022-09-05 09:53:20	4005	performance	100	8.0
35774	2022-09-05 09:53:30	4005	performance	90	-11.111112
35775	2022-09-05 09:53:40	4005	performance	92	2.173913
35776	2022-09-05 09:53:50	4005	performance	91	-1.0989012
35777	2022-09-05 09:54:00	4005	performance	99	8.080808
35778	2022-09-05 09:53:00	4006	performance	100	100.0
35779	2022-09-05 09:53:10	4006	performance	96	-4.166667
35780	2022-09-05 09:53:20	4006	performance	92	-4.347826
35781	2022-09-05 09:53:30	4006	performance	98	6.122449
35782	2022-09-05 09:53:40	4006	performance	96	-2.0833335
35783	2022-09-05 09:53:50	4006	performance	90	-6.666667
35784	2022-09-05 09:54:00	4006	performance	99	9.090909
35785	2022-09-05 09:53:00	4196	performance	99	100.0
35786	2022-09-05 09:53:10	4196	performance	94	-5.319149
35787	2022-09-05 09:53:20	4196	performance	92	-2.173913
35788	2022-09-05 09:53:30	4196	performance	99	7.070707
35789	2022-09-05 09:53:40	4196	performance	95	-4.2105265
35790	2022-09-05 09:53:50	4196	performance	93	-2.1505377
35791	2022-09-05 09:54:00	4196	performance	96	3.125
35792	2022-09-05 09:53:00	4698	performance	94	100.0
35793	2022-09-05 09:53:10	4698	performance	95	1.0526316
35794	2022-09-05 09:53:20	4698	performance	98	3.0612245
35795	2022-09-05 09:53:30	4698	performance	92	-6.521739
35796	2022-09-05 09:53:40	4698	performance	91	-1.0989012
35797	2022-09-05 09:53:50	4698	performance	100	9.0
35798	2022-09-05 09:54:00	4698	performance	97	-3.0927835
35799	2022-09-05 09:53:00	4699	performance	93	100.0
35800	2022-09-05 09:53:10	4699	performance	96	3.125
35801	2022-09-05 09:53:20	4699	performance	91	-5.4945054
35802	2022-09-05 09:53:30	4699	performance	96	5.208333
35803	2022-09-05 09:53:40	4699	performance	91	-5.4945054
35804	2022-09-05 09:53:50	4699	performance	94	3.1914895
35805	2022-09-05 09:54:00	4699	performance	99	5.050505
35806	2022-09-05 09:53:00	4432	performance	93	100.0
35807	2022-09-05 09:53:10	4432	performance	97	4.123711
35808	2022-09-05 09:53:20	4432	performance	97	0.0
35809	2022-09-05 09:53:30	4432	performance	92	-5.4347825
35810	2022-09-05 09:53:40	4432	performance	97	5.1546392
35811	2022-09-05 09:53:50	4432	performance	98	1.0204082
35812	2022-09-05 09:54:00	4432	performance	96	-2.0833335
35813	2022-09-05 09:53:00	4433	performance	94	100.0
35814	2022-09-05 09:53:10	4433	performance	95	1.0526316
35815	2022-09-05 09:53:20	4433	performance	97	2.0618556
35816	2022-09-05 09:53:30	4433	performance	95	-2.1052632
35817	2022-09-05 09:53:40	4433	performance	100	5.0
35818	2022-09-05 09:53:50	4433	performance	91	-9.89011
35819	2022-09-05 09:54:00	4433	performance	92	1.0869565
35820	2022-09-05 09:53:00	4700	performance	93	100.0
35821	2022-09-05 09:53:10	4700	performance	91	-2.1978023
35822	2022-09-05 09:53:20	4700	performance	92	1.0869565
35823	2022-09-05 09:53:30	4700	performance	100	8.0
35824	2022-09-05 09:53:40	4700	performance	91	-9.89011
35825	2022-09-05 09:53:50	4700	performance	98	7.1428576
35826	2022-09-05 09:54:00	4700	performance	94	-4.255319
35827	2022-09-05 09:53:00	4197	performance	95	100.0
35828	2022-09-05 09:53:10	4197	performance	90	-5.555556
35829	2022-09-05 09:53:20	4197	performance	91	1.0989012
35830	2022-09-05 09:53:30	4197	performance	91	0.0
35831	2022-09-05 09:53:40	4197	performance	93	2.1505377
35832	2022-09-05 09:53:50	4197	performance	96	3.125
35833	2022-09-05 09:54:00	4197	performance	100	4.0
35834	2022-09-05 09:53:00	4198	performance	99	100.0
35835	2022-09-05 09:53:10	4198	performance	95	-4.2105265
35836	2022-09-05 09:53:20	4198	performance	97	2.0618556
35837	2022-09-05 09:53:30	4198	performance	95	-2.1052632
35838	2022-09-05 09:53:40	4198	performance	99	4.040404
35839	2022-09-05 09:53:50	4198	performance	97	-2.0618556
35840	2022-09-05 09:54:00	4198	performance	100	3.0
35841	2022-09-05 09:53:00	4434	performance	90	100.0
35842	2022-09-05 09:53:10	4434	performance	96	6.25
35843	2022-09-05 09:53:20	4434	performance	98	2.0408163
35844	2022-09-05 09:53:30	4434	performance	91	-7.692308
35845	2022-09-05 09:53:40	4434	performance	100	9.0
35846	2022-09-05 09:53:50	4434	performance	96	-4.166667
35847	2022-09-05 09:54:00	4434	performance	94	-2.1276596
35848	2022-09-05 09:53:00	4007	performance	99	100.0
35849	2022-09-05 09:53:10	4007	performance	95	-4.2105265
35850	2022-09-05 09:53:20	4007	performance	95	0.0
35851	2022-09-05 09:53:30	4007	performance	93	-2.1505377
35852	2022-09-05 09:53:40	4007	performance	96	3.125
35853	2022-09-05 09:53:50	4007	performance	90	-6.666667
35854	2022-09-05 09:54:00	4007	performance	90	0.0
35855	2022-09-05 09:53:00	4701	performance	92	100.0
35856	2022-09-05 09:53:10	4701	performance	95	3.1578946
35857	2022-09-05 09:53:20	4701	performance	97	2.0618556
35858	2022-09-05 09:53:30	4701	performance	90	-7.777778
35859	2022-09-05 09:53:40	4701	performance	93	3.2258062
35860	2022-09-05 09:53:50	4701	performance	97	4.123711
35861	2022-09-05 09:54:00	4701	performance	92	-5.4347825
35862	2022-09-05 09:53:00	4702	performance	95	100.0
35863	2022-09-05 09:53:10	4702	performance	96	1.0416667
35864	2022-09-05 09:53:20	4702	performance	100	4.0
35865	2022-09-05 09:53:30	4702	performance	92	-8.695652
35866	2022-09-05 09:53:40	4702	performance	93	1.0752689
35867	2022-09-05 09:53:50	4702	performance	100	7.0
35868	2022-09-05 09:54:00	4702	performance	92	-8.695652
35869	2022-09-05 09:53:00	4703	performance	93	100.0
35870	2022-09-05 09:53:10	4703	performance	97	4.123711
35871	2022-09-05 09:53:20	4703	performance	96	-1.0416667
35872	2022-09-05 09:53:30	4703	performance	90	-6.666667
35873	2022-09-05 09:53:40	4703	performance	97	7.2164946
35874	2022-09-05 09:53:50	4703	performance	97	0.0
35875	2022-09-05 09:54:00	4703	performance	95	-2.1052632
35876	2022-09-05 09:53:00	4008	performance	98	100.0
35877	2022-09-05 09:53:10	4008	performance	94	-4.255319
35878	2022-09-05 09:53:20	4008	performance	99	5.050505
35879	2022-09-05 09:53:30	4008	performance	97	-2.0618556
35880	2022-09-05 09:53:40	4008	performance	98	1.0204082
35881	2022-09-05 09:53:50	4008	performance	98	0.0
35882	2022-09-05 09:54:00	4008	performance	90	-8.888889
35883	2022-09-05 09:53:00	4435	performance	99	100.0
35884	2022-09-05 09:53:10	4435	performance	90	-10.0
35885	2022-09-05 09:53:20	4435	performance	98	8.163265
35886	2022-09-05 09:53:30	4435	performance	95	-3.1578946
35887	2022-09-05 09:53:40	4435	performance	91	-4.3956046
35888	2022-09-05 09:53:50	4435	performance	95	4.2105265
35889	2022-09-05 09:54:00	4435	performance	90	-5.555556
35890	2022-09-05 09:53:00	4199	performance	98	100.0
35891	2022-09-05 09:53:10	4199	performance	93	-5.376344
35892	2022-09-05 09:53:20	4199	performance	100	7.0
35893	2022-09-05 09:53:30	4199	performance	95	-5.263158
35894	2022-09-05 09:53:40	4199	performance	95	0.0
35895	2022-09-05 09:53:50	4199	performance	90	-5.555556
35896	2022-09-05 09:54:00	4199	performance	93	3.2258062
35897	2022-09-05 09:53:00	4200	performance	93	100.0
35898	2022-09-05 09:53:10	4200	performance	93	0.0
35899	2022-09-05 09:53:20	4200	performance	98	5.102041
35900	2022-09-05 09:53:30	4200	performance	93	-5.376344
35901	2022-09-05 09:53:40	4200	performance	91	-2.1978023
35902	2022-09-05 09:53:50	4200	performance	96	5.208333
35903	2022-09-05 09:54:00	4200	performance	90	-6.666667
35904	2022-09-05 09:53:00	4704	performance	98	100.0
35905	2022-09-05 09:53:10	4704	performance	94	-4.255319
35906	2022-09-05 09:53:20	4704	performance	97	3.0927835
35907	2022-09-05 09:53:30	4704	performance	92	-5.4347825
35908	2022-09-05 09:53:40	4704	performance	92	0.0
35909	2022-09-05 09:53:50	4704	performance	98	6.122449
35910	2022-09-05 09:54:00	4704	performance	96	-2.0833335
35911	2022-09-05 09:53:00	4436	performance	95	100.0
35912	2022-09-05 09:53:10	4436	performance	94	-1.0638298
35913	2022-09-05 09:53:20	4436	performance	96	2.0833335
35914	2022-09-05 09:53:30	4436	performance	91	-5.4945054
35915	2022-09-05 09:53:40	4436	performance	94	3.1914895
35916	2022-09-05 09:53:50	4436	performance	93	-1.0752689
35917	2022-09-05 09:54:00	4436	performance	93	0.0
35918	2022-09-05 09:53:00	4437	performance	97	100.0
35919	2022-09-05 09:53:10	4437	performance	99	2.020202
35920	2022-09-05 09:53:20	4437	performance	96	-3.125
35921	2022-09-05 09:53:30	4437	performance	90	-6.666667
35922	2022-09-05 09:53:40	4437	performance	99	9.090909
35923	2022-09-05 09:53:50	4437	performance	91	-8.791209
35924	2022-09-05 09:54:00	4437	performance	90	-1.1111112
35925	2022-09-05 09:53:00	4705	performance	94	100.0
35926	2022-09-05 09:53:10	4705	performance	95	1.0526316
35927	2022-09-05 09:53:20	4705	performance	95	0.0
35928	2022-09-05 09:53:30	4705	performance	92	-3.2608695
35929	2022-09-05 09:53:40	4705	performance	97	5.1546392
35930	2022-09-05 09:53:50	4705	performance	96	-1.0416667
35931	2022-09-05 09:54:00	4705	performance	93	-3.2258062
35932	2022-09-05 09:53:00	4706	performance	99	100.0
35933	2022-09-05 09:53:10	4706	performance	90	-10.0
35934	2022-09-05 09:53:20	4706	performance	100	10.0
35935	2022-09-05 09:53:30	4706	performance	100	0.0
35936	2022-09-05 09:53:40	4706	performance	95	-5.263158
35937	2022-09-05 09:53:50	4706	performance	91	-4.3956046
35938	2022-09-05 09:54:00	4706	performance	98	7.1428576
35939	2022-09-05 09:53:00	4201	performance	96	100.0
35940	2022-09-05 09:53:10	4201	performance	96	0.0
35941	2022-09-05 09:53:20	4201	performance	90	-6.666667
35942	2022-09-05 09:53:30	4201	performance	91	1.0989012
35943	2022-09-05 09:53:40	4201	performance	94	3.1914895
35944	2022-09-05 09:53:50	4201	performance	98	4.0816326
35945	2022-09-05 09:54:00	4201	performance	97	-1.0309278
35946	2022-09-05 09:53:00	4009	performance	93	100.0
35947	2022-09-05 09:53:10	4009	performance	98	5.102041
35948	2022-09-05 09:53:20	4009	performance	98	0.0
35949	2022-09-05 09:53:30	4009	performance	95	-3.1578946
35950	2022-09-05 09:53:40	4009	performance	100	5.0
35951	2022-09-05 09:53:50	4009	performance	98	-2.0408163
35952	2022-09-05 09:54:00	4009	performance	92	-6.521739
35953	2022-09-05 09:53:00	4010	performance	99	100.0
35954	2022-09-05 09:53:10	4010	performance	96	-3.125
35955	2022-09-05 09:53:20	4010	performance	99	3.030303
35956	2022-09-05 09:53:30	4010	performance	100	1.0
35957	2022-09-05 09:53:40	4010	performance	90	-11.111112
35958	2022-09-05 09:53:50	4010	performance	96	6.25
35959	2022-09-05 09:54:00	4010	performance	96	0.0
35960	2022-09-05 09:53:00	4202	performance	99	100.0
35961	2022-09-05 09:53:10	4202	performance	95	-4.2105265
35962	2022-09-05 09:53:20	4202	performance	93	-2.1505377
35963	2022-09-05 09:53:30	4202	performance	95	2.1052632
35964	2022-09-05 09:53:40	4202	performance	97	2.0618556
35965	2022-09-05 09:53:50	4202	performance	99	2.020202
35966	2022-09-05 09:54:00	4202	performance	99	0.0
35967	2022-09-05 09:53:00	4707	performance	92	100.0
35968	2022-09-05 09:53:10	4707	performance	96	4.166667
35969	2022-09-05 09:53:20	4707	performance	94	-2.1276596
35970	2022-09-05 09:53:30	4707	performance	95	1.0526316
35971	2022-09-05 09:53:40	4707	performance	93	-2.1505377
35972	2022-09-05 09:53:50	4707	performance	100	7.0
35973	2022-09-05 09:54:00	4707	performance	100	0.0
35974	2022-09-05 09:53:00	4708	performance	100	100.0
35975	2022-09-05 09:53:10	4708	performance	93	-7.526882
35976	2022-09-05 09:53:20	4708	performance	93	0.0
35977	2022-09-05 09:53:30	4708	performance	99	6.060606
35978	2022-09-05 09:53:40	4708	performance	93	-6.4516125
35979	2022-09-05 09:53:50	4708	performance	97	4.123711
35980	2022-09-05 09:54:00	4708	performance	95	-2.1052632
35981	2022-09-05 09:53:00	4438	performance	99	100.0
35982	2022-09-05 09:53:10	4438	performance	92	-7.6086955
35983	2022-09-05 09:53:20	4438	performance	100	8.0
35984	2022-09-05 09:53:30	4438	performance	96	-4.166667
35985	2022-09-05 09:53:40	4438	performance	91	-5.4945054
35986	2022-09-05 09:53:50	4438	performance	96	5.208333
35987	2022-09-05 09:54:00	4438	performance	99	3.030303
35988	2022-09-05 09:53:00	4439	performance	96	100.0
35989	2022-09-05 09:53:10	4439	performance	95	-1.0526316
35990	2022-09-05 09:53:20	4439	performance	92	-3.2608695
35991	2022-09-05 09:53:30	4439	performance	90	-2.2222223
35992	2022-09-05 09:53:40	4439	performance	91	1.0989012
35993	2022-09-05 09:53:50	4439	performance	99	8.080808
35994	2022-09-05 09:54:00	4439	performance	94	-5.319149
35995	2022-09-05 09:53:00	4709	performance	95	100.0
35996	2022-09-05 09:53:10	4709	performance	96	1.0416667
35997	2022-09-05 09:53:20	4709	performance	95	-1.0526316
35998	2022-09-05 09:53:30	4709	performance	96	1.0416667
35999	2022-09-05 09:53:40	4709	performance	96	0.0
36000	2022-09-05 09:53:50	4709	performance	98	2.0408163
36001	2022-09-05 09:54:00	4709	performance	100	2.0
36002	2022-09-05 09:53:00	4203	performance	92	100.0
36003	2022-09-05 09:53:10	4203	performance	94	2.1276596
36004	2022-09-05 09:53:20	4203	performance	97	3.0927835
36005	2022-09-05 09:53:30	4203	performance	90	-7.777778
36006	2022-09-05 09:53:40	4203	performance	92	2.173913
36007	2022-09-05 09:53:50	4203	performance	90	-2.2222223
36008	2022-09-05 09:54:00	4203	performance	90	0.0
36009	2022-09-05 09:53:00	4204	performance	91	100.0
36010	2022-09-05 09:53:10	4204	performance	91	0.0
36011	2022-09-05 09:53:20	4204	performance	95	4.2105265
36012	2022-09-05 09:53:30	4204	performance	95	0.0
36013	2022-09-05 09:53:40	4204	performance	92	-3.2608695
36014	2022-09-05 09:53:50	4204	performance	94	2.1276596
36015	2022-09-05 09:54:00	4204	performance	97	3.0927835
36016	2022-09-05 09:53:00	4440	performance	93	100.0
36017	2022-09-05 09:53:10	4440	performance	93	0.0
36018	2022-09-05 09:53:20	4440	performance	100	7.0
36019	2022-09-05 09:53:30	4440	performance	92	-8.695652
36020	2022-09-05 09:53:40	4440	performance	92	0.0
36021	2022-09-05 09:53:50	4440	performance	90	-2.2222223
36022	2022-09-05 09:54:00	4440	performance	100	10.0
36023	2022-09-05 09:53:00	4011	performance	100	100.0
36024	2022-09-05 09:53:10	4011	performance	95	-5.263158
36025	2022-09-05 09:53:20	4011	performance	99	4.040404
36026	2022-09-05 09:53:30	4011	performance	96	-3.125
36027	2022-09-05 09:53:40	4011	performance	100	4.0
36028	2022-09-05 09:53:50	4011	performance	98	-2.0408163
36029	2022-09-05 09:54:00	4011	performance	98	0.0
36030	2022-09-05 09:53:00	4710	performance	92	100.0
36031	2022-09-05 09:53:10	4710	performance	97	5.1546392
36032	2022-09-05 09:53:20	4710	performance	98	1.0204082
36033	2022-09-05 09:53:30	4710	performance	94	-4.255319
36034	2022-09-05 09:53:40	4710	performance	95	1.0526316
36035	2022-09-05 09:53:50	4710	performance	97	2.0618556
36036	2022-09-05 09:54:00	4710	performance	90	-7.777778
36037	2022-09-05 09:53:00	4711	performance	91	100.0
36038	2022-09-05 09:53:10	4711	performance	98	7.1428576
36039	2022-09-05 09:53:20	4711	performance	96	-2.0833335
36040	2022-09-05 09:53:30	4711	performance	93	-3.2258062
36041	2022-09-05 09:53:40	4711	performance	95	2.1052632
36042	2022-09-05 09:53:50	4711	performance	100	5.0
36043	2022-09-05 09:54:00	4711	performance	99	-1.010101
36044	2022-09-05 09:53:00	4712	performance	97	100.0
36045	2022-09-05 09:53:10	4712	performance	93	-4.3010755
36046	2022-09-05 09:53:20	4712	performance	99	6.060606
36047	2022-09-05 09:53:30	4712	performance	90	-10.0
36048	2022-09-05 09:53:40	4712	performance	93	3.2258062
36049	2022-09-05 09:53:50	4712	performance	100	7.0
36050	2022-09-05 09:54:00	4712	performance	91	-9.89011
36051	2022-09-05 09:53:00	4012	performance	100	100.0
36052	2022-09-05 09:53:10	4012	performance	98	-2.0408163
36053	2022-09-05 09:53:20	4012	performance	98	0.0
36054	2022-09-05 09:53:30	4012	performance	95	-3.1578946
36055	2022-09-05 09:53:40	4012	performance	92	-3.2608695
36056	2022-09-05 09:53:50	4012	performance	100	8.0
36057	2022-09-05 09:54:00	4012	performance	95	-5.263158
36058	2022-09-05 09:53:00	4441	performance	97	100.0
36059	2022-09-05 09:53:10	4441	performance	99	2.020202
36060	2022-09-05 09:53:20	4441	performance	97	-2.0618556
36061	2022-09-05 09:53:30	4441	performance	97	0.0
36062	2022-09-05 09:53:40	4441	performance	95	-2.1052632
36063	2022-09-05 09:53:50	4441	performance	90	-5.555556
36064	2022-09-05 09:54:00	4441	performance	92	2.173913
36065	2022-09-05 09:53:00	4205	performance	93	100.0
36066	2022-09-05 09:53:10	4205	performance	92	-1.0869565
36067	2022-09-05 09:53:20	4205	performance	99	7.070707
36068	2022-09-05 09:53:30	4205	performance	92	-7.6086955
36069	2022-09-05 09:53:40	4205	performance	98	6.122449
36070	2022-09-05 09:53:50	4205	performance	90	-8.888889
36071	2022-09-05 09:54:00	4205	performance	94	4.255319
36072	2022-09-05 09:53:00	4206	performance	98	100.0
36073	2022-09-05 09:53:10	4206	performance	90	-8.888889
36074	2022-09-05 09:53:20	4206	performance	95	5.263158
36075	2022-09-05 09:53:30	4206	performance	90	-5.555556
36076	2022-09-05 09:53:40	4206	performance	96	6.25
36077	2022-09-05 09:53:50	4206	performance	96	0.0
36078	2022-09-05 09:54:00	4206	performance	99	3.030303
36079	2022-09-05 09:53:00	4713	performance	90	100.0
36080	2022-09-05 09:53:10	4713	performance	91	1.0989012
36081	2022-09-05 09:53:20	4713	performance	100	9.0
36082	2022-09-05 09:53:30	4713	performance	100	0.0
36083	2022-09-05 09:53:40	4713	performance	90	-11.111112
36084	2022-09-05 09:53:50	4713	performance	93	3.2258062
36085	2022-09-05 09:54:00	4713	performance	98	5.102041
36086	2022-09-05 09:53:00	4442	performance	93	100.0
36087	2022-09-05 09:53:10	4442	performance	100	7.0
36088	2022-09-05 09:53:20	4442	performance	98	-2.0408163
36089	2022-09-05 09:53:30	4442	performance	92	-6.521739
36090	2022-09-05 09:53:40	4442	performance	99	7.070707
36091	2022-09-05 09:53:50	4442	performance	92	-7.6086955
36092	2022-09-05 09:54:00	4442	performance	98	6.122449
36093	2022-09-05 09:53:00	4443	performance	94	100.0
36094	2022-09-05 09:53:10	4443	performance	98	4.0816326
36095	2022-09-05 09:53:20	4443	performance	98	0.0
36096	2022-09-05 09:53:30	4443	performance	93	-5.376344
36097	2022-09-05 09:53:40	4443	performance	93	0.0
36098	2022-09-05 09:53:50	4443	performance	93	0.0
36099	2022-09-05 09:54:00	4443	performance	94	1.0638298
36100	2022-09-05 09:53:00	4714	performance	100	100.0
36101	2022-09-05 09:53:10	4714	performance	90	-11.111112
36102	2022-09-05 09:53:20	4714	performance	93	3.2258062
36103	2022-09-05 09:53:30	4714	performance	91	-2.1978023
36104	2022-09-05 09:53:40	4714	performance	91	0.0
36105	2022-09-05 09:53:50	4714	performance	96	5.208333
36106	2022-09-05 09:54:00	4714	performance	98	2.0408163
36107	2022-09-05 09:53:00	4715	performance	94	100.0
36108	2022-09-05 09:53:10	4715	performance	98	4.0816326
36109	2022-09-05 09:53:20	4715	performance	99	1.010101
36110	2022-09-05 09:53:30	4715	performance	91	-8.791209
36111	2022-09-05 09:53:40	4715	performance	90	-1.1111112
36112	2022-09-05 09:53:50	4715	performance	90	0.0
36113	2022-09-05 09:54:00	4715	performance	95	5.263158
36114	2022-09-05 09:53:00	4207	performance	100	100.0
36115	2022-09-05 09:53:10	4207	performance	98	-2.0408163
36116	2022-09-05 09:53:20	4207	performance	98	0.0
36117	2022-09-05 09:53:30	4207	performance	100	2.0
36118	2022-09-05 09:53:40	4207	performance	94	-6.382979
36119	2022-09-05 09:53:50	4207	performance	90	-4.4444447
36120	2022-09-05 09:54:00	4207	performance	96	6.25
36121	2022-09-05 09:53:00	4013	performance	91	100.0
36122	2022-09-05 09:53:10	4013	performance	91	0.0
36123	2022-09-05 09:53:20	4013	performance	95	4.2105265
36124	2022-09-05 09:53:30	4013	performance	95	0.0
36125	2022-09-05 09:53:40	4013	performance	90	-5.555556
36126	2022-09-05 09:53:50	4013	performance	97	7.2164946
36127	2022-09-05 09:54:00	4013	performance	90	-7.777778
36128	2022-09-05 09:53:00	4014	performance	100	100.0
36129	2022-09-05 09:53:10	4014	performance	94	-6.382979
36130	2022-09-05 09:53:20	4014	performance	90	-4.4444447
36131	2022-09-05 09:53:30	4014	performance	91	1.0989012
36132	2022-09-05 09:53:40	4014	performance	92	1.0869565
36133	2022-09-05 09:53:50	4014	performance	96	4.166667
36134	2022-09-05 09:54:00	4014	performance	98	2.0408163
36135	2022-09-05 09:53:00	4208	performance	96	100.0
36136	2022-09-05 09:53:10	4208	performance	90	-6.666667
36137	2022-09-05 09:53:20	4208	performance	99	9.090909
36138	2022-09-05 09:53:30	4208	performance	100	1.0
36139	2022-09-05 09:53:40	4208	performance	93	-7.526882
36140	2022-09-05 09:53:50	4208	performance	95	2.1052632
36141	2022-09-05 09:54:00	4208	performance	92	-3.2608695
36142	2022-09-05 09:53:00	4716	performance	94	100.0
36143	2022-09-05 09:53:10	4716	performance	91	-3.2967036
36144	2022-09-05 09:53:20	4716	performance	98	7.1428576
36145	2022-09-05 09:53:30	4716	performance	92	-6.521739
36146	2022-09-05 09:53:40	4716	performance	97	5.1546392
36147	2022-09-05 09:53:50	4716	performance	91	-6.593407
36148	2022-09-05 09:54:00	4716	performance	93	2.1505377
36149	2022-09-05 09:53:00	4717	performance	96	100.0
36150	2022-09-05 09:53:10	4717	performance	93	-3.2258062
36151	2022-09-05 09:53:20	4717	performance	96	3.125
36152	2022-09-05 09:53:30	4717	performance	96	0.0
36153	2022-09-05 09:53:40	4717	performance	91	-5.4945054
36154	2022-09-05 09:53:50	4717	performance	93	2.1505377
36155	2022-09-05 09:54:00	4717	performance	99	6.060606
36156	2022-09-05 09:53:00	4444	performance	96	100.0
36157	2022-09-05 09:53:10	4444	performance	97	1.0309278
36158	2022-09-05 09:53:20	4444	performance	98	1.0204082
36159	2022-09-05 09:53:30	4444	performance	92	-6.521739
36160	2022-09-05 09:53:40	4444	performance	99	7.070707
36161	2022-09-05 09:53:50	4444	performance	95	-4.2105265
36162	2022-09-05 09:54:00	4444	performance	100	5.0
36163	2022-09-05 09:53:00	4445	performance	99	100.0
36164	2022-09-05 09:53:10	4445	performance	92	-7.6086955
36165	2022-09-05 09:53:20	4445	performance	94	2.1276596
36166	2022-09-05 09:53:30	4445	performance	95	1.0526316
36167	2022-09-05 09:53:40	4445	performance	93	-2.1505377
36168	2022-09-05 09:53:50	4445	performance	96	3.125
36169	2022-09-05 09:54:00	4445	performance	92	-4.347826
36170	2022-09-05 09:53:00	4718	performance	96	100.0
36171	2022-09-05 09:53:10	4718	performance	93	-3.2258062
36172	2022-09-05 09:53:20	4718	performance	92	-1.0869565
36173	2022-09-05 09:53:30	4718	performance	94	2.1276596
36174	2022-09-05 09:53:40	4718	performance	93	-1.0752689
36175	2022-09-05 09:53:50	4718	performance	94	1.0638298
36176	2022-09-05 09:54:00	4718	performance	100	6.0
36177	2022-09-05 09:53:00	4209	performance	100	100.0
36178	2022-09-05 09:53:10	4209	performance	100	0.0
36179	2022-09-05 09:53:20	4209	performance	98	-2.0408163
36180	2022-09-05 09:53:30	4209	performance	96	-2.0833335
36181	2022-09-05 09:53:40	4209	performance	100	4.0
36182	2022-09-05 09:53:50	4209	performance	92	-8.695652
36183	2022-09-05 09:54:00	4209	performance	91	-1.0989012
36184	2022-09-05 09:53:00	4210	performance	92	100.0
36185	2022-09-05 09:53:10	4210	performance	92	0.0
36186	2022-09-05 09:53:20	4210	performance	91	-1.0989012
36187	2022-09-05 09:53:30	4210	performance	96	5.208333
36188	2022-09-05 09:53:40	4210	performance	92	-4.347826
36189	2022-09-05 09:53:50	4210	performance	100	8.0
36190	2022-09-05 09:54:00	4210	performance	96	-4.166667
36191	2022-09-05 09:53:00	4446	performance	98	100.0
36192	2022-09-05 09:53:10	4446	performance	100	2.0
36193	2022-09-05 09:53:20	4446	performance	97	-3.0927835
36194	2022-09-05 09:53:30	4446	performance	92	-5.4347825
36195	2022-09-05 09:53:40	4446	performance	96	4.166667
36196	2022-09-05 09:53:50	4446	performance	98	2.0408163
36197	2022-09-05 09:54:00	4446	performance	95	-3.1578946
36198	2022-09-05 09:53:00	4015	performance	90	100.0
36199	2022-09-05 09:53:10	4015	performance	93	3.2258062
36200	2022-09-05 09:53:20	4015	performance	95	2.1052632
36201	2022-09-05 09:53:30	4015	performance	91	-4.3956046
36202	2022-09-05 09:53:40	4015	performance	91	0.0
36203	2022-09-05 09:53:50	4015	performance	100	9.0
36204	2022-09-05 09:54:00	4015	performance	91	-9.89011
36205	2022-09-05 09:53:00	4719	performance	96	100.0
36206	2022-09-05 09:53:10	4719	performance	99	3.030303
36207	2022-09-05 09:53:20	4719	performance	100	1.0
36208	2022-09-05 09:53:30	4719	performance	96	-4.166667
36209	2022-09-05 09:53:40	4719	performance	96	0.0
36210	2022-09-05 09:53:50	4719	performance	93	-3.2258062
36211	2022-09-05 09:54:00	4719	performance	95	2.1052632
36212	2022-09-05 09:53:00	4720	performance	91	100.0
36213	2022-09-05 09:53:10	4720	performance	90	-1.1111112
36214	2022-09-05 09:53:20	4720	performance	96	6.25
36215	2022-09-05 09:53:30	4720	performance	90	-6.666667
36216	2022-09-05 09:53:40	4720	performance	96	6.25
36217	2022-09-05 09:53:50	4720	performance	96	0.0
36218	2022-09-05 09:54:00	4720	performance	99	3.030303
36219	2022-09-05 09:53:00	4721	performance	90	100.0
36220	2022-09-05 09:53:10	4721	performance	95	5.263158
36221	2022-09-05 09:53:20	4721	performance	96	1.0416667
36222	2022-09-05 09:53:30	4721	performance	97	1.0309278
36223	2022-09-05 09:53:40	4721	performance	96	-1.0416667
36224	2022-09-05 09:53:50	4721	performance	93	-3.2258062
36225	2022-09-05 09:54:00	4721	performance	93	0.0
36226	2022-09-05 09:53:00	4016	performance	98	100.0
36227	2022-09-05 09:53:10	4016	performance	92	-6.521739
36228	2022-09-05 09:53:20	4016	performance	94	2.1276596
36229	2022-09-05 09:53:30	4016	performance	92	-2.173913
36230	2022-09-05 09:53:40	4016	performance	100	8.0
36231	2022-09-05 09:53:50	4016	performance	100	0.0
36232	2022-09-05 09:54:00	4016	performance	94	-6.382979
36233	2022-09-05 09:53:00	4447	performance	92	100.0
36234	2022-09-05 09:53:10	4447	performance	97	5.1546392
36235	2022-09-05 09:53:20	4447	performance	99	2.020202
36236	2022-09-05 09:53:30	4447	performance	100	1.0
36237	2022-09-05 09:53:40	4447	performance	96	-4.166667
36238	2022-09-05 09:53:50	4447	performance	93	-3.2258062
36239	2022-09-05 09:54:00	4447	performance	96	3.125
36240	2022-09-05 09:53:00	4211	performance	95	100.0
36241	2022-09-05 09:53:10	4211	performance	94	-1.0638298
36242	2022-09-05 09:53:20	4211	performance	92	-2.173913
36243	2022-09-05 09:53:30	4211	performance	92	0.0
36244	2022-09-05 09:53:40	4211	performance	99	7.070707
36245	2022-09-05 09:53:50	4211	performance	95	-4.2105265
36246	2022-09-05 09:54:00	4211	performance	90	-5.555556
36247	2022-09-05 09:53:00	4212	performance	95	100.0
36248	2022-09-05 09:53:10	4212	performance	100	5.0
36249	2022-09-05 09:53:20	4212	performance	96	-4.166667
36250	2022-09-05 09:53:30	4212	performance	92	-4.347826
36251	2022-09-05 09:53:40	4212	performance	94	2.1276596
36252	2022-09-05 09:53:50	4212	performance	99	5.050505
36253	2022-09-05 09:54:00	4212	performance	97	-2.0618556
36254	2022-09-05 09:53:00	4722	performance	99	100.0
36255	2022-09-05 09:53:10	4722	performance	94	-5.319149
36256	2022-09-05 09:53:20	4722	performance	92	-2.173913
36257	2022-09-05 09:53:30	4722	performance	99	7.070707
36258	2022-09-05 09:53:40	4722	performance	99	0.0
36259	2022-09-05 09:53:50	4722	performance	98	-1.0204082
36260	2022-09-05 09:54:00	4722	performance	94	-4.255319
36261	2022-09-05 09:53:00	4448	performance	100	100.0
36262	2022-09-05 09:53:10	4448	performance	90	-11.111112
36263	2022-09-05 09:53:20	4448	performance	96	6.25
36264	2022-09-05 09:53:30	4448	performance	100	4.0
36265	2022-09-05 09:53:40	4448	performance	94	-6.382979
36266	2022-09-05 09:53:50	4448	performance	91	-3.2967036
36267	2022-09-05 09:54:00	4448	performance	95	4.2105265
36268	2022-09-05 09:53:00	4449	performance	100	100.0
36269	2022-09-05 09:53:10	4449	performance	100	0.0
36270	2022-09-05 09:53:20	4449	performance	92	-8.695652
36271	2022-09-05 09:53:30	4449	performance	99	7.070707
36272	2022-09-05 09:53:40	4449	performance	90	-10.0
36273	2022-09-05 09:53:50	4449	performance	93	3.2258062
36274	2022-09-05 09:54:00	4449	performance	99	6.060606
36275	2022-09-05 09:53:00	4723	performance	92	100.0
36276	2022-09-05 09:53:10	4723	performance	93	1.0752689
36277	2022-09-05 09:53:20	4723	performance	93	0.0
36278	2022-09-05 09:53:30	4723	performance	96	3.125
36279	2022-09-05 09:53:40	4723	performance	92	-4.347826
36280	2022-09-05 09:53:50	4723	performance	95	3.1578946
36281	2022-09-05 09:54:00	4723	performance	91	-4.3956046
36282	2022-09-05 09:53:00	4724	performance	92	100.0
36283	2022-09-05 09:53:10	4724	performance	94	2.1276596
36284	2022-09-05 09:53:20	4724	performance	91	-3.2967036
36285	2022-09-05 09:53:30	4724	performance	96	5.208333
36286	2022-09-05 09:53:40	4724	performance	93	-3.2258062
36287	2022-09-05 09:53:50	4724	performance	91	-2.1978023
36288	2022-09-05 09:54:00	4724	performance	98	7.1428576
36289	2022-09-05 09:53:00	4213	performance	100	100.0
36290	2022-09-05 09:53:10	4213	performance	98	-2.0408163
36291	2022-09-05 09:53:20	4213	performance	96	-2.0833335
36292	2022-09-05 09:53:30	4213	performance	97	1.0309278
36293	2022-09-05 09:53:40	4213	performance	92	-5.4347825
36294	2022-09-05 09:53:50	4213	performance	100	8.0
36295	2022-09-05 09:54:00	4213	performance	94	-6.382979
36296	2022-09-05 09:53:00	4017	performance	95	100.0
36297	2022-09-05 09:53:10	4017	performance	92	-3.2608695
36298	2022-09-05 09:53:20	4017	performance	92	0.0
36299	2022-09-05 09:53:30	4017	performance	98	6.122449
36300	2022-09-05 09:53:40	4017	performance	97	-1.0309278
36301	2022-09-05 09:53:50	4017	performance	96	-1.0416667
36302	2022-09-05 09:54:00	4017	performance	91	-5.4945054
36303	2022-09-05 09:53:00	4018	performance	93	100.0
36304	2022-09-05 09:53:10	4018	performance	95	2.1052632
36305	2022-09-05 09:53:20	4018	performance	93	-2.1505377
36306	2022-09-05 09:53:30	4018	performance	95	2.1052632
36307	2022-09-05 09:53:40	4018	performance	95	0.0
36308	2022-09-05 09:53:50	4018	performance	100	5.0
36309	2022-09-05 09:54:00	4018	performance	100	0.0
36310	2022-09-05 09:53:00	4214	performance	91	100.0
36311	2022-09-05 09:53:10	4214	performance	90	-1.1111112
36312	2022-09-05 09:53:20	4214	performance	94	4.255319
36313	2022-09-05 09:53:30	4214	performance	98	4.0816326
36314	2022-09-05 09:53:40	4214	performance	100	2.0
36315	2022-09-05 09:53:50	4214	performance	100	0.0
36316	2022-09-05 09:54:00	4214	performance	98	-2.0408163
36317	2022-09-05 09:53:00	4725	performance	99	100.0
36318	2022-09-05 09:53:10	4725	performance	95	-4.2105265
36319	2022-09-05 09:53:20	4725	performance	91	-4.3956046
36320	2022-09-05 09:53:30	4725	performance	93	2.1505377
36321	2022-09-05 09:53:40	4725	performance	98	5.102041
36322	2022-09-05 09:53:50	4725	performance	91	-7.692308
36323	2022-09-05 09:54:00	4725	performance	92	1.0869565
36324	2022-09-05 09:53:00	4726	performance	98	100.0
36325	2022-09-05 09:53:10	4726	performance	94	-4.255319
36326	2022-09-05 09:53:20	4726	performance	93	-1.0752689
36327	2022-09-05 09:53:30	4726	performance	92	-1.0869565
36328	2022-09-05 09:53:40	4726	performance	91	-1.0989012
36329	2022-09-05 09:53:50	4726	performance	99	8.080808
36330	2022-09-05 09:54:00	4726	performance	95	-4.2105265
36331	2022-09-05 09:53:00	4020	performance	100	100.0
36332	2022-09-05 09:53:10	4020	performance	100	0.0
36333	2022-09-05 09:53:20	4020	performance	90	-11.111112
36334	2022-09-05 09:53:30	4020	performance	96	6.25
36335	2022-09-05 09:53:40	4020	performance	96	0.0
36336	2022-09-05 09:53:50	4020	performance	92	-4.347826
36337	2022-09-05 09:54:00	4020	performance	99	7.070707
36338	2022-09-05 09:53:00	4453	performance	98	100.0
36339	2022-09-05 09:53:10	4453	performance	97	-1.0309278
36340	2022-09-05 09:53:20	4453	performance	92	-5.4347825
36341	2022-09-05 09:53:30	4453	performance	97	5.1546392
36342	2022-09-05 09:53:40	4453	performance	94	-3.1914895
36343	2022-09-05 09:53:50	4453	performance	100	6.0
36344	2022-09-05 09:54:00	4453	performance	92	-8.695652
36345	2022-09-05 09:53:00	4450	performance	90	100.0
36346	2022-09-05 09:53:10	4450	performance	93	3.2258062
36347	2022-09-05 09:53:20	4450	performance	98	5.102041
36348	2022-09-05 09:53:30	4450	performance	100	2.0
36349	2022-09-05 09:53:40	4450	performance	93	-7.526882
36350	2022-09-05 09:53:50	4450	performance	100	7.0
36351	2022-09-05 09:54:00	4450	performance	91	-9.89011
36352	2022-09-05 09:53:00	4451	performance	100	100.0
36353	2022-09-05 09:53:10	4451	performance	97	-3.0927835
36354	2022-09-05 09:53:20	4451	performance	91	-6.593407
36355	2022-09-05 09:53:30	4451	performance	96	5.208333
36356	2022-09-05 09:53:40	4451	performance	98	2.0408163
36357	2022-09-05 09:53:50	4451	performance	96	-2.0833335
36358	2022-09-05 09:54:00	4451	performance	91	-5.4945054
36359	2022-09-05 09:53:00	4217	performance	97	100.0
36360	2022-09-05 09:53:10	4217	performance	90	-7.777778
36361	2022-09-05 09:53:20	4217	performance	90	0.0
36362	2022-09-05 09:53:30	4217	performance	94	4.255319
36363	2022-09-05 09:53:40	4217	performance	100	6.0
36364	2022-09-05 09:53:50	4217	performance	99	-1.010101
36365	2022-09-05 09:54:00	4217	performance	97	-2.0618556
36366	2022-09-05 09:53:00	4218	performance	94	100.0
36367	2022-09-05 09:53:10	4218	performance	97	3.0927835
36368	2022-09-05 09:53:20	4218	performance	97	0.0
36369	2022-09-05 09:53:30	4218	performance	93	-4.3010755
36370	2022-09-05 09:53:40	4218	performance	91	-2.1978023
36371	2022-09-05 09:53:50	4218	performance	96	5.208333
36372	2022-09-05 09:54:00	4218	performance	98	2.0408163
36373	2022-09-05 09:53:00	4731	performance	91	100.0
36374	2022-09-05 09:53:10	4731	performance	91	0.0
36375	2022-09-05 09:53:20	4731	performance	94	3.1914895
36376	2022-09-05 09:53:30	4731	performance	98	4.0816326
36377	2022-09-05 09:53:40	4731	performance	94	-4.255319
36378	2022-09-05 09:53:50	4731	performance	99	5.050505
36379	2022-09-05 09:54:00	4731	performance	95	-4.2105265
36380	2022-09-05 09:53:00	4727	performance	97	100.0
36381	2022-09-05 09:53:10	4727	performance	100	3.0
36382	2022-09-05 09:53:20	4727	performance	96	-4.166667
36383	2022-09-05 09:53:30	4727	performance	98	2.0408163
36384	2022-09-05 09:53:40	4727	performance	94	-4.255319
36385	2022-09-05 09:53:50	4727	performance	96	2.0833335
36386	2022-09-05 09:54:00	4727	performance	95	-1.0526316
36387	2022-09-05 09:53:00	4215	performance	92	100.0
36388	2022-09-05 09:53:10	4215	performance	94	2.1276596
36389	2022-09-05 09:53:20	4215	performance	93	-1.0752689
36390	2022-09-05 09:53:30	4215	performance	94	1.0638298
36391	2022-09-05 09:53:40	4215	performance	98	4.0816326
36392	2022-09-05 09:53:50	4215	performance	98	0.0
36393	2022-09-05 09:54:00	4215	performance	92	-6.521739
36394	2022-09-05 09:53:00	4454	performance	96	100.0
36395	2022-09-05 09:53:10	4454	performance	92	-4.347826
36396	2022-09-05 09:53:20	4454	performance	98	6.122449
36397	2022-09-05 09:53:30	4454	performance	96	-2.0833335
36398	2022-09-05 09:53:40	4454	performance	98	2.0408163
36399	2022-09-05 09:53:50	4454	performance	94	-4.255319
36400	2022-09-05 09:54:00	4454	performance	94	0.0
36401	2022-09-05 09:53:00	4379	performance	93	100.0
36402	2022-09-05 09:53:10	4379	performance	97	4.123711
36403	2022-09-05 09:53:20	4379	performance	94	-3.1914895
36404	2022-09-05 09:53:30	4379	performance	93	-1.0752689
36405	2022-09-05 09:53:40	4379	performance	96	3.125
36406	2022-09-05 09:53:50	4379	performance	94	-2.1276596
36407	2022-09-05 09:54:00	4379	performance	99	5.050505
36408	2022-09-05 09:53:00	3984	performance	95	100.0
36409	2022-09-05 09:53:10	3984	performance	90	-5.555556
36410	2022-09-05 09:53:20	3984	performance	96	6.25
36411	2022-09-05 09:53:30	3984	performance	92	-4.347826
36412	2022-09-05 09:53:40	3984	performance	97	5.1546392
36413	2022-09-05 09:53:50	3984	performance	100	3.0
36414	2022-09-05 09:54:00	3984	performance	96	-4.166667
36415	2022-09-05 09:53:00	3951	performance	94	100.0
36416	2022-09-05 09:53:10	3951	performance	94	0.0
36417	2022-09-05 09:53:20	3951	performance	94	0.0
36418	2022-09-05 09:53:30	3951	performance	94	0.0
36419	2022-09-05 09:53:40	3951	performance	98	4.0816326
36420	2022-09-05 09:53:50	3951	performance	98	0.0
36421	2022-09-05 09:54:00	3951	performance	96	-2.0833335
36422	2022-09-05 09:53:00	4116	performance	94	100.0
36423	2022-09-05 09:53:10	4116	performance	99	5.050505
36424	2022-09-05 09:53:20	4116	performance	92	-7.6086955
36425	2022-09-05 09:53:30	4116	performance	90	-2.2222223
36426	2022-09-05 09:53:40	4116	performance	99	9.090909
36427	2022-09-05 09:53:50	4116	performance	91	-8.791209
36428	2022-09-05 09:54:00	4116	performance	93	2.1505377
36429	2022-09-05 09:53:00	4455	performance	93	100.0
36430	2022-09-05 09:53:10	4455	performance	98	5.102041
36431	2022-09-05 09:53:20	4455	performance	90	-8.888889
36432	2022-09-05 09:53:30	4455	performance	91	1.0989012
36433	2022-09-05 09:53:40	4455	performance	92	1.0869565
36434	2022-09-05 09:53:50	4455	performance	100	8.0
36435	2022-09-05 09:54:00	4455	performance	100	0.0
36436	2022-09-05 09:53:00	4732	performance	98	100.0
36437	2022-09-05 09:53:10	4732	performance	91	-7.692308
36438	2022-09-05 09:53:20	4732	performance	93	2.1505377
36439	2022-09-05 09:53:30	4732	performance	94	1.0638298
36440	2022-09-05 09:53:40	4732	performance	96	2.0833335
36441	2022-09-05 09:53:50	4732	performance	96	0.0
36442	2022-09-05 09:54:00	4732	performance	91	-5.4945054
36443	2022-09-05 09:53:00	4733	performance	94	100.0
36444	2022-09-05 09:53:10	4733	performance	98	4.0816326
36445	2022-09-05 09:53:20	4733	performance	95	-3.1578946
36446	2022-09-05 09:53:30	4733	performance	99	4.040404
36447	2022-09-05 09:53:40	4733	performance	92	-7.6086955
36448	2022-09-05 09:53:50	4733	performance	94	2.1276596
36449	2022-09-05 09:54:00	4733	performance	97	3.0927835
36450	2022-09-05 09:53:00	4219	performance	97	100.0
36451	2022-09-05 09:53:10	4219	performance	95	-2.1052632
36452	2022-09-05 09:53:20	4219	performance	97	2.0618556
36453	2022-09-05 09:53:30	4219	performance	93	-4.3010755
36454	2022-09-05 09:53:40	4219	performance	97	4.123711
36455	2022-09-05 09:53:50	4219	performance	90	-7.777778
36456	2022-09-05 09:54:00	4219	performance	90	0.0
36457	2022-09-05 09:53:00	4021	performance	98	100.0
36458	2022-09-05 09:53:10	4021	performance	95	-3.1578946
36459	2022-09-05 09:53:20	4021	performance	97	2.0618556
36460	2022-09-05 09:53:30	4021	performance	90	-7.777778
36461	2022-09-05 09:53:40	4021	performance	98	8.163265
36462	2022-09-05 09:53:50	4021	performance	97	-1.0309278
36463	2022-09-05 09:54:00	4021	performance	100	3.0
36464	2022-09-05 09:53:00	4022	performance	95	100.0
36465	2022-09-05 09:53:10	4022	performance	98	3.0612245
36466	2022-09-05 09:53:20	4022	performance	97	-1.0309278
36467	2022-09-05 09:53:30	4022	performance	92	-5.4347825
36468	2022-09-05 09:53:40	4022	performance	94	2.1276596
36469	2022-09-05 09:53:50	4022	performance	90	-4.4444447
36470	2022-09-05 09:54:00	4022	performance	98	8.163265
36471	2022-09-05 09:53:00	4220	performance	90	100.0
36472	2022-09-05 09:53:10	4220	performance	100	10.0
36473	2022-09-05 09:53:20	4220	performance	99	-1.010101
36474	2022-09-05 09:53:30	4220	performance	97	-2.0618556
36475	2022-09-05 09:53:40	4220	performance	93	-4.3010755
36476	2022-09-05 09:53:50	4220	performance	90	-3.3333335
36477	2022-09-05 09:54:00	4220	performance	92	2.173913
36478	2022-09-05 09:53:00	4734	performance	97	100.0
36479	2022-09-05 09:53:10	4734	performance	91	-6.593407
36480	2022-09-05 09:53:20	4734	performance	97	6.185567
36481	2022-09-05 09:53:30	4734	performance	93	-4.3010755
36482	2022-09-05 09:53:40	4734	performance	94	1.0638298
36483	2022-09-05 09:53:50	4734	performance	96	2.0833335
36484	2022-09-05 09:54:00	4734	performance	96	0.0
36485	2022-09-05 09:53:00	4735	performance	95	100.0
36486	2022-09-05 09:53:10	4735	performance	93	-2.1505377
36487	2022-09-05 09:53:20	4735	performance	97	4.123711
36488	2022-09-05 09:53:30	4735	performance	97	0.0
36489	2022-09-05 09:53:40	4735	performance	91	-6.593407
36490	2022-09-05 09:53:50	4735	performance	90	-1.1111112
36491	2022-09-05 09:54:00	4735	performance	99	9.090909
36492	2022-09-05 09:53:00	4456	performance	96	100.0
36493	2022-09-05 09:53:10	4456	performance	96	0.0
36494	2022-09-05 09:53:20	4456	performance	91	-5.4945054
36495	2022-09-05 09:53:30	4456	performance	95	4.2105265
36496	2022-09-05 09:53:40	4456	performance	95	0.0
36497	2022-09-05 09:53:50	4456	performance	99	4.040404
36498	2022-09-05 09:54:00	4456	performance	97	-2.0618556
36499	2022-09-05 09:53:00	4457	performance	95	100.0
36500	2022-09-05 09:53:10	4457	performance	90	-5.555556
36501	2022-09-05 09:53:20	4457	performance	93	3.2258062
36502	2022-09-05 09:53:30	4457	performance	94	1.0638298
36503	2022-09-05 09:53:40	4457	performance	98	4.0816326
36504	2022-09-05 09:53:50	4457	performance	94	-4.255319
36505	2022-09-05 09:54:00	4457	performance	94	0.0
36506	2022-09-05 09:53:00	4736	performance	94	100.0
36507	2022-09-05 09:53:10	4736	performance	99	5.050505
36508	2022-09-05 09:53:20	4736	performance	94	-5.319149
36509	2022-09-05 09:53:30	4736	performance	100	6.0
36510	2022-09-05 09:53:40	4736	performance	96	-4.166667
36511	2022-09-05 09:53:50	4736	performance	95	-1.0526316
36512	2022-09-05 09:54:00	4736	performance	97	2.0618556
36513	2022-09-05 09:53:00	4221	performance	94	100.0
36514	2022-09-05 09:53:10	4221	performance	95	1.0526316
36515	2022-09-05 09:53:20	4221	performance	91	-4.3956046
36516	2022-09-05 09:53:30	4221	performance	97	6.185567
36517	2022-09-05 09:53:40	4221	performance	100	3.0
36518	2022-09-05 09:53:50	4221	performance	93	-7.526882
36519	2022-09-05 09:54:00	4221	performance	98	5.102041
36520	2022-09-05 09:53:00	4222	performance	92	100.0
36521	2022-09-05 09:53:10	4222	performance	92	0.0
36522	2022-09-05 09:53:20	4222	performance	93	1.0752689
36523	2022-09-05 09:53:30	4222	performance	92	-1.0869565
36524	2022-09-05 09:53:40	4222	performance	96	4.166667
36525	2022-09-05 09:53:50	4222	performance	93	-3.2258062
36526	2022-09-05 09:54:00	4222	performance	95	2.1052632
36527	2022-09-05 09:53:00	4458	performance	94	100.0
36528	2022-09-05 09:53:10	4458	performance	93	-1.0752689
36529	2022-09-05 09:53:20	4458	performance	95	2.1052632
36530	2022-09-05 09:53:30	4458	performance	93	-2.1505377
36531	2022-09-05 09:53:40	4458	performance	93	0.0
36532	2022-09-05 09:53:50	4458	performance	99	6.060606
36533	2022-09-05 09:54:00	4458	performance	90	-10.0
36534	2022-09-05 09:53:00	4023	performance	97	100.0
36535	2022-09-05 09:53:10	4023	performance	96	-1.0416667
36536	2022-09-05 09:53:20	4023	performance	98	2.0408163
36537	2022-09-05 09:53:30	4023	performance	94	-4.255319
36538	2022-09-05 09:53:40	4023	performance	93	-1.0752689
36539	2022-09-05 09:53:50	4023	performance	97	4.123711
36540	2022-09-05 09:54:00	4023	performance	94	-3.1914895
36541	2022-09-05 09:53:00	4737	performance	99	100.0
36542	2022-09-05 09:53:10	4737	performance	91	-8.791209
36543	2022-09-05 09:53:20	4737	performance	95	4.2105265
36544	2022-09-05 09:53:30	4737	performance	91	-4.3956046
36545	2022-09-05 09:53:40	4737	performance	100	9.0
36546	2022-09-05 09:53:50	4737	performance	93	-7.526882
36547	2022-09-05 09:54:00	4737	performance	100	7.0
36548	2022-09-05 09:53:00	4738	performance	93	100.0
36549	2022-09-05 09:53:10	4738	performance	99	6.060606
36550	2022-09-05 09:53:20	4738	performance	92	-7.6086955
36551	2022-09-05 09:53:30	4738	performance	91	-1.0989012
36552	2022-09-05 09:53:40	4738	performance	92	1.0869565
36553	2022-09-05 09:53:50	4738	performance	91	-1.0989012
36554	2022-09-05 09:54:00	4738	performance	96	5.208333
36555	2022-09-05 09:53:00	4739	performance	99	100.0
36556	2022-09-05 09:53:10	4739	performance	93	-6.4516125
36557	2022-09-05 09:53:20	4739	performance	94	1.0638298
36558	2022-09-05 09:53:30	4739	performance	93	-1.0752689
36559	2022-09-05 09:53:40	4739	performance	93	0.0
36560	2022-09-05 09:53:50	4739	performance	98	5.102041
36561	2022-09-05 09:54:00	4739	performance	97	-1.0309278
36562	2022-09-05 09:53:00	4024	performance	94	100.0
36563	2022-09-05 09:53:10	4024	performance	90	-4.4444447
36564	2022-09-05 09:53:20	4024	performance	95	5.263158
36565	2022-09-05 09:53:30	4024	performance	90	-5.555556
36566	2022-09-05 09:53:40	4024	performance	96	6.25
36567	2022-09-05 09:53:50	4024	performance	94	-2.1276596
36568	2022-09-05 09:54:00	4024	performance	98	4.0816326
36569	2022-09-05 09:53:00	4459	performance	100	100.0
36570	2022-09-05 09:53:10	4459	performance	100	0.0
36571	2022-09-05 09:53:20	4459	performance	93	-7.526882
36572	2022-09-05 09:53:30	4459	performance	95	2.1052632
36573	2022-09-05 09:53:40	4459	performance	100	5.0
36574	2022-09-05 09:53:50	4459	performance	93	-7.526882
36575	2022-09-05 09:54:00	4459	performance	99	6.060606
36576	2022-09-05 09:53:00	4223	performance	100	100.0
36577	2022-09-05 09:53:10	4223	performance	96	-4.166667
36578	2022-09-05 09:53:20	4223	performance	91	-5.4945054
36579	2022-09-05 09:53:30	4223	performance	100	9.0
36580	2022-09-05 09:53:40	4223	performance	98	-2.0408163
36581	2022-09-05 09:53:50	4223	performance	98	0.0
36582	2022-09-05 09:54:00	4223	performance	91	-7.692308
36583	2022-09-05 09:53:00	4224	performance	94	100.0
36584	2022-09-05 09:53:10	4224	performance	96	2.0833335
36585	2022-09-05 09:53:20	4224	performance	91	-5.4945054
36586	2022-09-05 09:53:30	4224	performance	98	7.1428576
36587	2022-09-05 09:53:40	4224	performance	95	-3.1578946
36588	2022-09-05 09:53:50	4224	performance	92	-3.2608695
36589	2022-09-05 09:54:00	4224	performance	97	5.1546392
36590	2022-09-05 09:53:00	4740	performance	94	100.0
36591	2022-09-05 09:53:10	4740	performance	98	4.0816326
36592	2022-09-05 09:53:20	4740	performance	95	-3.1578946
36593	2022-09-05 09:53:30	4740	performance	91	-4.3956046
36594	2022-09-05 09:53:40	4740	performance	96	5.208333
36595	2022-09-05 09:53:50	4740	performance	93	-3.2258062
36596	2022-09-05 09:54:00	4740	performance	98	5.102041
36597	2022-09-05 09:53:00	4460	performance	90	100.0
36598	2022-09-05 09:53:10	4460	performance	95	5.263158
36599	2022-09-05 09:53:20	4460	performance	98	3.0612245
36600	2022-09-05 09:53:30	4460	performance	100	2.0
36601	2022-09-05 09:53:40	4460	performance	100	0.0
36602	2022-09-05 09:53:50	4460	performance	92	-8.695652
36603	2022-09-05 09:54:00	4460	performance	96	4.166667
36604	2022-09-05 09:53:00	4461	performance	90	100.0
36605	2022-09-05 09:53:10	4461	performance	92	2.173913
36606	2022-09-05 09:53:20	4461	performance	92	0.0
36607	2022-09-05 09:53:30	4461	performance	92	0.0
36608	2022-09-05 09:53:40	4461	performance	100	8.0
36609	2022-09-05 09:53:50	4461	performance	94	-6.382979
36610	2022-09-05 09:54:00	4461	performance	92	-2.173913
36611	2022-09-05 09:53:00	4741	performance	98	100.0
36612	2022-09-05 09:53:10	4741	performance	100	2.0
36613	2022-09-05 09:53:20	4741	performance	100	0.0
36614	2022-09-05 09:53:30	4741	performance	97	-3.0927835
36615	2022-09-05 09:53:40	4741	performance	92	-5.4347825
36616	2022-09-05 09:53:50	4741	performance	96	4.166667
36617	2022-09-05 09:54:00	4741	performance	98	2.0408163
36618	2022-09-05 09:53:00	4742	performance	91	100.0
36619	2022-09-05 09:53:10	4742	performance	94	3.1914895
36620	2022-09-05 09:53:20	4742	performance	97	3.0927835
36621	2022-09-05 09:53:30	4742	performance	93	-4.3010755
36622	2022-09-05 09:53:40	4742	performance	91	-2.1978023
36623	2022-09-05 09:53:50	4742	performance	90	-1.1111112
36624	2022-09-05 09:54:00	4742	performance	98	8.163265
36625	2022-09-05 09:53:00	4225	performance	96	100.0
36626	2022-09-05 09:53:10	4225	performance	96	0.0
36627	2022-09-05 09:53:20	4225	performance	93	-3.2258062
36628	2022-09-05 09:53:30	4225	performance	95	2.1052632
36629	2022-09-05 09:53:40	4225	performance	97	2.0618556
36630	2022-09-05 09:53:50	4225	performance	96	-1.0416667
36631	2022-09-05 09:54:00	4225	performance	92	-4.347826
36632	2022-09-05 09:53:00	4025	performance	94	100.0
36633	2022-09-05 09:53:10	4025	performance	92	-2.173913
36634	2022-09-05 09:53:20	4025	performance	90	-2.2222223
36635	2022-09-05 09:53:30	4025	performance	92	2.173913
36636	2022-09-05 09:53:40	4025	performance	96	4.166667
36637	2022-09-05 09:53:50	4025	performance	91	-5.4945054
36638	2022-09-05 09:54:00	4025	performance	91	0.0
36639	2022-09-05 09:53:00	4026	performance	93	100.0
36640	2022-09-05 09:53:10	4026	performance	92	-1.0869565
36641	2022-09-05 09:53:20	4026	performance	91	-1.0989012
36642	2022-09-05 09:53:30	4026	performance	94	3.1914895
36643	2022-09-05 09:53:40	4026	performance	93	-1.0752689
36644	2022-09-05 09:53:50	4026	performance	100	7.0
36645	2022-09-05 09:54:00	4026	performance	91	-9.89011
36646	2022-09-05 09:53:00	4226	performance	92	100.0
36647	2022-09-05 09:53:10	4226	performance	94	2.1276596
36648	2022-09-05 09:53:20	4226	performance	98	4.0816326
36649	2022-09-05 09:53:30	4226	performance	91	-7.692308
36650	2022-09-05 09:53:40	4226	performance	100	9.0
36651	2022-09-05 09:53:50	4226	performance	94	-6.382979
36652	2022-09-05 09:54:00	4226	performance	99	5.050505
36653	2022-09-05 09:53:00	4743	performance	97	100.0
36654	2022-09-05 09:53:10	4743	performance	99	2.020202
36655	2022-09-05 09:53:20	4743	performance	90	-10.0
36656	2022-09-05 09:53:30	4743	performance	98	8.163265
36657	2022-09-05 09:53:40	4743	performance	98	0.0
36658	2022-09-05 09:53:50	4743	performance	90	-8.888889
36659	2022-09-05 09:54:00	4743	performance	98	8.163265
36660	2022-09-05 09:53:00	4744	performance	94	100.0
36661	2022-09-05 09:53:10	4744	performance	98	4.0816326
36662	2022-09-05 09:53:20	4744	performance	97	-1.0309278
36663	2022-09-05 09:53:30	4744	performance	93	-4.3010755
36664	2022-09-05 09:53:40	4744	performance	98	5.102041
36665	2022-09-05 09:53:50	4744	performance	97	-1.0309278
36666	2022-09-05 09:54:00	4744	performance	91	-6.593407
36667	2022-09-05 09:53:00	4462	performance	98	100.0
36668	2022-09-05 09:53:10	4462	performance	100	2.0
36669	2022-09-05 09:53:20	4462	performance	94	-6.382979
36670	2022-09-05 09:53:30	4462	performance	96	2.0833335
36671	2022-09-05 09:53:40	4462	performance	95	-1.0526316
36672	2022-09-05 09:53:50	4462	performance	99	4.040404
36673	2022-09-05 09:54:00	4462	performance	97	-2.0618556
36674	2022-09-05 09:53:00	4463	performance	93	100.0
36675	2022-09-05 09:53:10	4463	performance	97	4.123711
36676	2022-09-05 09:53:20	4463	performance	90	-7.777778
36677	2022-09-05 09:53:30	4463	performance	95	5.263158
36678	2022-09-05 09:53:40	4463	performance	97	2.0618556
36679	2022-09-05 09:53:50	4463	performance	98	1.0204082
36680	2022-09-05 09:54:00	4463	performance	94	-4.255319
36681	2022-09-05 09:53:00	4745	performance	98	100.0
36682	2022-09-05 09:53:10	4745	performance	93	-5.376344
36683	2022-09-05 09:53:20	4745	performance	97	4.123711
36684	2022-09-05 09:53:30	4745	performance	93	-4.3010755
36685	2022-09-05 09:53:40	4745	performance	90	-3.3333335
36686	2022-09-05 09:53:50	4745	performance	98	8.163265
36687	2022-09-05 09:54:00	4745	performance	96	-2.0833335
36688	2022-09-05 09:53:00	4227	performance	92	100.0
36689	2022-09-05 09:53:10	4227	performance	99	7.070707
36690	2022-09-05 09:53:20	4227	performance	97	-2.0618556
36691	2022-09-05 09:53:30	4227	performance	98	1.0204082
36692	2022-09-05 09:53:40	4227	performance	95	-3.1578946
36693	2022-09-05 09:53:50	4227	performance	100	5.0
36694	2022-09-05 09:54:00	4227	performance	99	-1.010101
36695	2022-09-05 09:53:00	4228	performance	95	100.0
36696	2022-09-05 09:53:10	4228	performance	95	0.0
36697	2022-09-05 09:53:20	4228	performance	95	0.0
36698	2022-09-05 09:53:30	4228	performance	91	-4.3956046
36699	2022-09-05 09:53:40	4228	performance	96	5.208333
36700	2022-09-05 09:53:50	4228	performance	91	-5.4945054
36701	2022-09-05 09:54:00	4228	performance	90	-1.1111112
36702	2022-09-05 09:53:00	4464	performance	100	100.0
36703	2022-09-05 09:53:10	4464	performance	92	-8.695652
36704	2022-09-05 09:53:20	4464	performance	94	2.1276596
36705	2022-09-05 09:53:30	4464	performance	97	3.0927835
36706	2022-09-05 09:53:40	4464	performance	98	1.0204082
36707	2022-09-05 09:53:50	4464	performance	98	0.0
36708	2022-09-05 09:54:00	4464	performance	100	2.0
36709	2022-09-05 09:53:00	4027	performance	100	100.0
36710	2022-09-05 09:53:10	4027	performance	97	-3.0927835
36711	2022-09-05 09:53:20	4027	performance	100	3.0
36712	2022-09-05 09:53:30	4027	performance	94	-6.382979
36713	2022-09-05 09:53:40	4027	performance	92	-2.173913
36714	2022-09-05 09:53:50	4027	performance	97	5.1546392
36715	2022-09-05 09:54:00	4027	performance	90	-7.777778
36716	2022-09-05 09:53:00	4028	performance	93	100.0
36717	2022-09-05 09:53:10	4028	performance	95	2.1052632
36718	2022-09-05 09:53:20	4028	performance	93	-2.1505377
36719	2022-09-05 09:53:30	4028	performance	99	6.060606
36720	2022-09-05 09:53:40	4028	performance	93	-6.4516125
36721	2022-09-05 09:53:50	4028	performance	95	2.1052632
36722	2022-09-05 09:54:00	4028	performance	97	2.0618556
36723	2022-09-05 09:53:00	4466	performance	99	100.0
36724	2022-09-05 09:53:10	4466	performance	96	-3.125
36725	2022-09-05 09:53:20	4466	performance	92	-4.347826
36726	2022-09-05 09:53:30	4466	performance	92	0.0
36727	2022-09-05 09:53:40	4466	performance	94	2.1276596
36728	2022-09-05 09:53:50	4466	performance	99	5.050505
36729	2022-09-05 09:54:00	4466	performance	100	1.0
36730	2022-09-05 09:53:00	4467	performance	100	100.0
36731	2022-09-05 09:53:10	4467	performance	98	-2.0408163
36732	2022-09-05 09:53:20	4467	performance	93	-5.376344
36733	2022-09-05 09:53:30	4467	performance	99	6.060606
36734	2022-09-05 09:53:40	4467	performance	100	1.0
36735	2022-09-05 09:53:50	4467	performance	92	-8.695652
36736	2022-09-05 09:54:00	4467	performance	92	0.0
36737	2022-09-05 09:53:00	4029	performance	98	100.0
36738	2022-09-05 09:53:10	4029	performance	97	-1.0309278
36739	2022-09-05 09:53:20	4029	performance	92	-5.4347825
36740	2022-09-05 09:53:30	4029	performance	92	0.0
36741	2022-09-05 09:53:40	4029	performance	92	0.0
36742	2022-09-05 09:53:50	4029	performance	95	3.1578946
36743	2022-09-05 09:54:00	4029	performance	98	3.0612245
36744	2022-09-05 09:53:00	4746	performance	97	100.0
36745	2022-09-05 09:53:10	4746	performance	97	0.0
36746	2022-09-05 09:53:20	4746	performance	92	-5.4347825
36747	2022-09-05 09:53:30	4746	performance	96	4.166667
36748	2022-09-05 09:53:40	4746	performance	100	4.0
36749	2022-09-05 09:53:50	4746	performance	98	-2.0408163
36750	2022-09-05 09:54:00	4746	performance	95	-3.1578946
36751	2022-09-05 09:53:00	4030	performance	98	100.0
36752	2022-09-05 09:53:10	4030	performance	98	0.0
36753	2022-09-05 09:53:20	4030	performance	98	0.0
36754	2022-09-05 09:53:30	4030	performance	95	-3.1578946
36755	2022-09-05 09:53:40	4030	performance	90	-5.555556
36756	2022-09-05 09:53:50	4030	performance	96	6.25
36757	2022-09-05 09:54:00	4030	performance	91	-5.4945054
36758	2022-09-05 09:53:00	4468	performance	100	100.0
36759	2022-09-05 09:53:10	4468	performance	90	-11.111112
36760	2022-09-05 09:53:20	4468	performance	99	9.090909
36761	2022-09-05 09:53:30	4468	performance	92	-7.6086955
36762	2022-09-05 09:53:40	4468	performance	98	6.122449
36763	2022-09-05 09:53:50	4468	performance	95	-3.1578946
36764	2022-09-05 09:54:00	4468	performance	96	1.0416667
36765	2022-09-05 09:53:00	4747	performance	99	100.0
36766	2022-09-05 09:53:10	4747	performance	93	-6.4516125
36767	2022-09-05 09:53:20	4747	performance	99	6.060606
36768	2022-09-05 09:53:30	4747	performance	90	-10.0
36769	2022-09-05 09:53:40	4747	performance	96	6.25
36770	2022-09-05 09:53:50	4747	performance	95	-1.0526316
36771	2022-09-05 09:54:00	4747	performance	95	0.0
36772	2022-09-05 09:53:00	4748	performance	98	100.0
36773	2022-09-05 09:53:10	4748	performance	100	2.0
36774	2022-09-05 09:53:20	4748	performance	97	-3.0927835
36775	2022-09-05 09:53:30	4748	performance	100	3.0
36776	2022-09-05 09:53:40	4748	performance	97	-3.0927835
36777	2022-09-05 09:53:50	4748	performance	98	1.0204082
36778	2022-09-05 09:54:00	4748	performance	92	-6.521739
36779	2022-09-05 09:53:00	4229	performance	100	100.0
36780	2022-09-05 09:53:10	4229	performance	94	-6.382979
36781	2022-09-05 09:53:20	4229	performance	92	-2.173913
36782	2022-09-05 09:53:30	4229	performance	96	4.166667
36783	2022-09-05 09:53:40	4229	performance	94	-2.1276596
36784	2022-09-05 09:53:50	4229	performance	91	-3.2967036
36785	2022-09-05 09:54:00	4229	performance	92	1.0869565
36786	2022-09-05 09:53:00	4469	performance	92	100.0
36787	2022-09-05 09:53:10	4469	performance	99	7.070707
36788	2022-09-05 09:53:20	4469	performance	97	-2.0618556
36789	2022-09-05 09:53:30	4469	performance	95	-2.1052632
36790	2022-09-05 09:53:40	4469	performance	94	-1.0638298
36791	2022-09-05 09:53:50	4469	performance	91	-3.2967036
36792	2022-09-05 09:54:00	4469	performance	92	1.0869565
36793	2022-09-05 09:53:00	4470	performance	93	100.0
36794	2022-09-05 09:53:10	4470	performance	98	5.102041
36795	2022-09-05 09:53:20	4470	performance	96	-2.0833335
36796	2022-09-05 09:53:30	4470	performance	100	4.0
36797	2022-09-05 09:53:40	4470	performance	100	0.0
36798	2022-09-05 09:53:50	4470	performance	94	-6.382979
36799	2022-09-05 09:54:00	4470	performance	91	-3.2967036
36800	2022-09-05 09:53:00	4230	performance	96	100.0
36801	2022-09-05 09:53:10	4230	performance	98	2.0408163
36802	2022-09-05 09:53:20	4230	performance	99	1.010101
36803	2022-09-05 09:53:30	4230	performance	96	-3.125
36804	2022-09-05 09:53:40	4230	performance	99	3.030303
36805	2022-09-05 09:53:50	4230	performance	90	-10.0
36806	2022-09-05 09:54:00	4230	performance	98	8.163265
36807	2022-09-05 09:53:00	4749	performance	90	100.0
36808	2022-09-05 09:53:10	4749	performance	91	1.0989012
36809	2022-09-05 09:53:20	4749	performance	100	9.0
36810	2022-09-05 09:53:30	4749	performance	98	-2.0408163
36811	2022-09-05 09:53:40	4749	performance	96	-2.0833335
36812	2022-09-05 09:53:50	4749	performance	96	0.0
36813	2022-09-05 09:54:00	4749	performance	97	1.0309278
36814	2022-09-05 09:53:00	4750	performance	93	100.0
36815	2022-09-05 09:53:10	4750	performance	95	2.1052632
36816	2022-09-05 09:53:20	4750	performance	97	2.0618556
36817	2022-09-05 09:53:30	4750	performance	91	-6.593407
36818	2022-09-05 09:53:40	4750	performance	90	-1.1111112
36819	2022-09-05 09:53:50	4750	performance	90	0.0
36820	2022-09-05 09:54:00	4750	performance	98	8.163265
36821	2022-09-05 09:53:00	4031	performance	97	100.0
36822	2022-09-05 09:53:10	4031	performance	96	-1.0416667
36823	2022-09-05 09:53:20	4031	performance	98	2.0408163
36824	2022-09-05 09:53:30	4031	performance	99	1.010101
36825	2022-09-05 09:53:40	4031	performance	98	-1.0204082
36826	2022-09-05 09:53:50	4031	performance	97	-1.0309278
36827	2022-09-05 09:54:00	4031	performance	91	-6.593407
36828	2022-09-05 09:53:00	4032	performance	95	100.0
36829	2022-09-05 09:53:10	4032	performance	97	2.0618556
36830	2022-09-05 09:53:20	4032	performance	94	-3.1914895
36831	2022-09-05 09:53:30	4032	performance	97	3.0927835
36832	2022-09-05 09:53:40	4032	performance	90	-7.777778
36833	2022-09-05 09:53:50	4032	performance	93	3.2258062
36834	2022-09-05 09:54:00	4032	performance	90	-3.3333335
36835	2022-09-05 09:53:00	4751	performance	92	100.0
36836	2022-09-05 09:53:10	4751	performance	94	2.1276596
36837	2022-09-05 09:53:20	4751	performance	99	5.050505
36838	2022-09-05 09:53:30	4751	performance	96	-3.125
36839	2022-09-05 09:53:40	4751	performance	99	3.030303
36840	2022-09-05 09:53:50	4751	performance	100	1.0
36841	2022-09-05 09:54:00	4751	performance	91	-9.89011
36842	2022-09-05 09:53:00	4231	performance	97	100.0
36843	2022-09-05 09:53:10	4231	performance	96	-1.0416667
36844	2022-09-05 09:53:20	4231	performance	94	-2.1276596
36845	2022-09-05 09:53:30	4231	performance	93	-1.0752689
36846	2022-09-05 09:53:40	4231	performance	99	6.060606
36847	2022-09-05 09:53:50	4231	performance	99	0.0
36848	2022-09-05 09:54:00	4231	performance	93	-6.4516125
36849	2022-09-05 09:53:00	4232	performance	100	100.0
36850	2022-09-05 09:53:10	4232	performance	94	-6.382979
36851	2022-09-05 09:53:20	4232	performance	90	-4.4444447
36852	2022-09-05 09:53:30	4232	performance	98	8.163265
36853	2022-09-05 09:53:40	4232	performance	99	1.010101
36854	2022-09-05 09:53:50	4232	performance	91	-8.791209
36855	2022-09-05 09:54:00	4232	performance	96	5.208333
36856	2022-09-05 09:53:00	4471	performance	96	100.0
36857	2022-09-05 09:53:10	4471	performance	99	3.030303
36858	2022-09-05 09:53:20	4471	performance	96	-3.125
36859	2022-09-05 09:53:30	4471	performance	99	3.030303
36860	2022-09-05 09:53:40	4471	performance	99	0.0
36861	2022-09-05 09:53:50	4471	performance	100	1.0
36862	2022-09-05 09:54:00	4471	performance	92	-8.695652
36863	2022-09-05 09:53:00	4472	performance	95	100.0
36864	2022-09-05 09:53:10	4472	performance	99	4.040404
36865	2022-09-05 09:53:20	4472	performance	98	-1.0204082
36866	2022-09-05 09:53:30	4472	performance	93	-5.376344
36867	2022-09-05 09:53:40	4472	performance	96	3.125
36868	2022-09-05 09:53:50	4472	performance	90	-6.666667
36869	2022-09-05 09:54:00	4472	performance	98	8.163265
36870	2022-09-05 09:53:00	4752	performance	91	100.0
36871	2022-09-05 09:53:10	4752	performance	90	-1.1111112
36872	2022-09-05 09:53:20	4752	performance	96	6.25
36873	2022-09-05 09:53:30	4752	performance	96	0.0
36874	2022-09-05 09:53:40	4752	performance	92	-4.347826
36875	2022-09-05 09:53:50	4752	performance	92	0.0
36876	2022-09-05 09:54:00	4752	performance	92	0.0
36877	2022-09-05 09:53:00	4753	performance	94	100.0
36878	2022-09-05 09:53:10	4753	performance	97	3.0927835
36879	2022-09-05 09:53:20	4753	performance	92	-5.4347825
36880	2022-09-05 09:53:30	4753	performance	96	4.166667
36881	2022-09-05 09:53:40	4753	performance	96	0.0
36882	2022-09-05 09:53:50	4753	performance	99	3.030303
36883	2022-09-05 09:54:00	4753	performance	93	-6.4516125
36884	2022-09-05 09:53:00	4754	performance	97	100.0
36885	2022-09-05 09:53:10	4754	performance	91	-6.593407
36886	2022-09-05 09:53:20	4754	performance	99	8.080808
36887	2022-09-05 09:53:30	4754	performance	93	-6.4516125
36888	2022-09-05 09:53:40	4754	performance	96	3.125
36889	2022-09-05 09:53:50	4754	performance	91	-5.4945054
36890	2022-09-05 09:54:00	4754	performance	95	4.2105265
36891	2022-09-05 09:53:00	4473	performance	91	100.0
36892	2022-09-05 09:53:10	4473	performance	96	5.208333
36893	2022-09-05 09:53:20	4473	performance	96	0.0
36894	2022-09-05 09:53:30	4473	performance	95	-1.0526316
36895	2022-09-05 09:53:40	4473	performance	95	0.0
36896	2022-09-05 09:53:50	4473	performance	98	3.0612245
36897	2022-09-05 09:54:00	4473	performance	94	-4.255319
36898	2022-09-05 09:53:00	4033	performance	94	100.0
36899	2022-09-05 09:53:10	4033	performance	99	5.050505
36900	2022-09-05 09:53:20	4033	performance	92	-7.6086955
36901	2022-09-05 09:53:30	4033	performance	94	2.1276596
36902	2022-09-05 09:53:40	4033	performance	99	5.050505
36903	2022-09-05 09:53:50	4033	performance	90	-10.0
36904	2022-09-05 09:54:00	4033	performance	100	10.0
36905	2022-09-05 09:53:00	4233	performance	91	100.0
36906	2022-09-05 09:53:10	4233	performance	95	4.2105265
36907	2022-09-05 09:53:20	4233	performance	91	-4.3956046
36908	2022-09-05 09:53:30	4233	performance	91	0.0
36909	2022-09-05 09:53:40	4233	performance	100	9.0
36910	2022-09-05 09:53:50	4233	performance	99	-1.010101
36911	2022-09-05 09:54:00	4233	performance	99	0.0
36912	2022-09-05 09:53:00	4234	performance	99	100.0
36913	2022-09-05 09:53:10	4234	performance	95	-4.2105265
36914	2022-09-05 09:53:20	4234	performance	99	4.040404
36915	2022-09-05 09:53:30	4234	performance	91	-8.791209
36916	2022-09-05 09:53:40	4234	performance	94	3.1914895
36917	2022-09-05 09:53:50	4234	performance	92	-2.173913
36918	2022-09-05 09:54:00	4234	performance	100	8.0
36919	2022-09-05 09:53:00	4755	performance	90	100.0
36920	2022-09-05 09:53:10	4755	performance	95	5.263158
36921	2022-09-05 09:53:20	4755	performance	96	1.0416667
36922	2022-09-05 09:53:30	4755	performance	98	2.0408163
36923	2022-09-05 09:53:40	4755	performance	92	-6.521739
36924	2022-09-05 09:53:50	4755	performance	94	2.1276596
36925	2022-09-05 09:54:00	4755	performance	100	6.0
36926	2022-09-05 09:53:00	4034	performance	92	100.0
36927	2022-09-05 09:53:10	4034	performance	93	1.0752689
36928	2022-09-05 09:53:20	4034	performance	97	4.123711
36929	2022-09-05 09:53:30	4034	performance	93	-4.3010755
36930	2022-09-05 09:53:40	4034	performance	91	-2.1978023
36931	2022-09-05 09:53:50	4034	performance	96	5.208333
36932	2022-09-05 09:54:00	4034	performance	97	1.0309278
36933	2022-09-05 09:53:00	4474	performance	91	100.0
36934	2022-09-05 09:53:10	4474	performance	97	6.185567
36935	2022-09-05 09:53:20	4474	performance	95	-2.1052632
36936	2022-09-05 09:53:30	4474	performance	91	-4.3956046
36937	2022-09-05 09:53:40	4474	performance	95	4.2105265
36938	2022-09-05 09:53:50	4474	performance	96	1.0416667
36939	2022-09-05 09:54:00	4474	performance	97	1.0309278
36940	2022-09-05 09:53:00	4756	performance	91	100.0
36941	2022-09-05 09:53:10	4756	performance	90	-1.1111112
36942	2022-09-05 09:53:20	4756	performance	97	7.2164946
36943	2022-09-05 09:53:30	4756	performance	91	-6.593407
36944	2022-09-05 09:53:40	4756	performance	94	3.1914895
36945	2022-09-05 09:53:50	4756	performance	92	-2.173913
36946	2022-09-05 09:54:00	4756	performance	98	6.122449
36947	2022-09-05 09:53:00	4757	performance	90	100.0
36948	2022-09-05 09:53:10	4757	performance	96	6.25
36949	2022-09-05 09:53:20	4757	performance	91	-5.4945054
36950	2022-09-05 09:53:30	4757	performance	96	5.208333
36951	2022-09-05 09:53:40	4757	performance	91	-5.4945054
36952	2022-09-05 09:53:50	4757	performance	97	6.185567
36953	2022-09-05 09:54:00	4757	performance	91	-6.593407
36954	2022-09-05 09:53:00	4235	performance	93	100.0
36955	2022-09-05 09:53:10	4235	performance	93	0.0
36956	2022-09-05 09:53:20	4235	performance	92	-1.0869565
36957	2022-09-05 09:53:30	4235	performance	100	8.0
36958	2022-09-05 09:53:40	4235	performance	98	-2.0408163
36959	2022-09-05 09:53:50	4235	performance	97	-1.0309278
36960	2022-09-05 09:54:00	4235	performance	94	-3.1914895
36961	2022-09-05 09:53:00	4475	performance	91	100.0
36962	2022-09-05 09:53:10	4475	performance	94	3.1914895
36963	2022-09-05 09:53:20	4475	performance	100	6.0
36964	2022-09-05 09:53:30	4475	performance	93	-7.526882
36965	2022-09-05 09:53:40	4475	performance	96	3.125
36966	2022-09-05 09:53:50	4475	performance	90	-6.666667
36967	2022-09-05 09:54:00	4475	performance	95	5.263158
36968	2022-09-05 09:53:00	4476	performance	97	100.0
36969	2022-09-05 09:53:10	4476	performance	94	-3.1914895
36970	2022-09-05 09:53:20	4476	performance	90	-4.4444447
36971	2022-09-05 09:53:30	4476	performance	98	8.163265
36972	2022-09-05 09:53:40	4476	performance	92	-6.521739
36973	2022-09-05 09:53:50	4476	performance	97	5.1546392
36974	2022-09-05 09:54:00	4476	performance	99	2.020202
36975	2022-09-05 09:53:00	4236	performance	90	100.0
36976	2022-09-05 09:53:10	4236	performance	98	8.163265
36977	2022-09-05 09:53:20	4236	performance	95	-3.1578946
36978	2022-09-05 09:53:30	4236	performance	93	-2.1505377
36979	2022-09-05 09:53:40	4236	performance	99	6.060606
36980	2022-09-05 09:53:50	4236	performance	95	-4.2105265
36981	2022-09-05 09:54:00	4236	performance	93	-2.1505377
36982	2022-09-05 09:53:00	4758	performance	92	100.0
36983	2022-09-05 09:53:10	4758	performance	91	-1.0989012
36984	2022-09-05 09:53:20	4758	performance	90	-1.1111112
36985	2022-09-05 09:53:30	4758	performance	92	2.173913
36986	2022-09-05 09:53:40	4758	performance	100	8.0
36987	2022-09-05 09:53:50	4758	performance	90	-11.111112
36988	2022-09-05 09:54:00	4758	performance	90	0.0
36989	2022-09-05 09:53:00	4759	performance	96	100.0
36990	2022-09-05 09:53:10	4759	performance	93	-3.2258062
36991	2022-09-05 09:53:20	4759	performance	96	3.125
36992	2022-09-05 09:53:30	4759	performance	91	-5.4945054
36993	2022-09-05 09:53:40	4759	performance	93	2.1505377
36994	2022-09-05 09:53:50	4759	performance	94	1.0638298
36995	2022-09-05 09:54:00	4759	performance	91	-3.2967036
36996	2022-09-05 09:53:00	4035	performance	93	100.0
36997	2022-09-05 09:53:10	4035	performance	91	-2.1978023
36998	2022-09-05 09:53:20	4035	performance	90	-1.1111112
36999	2022-09-05 09:53:30	4035	performance	100	10.0
37000	2022-09-05 09:53:40	4035	performance	100	0.0
37001	2022-09-05 09:53:50	4035	performance	100	0.0
37002	2022-09-05 09:54:00	4035	performance	90	-11.111112
37003	2022-09-05 09:53:00	4036	performance	100	100.0
37004	2022-09-05 09:53:10	4036	performance	92	-8.695652
37005	2022-09-05 09:53:20	4036	performance	93	1.0752689
37006	2022-09-05 09:53:30	4036	performance	92	-1.0869565
37007	2022-09-05 09:53:40	4036	performance	91	-1.0989012
37008	2022-09-05 09:53:50	4036	performance	90	-1.1111112
37009	2022-09-05 09:54:00	4036	performance	99	9.090909
37010	2022-09-05 09:53:00	4760	performance	95	100.0
37011	2022-09-05 09:53:10	4760	performance	99	4.040404
37012	2022-09-05 09:53:20	4760	performance	99	0.0
37013	2022-09-05 09:53:30	4760	performance	97	-2.0618556
37014	2022-09-05 09:53:40	4760	performance	93	-4.3010755
37015	2022-09-05 09:53:50	4760	performance	96	3.125
37016	2022-09-05 09:54:00	4760	performance	96	0.0
37017	2022-09-05 09:53:00	4237	performance	99	100.0
37018	2022-09-05 09:53:10	4237	performance	92	-7.6086955
37019	2022-09-05 09:53:20	4237	performance	94	2.1276596
37020	2022-09-05 09:53:30	4237	performance	92	-2.173913
37021	2022-09-05 09:53:40	4237	performance	90	-2.2222223
37022	2022-09-05 09:53:50	4237	performance	95	5.263158
37023	2022-09-05 09:54:00	4237	performance	91	-4.3956046
37024	2022-09-05 09:53:00	4238	performance	97	100.0
37025	2022-09-05 09:53:10	4238	performance	94	-3.1914895
37026	2022-09-05 09:53:20	4238	performance	92	-2.173913
37027	2022-09-05 09:53:30	4238	performance	98	6.122449
37028	2022-09-05 09:53:40	4238	performance	91	-7.692308
37029	2022-09-05 09:53:50	4238	performance	94	3.1914895
37030	2022-09-05 09:54:00	4238	performance	98	4.0816326
37031	2022-09-05 09:53:00	4477	performance	95	100.0
37032	2022-09-05 09:53:10	4477	performance	91	-4.3956046
37033	2022-09-05 09:53:20	4477	performance	98	7.1428576
37034	2022-09-05 09:53:30	4477	performance	100	2.0
37035	2022-09-05 09:53:40	4477	performance	100	0.0
37036	2022-09-05 09:53:50	4477	performance	95	-5.263158
37037	2022-09-05 09:54:00	4477	performance	92	-3.2608695
37038	2022-09-05 09:53:00	4478	performance	98	100.0
37039	2022-09-05 09:53:10	4478	performance	100	2.0
37040	2022-09-05 09:53:20	4478	performance	93	-7.526882
37041	2022-09-05 09:53:30	4478	performance	93	0.0
37042	2022-09-05 09:53:40	4478	performance	97	4.123711
37043	2022-09-05 09:53:50	4478	performance	90	-7.777778
37044	2022-09-05 09:54:00	4478	performance	99	9.090909
37045	2022-09-05 09:53:00	4761	performance	94	100.0
37046	2022-09-05 09:53:10	4761	performance	98	4.0816326
37047	2022-09-05 09:53:20	4761	performance	97	-1.0309278
37048	2022-09-05 09:53:30	4761	performance	97	0.0
37049	2022-09-05 09:53:40	4761	performance	97	0.0
37050	2022-09-05 09:53:50	4761	performance	97	0.0
37051	2022-09-05 09:54:00	4761	performance	98	1.0204082
37052	2022-09-05 09:53:00	4762	performance	98	100.0
37053	2022-09-05 09:53:10	4762	performance	90	-8.888889
37054	2022-09-05 09:53:20	4762	performance	98	8.163265
37055	2022-09-05 09:53:30	4762	performance	100	2.0
37056	2022-09-05 09:53:40	4762	performance	98	-2.0408163
37057	2022-09-05 09:53:50	4762	performance	100	2.0
37058	2022-09-05 09:54:00	4762	performance	98	-2.0408163
37059	2022-09-05 09:53:00	4763	performance	91	100.0
37060	2022-09-05 09:53:10	4763	performance	97	6.185567
37061	2022-09-05 09:53:20	4763	performance	98	1.0204082
37062	2022-09-05 09:53:30	4763	performance	95	-3.1578946
37063	2022-09-05 09:53:40	4763	performance	91	-4.3956046
37064	2022-09-05 09:53:50	4763	performance	98	7.1428576
37065	2022-09-05 09:54:00	4763	performance	94	-4.255319
37066	2022-09-05 09:53:00	4479	performance	100	100.0
37067	2022-09-05 09:53:10	4479	performance	100	0.0
37068	2022-09-05 09:53:20	4479	performance	93	-7.526882
37069	2022-09-05 09:53:30	4479	performance	96	3.125
37070	2022-09-05 09:53:40	4479	performance	100	4.0
37071	2022-09-05 09:53:50	4479	performance	100	0.0
37072	2022-09-05 09:54:00	4479	performance	91	-9.89011
37073	2022-09-05 09:53:00	4037	performance	97	100.0
37074	2022-09-05 09:53:10	4037	performance	100	3.0
37075	2022-09-05 09:53:20	4037	performance	97	-3.0927835
37076	2022-09-05 09:53:30	4037	performance	99	2.020202
37077	2022-09-05 09:53:40	4037	performance	90	-10.0
37078	2022-09-05 09:53:50	4037	performance	96	6.25
37079	2022-09-05 09:54:00	4037	performance	96	0.0
37080	2022-09-05 09:53:00	4239	performance	91	100.0
37081	2022-09-05 09:53:10	4239	performance	91	0.0
37082	2022-09-05 09:53:20	4239	performance	99	8.080808
37083	2022-09-05 09:53:30	4239	performance	93	-6.4516125
37084	2022-09-05 09:53:40	4239	performance	91	-2.1978023
37085	2022-09-05 09:53:50	4239	performance	92	1.0869565
37086	2022-09-05 09:54:00	4239	performance	100	8.0
37087	2022-09-05 09:53:00	4240	performance	95	100.0
37088	2022-09-05 09:53:10	4240	performance	94	-1.0638298
37089	2022-09-05 09:53:20	4240	performance	97	3.0927835
37090	2022-09-05 09:53:30	4240	performance	94	-3.1914895
37091	2022-09-05 09:53:40	4240	performance	96	2.0833335
37092	2022-09-05 09:53:50	4240	performance	98	2.0408163
37093	2022-09-05 09:54:00	4240	performance	97	-1.0309278
37094	2022-09-05 09:53:00	4764	performance	90	100.0
37095	2022-09-05 09:53:10	4764	performance	99	9.090909
37096	2022-09-05 09:53:20	4764	performance	99	0.0
37097	2022-09-05 09:53:30	4764	performance	97	-2.0618556
37098	2022-09-05 09:53:40	4764	performance	96	-1.0416667
37099	2022-09-05 09:53:50	4764	performance	90	-6.666667
37100	2022-09-05 09:54:00	4764	performance	96	6.25
37101	2022-09-05 09:53:00	4038	performance	99	100.0
37102	2022-09-05 09:53:10	4038	performance	92	-7.6086955
37103	2022-09-05 09:53:20	4038	performance	99	7.070707
37104	2022-09-05 09:53:30	4038	performance	100	1.0
37105	2022-09-05 09:53:40	4038	performance	92	-8.695652
37106	2022-09-05 09:53:50	4038	performance	93	1.0752689
37107	2022-09-05 09:54:00	4038	performance	97	4.123711
37108	2022-09-05 09:53:00	4480	performance	99	100.0
37109	2022-09-05 09:53:10	4480	performance	99	0.0
37110	2022-09-05 09:53:20	4480	performance	92	-7.6086955
37111	2022-09-05 09:53:30	4480	performance	94	2.1276596
37112	2022-09-05 09:53:40	4480	performance	96	2.0833335
37113	2022-09-05 09:53:50	4480	performance	91	-5.4945054
37114	2022-09-05 09:54:00	4480	performance	96	5.208333
37115	2022-09-05 09:53:00	4765	performance	95	100.0
37116	2022-09-05 09:53:10	4765	performance	91	-4.3956046
37117	2022-09-05 09:53:20	4765	performance	91	0.0
37118	2022-09-05 09:53:30	4765	performance	99	8.080808
37119	2022-09-05 09:53:40	4765	performance	98	-1.0204082
37120	2022-09-05 09:53:50	4765	performance	92	-6.521739
37121	2022-09-05 09:54:00	4765	performance	99	7.070707
37122	2022-09-05 09:53:00	4766	performance	95	100.0
37123	2022-09-05 09:53:10	4766	performance	94	-1.0638298
37124	2022-09-05 09:53:20	4766	performance	100	6.0
37125	2022-09-05 09:53:30	4766	performance	98	-2.0408163
37126	2022-09-05 09:53:40	4766	performance	93	-5.376344
37127	2022-09-05 09:53:50	4766	performance	93	0.0
37128	2022-09-05 09:54:00	4766	performance	94	1.0638298
37129	2022-09-05 09:53:00	4241	performance	90	100.0
37130	2022-09-05 09:53:10	4241	performance	90	0.0
37131	2022-09-05 09:53:20	4241	performance	91	1.0989012
37132	2022-09-05 09:53:30	4241	performance	90	-1.1111112
37133	2022-09-05 09:53:40	4241	performance	90	0.0
37134	2022-09-05 09:53:50	4241	performance	92	2.173913
37135	2022-09-05 09:54:00	4241	performance	91	-1.0989012
37136	2022-09-05 09:53:00	4481	performance	94	100.0
37137	2022-09-05 09:53:10	4481	performance	91	-3.2967036
37138	2022-09-05 09:53:20	4481	performance	94	3.1914895
37139	2022-09-05 09:53:30	4481	performance	94	0.0
37140	2022-09-05 09:53:40	4481	performance	90	-4.4444447
37141	2022-09-05 09:53:50	4481	performance	92	2.173913
37142	2022-09-05 09:54:00	4481	performance	96	4.166667
37143	2022-09-05 09:53:00	4482	performance	95	100.0
37144	2022-09-05 09:53:10	4482	performance	95	0.0
37145	2022-09-05 09:53:20	4482	performance	91	-4.3956046
37146	2022-09-05 09:53:30	4482	performance	99	8.080808
37147	2022-09-05 09:53:40	4482	performance	96	-3.125
37148	2022-09-05 09:53:50	4482	performance	98	2.0408163
37149	2022-09-05 09:54:00	4482	performance	97	-1.0309278
37150	2022-09-05 09:53:00	4242	performance	93	100.0
37151	2022-09-05 09:53:10	4242	performance	97	4.123711
37152	2022-09-05 09:53:20	4242	performance	90	-7.777778
37153	2022-09-05 09:53:30	4242	performance	91	1.0989012
37154	2022-09-05 09:53:40	4242	performance	100	9.0
37155	2022-09-05 09:53:50	4242	performance	97	-3.0927835
37156	2022-09-05 09:54:00	4242	performance	95	-2.1052632
37157	2022-09-05 09:53:00	4767	performance	95	100.0
37158	2022-09-05 09:53:10	4767	performance	90	-5.555556
37159	2022-09-05 09:53:20	4767	performance	95	5.263158
37160	2022-09-05 09:53:30	4767	performance	94	-1.0638298
37161	2022-09-05 09:53:40	4767	performance	98	4.0816326
37162	2022-09-05 09:53:50	4767	performance	99	1.010101
37163	2022-09-05 09:54:00	4767	performance	95	-4.2105265
37164	2022-09-05 09:53:00	4768	performance	93	100.0
37165	2022-09-05 09:53:10	4768	performance	96	3.125
37166	2022-09-05 09:53:20	4768	performance	93	-3.2258062
37167	2022-09-05 09:53:30	4768	performance	93	0.0
37168	2022-09-05 09:53:40	4768	performance	97	4.123711
37169	2022-09-05 09:53:50	4768	performance	99	2.020202
37170	2022-09-05 09:54:00	4768	performance	90	-10.0
37171	2022-09-05 09:53:00	4039	performance	100	100.0
37172	2022-09-05 09:53:10	4039	performance	99	-1.010101
37173	2022-09-05 09:53:20	4039	performance	99	0.0
37174	2022-09-05 09:53:30	4039	performance	98	-1.0204082
37175	2022-09-05 09:53:40	4039	performance	99	1.010101
37176	2022-09-05 09:53:50	4039	performance	91	-8.791209
37177	2022-09-05 09:54:00	4039	performance	98	7.1428576
37178	2022-09-05 09:53:00	4040	performance	95	100.0
37179	2022-09-05 09:53:10	4040	performance	91	-4.3956046
37180	2022-09-05 09:53:20	4040	performance	93	2.1505377
37181	2022-09-05 09:53:30	4040	performance	92	-1.0869565
37182	2022-09-05 09:53:40	4040	performance	97	5.1546392
37183	2022-09-05 09:53:50	4040	performance	93	-4.3010755
37184	2022-09-05 09:54:00	4040	performance	100	7.0
37185	2022-09-05 09:53:00	4769	performance	98	100.0
37186	2022-09-05 09:53:10	4769	performance	91	-7.692308
37187	2022-09-05 09:53:20	4769	performance	93	2.1505377
37188	2022-09-05 09:53:30	4769	performance	97	4.123711
37189	2022-09-05 09:53:40	4769	performance	92	-5.4347825
37190	2022-09-05 09:53:50	4769	performance	97	5.1546392
37191	2022-09-05 09:54:00	4769	performance	99	2.020202
37192	2022-09-05 09:53:00	4243	performance	99	100.0
37193	2022-09-05 09:53:10	4243	performance	93	-6.4516125
37194	2022-09-05 09:53:20	4243	performance	94	1.0638298
37195	2022-09-05 09:53:30	4243	performance	96	2.0833335
37196	2022-09-05 09:53:40	4243	performance	96	0.0
37197	2022-09-05 09:53:50	4243	performance	96	0.0
37198	2022-09-05 09:54:00	4243	performance	97	1.0309278
37199	2022-09-05 09:53:00	4244	performance	99	100.0
37200	2022-09-05 09:53:10	4244	performance	97	-2.0618556
37201	2022-09-05 09:53:20	4244	performance	98	1.0204082
37202	2022-09-05 09:53:30	4244	performance	95	-3.1578946
37203	2022-09-05 09:53:40	4244	performance	98	3.0612245
37204	2022-09-05 09:53:50	4244	performance	100	2.0
37205	2022-09-05 09:54:00	4244	performance	93	-7.526882
37206	2022-09-05 09:53:00	4483	performance	97	100.0
37207	2022-09-05 09:53:10	4483	performance	97	0.0
37208	2022-09-05 09:53:20	4483	performance	94	-3.1914895
37209	2022-09-05 09:53:30	4483	performance	95	1.0526316
37210	2022-09-05 09:53:40	4483	performance	90	-5.555556
37211	2022-09-05 09:53:50	4483	performance	100	10.0
37212	2022-09-05 09:54:00	4483	performance	98	-2.0408163
37213	2022-09-05 09:53:00	4484	performance	93	100.0
37214	2022-09-05 09:53:10	4484	performance	92	-1.0869565
37215	2022-09-05 09:53:20	4484	performance	99	7.070707
37216	2022-09-05 09:53:30	4484	performance	93	-6.4516125
37217	2022-09-05 09:53:40	4484	performance	92	-1.0869565
37218	2022-09-05 09:53:50	4484	performance	95	3.1578946
37219	2022-09-05 09:54:00	4484	performance	90	-5.555556
37220	2022-09-05 09:53:00	4770	performance	92	100.0
37221	2022-09-05 09:53:10	4770	performance	96	4.166667
37222	2022-09-05 09:53:20	4770	performance	94	-2.1276596
37223	2022-09-05 09:53:30	4770	performance	93	-1.0752689
37224	2022-09-05 09:53:40	4770	performance	95	2.1052632
37225	2022-09-05 09:53:50	4770	performance	97	2.0618556
37226	2022-09-05 09:54:00	4770	performance	97	0.0
37227	2022-09-05 09:53:00	4771	performance	92	100.0
37228	2022-09-05 09:53:10	4771	performance	92	0.0
37229	2022-09-05 09:53:20	4771	performance	95	3.1578946
37230	2022-09-05 09:53:30	4771	performance	93	-2.1505377
37231	2022-09-05 09:53:40	4771	performance	95	2.1052632
37232	2022-09-05 09:53:50	4771	performance	99	4.040404
37233	2022-09-05 09:54:00	4771	performance	91	-8.791209
37234	2022-09-05 09:53:00	4772	performance	97	100.0
37235	2022-09-05 09:53:10	4772	performance	91	-6.593407
37236	2022-09-05 09:53:20	4772	performance	98	7.1428576
37237	2022-09-05 09:53:30	4772	performance	91	-7.692308
37238	2022-09-05 09:53:40	4772	performance	90	-1.1111112
37239	2022-09-05 09:53:50	4772	performance	99	9.090909
37240	2022-09-05 09:54:00	4772	performance	92	-7.6086955
37241	2022-09-05 09:53:00	4485	performance	93	100.0
37242	2022-09-05 09:53:10	4485	performance	95	2.1052632
37243	2022-09-05 09:53:20	4485	performance	95	0.0
37244	2022-09-05 09:53:30	4485	performance	93	-2.1505377
37245	2022-09-05 09:53:40	4485	performance	98	5.102041
37246	2022-09-05 09:53:50	4485	performance	94	-4.255319
37247	2022-09-05 09:54:00	4485	performance	95	1.0526316
37248	2022-09-05 09:53:00	4041	performance	95	100.0
37249	2022-09-05 09:53:10	4041	performance	97	2.0618556
37250	2022-09-05 09:53:20	4041	performance	97	0.0
37251	2022-09-05 09:53:30	4041	performance	93	-4.3010755
37252	2022-09-05 09:53:40	4041	performance	90	-3.3333335
37253	2022-09-05 09:53:50	4041	performance	99	9.090909
37254	2022-09-05 09:54:00	4041	performance	97	-2.0618556
37255	2022-09-05 09:53:00	4245	performance	98	100.0
37256	2022-09-05 09:53:10	4245	performance	100	2.0
37257	2022-09-05 09:53:20	4245	performance	91	-9.89011
37258	2022-09-05 09:53:30	4245	performance	91	0.0
37259	2022-09-05 09:53:40	4245	performance	91	0.0
37260	2022-09-05 09:53:50	4245	performance	94	3.1914895
37261	2022-09-05 09:54:00	4245	performance	98	4.0816326
37262	2022-09-05 09:53:00	4246	performance	92	100.0
37263	2022-09-05 09:53:10	4246	performance	98	6.122449
37264	2022-09-05 09:53:20	4246	performance	100	2.0
37265	2022-09-05 09:53:30	4246	performance	99	-1.010101
37266	2022-09-05 09:53:40	4246	performance	100	1.0
37267	2022-09-05 09:53:50	4246	performance	98	-2.0408163
37268	2022-09-05 09:54:00	4246	performance	98	0.0
37269	2022-09-05 09:53:00	4773	performance	92	100.0
37270	2022-09-05 09:53:10	4773	performance	97	5.1546392
37271	2022-09-05 09:53:20	4773	performance	96	-1.0416667
37272	2022-09-05 09:53:30	4773	performance	95	-1.0526316
37273	2022-09-05 09:53:40	4773	performance	98	3.0612245
37274	2022-09-05 09:53:50	4773	performance	91	-7.692308
37275	2022-09-05 09:54:00	4773	performance	98	7.1428576
37276	2022-09-05 09:53:00	4042	performance	93	100.0
37277	2022-09-05 09:53:10	4042	performance	94	1.0638298
37278	2022-09-05 09:53:20	4042	performance	90	-4.4444447
37279	2022-09-05 09:53:30	4042	performance	92	2.173913
37280	2022-09-05 09:53:40	4042	performance	99	7.070707
37281	2022-09-05 09:53:50	4042	performance	98	-1.0204082
37282	2022-09-05 09:54:00	4042	performance	98	0.0
37283	2022-09-05 09:53:00	4486	performance	95	100.0
37284	2022-09-05 09:53:10	4486	performance	90	-5.555556
37285	2022-09-05 09:53:20	4486	performance	92	2.173913
37286	2022-09-05 09:53:30	4486	performance	90	-2.2222223
37287	2022-09-05 09:53:40	4486	performance	99	9.090909
37288	2022-09-05 09:53:50	4486	performance	92	-7.6086955
37289	2022-09-05 09:54:00	4486	performance	90	-2.2222223
37290	2022-09-05 09:53:00	4774	performance	92	100.0
37291	2022-09-05 09:53:10	4774	performance	98	6.122449
37292	2022-09-05 09:53:20	4774	performance	94	-4.255319
37293	2022-09-05 09:53:30	4774	performance	90	-4.4444447
37294	2022-09-05 09:53:40	4774	performance	96	6.25
37295	2022-09-05 09:53:50	4774	performance	93	-3.2258062
37296	2022-09-05 09:54:00	4774	performance	90	-3.3333335
37297	2022-09-05 09:53:00	4775	performance	94	100.0
37298	2022-09-05 09:53:10	4775	performance	91	-3.2967036
37299	2022-09-05 09:53:20	4775	performance	98	7.1428576
37300	2022-09-05 09:53:30	4775	performance	100	2.0
37301	2022-09-05 09:53:40	4775	performance	95	-5.263158
37302	2022-09-05 09:53:50	4775	performance	94	-1.0638298
37303	2022-09-05 09:54:00	4775	performance	95	1.0526316
37304	2022-09-05 09:53:00	4247	performance	94	100.0
37305	2022-09-05 09:53:10	4247	performance	92	-2.173913
37306	2022-09-05 09:53:20	4247	performance	96	4.166667
37307	2022-09-05 09:53:30	4247	performance	91	-5.4945054
37308	2022-09-05 09:53:40	4247	performance	94	3.1914895
37309	2022-09-05 09:53:50	4247	performance	94	0.0
37310	2022-09-05 09:54:00	4247	performance	100	6.0
37311	2022-09-05 09:53:00	4487	performance	91	100.0
37312	2022-09-05 09:53:10	4487	performance	92	1.0869565
37313	2022-09-05 09:53:20	4487	performance	97	5.1546392
37314	2022-09-05 09:53:30	4487	performance	93	-4.3010755
37315	2022-09-05 09:53:40	4487	performance	99	6.060606
37316	2022-09-05 09:53:50	4487	performance	95	-4.2105265
37317	2022-09-05 09:54:00	4487	performance	99	4.040404
37318	2022-09-05 09:53:00	4488	performance	95	100.0
37319	2022-09-05 09:53:10	4488	performance	98	3.0612245
37320	2022-09-05 09:53:20	4488	performance	90	-8.888889
37321	2022-09-05 09:53:30	4488	performance	91	1.0989012
37322	2022-09-05 09:53:40	4488	performance	96	5.208333
37323	2022-09-05 09:53:50	4488	performance	93	-3.2258062
37324	2022-09-05 09:54:00	4488	performance	90	-3.3333335
37325	2022-09-05 09:53:00	4248	performance	91	100.0
37326	2022-09-05 09:53:10	4248	performance	91	0.0
37327	2022-09-05 09:53:20	4248	performance	94	3.1914895
37328	2022-09-05 09:53:30	4248	performance	99	5.050505
37329	2022-09-05 09:53:40	4248	performance	98	-1.0204082
37330	2022-09-05 09:53:50	4248	performance	93	-5.376344
37331	2022-09-05 09:54:00	4248	performance	93	0.0
37332	2022-09-05 09:53:00	4776	performance	97	100.0
37333	2022-09-05 09:53:10	4776	performance	90	-7.777778
37334	2022-09-05 09:53:20	4776	performance	91	1.0989012
37335	2022-09-05 09:53:30	4776	performance	97	6.185567
37336	2022-09-05 09:53:40	4776	performance	100	3.0
37337	2022-09-05 09:53:50	4776	performance	100	0.0
37338	2022-09-05 09:54:00	4776	performance	95	-5.263158
37339	2022-09-05 09:53:00	4777	performance	97	100.0
37340	2022-09-05 09:53:10	4777	performance	98	1.0204082
37341	2022-09-05 09:53:20	4777	performance	97	-1.0309278
37342	2022-09-05 09:53:30	4777	performance	96	-1.0416667
37343	2022-09-05 09:53:40	4777	performance	95	-1.0526316
37344	2022-09-05 09:53:50	4777	performance	91	-4.3956046
37345	2022-09-05 09:54:00	4777	performance	90	-1.1111112
37346	2022-09-05 09:53:00	4043	performance	92	100.0
37347	2022-09-05 09:53:10	4043	performance	95	3.1578946
37348	2022-09-05 09:53:20	4043	performance	90	-5.555556
37349	2022-09-05 09:53:30	4043	performance	99	9.090909
37350	2022-09-05 09:53:40	4043	performance	99	0.0
37351	2022-09-05 09:53:50	4043	performance	93	-6.4516125
37352	2022-09-05 09:54:00	4043	performance	93	0.0
37353	2022-09-05 09:53:00	4044	performance	97	100.0
37354	2022-09-05 09:53:10	4044	performance	97	0.0
37355	2022-09-05 09:53:20	4044	performance	93	-4.3010755
37356	2022-09-05 09:53:30	4044	performance	97	4.123711
37357	2022-09-05 09:53:40	4044	performance	92	-5.4347825
37358	2022-09-05 09:53:50	4044	performance	90	-2.2222223
37359	2022-09-05 09:54:00	4044	performance	93	3.2258062
37360	2022-09-05 09:53:00	4778	performance	95	100.0
37361	2022-09-05 09:53:10	4778	performance	91	-4.3956046
37362	2022-09-05 09:53:20	4778	performance	96	5.208333
37363	2022-09-05 09:53:30	4778	performance	96	0.0
37364	2022-09-05 09:53:40	4778	performance	100	4.0
37365	2022-09-05 09:53:50	4778	performance	98	-2.0408163
37366	2022-09-05 09:54:00	4778	performance	100	2.0
37367	2022-09-05 09:53:00	4249	performance	99	100.0
37368	2022-09-05 09:53:10	4249	performance	92	-7.6086955
37369	2022-09-05 09:53:20	4249	performance	91	-1.0989012
37370	2022-09-05 09:53:30	4249	performance	90	-1.1111112
37371	2022-09-05 09:53:40	4249	performance	93	3.2258062
37372	2022-09-05 09:53:50	4249	performance	96	3.125
37373	2022-09-05 09:54:00	4249	performance	99	3.030303
37374	2022-09-05 09:53:00	4375	performance	91	100.0
37375	2022-09-05 09:53:10	4375	performance	91	0.0
37376	2022-09-05 09:53:20	4375	performance	99	8.080808
37377	2022-09-05 09:53:30	4375	performance	97	-2.0618556
37378	2022-09-05 09:53:40	4375	performance	93	-4.3010755
37379	2022-09-05 09:53:50	4375	performance	97	4.123711
37380	2022-09-05 09:54:00	4375	performance	98	1.0204082
37381	2022-09-05 09:53:00	4376	performance	92	100.0
37382	2022-09-05 09:53:10	4376	performance	96	4.166667
37383	2022-09-05 09:53:20	4376	performance	92	-4.347826
37384	2022-09-05 09:53:30	4376	performance	92	0.0
37385	2022-09-05 09:53:40	4376	performance	100	8.0
37386	2022-09-05 09:53:50	4376	performance	97	-3.0927835
37387	2022-09-05 09:54:00	4376	performance	99	2.020202
37388	2022-09-05 09:53:00	4250	performance	91	100.0
37389	2022-09-05 09:53:10	4250	performance	95	4.2105265
37390	2022-09-05 09:53:20	4250	performance	92	-3.2608695
37391	2022-09-05 09:53:30	4250	performance	92	0.0
37392	2022-09-05 09:53:40	4250	performance	99	7.070707
37393	2022-09-05 09:53:50	4250	performance	93	-6.4516125
37394	2022-09-05 09:54:00	4250	performance	96	3.125
37395	2022-09-05 09:53:00	4489	performance	93	100.0
37396	2022-09-05 09:53:10	4489	performance	94	1.0638298
37397	2022-09-05 09:53:20	4489	performance	90	-4.4444447
37398	2022-09-05 09:53:30	4489	performance	99	9.090909
37399	2022-09-05 09:53:40	4489	performance	95	-4.2105265
37400	2022-09-05 09:53:50	4489	performance	99	4.040404
37401	2022-09-05 09:54:00	4489	performance	90	-10.0
37402	2022-09-05 09:53:00	4490	performance	95	100.0
37403	2022-09-05 09:53:10	4490	performance	98	3.0612245
37404	2022-09-05 09:53:20	4490	performance	92	-6.521739
37405	2022-09-05 09:53:30	4490	performance	92	0.0
37406	2022-09-05 09:53:40	4490	performance	100	8.0
37407	2022-09-05 09:53:50	4490	performance	91	-9.89011
37408	2022-09-05 09:54:00	4490	performance	96	5.208333
37409	2022-09-05 09:53:00	4779	performance	91	100.0
37410	2022-09-05 09:53:10	4779	performance	100	9.0
37411	2022-09-05 09:53:20	4779	performance	100	0.0
37412	2022-09-05 09:53:30	4779	performance	92	-8.695652
37413	2022-09-05 09:53:40	4779	performance	98	6.122449
37414	2022-09-05 09:53:50	4779	performance	90	-8.888889
37415	2022-09-05 09:54:00	4779	performance	99	9.090909
37416	2022-09-05 09:53:00	4780	performance	90	100.0
37417	2022-09-05 09:53:10	4780	performance	98	8.163265
37418	2022-09-05 09:53:20	4780	performance	92	-6.521739
37419	2022-09-05 09:53:30	4780	performance	98	6.122449
37420	2022-09-05 09:53:40	4780	performance	97	-1.0309278
37421	2022-09-05 09:53:50	4780	performance	95	-2.1052632
37422	2022-09-05 09:54:00	4780	performance	94	-1.0638298
37423	2022-09-05 09:53:00	4781	performance	100	100.0
37424	2022-09-05 09:53:10	4781	performance	97	-3.0927835
37425	2022-09-05 09:53:20	4781	performance	95	-2.1052632
37426	2022-09-05 09:53:30	4781	performance	96	1.0416667
37427	2022-09-05 09:53:40	4781	performance	99	3.030303
37428	2022-09-05 09:53:50	4781	performance	98	-1.0204082
37429	2022-09-05 09:54:00	4781	performance	93	-5.376344
37430	2022-09-05 09:53:00	4491	performance	94	100.0
37431	2022-09-05 09:53:10	4491	performance	100	6.0
37432	2022-09-05 09:53:20	4491	performance	99	-1.010101
37433	2022-09-05 09:53:30	4491	performance	92	-7.6086955
37434	2022-09-05 09:53:40	4491	performance	91	-1.0989012
37435	2022-09-05 09:53:50	4491	performance	98	7.1428576
37436	2022-09-05 09:54:00	4491	performance	90	-8.888889
37437	2022-09-05 09:53:00	4045	performance	98	100.0
37438	2022-09-05 09:53:10	4045	performance	94	-4.255319
37439	2022-09-05 09:53:20	4045	performance	98	4.0816326
37440	2022-09-05 09:53:30	4045	performance	92	-6.521739
37441	2022-09-05 09:53:40	4045	performance	96	4.166667
37442	2022-09-05 09:53:50	4045	performance	94	-2.1276596
37443	2022-09-05 09:54:00	4045	performance	96	2.0833335
37444	2022-09-05 09:53:00	4251	performance	100	100.0
37445	2022-09-05 09:53:10	4251	performance	99	-1.010101
37446	2022-09-05 09:53:20	4251	performance	98	-1.0204082
37447	2022-09-05 09:53:30	4251	performance	100	2.0
37448	2022-09-05 09:53:40	4251	performance	97	-3.0927835
37449	2022-09-05 09:53:50	4251	performance	98	1.0204082
37450	2022-09-05 09:54:00	4251	performance	94	-4.255319
37451	2022-09-05 09:53:00	4252	performance	98	100.0
37452	2022-09-05 09:53:10	4252	performance	100	2.0
37453	2022-09-05 09:53:20	4252	performance	96	-4.166667
37454	2022-09-05 09:53:30	4252	performance	90	-6.666667
37455	2022-09-05 09:53:40	4252	performance	99	9.090909
37456	2022-09-05 09:53:50	4252	performance	99	0.0
37457	2022-09-05 09:54:00	4252	performance	100	1.0
37458	2022-09-05 09:53:00	4782	performance	93	100.0
37459	2022-09-05 09:53:10	4782	performance	92	-1.0869565
37460	2022-09-05 09:53:20	4782	performance	95	3.1578946
37461	2022-09-05 09:53:30	4782	performance	100	5.0
37462	2022-09-05 09:53:40	4782	performance	96	-4.166667
37463	2022-09-05 09:53:50	4782	performance	99	3.030303
37464	2022-09-05 09:54:00	4782	performance	95	-4.2105265
37465	2022-09-05 09:53:00	4046	performance	94	100.0
37466	2022-09-05 09:53:10	4046	performance	93	-1.0752689
37467	2022-09-05 09:53:20	4046	performance	98	5.102041
37468	2022-09-05 09:53:30	4046	performance	100	2.0
37469	2022-09-05 09:53:40	4046	performance	94	-6.382979
37470	2022-09-05 09:53:50	4046	performance	93	-1.0752689
37471	2022-09-05 09:54:00	4046	performance	92	-1.0869565
37472	2022-09-05 09:53:00	4492	performance	93	100.0
37473	2022-09-05 09:53:10	4492	performance	100	7.0
37474	2022-09-05 09:53:20	4492	performance	91	-9.89011
37475	2022-09-05 09:53:30	4492	performance	91	0.0
37476	2022-09-05 09:53:40	4492	performance	96	5.208333
37477	2022-09-05 09:53:50	4492	performance	96	0.0
37478	2022-09-05 09:54:00	4492	performance	99	3.030303
37479	2022-09-05 09:53:00	4783	performance	97	100.0
37480	2022-09-05 09:53:10	4783	performance	95	-2.1052632
37481	2022-09-05 09:53:20	4783	performance	90	-5.555556
37482	2022-09-05 09:53:30	4783	performance	93	3.2258062
37483	2022-09-05 09:53:40	4783	performance	99	6.060606
37484	2022-09-05 09:53:50	4783	performance	96	-3.125
37485	2022-09-05 09:54:00	4783	performance	96	0.0
37486	2022-09-05 09:53:00	4784	performance	93	100.0
37487	2022-09-05 09:53:10	4784	performance	97	4.123711
37488	2022-09-05 09:53:20	4784	performance	93	-4.3010755
37489	2022-09-05 09:53:30	4784	performance	93	0.0
37490	2022-09-05 09:53:40	4784	performance	99	6.060606
37491	2022-09-05 09:53:50	4784	performance	95	-4.2105265
37492	2022-09-05 09:54:00	4784	performance	100	5.0
37493	2022-09-05 09:53:00	4253	performance	97	100.0
37494	2022-09-05 09:53:10	4253	performance	91	-6.593407
37495	2022-09-05 09:53:20	4253	performance	91	0.0
37496	2022-09-05 09:53:30	4253	performance	96	5.208333
37497	2022-09-05 09:53:40	4253	performance	92	-4.347826
37498	2022-09-05 09:53:50	4253	performance	96	4.166667
37499	2022-09-05 09:54:00	4253	performance	95	-1.0526316
37500	2022-09-05 09:53:00	4493	performance	98	100.0
37501	2022-09-05 09:53:10	4493	performance	90	-8.888889
37502	2022-09-05 09:53:20	4493	performance	92	2.173913
37503	2022-09-05 09:53:30	4493	performance	99	7.070707
37504	2022-09-05 09:53:40	4493	performance	100	1.0
37505	2022-09-05 09:53:50	4493	performance	98	-2.0408163
37506	2022-09-05 09:54:00	4493	performance	94	-4.255319
37507	2022-09-05 09:53:00	4494	performance	92	100.0
37508	2022-09-05 09:53:10	4494	performance	99	7.070707
37509	2022-09-05 09:53:20	4494	performance	90	-10.0
37510	2022-09-05 09:53:30	4494	performance	91	1.0989012
37511	2022-09-05 09:53:40	4494	performance	96	5.208333
37512	2022-09-05 09:53:50	4494	performance	92	-4.347826
37513	2022-09-05 09:54:00	4494	performance	91	-1.0989012
37514	2022-09-05 09:53:00	4254	performance	100	100.0
37515	2022-09-05 09:53:10	4254	performance	99	-1.010101
37516	2022-09-05 09:53:20	4254	performance	94	-5.319149
37517	2022-09-05 09:53:30	4254	performance	90	-4.4444447
37518	2022-09-05 09:53:40	4254	performance	100	10.0
37519	2022-09-05 09:53:50	4254	performance	97	-3.0927835
37520	2022-09-05 09:54:00	4254	performance	91	-6.593407
37521	2022-09-05 09:53:00	4785	performance	92	100.0
37522	2022-09-05 09:53:10	4785	performance	93	1.0752689
37523	2022-09-05 09:53:20	4785	performance	100	7.0
37524	2022-09-05 09:53:30	4785	performance	92	-8.695652
37525	2022-09-05 09:53:40	4785	performance	95	3.1578946
37526	2022-09-05 09:53:50	4785	performance	100	5.0
37527	2022-09-05 09:54:00	4785	performance	92	-8.695652
37528	2022-09-05 09:53:00	4786	performance	96	100.0
37529	2022-09-05 09:53:10	4786	performance	91	-5.4945054
37530	2022-09-05 09:53:20	4786	performance	94	3.1914895
37531	2022-09-05 09:53:30	4786	performance	94	0.0
37532	2022-09-05 09:53:40	4786	performance	94	0.0
37533	2022-09-05 09:53:50	4786	performance	90	-4.4444447
37534	2022-09-05 09:54:00	4786	performance	97	7.2164946
37535	2022-09-05 09:53:00	4047	performance	91	100.0
37536	2022-09-05 09:53:10	4047	performance	95	4.2105265
37537	2022-09-05 09:53:20	4047	performance	93	-2.1505377
37538	2022-09-05 09:53:30	4047	performance	94	1.0638298
37539	2022-09-05 09:53:40	4047	performance	95	1.0526316
37540	2022-09-05 09:53:50	4047	performance	100	5.0
37541	2022-09-05 09:54:00	4047	performance	99	-1.010101
37542	2022-09-05 09:53:00	4048	performance	100	100.0
37543	2022-09-05 09:53:10	4048	performance	90	-11.111112
37544	2022-09-05 09:53:20	4048	performance	95	5.263158
37545	2022-09-05 09:53:30	4048	performance	91	-4.3956046
37546	2022-09-05 09:53:40	4048	performance	95	4.2105265
37547	2022-09-05 09:53:50	4048	performance	95	0.0
37548	2022-09-05 09:54:00	4048	performance	92	-3.2608695
37549	2022-09-05 09:53:00	4787	performance	99	100.0
37550	2022-09-05 09:53:10	4787	performance	93	-6.4516125
37551	2022-09-05 09:53:20	4787	performance	99	6.060606
37552	2022-09-05 09:53:30	4787	performance	92	-7.6086955
37553	2022-09-05 09:53:40	4787	performance	91	-1.0989012
37554	2022-09-05 09:53:50	4787	performance	91	0.0
37555	2022-09-05 09:54:00	4787	performance	90	-1.1111112
37556	2022-09-05 09:53:00	4255	performance	100	100.0
37557	2022-09-05 09:53:10	4255	performance	90	-11.111112
37558	2022-09-05 09:53:20	4255	performance	92	2.173913
37559	2022-09-05 09:53:30	4255	performance	99	7.070707
37560	2022-09-05 09:53:40	4255	performance	98	-1.0204082
37561	2022-09-05 09:53:50	4255	performance	93	-5.376344
37562	2022-09-05 09:54:00	4255	performance	95	2.1052632
37563	2022-09-05 09:53:00	4256	performance	95	100.0
37564	2022-09-05 09:53:10	4256	performance	100	5.0
37565	2022-09-05 09:53:20	4256	performance	99	-1.010101
37566	2022-09-05 09:53:30	4256	performance	94	-5.319149
37567	2022-09-05 09:53:40	4256	performance	100	6.0
37568	2022-09-05 09:53:50	4256	performance	97	-3.0927835
37569	2022-09-05 09:54:00	4256	performance	90	-7.777778
37570	2022-09-05 09:53:00	4495	performance	100	100.0
37571	2022-09-05 09:53:10	4495	performance	92	-8.695652
37572	2022-09-05 09:53:20	4495	performance	100	8.0
37573	2022-09-05 09:53:30	4495	performance	99	-1.010101
37574	2022-09-05 09:53:40	4495	performance	93	-6.4516125
37575	2022-09-05 09:53:50	4495	performance	97	4.123711
37576	2022-09-05 09:54:00	4495	performance	91	-6.593407
37577	2022-09-05 09:53:00	4496	performance	92	100.0
37578	2022-09-05 09:53:10	4496	performance	93	1.0752689
37579	2022-09-05 09:53:20	4496	performance	96	3.125
37580	2022-09-05 09:53:30	4496	performance	98	2.0408163
37581	2022-09-05 09:53:40	4496	performance	91	-7.692308
37582	2022-09-05 09:53:50	4496	performance	97	6.185567
37583	2022-09-05 09:54:00	4496	performance	92	-5.4347825
37584	2022-09-05 09:53:00	4788	performance	96	100.0
37585	2022-09-05 09:53:10	4788	performance	99	3.030303
37586	2022-09-05 09:53:20	4788	performance	97	-2.0618556
37587	2022-09-05 09:53:30	4788	performance	90	-7.777778
37588	2022-09-05 09:53:40	4788	performance	91	1.0989012
37589	2022-09-05 09:53:50	4788	performance	94	3.1914895
37590	2022-09-05 09:54:00	4788	performance	96	2.0833335
37591	2022-09-05 09:53:00	4789	performance	98	100.0
37592	2022-09-05 09:53:10	4789	performance	90	-8.888889
37593	2022-09-05 09:53:20	4789	performance	95	5.263158
37594	2022-09-05 09:53:30	4789	performance	100	5.0
37595	2022-09-05 09:53:40	4789	performance	90	-11.111112
37596	2022-09-05 09:53:50	4789	performance	90	0.0
37597	2022-09-05 09:54:00	4789	performance	93	3.2258062
37598	2022-09-05 09:53:00	4790	performance	94	100.0
37599	2022-09-05 09:53:10	4790	performance	92	-2.173913
37600	2022-09-05 09:53:20	4790	performance	92	0.0
37601	2022-09-05 09:53:30	4790	performance	96	4.166667
37602	2022-09-05 09:53:40	4790	performance	96	0.0
37603	2022-09-05 09:53:50	4790	performance	92	-4.347826
37604	2022-09-05 09:54:00	4790	performance	92	0.0
37605	2022-09-05 09:53:00	4497	performance	98	100.0
37606	2022-09-05 09:53:10	4497	performance	97	-1.0309278
37607	2022-09-05 09:53:20	4497	performance	90	-7.777778
37608	2022-09-05 09:53:30	4497	performance	90	0.0
37609	2022-09-05 09:53:40	4497	performance	91	1.0989012
37610	2022-09-05 09:53:50	4497	performance	100	9.0
37611	2022-09-05 09:54:00	4497	performance	95	-5.263158
37612	2022-09-05 09:53:00	4049	performance	97	100.0
37613	2022-09-05 09:53:10	4049	performance	92	-5.4347825
37614	2022-09-05 09:53:20	4049	performance	91	-1.0989012
37615	2022-09-05 09:53:30	4049	performance	92	1.0869565
37616	2022-09-05 09:53:40	4049	performance	96	4.166667
37617	2022-09-05 09:53:50	4049	performance	94	-2.1276596
37618	2022-09-05 09:54:00	4049	performance	96	2.0833335
37619	2022-09-05 09:53:00	4257	performance	92	100.0
37620	2022-09-05 09:53:10	4257	performance	95	3.1578946
37621	2022-09-05 09:53:20	4257	performance	95	0.0
37622	2022-09-05 09:53:30	4257	performance	93	-2.1505377
37623	2022-09-05 09:53:40	4257	performance	99	6.060606
37624	2022-09-05 09:53:50	4257	performance	91	-8.791209
37625	2022-09-05 09:54:00	4257	performance	97	6.185567
37626	2022-09-05 09:53:00	4258	performance	94	100.0
37627	2022-09-05 09:53:10	4258	performance	100	6.0
37628	2022-09-05 09:53:20	4258	performance	95	-5.263158
37629	2022-09-05 09:53:30	4258	performance	94	-1.0638298
37630	2022-09-05 09:53:40	4258	performance	99	5.050505
37631	2022-09-05 09:53:50	4258	performance	90	-10.0
37632	2022-09-05 09:54:00	4258	performance	91	1.0989012
37633	2022-09-05 09:53:00	4791	performance	95	100.0
37634	2022-09-05 09:53:10	4791	performance	92	-3.2608695
37635	2022-09-05 09:53:20	4791	performance	91	-1.0989012
37636	2022-09-05 09:53:30	4791	performance	96	5.208333
37637	2022-09-05 09:53:40	4791	performance	96	0.0
37638	2022-09-05 09:53:50	4791	performance	90	-6.666667
37639	2022-09-05 09:54:00	4791	performance	98	8.163265
37640	2022-09-05 09:53:00	4050	performance	98	100.0
37641	2022-09-05 09:53:10	4050	performance	92	-6.521739
37642	2022-09-05 09:53:20	4050	performance	97	5.1546392
37643	2022-09-05 09:53:30	4050	performance	90	-7.777778
37644	2022-09-05 09:53:40	4050	performance	98	8.163265
37645	2022-09-05 09:53:50	4050	performance	94	-4.255319
37646	2022-09-05 09:54:00	4050	performance	99	5.050505
37647	2022-09-05 09:53:00	4498	performance	99	100.0
37648	2022-09-05 09:53:10	4498	performance	93	-6.4516125
37649	2022-09-05 09:53:20	4498	performance	94	1.0638298
37650	2022-09-05 09:53:30	4498	performance	93	-1.0752689
37651	2022-09-05 09:53:40	4498	performance	94	1.0638298
37652	2022-09-05 09:53:50	4498	performance	92	-2.173913
37653	2022-09-05 09:54:00	4498	performance	95	3.1578946
37654	2022-09-05 09:53:00	4792	performance	98	100.0
37655	2022-09-05 09:53:10	4792	performance	96	-2.0833335
37656	2022-09-05 09:53:20	4792	performance	90	-6.666667
37657	2022-09-05 09:53:30	4792	performance	100	10.0
37658	2022-09-05 09:53:40	4792	performance	90	-11.111112
37659	2022-09-05 09:53:50	4792	performance	93	3.2258062
37660	2022-09-05 09:54:00	4792	performance	95	2.1052632
37661	2022-09-05 09:53:00	4793	performance	100	100.0
37662	2022-09-05 09:53:10	4793	performance	93	-7.526882
37663	2022-09-05 09:53:20	4793	performance	94	1.0638298
37664	2022-09-05 09:53:30	4793	performance	90	-4.4444447
37665	2022-09-05 09:53:40	4793	performance	99	9.090909
37666	2022-09-05 09:53:50	4793	performance	92	-7.6086955
37667	2022-09-05 09:54:00	4793	performance	94	2.1276596
37668	2022-09-05 09:53:00	4259	performance	97	100.0
37669	2022-09-05 09:53:10	4259	performance	96	-1.0416667
37670	2022-09-05 09:53:20	4259	performance	90	-6.666667
37671	2022-09-05 09:53:30	4259	performance	100	10.0
37672	2022-09-05 09:53:40	4259	performance	91	-9.89011
37673	2022-09-05 09:53:50	4259	performance	95	4.2105265
37674	2022-09-05 09:54:00	4259	performance	98	3.0612245
37675	2022-09-05 09:53:00	4499	performance	99	100.0
37676	2022-09-05 09:53:10	4499	performance	94	-5.319149
37677	2022-09-05 09:53:20	4499	performance	97	3.0927835
37678	2022-09-05 09:53:30	4499	performance	90	-7.777778
37679	2022-09-05 09:53:40	4499	performance	90	0.0
37680	2022-09-05 09:53:50	4499	performance	94	4.255319
37681	2022-09-05 09:54:00	4499	performance	91	-3.2967036
37682	2022-09-05 09:53:00	4500	performance	96	100.0
37683	2022-09-05 09:53:10	4500	performance	90	-6.666667
37684	2022-09-05 09:53:20	4500	performance	99	9.090909
37685	2022-09-05 09:53:30	4500	performance	98	-1.0204082
37686	2022-09-05 09:53:40	4500	performance	97	-1.0309278
37687	2022-09-05 09:53:50	4500	performance	98	1.0204082
37688	2022-09-05 09:54:00	4500	performance	97	-1.0309278
37689	2022-09-05 09:53:00	4260	performance	98	100.0
37690	2022-09-05 09:53:10	4260	performance	98	0.0
37691	2022-09-05 09:53:20	4260	performance	97	-1.0309278
37692	2022-09-05 09:53:30	4260	performance	95	-2.1052632
37693	2022-09-05 09:53:40	4260	performance	99	4.040404
37694	2022-09-05 09:53:50	4260	performance	96	-3.125
37695	2022-09-05 09:54:00	4260	performance	94	-2.1276596
37696	2022-09-05 09:53:00	4794	performance	93	100.0
37697	2022-09-05 09:53:10	4794	performance	97	4.123711
37698	2022-09-05 09:53:20	4794	performance	92	-5.4347825
37699	2022-09-05 09:53:30	4794	performance	95	3.1578946
37700	2022-09-05 09:53:40	4794	performance	90	-5.555556
37701	2022-09-05 09:53:50	4794	performance	94	4.255319
37702	2022-09-05 09:54:00	4794	performance	91	-3.2967036
37703	2022-09-05 09:53:00	4795	performance	91	100.0
37704	2022-09-05 09:53:10	4795	performance	90	-1.1111112
37705	2022-09-05 09:53:20	4795	performance	99	9.090909
37706	2022-09-05 09:53:30	4795	performance	98	-1.0204082
37707	2022-09-05 09:53:40	4795	performance	93	-5.376344
37708	2022-09-05 09:53:50	4795	performance	90	-3.3333335
37709	2022-09-05 09:54:00	4795	performance	96	6.25
37710	2022-09-05 09:53:00	4051	performance	98	100.0
37711	2022-09-05 09:53:10	4051	performance	98	0.0
37712	2022-09-05 09:53:20	4051	performance	95	-3.1578946
37713	2022-09-05 09:53:30	4051	performance	97	2.0618556
37714	2022-09-05 09:53:40	4051	performance	98	1.0204082
37715	2022-09-05 09:53:50	4051	performance	99	1.010101
37716	2022-09-05 09:54:00	4051	performance	90	-10.0
37717	2022-09-05 09:53:00	4052	performance	100	100.0
37718	2022-09-05 09:53:10	4052	performance	99	-1.010101
37719	2022-09-05 09:53:20	4052	performance	92	-7.6086955
37720	2022-09-05 09:53:30	4052	performance	99	7.070707
37721	2022-09-05 09:53:40	4052	performance	95	-4.2105265
37722	2022-09-05 09:53:50	4052	performance	98	3.0612245
37723	2022-09-05 09:54:00	4052	performance	98	0.0
37724	2022-09-05 09:53:00	4796	performance	94	100.0
37725	2022-09-05 09:53:10	4796	performance	98	4.0816326
37726	2022-09-05 09:53:20	4796	performance	98	0.0
37727	2022-09-05 09:53:30	4796	performance	96	-2.0833335
37728	2022-09-05 09:53:40	4796	performance	100	4.0
37729	2022-09-05 09:53:50	4796	performance	99	-1.010101
37730	2022-09-05 09:54:00	4796	performance	95	-4.2105265
37731	2022-09-05 09:53:00	4261	performance	92	100.0
37732	2022-09-05 09:53:10	4261	performance	92	0.0
37733	2022-09-05 09:53:20	4261	performance	94	2.1276596
37734	2022-09-05 09:53:30	4261	performance	99	5.050505
37735	2022-09-05 09:53:40	4261	performance	97	-2.0618556
37736	2022-09-05 09:53:50	4261	performance	92	-5.4347825
37737	2022-09-05 09:54:00	4261	performance	92	0.0
37738	2022-09-05 09:53:00	4262	performance	97	100.0
37739	2022-09-05 09:53:10	4262	performance	98	1.0204082
37740	2022-09-05 09:53:20	4262	performance	95	-3.1578946
37741	2022-09-05 09:53:30	4262	performance	93	-2.1505377
37742	2022-09-05 09:53:40	4262	performance	92	-1.0869565
37743	2022-09-05 09:53:50	4262	performance	92	0.0
37744	2022-09-05 09:54:00	4262	performance	93	1.0752689
37745	2022-09-05 09:53:00	4501	performance	90	100.0
37746	2022-09-05 09:53:10	4501	performance	94	4.255319
37747	2022-09-05 09:53:20	4501	performance	94	0.0
37748	2022-09-05 09:53:30	4501	performance	90	-4.4444447
37749	2022-09-05 09:53:40	4501	performance	95	5.263158
37750	2022-09-05 09:53:50	4501	performance	98	3.0612245
37751	2022-09-05 09:54:00	4501	performance	95	-3.1578946
37752	2022-09-05 09:53:00	4502	performance	96	100.0
37753	2022-09-05 09:53:10	4502	performance	90	-6.666667
37754	2022-09-05 09:53:20	4502	performance	99	9.090909
37755	2022-09-05 09:53:30	4502	performance	90	-10.0
37756	2022-09-05 09:53:40	4502	performance	94	4.255319
37757	2022-09-05 09:53:50	4502	performance	98	4.0816326
37758	2022-09-05 09:54:00	4502	performance	90	-8.888889
37759	2022-09-05 09:53:00	4797	performance	100	100.0
37760	2022-09-05 09:53:10	4797	performance	92	-8.695652
37761	2022-09-05 09:53:20	4797	performance	95	3.1578946
37762	2022-09-05 09:53:30	4797	performance	92	-3.2608695
37763	2022-09-05 09:53:40	4797	performance	99	7.070707
37764	2022-09-05 09:53:50	4797	performance	94	-5.319149
37765	2022-09-05 09:54:00	4797	performance	98	4.0816326
37766	2022-09-05 09:53:00	4798	performance	93	100.0
37767	2022-09-05 09:53:10	4798	performance	98	5.102041
37768	2022-09-05 09:53:20	4798	performance	91	-7.692308
37769	2022-09-05 09:53:30	4798	performance	94	3.1914895
37770	2022-09-05 09:53:40	4798	performance	96	2.0833335
37771	2022-09-05 09:53:50	4798	performance	97	1.0309278
37772	2022-09-05 09:54:00	4798	performance	93	-4.3010755
37773	2022-09-05 09:53:00	4799	performance	99	100.0
37774	2022-09-05 09:53:10	4799	performance	95	-4.2105265
37775	2022-09-05 09:53:20	4799	performance	90	-5.555556
37776	2022-09-05 09:53:30	4799	performance	97	7.2164946
37777	2022-09-05 09:53:40	4799	performance	98	1.0204082
37778	2022-09-05 09:53:50	4799	performance	92	-6.521739
37779	2022-09-05 09:54:00	4799	performance	94	2.1276596
37780	2022-09-05 09:53:00	4503	performance	95	100.0
37781	2022-09-05 09:53:10	4503	performance	96	1.0416667
37782	2022-09-05 09:53:20	4503	performance	94	-2.1276596
37783	2022-09-05 09:53:30	4503	performance	99	5.050505
37784	2022-09-05 09:53:40	4503	performance	96	-3.125
37785	2022-09-05 09:53:50	4503	performance	91	-5.4945054
37786	2022-09-05 09:54:00	4503	performance	91	0.0
37787	2022-09-05 09:53:00	4053	performance	91	100.0
37788	2022-09-05 09:53:10	4053	performance	93	2.1505377
37789	2022-09-05 09:53:20	4053	performance	100	7.0
37790	2022-09-05 09:53:30	4053	performance	100	0.0
37791	2022-09-05 09:53:40	4053	performance	90	-11.111112
37792	2022-09-05 09:53:50	4053	performance	97	7.2164946
37793	2022-09-05 09:54:00	4053	performance	90	-7.777778
37794	2022-09-05 09:53:00	4263	performance	96	100.0
37795	2022-09-05 09:53:10	4263	performance	90	-6.666667
37796	2022-09-05 09:53:20	4263	performance	93	3.2258062
37797	2022-09-05 09:53:30	4263	performance	98	5.102041
37798	2022-09-05 09:53:40	4263	performance	94	-4.255319
37799	2022-09-05 09:53:50	4263	performance	93	-1.0752689
37800	2022-09-05 09:54:00	4263	performance	96	3.125
37801	2022-09-05 09:53:00	4264	performance	90	100.0
37802	2022-09-05 09:53:10	4264	performance	93	3.2258062
37803	2022-09-05 09:53:20	4264	performance	93	0.0
37804	2022-09-05 09:53:30	4264	performance	92	-1.0869565
37805	2022-09-05 09:53:40	4264	performance	92	0.0
37806	2022-09-05 09:53:50	4264	performance	98	6.122449
37807	2022-09-05 09:54:00	4264	performance	94	-4.255319
37808	2022-09-05 09:53:00	4800	performance	90	100.0
37809	2022-09-05 09:53:10	4800	performance	99	9.090909
37810	2022-09-05 09:53:20	4800	performance	94	-5.319149
37811	2022-09-05 09:53:30	4800	performance	99	5.050505
37812	2022-09-05 09:53:40	4800	performance	94	-5.319149
37813	2022-09-05 09:53:50	4800	performance	91	-3.2967036
37814	2022-09-05 09:54:00	4800	performance	93	2.1505377
37815	2022-09-05 09:53:00	4054	performance	99	100.0
37816	2022-09-05 09:53:10	4054	performance	90	-10.0
37817	2022-09-05 09:53:20	4054	performance	98	8.163265
37818	2022-09-05 09:53:30	4054	performance	90	-8.888889
37819	2022-09-05 09:53:40	4054	performance	91	1.0989012
37820	2022-09-05 09:53:50	4054	performance	96	5.208333
37821	2022-09-05 09:54:00	4054	performance	95	-1.0526316
37822	2022-09-05 09:53:00	4504	performance	90	100.0
37823	2022-09-05 09:53:10	4504	performance	97	7.2164946
37824	2022-09-05 09:53:20	4504	performance	93	-4.3010755
37825	2022-09-05 09:53:30	4504	performance	92	-1.0869565
37826	2022-09-05 09:53:40	4504	performance	96	4.166667
37827	2022-09-05 09:53:50	4504	performance	100	4.0
37828	2022-09-05 09:54:00	4504	performance	95	-5.263158
37829	2022-09-05 09:53:00	4801	performance	93	100.0
37830	2022-09-05 09:53:10	4801	performance	96	3.125
37831	2022-09-05 09:53:20	4801	performance	94	-2.1276596
37832	2022-09-05 09:53:30	4801	performance	95	1.0526316
37833	2022-09-05 09:53:40	4801	performance	97	2.0618556
37834	2022-09-05 09:53:50	4801	performance	99	2.020202
37835	2022-09-05 09:54:00	4801	performance	96	-3.125
37836	2022-09-05 09:53:00	4802	performance	92	100.0
37837	2022-09-05 09:53:10	4802	performance	96	4.166667
37838	2022-09-05 09:53:20	4802	performance	92	-4.347826
37839	2022-09-05 09:53:30	4802	performance	98	6.122449
37840	2022-09-05 09:53:40	4802	performance	97	-1.0309278
37841	2022-09-05 09:53:50	4802	performance	92	-5.4347825
37842	2022-09-05 09:54:00	4802	performance	98	6.122449
37843	2022-09-05 09:53:00	4265	performance	99	100.0
37844	2022-09-05 09:53:10	4265	performance	97	-2.0618556
37845	2022-09-05 09:53:20	4265	performance	94	-3.1914895
37846	2022-09-05 09:53:30	4265	performance	96	2.0833335
37847	2022-09-05 09:53:40	4265	performance	100	4.0
37848	2022-09-05 09:53:50	4265	performance	99	-1.010101
37849	2022-09-05 09:54:00	4265	performance	96	-3.125
37850	2022-09-05 09:53:00	4505	performance	91	100.0
37851	2022-09-05 09:53:10	4505	performance	90	-1.1111112
37852	2022-09-05 09:53:20	4505	performance	95	5.263158
37853	2022-09-05 09:53:30	4505	performance	100	5.0
37854	2022-09-05 09:53:40	4505	performance	99	-1.010101
37855	2022-09-05 09:53:50	4505	performance	97	-2.0618556
37856	2022-09-05 09:54:00	4505	performance	98	1.0204082
37857	2022-09-05 09:53:00	4506	performance	95	100.0
37858	2022-09-05 09:53:10	4506	performance	95	0.0
37859	2022-09-05 09:53:20	4506	performance	96	1.0416667
37860	2022-09-05 09:53:30	4506	performance	96	0.0
37861	2022-09-05 09:53:40	4506	performance	99	3.030303
37862	2022-09-05 09:53:50	4506	performance	95	-4.2105265
37863	2022-09-05 09:54:00	4506	performance	97	2.0618556
37864	2022-09-05 09:53:00	4266	performance	91	100.0
37865	2022-09-05 09:53:10	4266	performance	96	5.208333
37866	2022-09-05 09:53:20	4266	performance	100	4.0
37867	2022-09-05 09:53:30	4266	performance	90	-11.111112
37868	2022-09-05 09:53:40	4266	performance	95	5.263158
37869	2022-09-05 09:53:50	4266	performance	96	1.0416667
37870	2022-09-05 09:54:00	4266	performance	97	1.0309278
37871	2022-09-05 09:53:00	4803	performance	96	100.0
37872	2022-09-05 09:53:10	4803	performance	95	-1.0526316
37873	2022-09-05 09:53:20	4803	performance	95	0.0
37874	2022-09-05 09:53:30	4803	performance	98	3.0612245
37875	2022-09-05 09:53:40	4803	performance	92	-6.521739
37876	2022-09-05 09:53:50	4803	performance	98	6.122449
37877	2022-09-05 09:54:00	4803	performance	94	-4.255319
37878	2022-09-05 09:53:00	4804	performance	92	100.0
37879	2022-09-05 09:53:10	4804	performance	98	6.122449
37880	2022-09-05 09:53:20	4804	performance	92	-6.521739
37881	2022-09-05 09:53:30	4804	performance	98	6.122449
37882	2022-09-05 09:53:40	4804	performance	100	2.0
37883	2022-09-05 09:53:50	4804	performance	98	-2.0408163
37884	2022-09-05 09:54:00	4804	performance	99	1.010101
37885	2022-09-05 09:53:00	4055	performance	95	100.0
37886	2022-09-05 09:53:10	4055	performance	92	-3.2608695
37887	2022-09-05 09:53:20	4055	performance	100	8.0
37888	2022-09-05 09:53:30	4055	performance	98	-2.0408163
37889	2022-09-05 09:53:40	4055	performance	100	2.0
37890	2022-09-05 09:53:50	4055	performance	90	-11.111112
37891	2022-09-05 09:54:00	4055	performance	99	9.090909
37892	2022-09-05 09:53:00	4056	performance	90	100.0
37893	2022-09-05 09:53:10	4056	performance	91	1.0989012
37894	2022-09-05 09:53:20	4056	performance	95	4.2105265
37895	2022-09-05 09:53:30	4056	performance	97	2.0618556
37896	2022-09-05 09:53:40	4056	performance	99	2.020202
37897	2022-09-05 09:53:50	4056	performance	91	-8.791209
37898	2022-09-05 09:54:00	4056	performance	94	3.1914895
37899	2022-09-05 09:53:00	4805	performance	96	100.0
37900	2022-09-05 09:53:10	4805	performance	90	-6.666667
37901	2022-09-05 09:53:20	4805	performance	96	6.25
37902	2022-09-05 09:53:30	4805	performance	99	3.030303
37903	2022-09-05 09:53:40	4805	performance	98	-1.0204082
37904	2022-09-05 09:53:50	4805	performance	94	-4.255319
37905	2022-09-05 09:54:00	4805	performance	90	-4.4444447
37906	2022-09-05 09:53:00	4267	performance	99	100.0
37907	2022-09-05 09:53:10	4267	performance	92	-7.6086955
37908	2022-09-05 09:53:20	4267	performance	91	-1.0989012
37909	2022-09-05 09:53:30	4267	performance	98	7.1428576
37910	2022-09-05 09:53:40	4267	performance	94	-4.255319
37911	2022-09-05 09:53:50	4267	performance	92	-2.173913
37912	2022-09-05 09:54:00	4267	performance	96	4.166667
37913	2022-09-05 09:53:00	4268	performance	94	100.0
37914	2022-09-05 09:53:10	4268	performance	97	3.0927835
37915	2022-09-05 09:53:20	4268	performance	97	0.0
37916	2022-09-05 09:53:30	4268	performance	90	-7.777778
37917	2022-09-05 09:53:40	4268	performance	95	5.263158
37918	2022-09-05 09:53:50	4268	performance	98	3.0612245
37919	2022-09-05 09:54:00	4268	performance	90	-8.888889
37920	2022-09-05 09:53:00	4507	performance	100	100.0
37921	2022-09-05 09:53:10	4507	performance	91	-9.89011
37922	2022-09-05 09:53:20	4507	performance	92	1.0869565
37923	2022-09-05 09:53:30	4507	performance	94	2.1276596
37924	2022-09-05 09:53:40	4507	performance	100	6.0
37925	2022-09-05 09:53:50	4507	performance	95	-5.263158
37926	2022-09-05 09:54:00	4507	performance	100	5.0
37927	2022-09-05 09:53:00	4508	performance	96	100.0
37928	2022-09-05 09:53:10	4508	performance	93	-3.2258062
37929	2022-09-05 09:53:20	4508	performance	99	6.060606
37930	2022-09-05 09:53:30	4508	performance	97	-2.0618556
37931	2022-09-05 09:53:40	4508	performance	93	-4.3010755
37932	2022-09-05 09:53:50	4508	performance	91	-2.1978023
37933	2022-09-05 09:54:00	4508	performance	97	6.185567
37934	2022-09-05 09:53:00	4806	performance	93	100.0
37935	2022-09-05 09:53:10	4806	performance	97	4.123711
37936	2022-09-05 09:53:20	4806	performance	96	-1.0416667
37937	2022-09-05 09:53:30	4806	performance	100	4.0
37938	2022-09-05 09:53:40	4806	performance	99	-1.010101
37939	2022-09-05 09:53:50	4806	performance	94	-5.319149
37940	2022-09-05 09:54:00	4806	performance	97	3.0927835
37941	2022-09-05 09:53:00	4807	performance	92	100.0
37942	2022-09-05 09:53:10	4807	performance	90	-2.2222223
37943	2022-09-05 09:53:20	4807	performance	99	9.090909
37944	2022-09-05 09:53:30	4807	performance	100	1.0
37945	2022-09-05 09:53:40	4807	performance	97	-3.0927835
37946	2022-09-05 09:53:50	4807	performance	98	1.0204082
37947	2022-09-05 09:54:00	4807	performance	91	-7.692308
37948	2022-09-05 09:53:00	4808	performance	96	100.0
37949	2022-09-05 09:53:10	4808	performance	100	4.0
37950	2022-09-05 09:53:20	4808	performance	97	-3.0927835
37951	2022-09-05 09:53:30	4808	performance	99	2.020202
37952	2022-09-05 09:53:40	4808	performance	93	-6.4516125
37953	2022-09-05 09:53:50	4808	performance	98	5.102041
37954	2022-09-05 09:54:00	4808	performance	96	-2.0833335
37955	2022-09-05 09:53:00	4509	performance	95	100.0
37956	2022-09-05 09:53:10	4509	performance	90	-5.555556
37957	2022-09-05 09:53:20	4509	performance	93	3.2258062
37958	2022-09-05 09:53:30	4509	performance	95	2.1052632
37959	2022-09-05 09:53:40	4509	performance	94	-1.0638298
37960	2022-09-05 09:53:50	4509	performance	95	1.0526316
37961	2022-09-05 09:54:00	4509	performance	93	-2.1505377
37962	2022-09-05 09:53:00	4057	performance	90	100.0
37963	2022-09-05 09:53:10	4057	performance	90	0.0
37964	2022-09-05 09:53:20	4057	performance	93	3.2258062
37965	2022-09-05 09:53:30	4057	performance	100	7.0
37966	2022-09-05 09:53:40	4057	performance	94	-6.382979
37967	2022-09-05 09:53:50	4057	performance	92	-2.173913
37968	2022-09-05 09:54:00	4057	performance	95	3.1578946
37969	2022-09-05 09:53:00	4269	performance	96	100.0
37970	2022-09-05 09:53:10	4269	performance	93	-3.2258062
37971	2022-09-05 09:53:20	4269	performance	93	0.0
37972	2022-09-05 09:53:30	4269	performance	99	6.060606
37973	2022-09-05 09:53:40	4269	performance	96	-3.125
37974	2022-09-05 09:53:50	4269	performance	99	3.030303
37975	2022-09-05 09:54:00	4269	performance	97	-2.0618556
37976	2022-09-05 09:53:00	4270	performance	100	100.0
37977	2022-09-05 09:53:10	4270	performance	91	-9.89011
37978	2022-09-05 09:53:20	4270	performance	99	8.080808
37979	2022-09-05 09:53:30	4270	performance	100	1.0
37980	2022-09-05 09:53:40	4270	performance	95	-5.263158
37981	2022-09-05 09:53:50	4270	performance	98	3.0612245
37982	2022-09-05 09:54:00	4270	performance	95	-3.1578946
37983	2022-09-05 09:53:00	4809	performance	96	100.0
37984	2022-09-05 09:53:10	4809	performance	97	1.0309278
37985	2022-09-05 09:53:20	4809	performance	95	-2.1052632
37986	2022-09-05 09:53:30	4809	performance	95	0.0
37987	2022-09-05 09:53:40	4809	performance	97	2.0618556
37988	2022-09-05 09:53:50	4809	performance	95	-2.1052632
37989	2022-09-05 09:54:00	4809	performance	98	3.0612245
37990	2022-09-05 09:53:00	4058	performance	98	100.0
37991	2022-09-05 09:53:10	4058	performance	94	-4.255319
37992	2022-09-05 09:53:20	4058	performance	91	-3.2967036
37993	2022-09-05 09:53:30	4058	performance	99	8.080808
37994	2022-09-05 09:53:40	4058	performance	93	-6.4516125
37995	2022-09-05 09:53:50	4058	performance	91	-2.1978023
37996	2022-09-05 09:54:00	4058	performance	97	6.185567
37997	2022-09-05 09:53:00	4059	performance	90	100.0
37998	2022-09-05 09:53:10	4059	performance	96	6.25
37999	2022-09-05 09:53:20	4059	performance	92	-4.347826
38000	2022-09-05 09:53:30	4059	performance	94	2.1276596
38001	2022-09-05 09:53:40	4059	performance	96	2.0833335
38002	2022-09-05 09:53:50	4059	performance	95	-1.0526316
38003	2022-09-05 09:54:00	4059	performance	93	-2.1505377
38004	2022-09-05 09:53:00	4810	performance	95	100.0
38005	2022-09-05 09:53:10	4810	performance	90	-5.555556
38006	2022-09-05 09:53:20	4810	performance	99	9.090909
38007	2022-09-05 09:53:30	4810	performance	91	-8.791209
38008	2022-09-05 09:53:40	4810	performance	98	7.1428576
38009	2022-09-05 09:53:50	4810	performance	95	-3.1578946
38010	2022-09-05 09:54:00	4810	performance	95	0.0
38011	2022-09-05 09:53:00	4811	performance	100	100.0
38012	2022-09-05 09:53:10	4811	performance	94	-6.382979
38013	2022-09-05 09:53:20	4811	performance	92	-2.173913
38014	2022-09-05 09:53:30	4811	performance	98	6.122449
38015	2022-09-05 09:53:40	4811	performance	91	-7.692308
38016	2022-09-05 09:53:50	4811	performance	98	7.1428576
38017	2022-09-05 09:54:00	4811	performance	96	-2.0833335
38018	2022-09-05 09:53:00	4271	performance	93	100.0
38019	2022-09-05 09:53:10	4271	performance	91	-2.1978023
38020	2022-09-05 09:53:20	4271	performance	91	0.0
38021	2022-09-05 09:53:30	4271	performance	93	2.1505377
38022	2022-09-05 09:53:40	4271	performance	100	7.0
38023	2022-09-05 09:53:50	4271	performance	95	-5.263158
38024	2022-09-05 09:54:00	4271	performance	98	3.0612245
38025	2022-09-05 09:53:00	4061	performance	95	100.0
38026	2022-09-05 09:53:10	4061	performance	98	3.0612245
38027	2022-09-05 09:53:20	4061	performance	91	-7.692308
38028	2022-09-05 09:53:30	4061	performance	96	5.208333
38029	2022-09-05 09:53:40	4061	performance	96	0.0
38030	2022-09-05 09:53:50	4061	performance	95	-1.0526316
38031	2022-09-05 09:54:00	4061	performance	91	-4.3956046
38032	2022-09-05 09:53:00	4062	performance	91	100.0
38033	2022-09-05 09:53:10	4062	performance	96	5.208333
38034	2022-09-05 09:53:20	4062	performance	100	4.0
38035	2022-09-05 09:53:30	4062	performance	96	-4.166667
38036	2022-09-05 09:53:40	4062	performance	94	-2.1276596
38037	2022-09-05 09:53:50	4062	performance	94	0.0
38038	2022-09-05 09:54:00	4062	performance	93	-1.0752689
38039	2022-09-05 09:53:00	4272	performance	92	100.0
38040	2022-09-05 09:53:10	4272	performance	90	-2.2222223
38041	2022-09-05 09:53:20	4272	performance	95	5.263158
38042	2022-09-05 09:53:30	4272	performance	94	-1.0638298
38043	2022-09-05 09:53:40	4272	performance	90	-4.4444447
38044	2022-09-05 09:53:50	4272	performance	92	2.173913
38045	2022-09-05 09:54:00	4272	performance	98	6.122449
38046	2022-09-05 09:53:00	4812	performance	92	100.0
38047	2022-09-05 09:53:10	4812	performance	96	4.166667
38048	2022-09-05 09:53:20	4812	performance	100	4.0
38049	2022-09-05 09:53:30	4812	performance	99	-1.010101
38050	2022-09-05 09:53:40	4812	performance	94	-5.319149
38051	2022-09-05 09:53:50	4812	performance	95	1.0526316
38052	2022-09-05 09:54:00	4812	performance	94	-1.0638298
38053	2022-09-05 09:53:00	4813	performance	96	100.0
38054	2022-09-05 09:53:10	4813	performance	92	-4.347826
38055	2022-09-05 09:53:20	4813	performance	95	3.1578946
38056	2022-09-05 09:53:30	4813	performance	95	0.0
38057	2022-09-05 09:53:40	4813	performance	96	1.0416667
38058	2022-09-05 09:53:50	4813	performance	92	-4.347826
38059	2022-09-05 09:54:00	4813	performance	92	0.0
38060	2022-09-05 09:53:00	4063	performance	90	100.0
38061	2022-09-05 09:53:10	4063	performance	97	7.2164946
38062	2022-09-05 09:53:20	4063	performance	93	-4.3010755
38063	2022-09-05 09:53:30	4063	performance	90	-3.3333335
38064	2022-09-05 09:53:40	4063	performance	98	8.163265
38065	2022-09-05 09:53:50	4063	performance	96	-2.0833335
38066	2022-09-05 09:54:00	4063	performance	94	-2.1276596
38067	2022-09-05 09:53:00	4510	performance	99	100.0
38068	2022-09-05 09:53:10	4510	performance	93	-6.4516125
38069	2022-09-05 09:53:20	4510	performance	95	2.1052632
38070	2022-09-05 09:53:30	4510	performance	93	-2.1505377
38071	2022-09-05 09:53:40	4510	performance	99	6.060606
38072	2022-09-05 09:53:50	4510	performance	98	-1.0204082
38073	2022-09-05 09:54:00	4510	performance	92	-6.521739
38074	2022-09-05 09:53:00	4814	performance	91	100.0
38075	2022-09-05 09:53:10	4814	performance	91	0.0
38076	2022-09-05 09:53:20	4814	performance	100	9.0
38077	2022-09-05 09:53:30	4814	performance	93	-7.526882
38078	2022-09-05 09:53:40	4814	performance	90	-3.3333335
38079	2022-09-05 09:53:50	4814	performance	91	1.0989012
38080	2022-09-05 09:54:00	4814	performance	93	2.1505377
38081	2022-09-05 09:53:00	4273	performance	90	100.0
38082	2022-09-05 09:53:10	4273	performance	99	9.090909
38083	2022-09-05 09:53:20	4273	performance	94	-5.319149
38084	2022-09-05 09:53:30	4273	performance	97	3.0927835
38085	2022-09-05 09:53:40	4273	performance	90	-7.777778
38086	2022-09-05 09:53:50	4273	performance	100	10.0
38087	2022-09-05 09:54:00	4273	performance	93	-7.526882
38088	2022-09-05 09:53:00	4274	performance	98	100.0
38089	2022-09-05 09:53:10	4274	performance	98	0.0
38090	2022-09-05 09:53:20	4274	performance	97	-1.0309278
38091	2022-09-05 09:53:30	4274	performance	97	0.0
38092	2022-09-05 09:53:40	4274	performance	96	-1.0416667
38093	2022-09-05 09:53:50	4274	performance	98	2.0408163
38094	2022-09-05 09:54:00	4274	performance	90	-8.888889
38095	2022-09-05 09:53:00	4064	performance	92	100.0
38096	2022-09-05 09:53:10	4064	performance	98	6.122449
38097	2022-09-05 09:53:20	4064	performance	94	-4.255319
38098	2022-09-05 09:53:30	4064	performance	96	2.0833335
38099	2022-09-05 09:53:40	4064	performance	94	-2.1276596
38100	2022-09-05 09:53:50	4064	performance	100	6.0
38101	2022-09-05 09:54:00	4064	performance	96	-4.166667
38102	2022-09-05 09:53:00	4065	performance	100	100.0
38103	2022-09-05 09:53:10	4065	performance	97	-3.0927835
38104	2022-09-05 09:53:20	4065	performance	93	-4.3010755
38105	2022-09-05 09:53:30	4065	performance	95	2.1052632
38106	2022-09-05 09:53:40	4065	performance	98	3.0612245
38107	2022-09-05 09:53:50	4065	performance	93	-5.376344
38108	2022-09-05 09:54:00	4065	performance	100	7.0
38109	2022-09-05 09:53:00	4815	performance	91	100.0
38110	2022-09-05 09:53:10	4815	performance	96	5.208333
38111	2022-09-05 09:53:20	4815	performance	95	-1.0526316
38112	2022-09-05 09:53:30	4815	performance	99	4.040404
38113	2022-09-05 09:53:40	4815	performance	98	-1.0204082
38114	2022-09-05 09:53:50	4815	performance	90	-8.888889
38115	2022-09-05 09:54:00	4815	performance	91	1.0989012
38116	2022-09-05 09:53:00	4816	performance	95	100.0
38117	2022-09-05 09:53:10	4816	performance	100	5.0
38118	2022-09-05 09:53:20	4816	performance	93	-7.526882
38119	2022-09-05 09:53:30	4816	performance	99	6.060606
38120	2022-09-05 09:53:40	4816	performance	90	-10.0
38121	2022-09-05 09:53:50	4816	performance	94	4.255319
38122	2022-09-05 09:54:00	4816	performance	100	6.0
38123	2022-09-05 09:53:00	4817	performance	100	100.0
38124	2022-09-05 09:53:10	4817	performance	100	0.0
38125	2022-09-05 09:53:20	4817	performance	91	-9.89011
38126	2022-09-05 09:53:30	4817	performance	97	6.185567
38127	2022-09-05 09:53:40	4817	performance	100	3.0
38128	2022-09-05 09:53:50	4817	performance	96	-4.166667
38129	2022-09-05 09:54:00	4817	performance	91	-5.4945054
38130	2022-09-05 09:53:00	4511	performance	100	100.0
38131	2022-09-05 09:53:10	4511	performance	92	-8.695652
38132	2022-09-05 09:53:20	4511	performance	96	4.166667
38133	2022-09-05 09:53:30	4511	performance	96	0.0
38134	2022-09-05 09:53:40	4511	performance	96	0.0
38135	2022-09-05 09:53:50	4511	performance	99	3.030303
38136	2022-09-05 09:54:00	4511	performance	91	-8.791209
38137	2022-09-05 09:53:00	4512	performance	100	100.0
38138	2022-09-05 09:53:10	4512	performance	97	-3.0927835
38139	2022-09-05 09:53:20	4512	performance	99	2.020202
38140	2022-09-05 09:53:30	4512	performance	100	1.0
38141	2022-09-05 09:53:40	4512	performance	93	-7.526882
38142	2022-09-05 09:53:50	4512	performance	98	5.102041
38143	2022-09-05 09:54:00	4512	performance	98	0.0
38144	2022-09-05 09:53:00	4275	performance	97	100.0
38145	2022-09-05 09:53:10	4275	performance	96	-1.0416667
38146	2022-09-05 09:53:20	4275	performance	91	-5.4945054
38147	2022-09-05 09:53:30	4275	performance	97	6.185567
38148	2022-09-05 09:53:40	4275	performance	90	-7.777778
38149	2022-09-05 09:53:50	4275	performance	98	8.163265
38150	2022-09-05 09:54:00	4275	performance	92	-6.521739
38151	2022-09-05 09:53:00	4276	performance	92	100.0
38152	2022-09-05 09:53:10	4276	performance	95	3.1578946
38153	2022-09-05 09:53:20	4276	performance	95	0.0
38154	2022-09-05 09:53:30	4276	performance	93	-2.1505377
38155	2022-09-05 09:53:40	4276	performance	99	6.060606
38156	2022-09-05 09:53:50	4276	performance	98	-1.0204082
38157	2022-09-05 09:54:00	4276	performance	98	0.0
38158	2022-09-05 09:53:00	4818	performance	100	100.0
38159	2022-09-05 09:53:10	4818	performance	99	-1.010101
38160	2022-09-05 09:53:20	4818	performance	90	-10.0
38161	2022-09-05 09:53:30	4818	performance	92	2.173913
38162	2022-09-05 09:53:40	4818	performance	93	1.0752689
38163	2022-09-05 09:53:50	4818	performance	96	3.125
38164	2022-09-05 09:54:00	4818	performance	91	-5.4945054
38165	2022-09-05 09:53:00	4513	performance	94	100.0
38166	2022-09-05 09:53:10	4513	performance	96	2.0833335
38167	2022-09-05 09:53:20	4513	performance	91	-5.4945054
38168	2022-09-05 09:53:30	4513	performance	94	3.1914895
38169	2022-09-05 09:53:40	4513	performance	99	5.050505
38170	2022-09-05 09:53:50	4513	performance	90	-10.0
38171	2022-09-05 09:54:00	4513	performance	95	5.263158
38172	2022-09-05 09:53:00	4066	performance	97	100.0
38173	2022-09-05 09:53:10	4066	performance	97	0.0
38174	2022-09-05 09:53:20	4066	performance	90	-7.777778
38175	2022-09-05 09:53:30	4066	performance	93	3.2258062
38176	2022-09-05 09:53:40	4066	performance	100	7.0
38177	2022-09-05 09:53:50	4066	performance	95	-5.263158
38178	2022-09-05 09:54:00	4066	performance	91	-4.3956046
38179	2022-09-05 09:53:00	4819	performance	93	100.0
38180	2022-09-05 09:53:10	4819	performance	99	6.060606
38181	2022-09-05 09:53:20	4819	performance	91	-8.791209
38182	2022-09-05 09:53:30	4819	performance	97	6.185567
38183	2022-09-05 09:53:40	4819	performance	93	-4.3010755
38184	2022-09-05 09:53:50	4819	performance	92	-1.0869565
38185	2022-09-05 09:54:00	4819	performance	93	1.0752689
38186	2022-09-05 09:53:00	4820	performance	95	100.0
38187	2022-09-05 09:53:10	4820	performance	93	-2.1505377
38188	2022-09-05 09:53:20	4820	performance	90	-3.3333335
38189	2022-09-05 09:53:30	4820	performance	99	9.090909
38190	2022-09-05 09:53:40	4820	performance	95	-4.2105265
38191	2022-09-05 09:53:50	4820	performance	94	-1.0638298
38192	2022-09-05 09:54:00	4820	performance	92	-2.173913
38193	2022-09-05 09:53:00	4277	performance	92	100.0
38194	2022-09-05 09:53:10	4277	performance	95	3.1578946
38195	2022-09-05 09:53:20	4277	performance	99	4.040404
38196	2022-09-05 09:53:30	4277	performance	100	1.0
38197	2022-09-05 09:53:40	4277	performance	98	-2.0408163
38198	2022-09-05 09:53:50	4277	performance	91	-7.692308
38199	2022-09-05 09:54:00	4277	performance	95	4.2105265
38200	2022-09-05 09:53:00	4067	performance	100	100.0
38201	2022-09-05 09:53:10	4067	performance	93	-7.526882
38202	2022-09-05 09:53:20	4067	performance	90	-3.3333335
38203	2022-09-05 09:53:30	4067	performance	93	3.2258062
38204	2022-09-05 09:53:40	4067	performance	97	4.123711
38205	2022-09-05 09:53:50	4067	performance	94	-3.1914895
38206	2022-09-05 09:54:00	4067	performance	90	-4.4444447
38207	2022-09-05 09:53:00	4514	performance	93	100.0
38208	2022-09-05 09:53:10	4514	performance	91	-2.1978023
38209	2022-09-05 09:53:20	4514	performance	100	9.0
38210	2022-09-05 09:53:30	4514	performance	95	-5.263158
38211	2022-09-05 09:53:40	4514	performance	92	-3.2608695
38212	2022-09-05 09:53:50	4514	performance	100	8.0
38213	2022-09-05 09:54:00	4514	performance	91	-9.89011
38214	2022-09-05 09:53:00	4278	performance	91	100.0
38215	2022-09-05 09:53:10	4278	performance	100	9.0
38216	2022-09-05 09:53:20	4278	performance	90	-11.111112
38217	2022-09-05 09:53:30	4278	performance	99	9.090909
38218	2022-09-05 09:53:40	4278	performance	96	-3.125
38219	2022-09-05 09:53:50	4278	performance	95	-1.0526316
38220	2022-09-05 09:54:00	4278	performance	96	1.0416667
38221	2022-09-05 09:53:00	4821	performance	92	100.0
38222	2022-09-05 09:53:10	4821	performance	94	2.1276596
38223	2022-09-05 09:53:20	4821	performance	94	0.0
38224	2022-09-05 09:53:30	4821	performance	99	5.050505
38225	2022-09-05 09:53:40	4821	performance	96	-3.125
38226	2022-09-05 09:53:50	4821	performance	96	0.0
38227	2022-09-05 09:54:00	4821	performance	95	-1.0526316
38228	2022-09-05 09:53:00	4822	performance	92	100.0
38229	2022-09-05 09:53:10	4822	performance	96	4.166667
38230	2022-09-05 09:53:20	4822	performance	96	0.0
38231	2022-09-05 09:53:30	4822	performance	97	1.0309278
38232	2022-09-05 09:53:40	4822	performance	94	-3.1914895
38233	2022-09-05 09:53:50	4822	performance	90	-4.4444447
38234	2022-09-05 09:54:00	4822	performance	93	3.2258062
38235	2022-09-05 09:53:00	4515	performance	99	100.0
38236	2022-09-05 09:53:10	4515	performance	99	0.0
38237	2022-09-05 09:53:20	4515	performance	98	-1.0204082
38238	2022-09-05 09:53:30	4515	performance	96	-2.0833335
38239	2022-09-05 09:53:40	4515	performance	99	3.030303
38240	2022-09-05 09:53:50	4515	performance	95	-4.2105265
38241	2022-09-05 09:54:00	4515	performance	90	-5.555556
38242	2022-09-05 09:53:00	4516	performance	98	100.0
38243	2022-09-05 09:53:10	4516	performance	92	-6.521739
38244	2022-09-05 09:53:20	4516	performance	99	7.070707
38245	2022-09-05 09:53:30	4516	performance	96	-3.125
38246	2022-09-05 09:53:40	4516	performance	95	-1.0526316
38247	2022-09-05 09:53:50	4516	performance	95	0.0
38248	2022-09-05 09:54:00	4516	performance	91	-4.3956046
38249	2022-09-05 09:53:00	4823	performance	93	100.0
38250	2022-09-05 09:53:10	4823	performance	99	6.060606
38251	2022-09-05 09:53:20	4823	performance	91	-8.791209
38252	2022-09-05 09:53:30	4823	performance	100	9.0
38253	2022-09-05 09:53:40	4823	performance	91	-9.89011
38254	2022-09-05 09:53:50	4823	performance	96	5.208333
38255	2022-09-05 09:54:00	4823	performance	98	2.0408163
38256	2022-09-05 09:53:00	4279	performance	93	100.0
38257	2022-09-05 09:53:10	4279	performance	96	3.125
38258	2022-09-05 09:53:20	4279	performance	97	1.0309278
38259	2022-09-05 09:53:30	4279	performance	92	-5.4347825
38260	2022-09-05 09:53:40	4279	performance	96	4.166667
38261	2022-09-05 09:53:50	4279	performance	98	2.0408163
38262	2022-09-05 09:54:00	4279	performance	98	0.0
38263	2022-09-05 09:53:00	4280	performance	100	100.0
38264	2022-09-05 09:53:10	4280	performance	90	-11.111112
38265	2022-09-05 09:53:20	4280	performance	94	4.255319
38266	2022-09-05 09:53:30	4280	performance	96	2.0833335
38267	2022-09-05 09:53:40	4280	performance	96	0.0
38268	2022-09-05 09:53:50	4280	performance	91	-5.4945054
38269	2022-09-05 09:54:00	4280	performance	99	8.080808
38270	2022-09-05 09:53:00	4068	performance	98	100.0
38271	2022-09-05 09:53:10	4068	performance	90	-8.888889
38272	2022-09-05 09:53:20	4068	performance	100	10.0
38273	2022-09-05 09:53:30	4068	performance	92	-8.695652
38274	2022-09-05 09:53:40	4068	performance	100	8.0
38275	2022-09-05 09:53:50	4068	performance	97	-3.0927835
38276	2022-09-05 09:54:00	4068	performance	100	3.0
38277	2022-09-05 09:53:00	4069	performance	97	100.0
38278	2022-09-05 09:53:10	4069	performance	97	0.0
38279	2022-09-05 09:53:20	4069	performance	100	3.0
38280	2022-09-05 09:53:30	4069	performance	93	-7.526882
38281	2022-09-05 09:53:40	4069	performance	90	-3.3333335
38282	2022-09-05 09:53:50	4069	performance	100	10.0
38283	2022-09-05 09:54:00	4069	performance	96	-4.166667
38284	2022-09-05 09:53:00	4824	performance	93	100.0
38285	2022-09-05 09:53:10	4824	performance	91	-2.1978023
38286	2022-09-05 09:53:20	4824	performance	90	-1.1111112
38287	2022-09-05 09:53:30	4824	performance	91	1.0989012
38288	2022-09-05 09:53:40	4824	performance	96	5.208333
38289	2022-09-05 09:53:50	4824	performance	91	-5.4945054
38290	2022-09-05 09:54:00	4824	performance	90	-1.1111112
38291	2022-09-05 09:53:00	4825	performance	92	100.0
38292	2022-09-05 09:53:10	4825	performance	94	2.1276596
38293	2022-09-05 09:53:20	4825	performance	97	3.0927835
38294	2022-09-05 09:53:30	4825	performance	90	-7.777778
38295	2022-09-05 09:53:40	4825	performance	93	3.2258062
38296	2022-09-05 09:53:50	4825	performance	94	1.0638298
38297	2022-09-05 09:54:00	4825	performance	95	1.0526316
38298	2022-09-05 09:53:00	4826	performance	96	100.0
38299	2022-09-05 09:53:10	4826	performance	95	-1.0526316
38300	2022-09-05 09:53:20	4826	performance	95	0.0
38301	2022-09-05 09:53:30	4826	performance	100	5.0
38302	2022-09-05 09:53:40	4826	performance	91	-9.89011
38303	2022-09-05 09:53:50	4826	performance	92	1.0869565
38304	2022-09-05 09:54:00	4826	performance	99	7.070707
38305	2022-09-05 09:53:00	4517	performance	92	100.0
38306	2022-09-05 09:53:10	4517	performance	94	2.1276596
38307	2022-09-05 09:53:20	4517	performance	99	5.050505
38308	2022-09-05 09:53:30	4517	performance	97	-2.0618556
38309	2022-09-05 09:53:40	4517	performance	94	-3.1914895
38310	2022-09-05 09:53:50	4517	performance	99	5.050505
38311	2022-09-05 09:54:00	4517	performance	97	-2.0618556
38312	2022-09-05 09:53:00	4518	performance	95	100.0
38313	2022-09-05 09:53:10	4518	performance	96	1.0416667
38314	2022-09-05 09:53:20	4518	performance	99	3.030303
38315	2022-09-05 09:53:30	4518	performance	94	-5.319149
38316	2022-09-05 09:53:40	4518	performance	95	1.0526316
38317	2022-09-05 09:53:50	4518	performance	97	2.0618556
38318	2022-09-05 09:54:00	4518	performance	94	-3.1914895
38319	2022-09-05 09:53:00	4281	performance	99	100.0
38320	2022-09-05 09:53:10	4281	performance	90	-10.0
38321	2022-09-05 09:53:20	4281	performance	90	0.0
38322	2022-09-05 09:53:30	4281	performance	98	8.163265
38323	2022-09-05 09:53:40	4281	performance	92	-6.521739
38324	2022-09-05 09:53:50	4281	performance	94	2.1276596
38325	2022-09-05 09:54:00	4281	performance	100	6.0
38326	2022-09-05 09:53:00	4282	performance	91	100.0
38327	2022-09-05 09:53:10	4282	performance	94	3.1914895
38328	2022-09-05 09:53:20	4282	performance	91	-3.2967036
38329	2022-09-05 09:53:30	4282	performance	90	-1.1111112
38330	2022-09-05 09:53:40	4282	performance	90	0.0
38331	2022-09-05 09:53:50	4282	performance	91	1.0989012
38332	2022-09-05 09:54:00	4282	performance	96	5.208333
38333	2022-09-05 09:53:00	4827	performance	92	100.0
38334	2022-09-05 09:53:10	4827	performance	90	-2.2222223
38335	2022-09-05 09:53:20	4827	performance	95	5.263158
38336	2022-09-05 09:53:30	4827	performance	97	2.0618556
38337	2022-09-05 09:53:40	4827	performance	92	-5.4347825
38338	2022-09-05 09:53:50	4827	performance	98	6.122449
38339	2022-09-05 09:54:00	4827	performance	99	1.010101
38340	2022-09-05 09:53:00	4519	performance	95	100.0
38341	2022-09-05 09:53:10	4519	performance	90	-5.555556
38342	2022-09-05 09:53:20	4519	performance	92	2.173913
38343	2022-09-05 09:53:30	4519	performance	93	1.0752689
38344	2022-09-05 09:53:40	4519	performance	99	6.060606
38345	2022-09-05 09:53:50	4519	performance	96	-3.125
38346	2022-09-05 09:54:00	4519	performance	98	2.0408163
38347	2022-09-05 09:53:00	4070	performance	94	100.0
38348	2022-09-05 09:53:10	4070	performance	96	2.0833335
38349	2022-09-05 09:53:20	4070	performance	100	4.0
38350	2022-09-05 09:53:30	4070	performance	97	-3.0927835
38351	2022-09-05 09:53:40	4070	performance	95	-2.1052632
38352	2022-09-05 09:53:50	4070	performance	93	-2.1505377
38353	2022-09-05 09:54:00	4070	performance	96	3.125
38354	2022-09-05 09:53:00	4828	performance	91	100.0
38355	2022-09-05 09:53:10	4828	performance	94	3.1914895
38356	2022-09-05 09:53:20	4828	performance	98	4.0816326
38357	2022-09-05 09:53:30	4828	performance	98	0.0
38358	2022-09-05 09:53:40	4828	performance	100	2.0
38359	2022-09-05 09:53:50	4828	performance	97	-3.0927835
38360	2022-09-05 09:54:00	4828	performance	97	0.0
38361	2022-09-05 09:53:00	4829	performance	98	100.0
38362	2022-09-05 09:53:10	4829	performance	91	-7.692308
38363	2022-09-05 09:53:20	4829	performance	99	8.080808
38364	2022-09-05 09:53:30	4829	performance	92	-7.6086955
38365	2022-09-05 09:53:40	4829	performance	93	1.0752689
38366	2022-09-05 09:53:50	4829	performance	97	4.123711
38367	2022-09-05 09:54:00	4829	performance	99	2.020202
38368	2022-09-05 09:53:00	4283	performance	91	100.0
38369	2022-09-05 09:53:10	4283	performance	96	5.208333
38370	2022-09-05 09:53:20	4283	performance	95	-1.0526316
38371	2022-09-05 09:53:30	4283	performance	97	2.0618556
38372	2022-09-05 09:53:40	4283	performance	93	-4.3010755
38373	2022-09-05 09:53:50	4283	performance	97	4.123711
38374	2022-09-05 09:54:00	4283	performance	95	-2.1052632
38375	2022-09-05 09:53:00	4071	performance	95	100.0
38376	2022-09-05 09:53:10	4071	performance	95	0.0
38377	2022-09-05 09:53:20	4071	performance	99	4.040404
38378	2022-09-05 09:53:30	4071	performance	100	1.0
38379	2022-09-05 09:53:40	4071	performance	99	-1.010101
38380	2022-09-05 09:53:50	4071	performance	91	-8.791209
38381	2022-09-05 09:54:00	4071	performance	95	4.2105265
38382	2022-09-05 09:53:00	4520	performance	99	100.0
38383	2022-09-05 09:53:10	4520	performance	96	-3.125
38384	2022-09-05 09:53:20	4520	performance	95	-1.0526316
38385	2022-09-05 09:53:30	4520	performance	95	0.0
38386	2022-09-05 09:53:40	4520	performance	99	4.040404
38387	2022-09-05 09:53:50	4520	performance	100	1.0
38388	2022-09-05 09:54:00	4520	performance	90	-11.111112
38389	2022-09-05 09:53:00	4284	performance	95	100.0
38390	2022-09-05 09:53:10	4284	performance	96	1.0416667
38391	2022-09-05 09:53:20	4284	performance	98	2.0408163
38392	2022-09-05 09:53:30	4284	performance	94	-4.255319
38393	2022-09-05 09:53:40	4284	performance	96	2.0833335
38394	2022-09-05 09:53:50	4284	performance	95	-1.0526316
38395	2022-09-05 09:54:00	4284	performance	93	-2.1505377
38396	2022-09-05 09:53:00	4830	performance	91	100.0
38397	2022-09-05 09:53:10	4830	performance	97	6.185567
38398	2022-09-05 09:53:20	4830	performance	100	3.0
38399	2022-09-05 09:53:30	4830	performance	96	-4.166667
38400	2022-09-05 09:53:40	4830	performance	97	1.0309278
38401	2022-09-05 09:53:50	4830	performance	91	-6.593407
38402	2022-09-05 09:54:00	4830	performance	99	8.080808
38403	2022-09-05 09:53:00	4831	performance	100	100.0
38404	2022-09-05 09:53:10	4831	performance	93	-7.526882
38405	2022-09-05 09:53:20	4831	performance	97	4.123711
38406	2022-09-05 09:53:30	4831	performance	94	-3.1914895
38407	2022-09-05 09:53:40	4831	performance	91	-3.2967036
38408	2022-09-05 09:53:50	4831	performance	99	8.080808
38409	2022-09-05 09:54:00	4831	performance	93	-6.4516125
38410	2022-09-05 09:53:00	4521	performance	95	100.0
38411	2022-09-05 09:53:10	4521	performance	100	5.0
38412	2022-09-05 09:53:20	4521	performance	95	-5.263158
38413	2022-09-05 09:53:30	4521	performance	90	-5.555556
38414	2022-09-05 09:53:40	4521	performance	90	0.0
38415	2022-09-05 09:53:50	4521	performance	97	7.2164946
38416	2022-09-05 09:54:00	4521	performance	100	3.0
38417	2022-09-05 09:53:00	4522	performance	98	100.0
38418	2022-09-05 09:53:10	4522	performance	96	-2.0833335
38419	2022-09-05 09:53:20	4522	performance	93	-3.2258062
38420	2022-09-05 09:53:30	4522	performance	97	4.123711
38421	2022-09-05 09:53:40	4522	performance	94	-3.1914895
38422	2022-09-05 09:53:50	4522	performance	99	5.050505
38423	2022-09-05 09:54:00	4522	performance	97	-2.0618556
38424	2022-09-05 09:53:00	4832	performance	91	100.0
38425	2022-09-05 09:53:10	4832	performance	98	7.1428576
38426	2022-09-05 09:53:20	4832	performance	97	-1.0309278
38427	2022-09-05 09:53:30	4832	performance	93	-4.3010755
38428	2022-09-05 09:53:40	4832	performance	96	3.125
38429	2022-09-05 09:53:50	4832	performance	98	2.0408163
38430	2022-09-05 09:54:00	4832	performance	92	-6.521739
38431	2022-09-05 09:53:00	4285	performance	95	100.0
38432	2022-09-05 09:53:10	4285	performance	98	3.0612245
38433	2022-09-05 09:53:20	4285	performance	94	-4.255319
38434	2022-09-05 09:53:30	4285	performance	97	3.0927835
38435	2022-09-05 09:53:40	4285	performance	100	3.0
38436	2022-09-05 09:53:50	4285	performance	97	-3.0927835
38437	2022-09-05 09:54:00	4285	performance	93	-4.3010755
38438	2022-09-05 09:53:00	4286	performance	92	100.0
38439	2022-09-05 09:53:10	4286	performance	99	7.070707
38440	2022-09-05 09:53:20	4286	performance	98	-1.0204082
38441	2022-09-05 09:53:30	4286	performance	98	0.0
38442	2022-09-05 09:53:40	4286	performance	100	2.0
38443	2022-09-05 09:53:50	4286	performance	94	-6.382979
38444	2022-09-05 09:54:00	4286	performance	95	1.0526316
38445	2022-09-05 09:53:00	4072	performance	99	100.0
38446	2022-09-05 09:53:10	4072	performance	94	-5.319149
38447	2022-09-05 09:53:20	4072	performance	97	3.0927835
38448	2022-09-05 09:53:30	4072	performance	90	-7.777778
38449	2022-09-05 09:53:40	4072	performance	93	3.2258062
38450	2022-09-05 09:53:50	4072	performance	100	7.0
38451	2022-09-05 09:54:00	4072	performance	97	-3.0927835
38452	2022-09-05 09:53:00	4073	performance	97	100.0
38453	2022-09-05 09:53:10	4073	performance	97	0.0
38454	2022-09-05 09:53:20	4073	performance	98	1.0204082
38455	2022-09-05 09:53:30	4073	performance	99	1.010101
38456	2022-09-05 09:53:40	4073	performance	91	-8.791209
38457	2022-09-05 09:53:50	4073	performance	97	6.185567
38458	2022-09-05 09:54:00	4073	performance	91	-6.593407
38459	2022-09-05 09:53:00	4833	performance	97	100.0
38460	2022-09-05 09:53:10	4833	performance	91	-6.593407
38461	2022-09-05 09:53:20	4833	performance	93	2.1505377
38462	2022-09-05 09:53:30	4833	performance	92	-1.0869565
38463	2022-09-05 09:53:40	4833	performance	92	0.0
38464	2022-09-05 09:53:50	4833	performance	96	4.166667
38465	2022-09-05 09:54:00	4833	performance	97	1.0309278
38466	2022-09-05 09:53:00	4834	performance	95	100.0
38467	2022-09-05 09:53:10	4834	performance	97	2.0618556
38468	2022-09-05 09:53:20	4834	performance	100	3.0
38469	2022-09-05 09:53:30	4834	performance	98	-2.0408163
38470	2022-09-05 09:53:40	4834	performance	95	-3.1578946
38471	2022-09-05 09:53:50	4834	performance	98	3.0612245
38472	2022-09-05 09:54:00	4834	performance	99	1.010101
38473	2022-09-05 09:53:00	4835	performance	95	100.0
38474	2022-09-05 09:53:10	4835	performance	100	5.0
38475	2022-09-05 09:53:20	4835	performance	92	-8.695652
38476	2022-09-05 09:53:30	4835	performance	91	-1.0989012
38477	2022-09-05 09:53:40	4835	performance	96	5.208333
38478	2022-09-05 09:53:50	4835	performance	96	0.0
38479	2022-09-05 09:54:00	4835	performance	91	-5.4945054
38480	2022-09-05 09:53:00	4523	performance	96	100.0
38481	2022-09-05 09:53:10	4523	performance	93	-3.2258062
38482	2022-09-05 09:53:20	4523	performance	96	3.125
38483	2022-09-05 09:53:30	4523	performance	93	-3.2258062
38484	2022-09-05 09:53:40	4523	performance	96	3.125
38485	2022-09-05 09:53:50	4523	performance	98	2.0408163
38486	2022-09-05 09:54:00	4523	performance	96	-2.0833335
38487	2022-09-05 09:53:00	4524	performance	94	100.0
38488	2022-09-05 09:53:10	4524	performance	95	1.0526316
38489	2022-09-05 09:53:20	4524	performance	92	-3.2608695
38490	2022-09-05 09:53:30	4524	performance	96	4.166667
38491	2022-09-05 09:53:40	4524	performance	97	1.0309278
38492	2022-09-05 09:53:50	4524	performance	92	-5.4347825
38493	2022-09-05 09:54:00	4524	performance	95	3.1578946
38494	2022-09-05 09:53:00	4287	performance	93	100.0
38495	2022-09-05 09:53:10	4287	performance	97	4.123711
38496	2022-09-05 09:53:20	4287	performance	92	-5.4347825
38497	2022-09-05 09:53:30	4287	performance	99	7.070707
38498	2022-09-05 09:53:40	4287	performance	91	-8.791209
38499	2022-09-05 09:53:50	4287	performance	95	4.2105265
38500	2022-09-05 09:54:00	4287	performance	94	-1.0638298
38501	2022-09-05 09:53:00	4288	performance	98	100.0
38502	2022-09-05 09:53:10	4288	performance	93	-5.376344
38503	2022-09-05 09:53:20	4288	performance	92	-1.0869565
38504	2022-09-05 09:53:30	4288	performance	95	3.1578946
38505	2022-09-05 09:53:40	4288	performance	99	4.040404
38506	2022-09-05 09:53:50	4288	performance	94	-5.319149
38507	2022-09-05 09:54:00	4288	performance	97	3.0927835
38508	2022-09-05 09:53:00	4836	performance	98	100.0
38509	2022-09-05 09:53:10	4836	performance	98	0.0
38510	2022-09-05 09:53:20	4836	performance	100	2.0
38511	2022-09-05 09:53:30	4836	performance	92	-8.695652
38512	2022-09-05 09:53:40	4836	performance	94	2.1276596
38513	2022-09-05 09:53:50	4836	performance	98	4.0816326
38514	2022-09-05 09:54:00	4836	performance	94	-4.255319
38515	2022-09-05 09:53:00	4525	performance	95	100.0
38516	2022-09-05 09:53:10	4525	performance	99	4.040404
38517	2022-09-05 09:53:20	4525	performance	91	-8.791209
38518	2022-09-05 09:53:30	4525	performance	99	8.080808
38519	2022-09-05 09:53:40	4525	performance	94	-5.319149
38520	2022-09-05 09:53:50	4525	performance	98	4.0816326
38521	2022-09-05 09:54:00	4525	performance	98	0.0
38522	2022-09-05 09:53:00	4074	performance	94	100.0
38523	2022-09-05 09:53:10	4074	performance	91	-3.2967036
38524	2022-09-05 09:53:20	4074	performance	100	9.0
38525	2022-09-05 09:53:30	4074	performance	90	-11.111112
38526	2022-09-05 09:53:40	4074	performance	97	7.2164946
38527	2022-09-05 09:53:50	4074	performance	99	2.020202
38528	2022-09-05 09:54:00	4074	performance	100	1.0
38529	2022-09-05 09:53:00	4837	performance	93	100.0
38530	2022-09-05 09:53:10	4837	performance	98	5.102041
38531	2022-09-05 09:53:20	4837	performance	94	-4.255319
38532	2022-09-05 09:53:30	4837	performance	94	0.0
38533	2022-09-05 09:53:40	4837	performance	96	2.0833335
38534	2022-09-05 09:53:50	4837	performance	95	-1.0526316
38535	2022-09-05 09:54:00	4837	performance	93	-2.1505377
38536	2022-09-05 09:53:00	4838	performance	99	100.0
38537	2022-09-05 09:53:10	4838	performance	100	1.0
38538	2022-09-05 09:53:20	4838	performance	90	-11.111112
38539	2022-09-05 09:53:30	4838	performance	100	10.0
38540	2022-09-05 09:53:40	4838	performance	95	-5.263158
38541	2022-09-05 09:53:50	4838	performance	92	-3.2608695
38542	2022-09-05 09:54:00	4838	performance	100	8.0
38543	2022-09-05 09:53:00	4289	performance	100	100.0
38544	2022-09-05 09:53:10	4289	performance	91	-9.89011
38545	2022-09-05 09:53:20	4289	performance	94	3.1914895
38546	2022-09-05 09:53:30	4289	performance	95	1.0526316
38547	2022-09-05 09:53:40	4289	performance	98	3.0612245
38548	2022-09-05 09:53:50	4289	performance	98	0.0
38549	2022-09-05 09:54:00	4289	performance	100	2.0
38550	2022-09-05 09:53:00	4075	performance	96	100.0
38551	2022-09-05 09:53:10	4075	performance	96	0.0
38552	2022-09-05 09:53:20	4075	performance	100	4.0
38553	2022-09-05 09:53:30	4075	performance	92	-8.695652
38554	2022-09-05 09:53:40	4075	performance	95	3.1578946
38555	2022-09-05 09:53:50	4075	performance	100	5.0
38556	2022-09-05 09:54:00	4075	performance	93	-7.526882
38557	2022-09-05 09:53:00	4526	performance	94	100.0
38558	2022-09-05 09:53:10	4526	performance	94	0.0
38559	2022-09-05 09:53:20	4526	performance	92	-2.173913
38560	2022-09-05 09:53:30	4526	performance	100	8.0
38561	2022-09-05 09:53:40	4526	performance	99	-1.010101
38562	2022-09-05 09:53:50	4526	performance	97	-2.0618556
38563	2022-09-05 09:54:00	4526	performance	97	0.0
38564	2022-09-05 09:53:00	4290	performance	96	100.0
38565	2022-09-05 09:53:10	4290	performance	96	0.0
38566	2022-09-05 09:53:20	4290	performance	98	2.0408163
38567	2022-09-05 09:53:30	4290	performance	98	0.0
38568	2022-09-05 09:53:40	4290	performance	95	-3.1578946
38569	2022-09-05 09:53:50	4290	performance	96	1.0416667
38570	2022-09-05 09:54:00	4290	performance	99	3.030303
38571	2022-09-05 09:53:00	4839	performance	96	100.0
38572	2022-09-05 09:53:10	4839	performance	95	-1.0526316
38573	2022-09-05 09:53:20	4839	performance	91	-4.3956046
38574	2022-09-05 09:53:30	4839	performance	97	6.185567
38575	2022-09-05 09:53:40	4839	performance	92	-5.4347825
38576	2022-09-05 09:53:50	4839	performance	92	0.0
38577	2022-09-05 09:54:00	4839	performance	93	1.0752689
38578	2022-09-05 09:53:00	4840	performance	93	100.0
38579	2022-09-05 09:53:10	4840	performance	92	-1.0869565
38580	2022-09-05 09:53:20	4840	performance	93	1.0752689
38581	2022-09-05 09:53:30	4840	performance	96	3.125
38582	2022-09-05 09:53:40	4840	performance	100	4.0
38583	2022-09-05 09:53:50	4840	performance	100	0.0
38584	2022-09-05 09:54:00	4840	performance	90	-11.111112
38585	2022-09-05 09:53:00	4527	performance	98	100.0
38586	2022-09-05 09:53:10	4527	performance	98	0.0
38587	2022-09-05 09:53:20	4527	performance	92	-6.521739
38588	2022-09-05 09:53:30	4527	performance	98	6.122449
38589	2022-09-05 09:53:40	4527	performance	92	-6.521739
38590	2022-09-05 09:53:50	4527	performance	94	2.1276596
38591	2022-09-05 09:54:00	4527	performance	98	4.0816326
38592	2022-09-05 09:53:00	4528	performance	92	100.0
38593	2022-09-05 09:53:10	4528	performance	99	7.070707
38594	2022-09-05 09:53:20	4528	performance	92	-7.6086955
38595	2022-09-05 09:53:30	4528	performance	100	8.0
38596	2022-09-05 09:53:40	4528	performance	97	-3.0927835
38597	2022-09-05 09:53:50	4528	performance	93	-4.3010755
38598	2022-09-05 09:54:00	4528	performance	98	5.102041
38599	2022-09-05 09:53:00	4841	performance	99	100.0
38600	2022-09-05 09:53:10	4841	performance	92	-7.6086955
38601	2022-09-05 09:53:20	4841	performance	98	6.122449
38602	2022-09-05 09:53:30	4841	performance	98	0.0
38603	2022-09-05 09:53:40	4841	performance	94	-4.255319
38604	2022-09-05 09:53:50	4841	performance	98	4.0816326
38605	2022-09-05 09:54:00	4841	performance	91	-7.692308
38606	2022-09-05 09:53:00	4291	performance	97	100.0
38607	2022-09-05 09:53:10	4291	performance	100	3.0
38608	2022-09-05 09:53:20	4291	performance	95	-5.263158
38609	2022-09-05 09:53:30	4291	performance	99	4.040404
38610	2022-09-05 09:53:40	4291	performance	90	-10.0
38611	2022-09-05 09:53:50	4291	performance	95	5.263158
38612	2022-09-05 09:54:00	4291	performance	90	-5.555556
38613	2022-09-05 09:53:00	4292	performance	98	100.0
38614	2022-09-05 09:53:10	4292	performance	96	-2.0833335
38615	2022-09-05 09:53:20	4292	performance	90	-6.666667
38616	2022-09-05 09:53:30	4292	performance	97	7.2164946
38617	2022-09-05 09:53:40	4292	performance	96	-1.0416667
38618	2022-09-05 09:53:50	4292	performance	96	0.0
38619	2022-09-05 09:54:00	4292	performance	93	-3.2258062
38620	2022-09-05 09:53:00	4076	performance	99	100.0
38621	2022-09-05 09:53:10	4076	performance	94	-5.319149
38622	2022-09-05 09:53:20	4076	performance	97	3.0927835
38623	2022-09-05 09:53:30	4076	performance	93	-4.3010755
38624	2022-09-05 09:53:40	4076	performance	97	4.123711
38625	2022-09-05 09:53:50	4076	performance	100	3.0
38626	2022-09-05 09:54:00	4076	performance	97	-3.0927835
38627	2022-09-05 09:53:00	4077	performance	90	100.0
38628	2022-09-05 09:53:10	4077	performance	93	3.2258062
38629	2022-09-05 09:53:20	4077	performance	97	4.123711
38630	2022-09-05 09:53:30	4077	performance	90	-7.777778
38631	2022-09-05 09:53:40	4077	performance	100	10.0
38632	2022-09-05 09:53:50	4077	performance	95	-5.263158
38633	2022-09-05 09:54:00	4077	performance	97	2.0618556
38634	2022-09-05 09:53:00	4842	performance	97	100.0
38635	2022-09-05 09:53:10	4842	performance	98	1.0204082
38636	2022-09-05 09:53:20	4842	performance	100	2.0
38637	2022-09-05 09:53:30	4842	performance	97	-3.0927835
38638	2022-09-05 09:53:40	4842	performance	94	-3.1914895
38639	2022-09-05 09:53:50	4842	performance	98	4.0816326
38640	2022-09-05 09:54:00	4842	performance	95	-3.1578946
38641	2022-09-05 09:53:00	4843	performance	93	100.0
38642	2022-09-05 09:53:10	4843	performance	96	3.125
38643	2022-09-05 09:53:20	4843	performance	98	2.0408163
38644	2022-09-05 09:53:30	4843	performance	93	-5.376344
38645	2022-09-05 09:53:40	4843	performance	100	7.0
38646	2022-09-05 09:53:50	4843	performance	98	-2.0408163
38647	2022-09-05 09:54:00	4843	performance	99	1.010101
38648	2022-09-05 09:53:00	4844	performance	92	100.0
38649	2022-09-05 09:53:10	4844	performance	95	3.1578946
38650	2022-09-05 09:53:20	4844	performance	90	-5.555556
38651	2022-09-05 09:53:30	4844	performance	96	6.25
38652	2022-09-05 09:53:40	4844	performance	93	-3.2258062
38653	2022-09-05 09:53:50	4844	performance	95	2.1052632
38654	2022-09-05 09:54:00	4844	performance	93	-2.1505377
38655	2022-09-05 09:53:00	4529	performance	93	100.0
38656	2022-09-05 09:53:10	4529	performance	92	-1.0869565
38657	2022-09-05 09:53:20	4529	performance	99	7.070707
38658	2022-09-05 09:53:30	4529	performance	95	-4.2105265
38659	2022-09-05 09:53:40	4529	performance	96	1.0416667
38660	2022-09-05 09:53:50	4529	performance	96	0.0
38661	2022-09-05 09:54:00	4529	performance	96	0.0
38662	2022-09-05 09:53:00	4530	performance	94	100.0
38663	2022-09-05 09:53:10	4530	performance	95	1.0526316
38664	2022-09-05 09:53:20	4530	performance	90	-5.555556
38665	2022-09-05 09:53:30	4530	performance	97	7.2164946
38666	2022-09-05 09:53:40	4530	performance	92	-5.4347825
38667	2022-09-05 09:53:50	4530	performance	99	7.070707
38668	2022-09-05 09:54:00	4530	performance	90	-10.0
38669	2022-09-05 09:53:00	4293	performance	96	100.0
38670	2022-09-05 09:53:10	4293	performance	92	-4.347826
38671	2022-09-05 09:53:20	4293	performance	92	0.0
38672	2022-09-05 09:53:30	4293	performance	100	8.0
38673	2022-09-05 09:53:40	4293	performance	98	-2.0408163
38674	2022-09-05 09:53:50	4293	performance	92	-6.521739
38675	2022-09-05 09:54:00	4293	performance	100	8.0
38676	2022-09-05 09:53:00	4294	performance	96	100.0
38677	2022-09-05 09:53:10	4294	performance	90	-6.666667
38678	2022-09-05 09:53:20	4294	performance	94	4.255319
38679	2022-09-05 09:53:30	4294	performance	92	-2.173913
38680	2022-09-05 09:53:40	4294	performance	99	7.070707
38681	2022-09-05 09:53:50	4294	performance	91	-8.791209
38682	2022-09-05 09:54:00	4294	performance	99	8.080808
38683	2022-09-05 09:53:00	4408	performance	93	100.0
38684	2022-09-05 09:53:10	4408	performance	93	0.0
38685	2022-09-05 09:53:20	4408	performance	90	-3.3333335
38686	2022-09-05 09:53:30	4408	performance	99	9.090909
38687	2022-09-05 09:53:40	4408	performance	95	-4.2105265
38688	2022-09-05 09:53:50	4408	performance	95	0.0
38689	2022-09-05 09:54:00	4408	performance	93	-2.1505377
38690	2022-09-05 09:53:00	4668	performance	92	100.0
38691	2022-09-05 09:53:10	4668	performance	98	6.122449
38692	2022-09-05 09:53:20	4668	performance	91	-7.692308
38693	2022-09-05 09:53:30	4668	performance	97	6.185567
38694	2022-09-05 09:53:40	4668	performance	90	-7.777778
38695	2022-09-05 09:53:50	4668	performance	90	0.0
38696	2022-09-05 09:54:00	4668	performance	93	3.2258062
38697	2022-09-05 09:53:00	4845	performance	90	100.0
38698	2022-09-05 09:53:10	4845	performance	90	0.0
38699	2022-09-05 09:53:20	4845	performance	97	7.2164946
38700	2022-09-05 09:53:30	4845	performance	91	-6.593407
38701	2022-09-05 09:53:40	4845	performance	92	1.0869565
38702	2022-09-05 09:53:50	4845	performance	94	2.1276596
38703	2022-09-05 09:54:00	4845	performance	94	0.0
38704	2022-09-05 09:53:00	4531	performance	97	100.0
38705	2022-09-05 09:53:10	4531	performance	91	-6.593407
38706	2022-09-05 09:53:20	4531	performance	98	7.1428576
38707	2022-09-05 09:53:30	4531	performance	100	2.0
38708	2022-09-05 09:53:40	4531	performance	90	-11.111112
38709	2022-09-05 09:53:50	4531	performance	90	0.0
38710	2022-09-05 09:54:00	4531	performance	98	8.163265
38711	2022-09-05 09:53:00	4078	performance	99	100.0
38712	2022-09-05 09:53:10	4078	performance	97	-2.0618556
38713	2022-09-05 09:53:20	4078	performance	93	-4.3010755
38714	2022-09-05 09:53:30	4078	performance	97	4.123711
38715	2022-09-05 09:53:40	4078	performance	97	0.0
38716	2022-09-05 09:53:50	4078	performance	94	-3.1914895
38717	2022-09-05 09:54:00	4078	performance	90	-4.4444447
38718	2022-09-05 09:53:00	4846	performance	95	100.0
38719	2022-09-05 09:53:10	4846	performance	94	-1.0638298
38720	2022-09-05 09:53:20	4846	performance	91	-3.2967036
38721	2022-09-05 09:53:30	4846	performance	90	-1.1111112
38722	2022-09-05 09:53:40	4846	performance	91	1.0989012
38723	2022-09-05 09:53:50	4846	performance	90	-1.1111112
38724	2022-09-05 09:54:00	4846	performance	94	4.255319
38725	2022-09-05 09:53:00	4847	performance	95	100.0
38726	2022-09-05 09:53:10	4847	performance	93	-2.1505377
38727	2022-09-05 09:53:20	4847	performance	95	2.1052632
38728	2022-09-05 09:53:30	4847	performance	91	-4.3956046
38729	2022-09-05 09:53:40	4847	performance	93	2.1505377
38730	2022-09-05 09:53:50	4847	performance	98	5.102041
38731	2022-09-05 09:54:00	4847	performance	94	-4.255319
38732	2022-09-05 09:53:00	4295	performance	98	100.0
38733	2022-09-05 09:53:10	4295	performance	95	-3.1578946
38734	2022-09-05 09:53:20	4295	performance	100	5.0
38735	2022-09-05 09:53:30	4295	performance	95	-5.263158
38736	2022-09-05 09:53:40	4295	performance	94	-1.0638298
38737	2022-09-05 09:53:50	4295	performance	91	-3.2967036
38738	2022-09-05 09:54:00	4295	performance	96	5.208333
38739	2022-09-05 09:53:00	4079	performance	94	100.0
38740	2022-09-05 09:53:10	4079	performance	90	-4.4444447
38741	2022-09-05 09:53:20	4079	performance	92	2.173913
38742	2022-09-05 09:53:30	4079	performance	90	-2.2222223
38743	2022-09-05 09:53:40	4079	performance	93	3.2258062
38744	2022-09-05 09:53:50	4079	performance	100	7.0
38745	2022-09-05 09:54:00	4079	performance	99	-1.010101
38746	2022-09-05 09:53:00	4532	performance	97	100.0
38747	2022-09-05 09:53:10	4532	performance	90	-7.777778
38748	2022-09-05 09:53:20	4532	performance	100	10.0
38749	2022-09-05 09:53:30	4532	performance	93	-7.526882
38750	2022-09-05 09:53:40	4532	performance	99	6.060606
38751	2022-09-05 09:53:50	4532	performance	98	-1.0204082
38752	2022-09-05 09:54:00	4532	performance	93	-5.376344
38753	2022-09-05 09:53:00	4296	performance	98	100.0
38754	2022-09-05 09:53:10	4296	performance	91	-7.692308
38755	2022-09-05 09:53:20	4296	performance	90	-1.1111112
38756	2022-09-05 09:53:30	4296	performance	100	10.0
38757	2022-09-05 09:53:40	4296	performance	99	-1.010101
38758	2022-09-05 09:53:50	4296	performance	90	-10.0
38759	2022-09-05 09:54:00	4296	performance	90	0.0
38760	2022-09-05 09:53:00	4848	performance	98	100.0
38761	2022-09-05 09:53:10	4848	performance	91	-7.692308
38762	2022-09-05 09:53:20	4848	performance	99	8.080808
38763	2022-09-05 09:53:30	4848	performance	98	-1.0204082
38764	2022-09-05 09:53:40	4848	performance	94	-4.255319
38765	2022-09-05 09:53:50	4848	performance	90	-4.4444447
38766	2022-09-05 09:54:00	4848	performance	100	10.0
38767	2022-09-05 09:53:00	4849	performance	91	100.0
38768	2022-09-05 09:53:10	4849	performance	100	9.0
38769	2022-09-05 09:53:20	4849	performance	98	-2.0408163
38770	2022-09-05 09:53:30	4849	performance	92	-6.521739
38771	2022-09-05 09:53:40	4849	performance	93	1.0752689
38772	2022-09-05 09:53:50	4849	performance	95	2.1052632
38773	2022-09-05 09:54:00	4849	performance	91	-4.3956046
38774	2022-09-05 09:53:00	4533	performance	93	100.0
38775	2022-09-05 09:53:10	4533	performance	92	-1.0869565
38776	2022-09-05 09:53:20	4533	performance	95	3.1578946
38777	2022-09-05 09:53:30	4533	performance	98	3.0612245
38778	2022-09-05 09:53:40	4533	performance	92	-6.521739
38779	2022-09-05 09:53:50	4533	performance	100	8.0
38780	2022-09-05 09:54:00	4533	performance	98	-2.0408163
38781	2022-09-05 09:53:00	4534	performance	96	100.0
38782	2022-09-05 09:53:10	4534	performance	92	-4.347826
38783	2022-09-05 09:53:20	4534	performance	93	1.0752689
38784	2022-09-05 09:53:30	4534	performance	91	-2.1978023
38785	2022-09-05 09:53:40	4534	performance	94	3.1914895
38786	2022-09-05 09:53:50	4534	performance	94	0.0
38787	2022-09-05 09:54:00	4534	performance	99	5.050505
38788	2022-09-05 09:53:00	4850	performance	91	100.0
38789	2022-09-05 09:53:10	4850	performance	100	9.0
38790	2022-09-05 09:53:20	4850	performance	92	-8.695652
38791	2022-09-05 09:53:30	4850	performance	91	-1.0989012
38792	2022-09-05 09:53:40	4850	performance	95	4.2105265
38793	2022-09-05 09:53:50	4850	performance	94	-1.0638298
38794	2022-09-05 09:54:00	4850	performance	90	-4.4444447
38795	2022-09-05 09:53:00	4297	performance	94	100.0
38796	2022-09-05 09:53:10	4297	performance	91	-3.2967036
38797	2022-09-05 09:53:20	4297	performance	99	8.080808
38798	2022-09-05 09:53:30	4297	performance	90	-10.0
38799	2022-09-05 09:53:40	4297	performance	92	2.173913
38800	2022-09-05 09:53:50	4297	performance	100	8.0
38801	2022-09-05 09:54:00	4297	performance	100	0.0
38802	2022-09-05 09:53:00	4298	performance	99	100.0
38803	2022-09-05 09:53:10	4298	performance	90	-10.0
38804	2022-09-05 09:53:20	4298	performance	98	8.163265
38805	2022-09-05 09:53:30	4298	performance	97	-1.0309278
38806	2022-09-05 09:53:40	4298	performance	99	2.020202
38807	2022-09-05 09:53:50	4298	performance	96	-3.125
38808	2022-09-05 09:54:00	4298	performance	93	-3.2258062
38809	2022-09-05 09:53:00	4080	performance	94	100.0
38810	2022-09-05 09:53:10	4080	performance	93	-1.0752689
38811	2022-09-05 09:53:20	4080	performance	91	-2.1978023
38812	2022-09-05 09:53:30	4080	performance	96	5.208333
38813	2022-09-05 09:53:40	4080	performance	92	-4.347826
38814	2022-09-05 09:53:50	4080	performance	92	0.0
38815	2022-09-05 09:54:00	4080	performance	94	2.1276596
38816	2022-09-05 09:53:00	4081	performance	99	100.0
38817	2022-09-05 09:53:10	4081	performance	100	1.0
38818	2022-09-05 09:53:20	4081	performance	100	0.0
38819	2022-09-05 09:53:30	4081	performance	99	-1.010101
38820	2022-09-05 09:53:40	4081	performance	94	-5.319149
38821	2022-09-05 09:53:50	4081	performance	92	-2.173913
38822	2022-09-05 09:54:00	4081	performance	94	2.1276596
38823	2022-09-05 09:53:00	4851	performance	98	100.0
38824	2022-09-05 09:53:10	4851	performance	96	-2.0833335
38825	2022-09-05 09:53:20	4851	performance	98	2.0408163
38826	2022-09-05 09:53:30	4851	performance	99	1.010101
38827	2022-09-05 09:53:40	4851	performance	91	-8.791209
38828	2022-09-05 09:53:50	4851	performance	98	7.1428576
38829	2022-09-05 09:54:00	4851	performance	97	-1.0309278
38830	2022-09-05 09:53:00	4852	performance	100	100.0
38831	2022-09-05 09:53:10	4852	performance	100	0.0
38832	2022-09-05 09:53:20	4852	performance	92	-8.695652
38833	2022-09-05 09:53:30	4852	performance	97	5.1546392
38834	2022-09-05 09:53:40	4852	performance	99	2.020202
38835	2022-09-05 09:53:50	4852	performance	91	-8.791209
38836	2022-09-05 09:54:00	4852	performance	90	-1.1111112
38837	2022-09-05 09:53:00	4853	performance	92	100.0
38838	2022-09-05 09:53:10	4853	performance	97	5.1546392
38839	2022-09-05 09:53:20	4853	performance	99	2.020202
38840	2022-09-05 09:53:30	4853	performance	98	-1.0204082
38841	2022-09-05 09:53:40	4853	performance	97	-1.0309278
38842	2022-09-05 09:53:50	4853	performance	98	1.0204082
38843	2022-09-05 09:54:00	4853	performance	92	-6.521739
38844	2022-09-05 09:53:00	4535	performance	94	100.0
38845	2022-09-05 09:53:10	4535	performance	92	-2.173913
38846	2022-09-05 09:53:20	4535	performance	98	6.122449
38847	2022-09-05 09:53:30	4535	performance	99	1.010101
38848	2022-09-05 09:53:40	4535	performance	100	1.0
38849	2022-09-05 09:53:50	4535	performance	93	-7.526882
38850	2022-09-05 09:54:00	4535	performance	99	6.060606
38851	2022-09-05 09:53:00	4536	performance	93	100.0
38852	2022-09-05 09:53:10	4536	performance	97	4.123711
38853	2022-09-05 09:53:20	4536	performance	95	-2.1052632
38854	2022-09-05 09:53:30	4536	performance	91	-4.3956046
38855	2022-09-05 09:53:40	4536	performance	91	0.0
38856	2022-09-05 09:53:50	4536	performance	93	2.1505377
38857	2022-09-05 09:54:00	4536	performance	100	7.0
38858	2022-09-05 09:53:00	4299	performance	100	100.0
38859	2022-09-05 09:53:10	4299	performance	99	-1.010101
38860	2022-09-05 09:53:20	4299	performance	92	-7.6086955
38861	2022-09-05 09:53:30	4299	performance	97	5.1546392
38862	2022-09-05 09:53:40	4299	performance	97	0.0
38863	2022-09-05 09:53:50	4299	performance	97	0.0
38864	2022-09-05 09:54:00	4299	performance	100	3.0
38865	2022-09-05 09:53:00	4300	performance	93	100.0
38866	2022-09-05 09:53:10	4300	performance	96	3.125
38867	2022-09-05 09:53:20	4300	performance	92	-4.347826
38868	2022-09-05 09:53:30	4300	performance	98	6.122449
38869	2022-09-05 09:53:40	4300	performance	99	1.010101
38870	2022-09-05 09:53:50	4300	performance	90	-10.0
38871	2022-09-05 09:54:00	4300	performance	99	9.090909
38872	2022-09-05 09:53:00	4854	performance	92	100.0
38873	2022-09-05 09:53:10	4854	performance	90	-2.2222223
38874	2022-09-05 09:53:20	4854	performance	90	0.0
38875	2022-09-05 09:53:30	4854	performance	90	0.0
38876	2022-09-05 09:53:40	4854	performance	96	6.25
38877	2022-09-05 09:53:50	4854	performance	92	-4.347826
38878	2022-09-05 09:54:00	4854	performance	99	7.070707
38879	2022-09-05 09:53:00	4537	performance	100	100.0
38880	2022-09-05 09:53:10	4537	performance	96	-4.166667
38881	2022-09-05 09:53:20	4537	performance	92	-4.347826
38882	2022-09-05 09:53:30	4537	performance	90	-2.2222223
38883	2022-09-05 09:53:40	4537	performance	94	4.255319
38884	2022-09-05 09:53:50	4537	performance	96	2.0833335
38885	2022-09-05 09:54:00	4537	performance	95	-1.0526316
38886	2022-09-05 09:53:00	4082	performance	93	100.0
38887	2022-09-05 09:53:10	4082	performance	98	5.102041
38888	2022-09-05 09:53:20	4082	performance	95	-3.1578946
38889	2022-09-05 09:53:30	4082	performance	97	2.0618556
38890	2022-09-05 09:53:40	4082	performance	99	2.020202
38891	2022-09-05 09:53:50	4082	performance	90	-10.0
38892	2022-09-05 09:54:00	4082	performance	98	8.163265
38893	2022-09-05 09:53:00	4855	performance	90	100.0
38894	2022-09-05 09:53:10	4855	performance	99	9.090909
38895	2022-09-05 09:53:20	4855	performance	90	-10.0
38896	2022-09-05 09:53:30	4855	performance	91	1.0989012
38897	2022-09-05 09:53:40	4855	performance	99	8.080808
38898	2022-09-05 09:53:50	4855	performance	96	-3.125
38899	2022-09-05 09:54:00	4855	performance	98	2.0408163
38900	2022-09-05 09:53:00	4856	performance	93	100.0
38901	2022-09-05 09:53:10	4856	performance	97	4.123711
38902	2022-09-05 09:53:20	4856	performance	93	-4.3010755
38903	2022-09-05 09:53:30	4856	performance	94	1.0638298
38904	2022-09-05 09:53:40	4856	performance	99	5.050505
38905	2022-09-05 09:53:50	4856	performance	96	-3.125
38906	2022-09-05 09:54:00	4856	performance	96	0.0
38907	2022-09-05 09:53:00	4301	performance	95	100.0
38908	2022-09-05 09:53:10	4301	performance	91	-4.3956046
38909	2022-09-05 09:53:20	4301	performance	90	-1.1111112
38910	2022-09-05 09:53:30	4301	performance	96	6.25
38911	2022-09-05 09:53:40	4301	performance	98	2.0408163
38912	2022-09-05 09:53:50	4301	performance	97	-1.0309278
38913	2022-09-05 09:54:00	4301	performance	93	-4.3010755
38914	2022-09-05 09:53:00	4083	performance	96	100.0
38915	2022-09-05 09:53:10	4083	performance	98	2.0408163
38916	2022-09-05 09:53:20	4083	performance	94	-4.255319
38917	2022-09-05 09:53:30	4083	performance	91	-3.2967036
38918	2022-09-05 09:53:40	4083	performance	97	6.185567
38919	2022-09-05 09:53:50	4083	performance	97	0.0
38920	2022-09-05 09:54:00	4083	performance	97	0.0
38921	2022-09-05 09:53:00	4538	performance	92	100.0
38922	2022-09-05 09:53:10	4538	performance	96	4.166667
38923	2022-09-05 09:53:20	4538	performance	97	1.0309278
38924	2022-09-05 09:53:30	4538	performance	97	0.0
38925	2022-09-05 09:53:40	4538	performance	98	1.0204082
38926	2022-09-05 09:53:50	4538	performance	97	-1.0309278
38927	2022-09-05 09:54:00	4538	performance	90	-7.777778
38928	2022-09-05 09:53:00	4302	performance	100	100.0
38929	2022-09-05 09:53:10	4302	performance	90	-11.111112
38930	2022-09-05 09:53:20	4302	performance	99	9.090909
38931	2022-09-05 09:53:30	4302	performance	97	-2.0618556
38932	2022-09-05 09:53:40	4302	performance	95	-2.1052632
38933	2022-09-05 09:53:50	4302	performance	100	5.0
38934	2022-09-05 09:54:00	4302	performance	95	-5.263158
38935	2022-09-05 09:53:00	4857	performance	97	100.0
38936	2022-09-05 09:53:10	4857	performance	92	-5.4347825
38937	2022-09-05 09:53:20	4857	performance	91	-1.0989012
38938	2022-09-05 09:53:30	4857	performance	91	0.0
38939	2022-09-05 09:53:40	4857	performance	90	-1.1111112
38940	2022-09-05 09:53:50	4857	performance	96	6.25
38941	2022-09-05 09:54:00	4857	performance	97	1.0309278
38942	2022-09-05 09:53:00	4858	performance	94	100.0
38943	2022-09-05 09:53:10	4858	performance	90	-4.4444447
38944	2022-09-05 09:53:20	4858	performance	98	8.163265
38945	2022-09-05 09:53:30	4858	performance	99	1.010101
38946	2022-09-05 09:53:40	4858	performance	92	-7.6086955
38947	2022-09-05 09:53:50	4858	performance	99	7.070707
38948	2022-09-05 09:54:00	4858	performance	94	-5.319149
38949	2022-09-05 09:53:00	4539	performance	98	100.0
38950	2022-09-05 09:53:10	4539	performance	93	-5.376344
38951	2022-09-05 09:53:20	4539	performance	91	-2.1978023
38952	2022-09-05 09:53:30	4539	performance	92	1.0869565
38953	2022-09-05 09:53:40	4539	performance	100	8.0
38954	2022-09-05 09:53:50	4539	performance	94	-6.382979
38955	2022-09-05 09:54:00	4539	performance	98	4.0816326
38956	2022-09-05 09:53:00	4540	performance	96	100.0
38957	2022-09-05 09:53:10	4540	performance	100	4.0
38958	2022-09-05 09:53:20	4540	performance	99	-1.010101
38959	2022-09-05 09:53:30	4540	performance	94	-5.319149
38960	2022-09-05 09:53:40	4540	performance	100	6.0
38961	2022-09-05 09:53:50	4540	performance	97	-3.0927835
38962	2022-09-05 09:54:00	4540	performance	94	-3.1914895
38963	2022-09-05 09:53:00	4859	performance	91	100.0
38964	2022-09-05 09:53:10	4859	performance	93	2.1505377
38965	2022-09-05 09:53:20	4859	performance	91	-2.1978023
38966	2022-09-05 09:53:30	4859	performance	99	8.080808
38967	2022-09-05 09:53:40	4859	performance	97	-2.0618556
38968	2022-09-05 09:53:50	4859	performance	99	2.020202
38969	2022-09-05 09:54:00	4859	performance	92	-7.6086955
38970	2022-09-05 09:53:00	4303	performance	91	100.0
38971	2022-09-05 09:53:10	4303	performance	100	9.0
38972	2022-09-05 09:53:20	4303	performance	91	-9.89011
38973	2022-09-05 09:53:30	4303	performance	91	0.0
38974	2022-09-05 09:53:40	4303	performance	97	6.185567
38975	2022-09-05 09:53:50	4303	performance	92	-5.4347825
38976	2022-09-05 09:54:00	4303	performance	98	6.122449
38977	2022-09-05 09:53:00	4304	performance	94	100.0
38978	2022-09-05 09:53:10	4304	performance	91	-3.2967036
38979	2022-09-05 09:53:20	4304	performance	93	2.1505377
38980	2022-09-05 09:53:30	4304	performance	91	-2.1978023
38981	2022-09-05 09:53:40	4304	performance	93	2.1505377
38982	2022-09-05 09:53:50	4304	performance	96	3.125
38983	2022-09-05 09:54:00	4304	performance	99	3.030303
38984	2022-09-05 09:53:00	4084	performance	93	100.0
38985	2022-09-05 09:53:10	4084	performance	90	-3.3333335
38986	2022-09-05 09:53:20	4084	performance	97	7.2164946
38987	2022-09-05 09:53:30	4084	performance	96	-1.0416667
38988	2022-09-05 09:53:40	4084	performance	95	-1.0526316
38989	2022-09-05 09:53:50	4084	performance	94	-1.0638298
38990	2022-09-05 09:54:00	4084	performance	91	-3.2967036
38991	2022-09-05 09:53:00	4085	performance	94	100.0
38992	2022-09-05 09:53:10	4085	performance	91	-3.2967036
38993	2022-09-05 09:53:20	4085	performance	93	2.1505377
38994	2022-09-05 09:53:30	4085	performance	90	-3.3333335
38995	2022-09-05 09:53:40	4085	performance	95	5.263158
38996	2022-09-05 09:53:50	4085	performance	98	3.0612245
38997	2022-09-05 09:54:00	4085	performance	93	-5.376344
38998	2022-09-05 09:53:00	4860	performance	90	100.0
38999	2022-09-05 09:53:10	4860	performance	96	6.25
39000	2022-09-05 09:53:20	4860	performance	97	1.0309278
39001	2022-09-05 09:53:30	4860	performance	92	-5.4347825
39002	2022-09-05 09:53:40	4860	performance	92	0.0
39003	2022-09-05 09:53:50	4860	performance	99	7.070707
39004	2022-09-05 09:54:00	4860	performance	91	-8.791209
39005	2022-09-05 09:53:00	4861	performance	98	100.0
39006	2022-09-05 09:53:10	4861	performance	94	-4.255319
39007	2022-09-05 09:53:20	4861	performance	98	4.0816326
39008	2022-09-05 09:53:30	4861	performance	93	-5.376344
39009	2022-09-05 09:53:40	4861	performance	93	0.0
39010	2022-09-05 09:53:50	4861	performance	96	3.125
39011	2022-09-05 09:54:00	4861	performance	91	-5.4945054
39012	2022-09-05 09:53:00	4862	performance	92	100.0
39013	2022-09-05 09:53:10	4862	performance	92	0.0
39014	2022-09-05 09:53:20	4862	performance	92	0.0
39015	2022-09-05 09:53:30	4862	performance	100	8.0
39016	2022-09-05 09:53:40	4862	performance	92	-8.695652
39017	2022-09-05 09:53:50	4862	performance	90	-2.2222223
39018	2022-09-05 09:54:00	4862	performance	91	1.0989012
39019	2022-09-05 09:53:00	4541	performance	90	100.0
39020	2022-09-05 09:53:10	4541	performance	97	7.2164946
39021	2022-09-05 09:53:20	4541	performance	98	1.0204082
39022	2022-09-05 09:53:30	4541	performance	90	-8.888889
39023	2022-09-05 09:53:40	4541	performance	92	2.173913
39024	2022-09-05 09:53:50	4541	performance	96	4.166667
39025	2022-09-05 09:54:00	4541	performance	91	-5.4945054
39026	2022-09-05 09:53:00	4542	performance	99	100.0
39027	2022-09-05 09:53:10	4542	performance	93	-6.4516125
39028	2022-09-05 09:53:20	4542	performance	98	5.102041
39029	2022-09-05 09:53:30	4542	performance	98	0.0
39030	2022-09-05 09:53:40	4542	performance	95	-3.1578946
39031	2022-09-05 09:53:50	4542	performance	94	-1.0638298
39032	2022-09-05 09:54:00	4542	performance	98	4.0816326
39033	2022-09-05 09:53:00	4305	performance	92	100.0
39034	2022-09-05 09:53:10	4305	performance	96	4.166667
39035	2022-09-05 09:53:20	4305	performance	93	-3.2258062
39036	2022-09-05 09:53:30	4305	performance	95	2.1052632
39037	2022-09-05 09:53:40	4305	performance	95	0.0
39038	2022-09-05 09:53:50	4305	performance	97	2.0618556
39039	2022-09-05 09:54:00	4305	performance	98	1.0204082
39040	2022-09-05 09:53:00	4306	performance	100	100.0
39041	2022-09-05 09:53:10	4306	performance	99	-1.010101
39042	2022-09-05 09:53:20	4306	performance	90	-10.0
39043	2022-09-05 09:53:30	4306	performance	100	10.0
39044	2022-09-05 09:53:40	4306	performance	95	-5.263158
39045	2022-09-05 09:53:50	4306	performance	94	-1.0638298
39046	2022-09-05 09:54:00	4306	performance	100	6.0
39047	2022-09-05 09:53:00	4863	performance	96	100.0
39048	2022-09-05 09:53:10	4863	performance	92	-4.347826
39049	2022-09-05 09:53:20	4863	performance	92	0.0
39050	2022-09-05 09:53:30	4863	performance	90	-2.2222223
39051	2022-09-05 09:53:40	4863	performance	98	8.163265
39052	2022-09-05 09:53:50	4863	performance	98	0.0
39053	2022-09-05 09:54:00	4863	performance	91	-7.692308
39054	2022-09-05 09:53:00	4543	performance	92	100.0
39055	2022-09-05 09:53:10	4543	performance	99	7.070707
39056	2022-09-05 09:53:20	4543	performance	97	-2.0618556
39057	2022-09-05 09:53:30	4543	performance	99	2.020202
39058	2022-09-05 09:53:40	4543	performance	99	0.0
39059	2022-09-05 09:53:50	4543	performance	90	-10.0
39060	2022-09-05 09:54:00	4543	performance	91	1.0989012
39061	2022-09-05 09:53:00	4086	performance	94	100.0
39062	2022-09-05 09:53:10	4086	performance	91	-3.2967036
39063	2022-09-05 09:53:20	4086	performance	93	2.1505377
39064	2022-09-05 09:53:30	4086	performance	92	-1.0869565
39065	2022-09-05 09:53:40	4086	performance	98	6.122449
39066	2022-09-05 09:53:50	4086	performance	99	1.010101
39067	2022-09-05 09:54:00	4086	performance	92	-7.6086955
39068	2022-09-05 09:53:00	4864	performance	95	100.0
39069	2022-09-05 09:53:10	4864	performance	91	-4.3956046
39070	2022-09-05 09:53:20	4864	performance	94	3.1914895
39071	2022-09-05 09:53:30	4864	performance	90	-4.4444447
39072	2022-09-05 09:53:40	4864	performance	94	4.255319
39073	2022-09-05 09:53:50	4864	performance	96	2.0833335
39074	2022-09-05 09:54:00	4864	performance	98	2.0408163
39075	2022-09-05 09:53:00	4865	performance	95	100.0
39076	2022-09-05 09:53:10	4865	performance	93	-2.1505377
39077	2022-09-05 09:53:20	4865	performance	95	2.1052632
39078	2022-09-05 09:53:30	4865	performance	94	-1.0638298
39079	2022-09-05 09:53:40	4865	performance	99	5.050505
39080	2022-09-05 09:53:50	4865	performance	94	-5.319149
39081	2022-09-05 09:54:00	4865	performance	99	5.050505
39082	2022-09-05 09:53:00	4307	performance	93	100.0
39083	2022-09-05 09:53:10	4307	performance	91	-2.1978023
39084	2022-09-05 09:53:20	4307	performance	99	8.080808
39085	2022-09-05 09:53:30	4307	performance	94	-5.319149
39086	2022-09-05 09:53:40	4307	performance	96	2.0833335
39087	2022-09-05 09:53:50	4307	performance	99	3.030303
39088	2022-09-05 09:54:00	4307	performance	93	-6.4516125
39089	2022-09-05 09:53:00	4087	performance	97	100.0
39090	2022-09-05 09:53:10	4087	performance	97	0.0
39091	2022-09-05 09:53:20	4087	performance	91	-6.593407
39092	2022-09-05 09:53:30	4087	performance	94	3.1914895
39093	2022-09-05 09:53:40	4087	performance	94	0.0
39094	2022-09-05 09:53:50	4087	performance	90	-4.4444447
39095	2022-09-05 09:54:00	4087	performance	91	1.0989012
39096	2022-09-05 09:53:00	4544	performance	95	100.0
39097	2022-09-05 09:53:10	4544	performance	94	-1.0638298
39098	2022-09-05 09:53:20	4544	performance	97	3.0927835
39099	2022-09-05 09:53:30	4544	performance	100	3.0
39100	2022-09-05 09:53:40	4544	performance	94	-6.382979
39101	2022-09-05 09:53:50	4544	performance	94	0.0
39102	2022-09-05 09:54:00	4544	performance	91	-3.2967036
39103	2022-09-05 09:53:00	4308	performance	97	100.0
39104	2022-09-05 09:53:10	4308	performance	90	-7.777778
39105	2022-09-05 09:53:20	4308	performance	94	4.255319
39106	2022-09-05 09:53:30	4308	performance	93	-1.0752689
39107	2022-09-05 09:53:40	4308	performance	93	0.0
39108	2022-09-05 09:53:50	4308	performance	100	7.0
39109	2022-09-05 09:54:00	4308	performance	97	-3.0927835
39110	2022-09-05 09:53:00	4866	performance	100	100.0
39111	2022-09-05 09:53:10	4866	performance	99	-1.010101
39112	2022-09-05 09:53:20	4866	performance	98	-1.0204082
39113	2022-09-05 09:53:30	4866	performance	99	1.010101
39114	2022-09-05 09:53:40	4866	performance	90	-10.0
39115	2022-09-05 09:53:50	4866	performance	94	4.255319
39116	2022-09-05 09:54:00	4866	performance	90	-4.4444447
39117	2022-09-05 09:53:00	4867	performance	100	100.0
39118	2022-09-05 09:53:10	4867	performance	93	-7.526882
39119	2022-09-05 09:53:20	4867	performance	91	-2.1978023
39120	2022-09-05 09:53:30	4867	performance	92	1.0869565
39121	2022-09-05 09:53:40	4867	performance	98	6.122449
39122	2022-09-05 09:53:50	4867	performance	93	-5.376344
39123	2022-09-05 09:54:00	4867	performance	99	6.060606
39124	2022-09-05 09:53:00	4545	performance	95	100.0
39125	2022-09-05 09:53:10	4545	performance	97	2.0618556
39126	2022-09-05 09:53:20	4545	performance	92	-5.4347825
39127	2022-09-05 09:53:30	4545	performance	99	7.070707
39128	2022-09-05 09:53:40	4545	performance	98	-1.0204082
39129	2022-09-05 09:53:50	4545	performance	100	2.0
39130	2022-09-05 09:54:00	4545	performance	99	-1.010101
39131	2022-09-05 09:53:00	4546	performance	93	100.0
39132	2022-09-05 09:53:10	4546	performance	97	4.123711
39133	2022-09-05 09:53:20	4546	performance	100	3.0
39134	2022-09-05 09:53:30	4546	performance	97	-3.0927835
39135	2022-09-05 09:53:40	4546	performance	90	-7.777778
39136	2022-09-05 09:53:50	4546	performance	93	3.2258062
39137	2022-09-05 09:54:00	4546	performance	92	-1.0869565
39138	2022-09-05 09:53:00	4868	performance	95	100.0
39139	2022-09-05 09:53:10	4868	performance	96	1.0416667
39140	2022-09-05 09:53:20	4868	performance	92	-4.347826
39141	2022-09-05 09:53:30	4868	performance	97	5.1546392
39142	2022-09-05 09:53:40	4868	performance	92	-5.4347825
39143	2022-09-05 09:53:50	4868	performance	90	-2.2222223
39144	2022-09-05 09:54:00	4868	performance	93	3.2258062
39145	2022-09-05 09:53:00	4309	performance	90	100.0
39146	2022-09-05 09:53:10	4309	performance	100	10.0
39147	2022-09-05 09:53:20	4309	performance	92	-8.695652
39148	2022-09-05 09:53:30	4309	performance	90	-2.2222223
39149	2022-09-05 09:53:40	4309	performance	96	6.25
39150	2022-09-05 09:53:50	4309	performance	91	-5.4945054
39151	2022-09-05 09:54:00	4309	performance	90	-1.1111112
39152	2022-09-05 09:53:00	4310	performance	90	100.0
39153	2022-09-05 09:53:10	4310	performance	96	6.25
39154	2022-09-05 09:53:20	4310	performance	91	-5.4945054
39155	2022-09-05 09:53:30	4310	performance	92	1.0869565
39156	2022-09-05 09:53:40	4310	performance	97	5.1546392
39157	2022-09-05 09:53:50	4310	performance	97	0.0
39158	2022-09-05 09:54:00	4310	performance	97	0.0
39159	2022-09-05 09:53:00	4088	performance	99	100.0
39160	2022-09-05 09:53:10	4088	performance	93	-6.4516125
39161	2022-09-05 09:53:20	4088	performance	96	3.125
39162	2022-09-05 09:53:30	4088	performance	94	-2.1276596
39163	2022-09-05 09:53:40	4088	performance	98	4.0816326
39164	2022-09-05 09:53:50	4088	performance	95	-3.1578946
39165	2022-09-05 09:54:00	4088	performance	94	-1.0638298
39166	2022-09-05 09:53:00	4089	performance	93	100.0
39167	2022-09-05 09:53:10	4089	performance	100	7.0
39168	2022-09-05 09:53:20	4089	performance	97	-3.0927835
39169	2022-09-05 09:53:30	4089	performance	91	-6.593407
39170	2022-09-05 09:53:40	4089	performance	98	7.1428576
39171	2022-09-05 09:53:50	4089	performance	98	0.0
39172	2022-09-05 09:54:00	4089	performance	93	-5.376344
39173	2022-09-05 09:53:00	4869	performance	100	100.0
39174	2022-09-05 09:53:10	4869	performance	98	-2.0408163
39175	2022-09-05 09:53:20	4869	performance	94	-4.255319
39176	2022-09-05 09:53:30	4869	performance	94	0.0
39177	2022-09-05 09:53:40	4869	performance	96	2.0833335
39178	2022-09-05 09:53:50	4869	performance	91	-5.4945054
39179	2022-09-05 09:54:00	4869	performance	94	3.1914895
39180	2022-09-05 09:53:00	4870	performance	91	100.0
39181	2022-09-05 09:53:10	4870	performance	100	9.0
39182	2022-09-05 09:53:20	4870	performance	94	-6.382979
39183	2022-09-05 09:53:30	4870	performance	96	2.0833335
39184	2022-09-05 09:53:40	4870	performance	90	-6.666667
39185	2022-09-05 09:53:50	4870	performance	91	1.0989012
39186	2022-09-05 09:54:00	4870	performance	99	8.080808
39187	2022-09-05 09:53:00	4871	performance	100	100.0
39188	2022-09-05 09:53:10	4871	performance	99	-1.010101
39189	2022-09-05 09:53:20	4871	performance	94	-5.319149
39190	2022-09-05 09:53:30	4871	performance	98	4.0816326
39191	2022-09-05 09:53:40	4871	performance	100	2.0
39192	2022-09-05 09:53:50	4871	performance	96	-4.166667
39193	2022-09-05 09:54:00	4871	performance	97	1.0309278
39194	2022-09-05 09:53:00	4547	performance	98	100.0
39195	2022-09-05 09:53:10	4547	performance	99	1.010101
39196	2022-09-05 09:53:20	4547	performance	100	1.0
39197	2022-09-05 09:53:30	4547	performance	94	-6.382979
39198	2022-09-05 09:53:40	4547	performance	100	6.0
39199	2022-09-05 09:53:50	4547	performance	99	-1.010101
39200	2022-09-05 09:54:00	4547	performance	91	-8.791209
39201	2022-09-05 09:53:00	4548	performance	92	100.0
39202	2022-09-05 09:53:10	4548	performance	95	3.1578946
39203	2022-09-05 09:53:20	4548	performance	95	0.0
39204	2022-09-05 09:53:30	4548	performance	99	4.040404
39205	2022-09-05 09:53:40	4548	performance	100	1.0
39206	2022-09-05 09:53:50	4548	performance	93	-7.526882
39207	2022-09-05 09:54:00	4548	performance	92	-1.0869565
39208	2022-09-05 09:53:00	4311	performance	91	100.0
39209	2022-09-05 09:53:10	4311	performance	95	4.2105265
39210	2022-09-05 09:53:20	4311	performance	90	-5.555556
39211	2022-09-05 09:53:30	4311	performance	92	2.173913
39212	2022-09-05 09:53:40	4311	performance	93	1.0752689
39213	2022-09-05 09:53:50	4311	performance	94	1.0638298
39214	2022-09-05 09:54:00	4311	performance	92	-2.173913
39215	2022-09-05 09:53:00	4312	performance	91	100.0
39216	2022-09-05 09:53:10	4312	performance	97	6.185567
39217	2022-09-05 09:53:20	4312	performance	91	-6.593407
39218	2022-09-05 09:53:30	4312	performance	99	8.080808
39219	2022-09-05 09:53:40	4312	performance	96	-3.125
39220	2022-09-05 09:53:50	4312	performance	99	3.030303
39221	2022-09-05 09:54:00	4312	performance	100	1.0
39222	2022-09-05 09:53:00	4872	performance	93	100.0
39223	2022-09-05 09:53:10	4872	performance	91	-2.1978023
39224	2022-09-05 09:53:20	4872	performance	98	7.1428576
39225	2022-09-05 09:53:30	4872	performance	96	-2.0833335
39226	2022-09-05 09:53:40	4872	performance	98	2.0408163
39227	2022-09-05 09:53:50	4872	performance	94	-4.255319
39228	2022-09-05 09:54:00	4872	performance	99	5.050505
39229	2022-09-05 09:53:00	4549	performance	94	100.0
39230	2022-09-05 09:53:10	4549	performance	94	0.0
39231	2022-09-05 09:53:20	4549	performance	93	-1.0752689
39232	2022-09-05 09:53:30	4549	performance	94	1.0638298
39233	2022-09-05 09:53:40	4549	performance	94	0.0
39234	2022-09-05 09:53:50	4549	performance	93	-1.0752689
39235	2022-09-05 09:54:00	4549	performance	92	-1.0869565
39236	2022-09-05 09:53:00	4090	performance	95	100.0
39237	2022-09-05 09:53:10	4090	performance	98	3.0612245
39238	2022-09-05 09:53:20	4090	performance	90	-8.888889
39239	2022-09-05 09:53:30	4090	performance	91	1.0989012
39240	2022-09-05 09:53:40	4090	performance	91	0.0
39241	2022-09-05 09:53:50	4090	performance	94	3.1914895
39242	2022-09-05 09:54:00	4090	performance	98	4.0816326
39243	2022-09-05 09:53:00	4873	performance	91	100.0
39244	2022-09-05 09:53:10	4873	performance	98	7.1428576
39245	2022-09-05 09:53:20	4873	performance	96	-2.0833335
39246	2022-09-05 09:53:30	4873	performance	90	-6.666667
39247	2022-09-05 09:53:40	4873	performance	91	1.0989012
39248	2022-09-05 09:53:50	4873	performance	97	6.185567
39249	2022-09-05 09:54:00	4873	performance	95	-2.1052632
39250	2022-09-05 09:53:00	4874	performance	92	100.0
39251	2022-09-05 09:53:10	4874	performance	99	7.070707
39252	2022-09-05 09:53:20	4874	performance	96	-3.125
39253	2022-09-05 09:53:30	4874	performance	100	4.0
39254	2022-09-05 09:53:40	4874	performance	98	-2.0408163
39255	2022-09-05 09:53:50	4874	performance	94	-4.255319
39256	2022-09-05 09:54:00	4874	performance	94	0.0
39257	2022-09-05 09:53:00	4313	performance	97	100.0
39258	2022-09-05 09:53:10	4313	performance	95	-2.1052632
39259	2022-09-05 09:53:20	4313	performance	92	-3.2608695
39260	2022-09-05 09:53:30	4313	performance	98	6.122449
39261	2022-09-05 09:53:40	4313	performance	100	2.0
39262	2022-09-05 09:53:50	4313	performance	94	-6.382979
39263	2022-09-05 09:54:00	4313	performance	90	-4.4444447
39264	2022-09-05 09:53:00	4091	performance	98	100.0
39265	2022-09-05 09:53:10	4091	performance	92	-6.521739
39266	2022-09-05 09:53:20	4091	performance	99	7.070707
39267	2022-09-05 09:53:30	4091	performance	94	-5.319149
39268	2022-09-05 09:53:40	4091	performance	91	-3.2967036
39269	2022-09-05 09:53:50	4091	performance	100	9.0
39270	2022-09-05 09:54:00	4091	performance	96	-4.166667
39271	2022-09-05 09:53:00	4550	performance	95	100.0
39272	2022-09-05 09:53:10	4550	performance	90	-5.555556
39273	2022-09-05 09:53:20	4550	performance	92	2.173913
39274	2022-09-05 09:53:30	4550	performance	96	4.166667
39275	2022-09-05 09:53:40	4550	performance	92	-4.347826
39276	2022-09-05 09:53:50	4550	performance	98	6.122449
39277	2022-09-05 09:54:00	4550	performance	90	-8.888889
39278	2022-09-05 09:53:00	4314	performance	94	100.0
39279	2022-09-05 09:53:10	4314	performance	91	-3.2967036
39280	2022-09-05 09:53:20	4314	performance	98	7.1428576
39281	2022-09-05 09:53:30	4314	performance	90	-8.888889
39282	2022-09-05 09:53:40	4314	performance	97	7.2164946
39283	2022-09-05 09:53:50	4314	performance	95	-2.1052632
39284	2022-09-05 09:54:00	4314	performance	91	-4.3956046
39285	2022-09-05 09:53:00	4875	performance	91	100.0
39286	2022-09-05 09:53:10	4875	performance	93	2.1505377
39287	2022-09-05 09:53:20	4875	performance	93	0.0
39288	2022-09-05 09:53:30	4875	performance	95	2.1052632
39289	2022-09-05 09:53:40	4875	performance	100	5.0
39290	2022-09-05 09:53:50	4875	performance	98	-2.0408163
39291	2022-09-05 09:54:00	4875	performance	96	-2.0833335
39292	2022-09-05 09:53:00	4876	performance	92	100.0
39293	2022-09-05 09:53:10	4876	performance	99	7.070707
39294	2022-09-05 09:53:20	4876	performance	93	-6.4516125
39295	2022-09-05 09:53:30	4876	performance	97	4.123711
39296	2022-09-05 09:53:40	4876	performance	91	-6.593407
39297	2022-09-05 09:53:50	4876	performance	90	-1.1111112
39298	2022-09-05 09:54:00	4876	performance	98	8.163265
39299	2022-09-05 09:53:00	4551	performance	91	100.0
39300	2022-09-05 09:53:10	4551	performance	98	7.1428576
39301	2022-09-05 09:53:20	4551	performance	90	-8.888889
39302	2022-09-05 09:53:30	4551	performance	94	4.255319
39303	2022-09-05 09:53:40	4551	performance	92	-2.173913
39304	2022-09-05 09:53:50	4551	performance	90	-2.2222223
39305	2022-09-05 09:54:00	4551	performance	100	10.0
39306	2022-09-05 09:53:00	4552	performance	99	100.0
39307	2022-09-05 09:53:10	4552	performance	95	-4.2105265
39308	2022-09-05 09:53:20	4552	performance	90	-5.555556
39309	2022-09-05 09:53:30	4552	performance	96	6.25
39310	2022-09-05 09:53:40	4552	performance	100	4.0
39311	2022-09-05 09:53:50	4552	performance	90	-11.111112
39312	2022-09-05 09:54:00	4552	performance	92	2.173913
39313	2022-09-05 09:53:00	4877	performance	96	100.0
39314	2022-09-05 09:53:10	4877	performance	93	-3.2258062
39315	2022-09-05 09:53:20	4877	performance	97	4.123711
39316	2022-09-05 09:53:30	4877	performance	93	-4.3010755
39317	2022-09-05 09:53:40	4877	performance	100	7.0
39318	2022-09-05 09:53:50	4877	performance	91	-9.89011
39319	2022-09-05 09:54:00	4877	performance	95	4.2105265
39320	2022-09-05 09:53:00	4315	performance	95	100.0
39321	2022-09-05 09:53:10	4315	performance	97	2.0618556
39322	2022-09-05 09:53:20	4315	performance	94	-3.1914895
39323	2022-09-05 09:53:30	4315	performance	94	0.0
39324	2022-09-05 09:53:40	4315	performance	100	6.0
39325	2022-09-05 09:53:50	4315	performance	99	-1.010101
39326	2022-09-05 09:54:00	4315	performance	100	1.0
39327	2022-09-05 09:53:00	4316	performance	96	100.0
39328	2022-09-05 09:53:10	4316	performance	96	0.0
39329	2022-09-05 09:53:20	4316	performance	99	3.030303
39330	2022-09-05 09:53:30	4316	performance	90	-10.0
39331	2022-09-05 09:53:40	4316	performance	96	6.25
39332	2022-09-05 09:53:50	4316	performance	98	2.0408163
39333	2022-09-05 09:54:00	4316	performance	99	1.010101
39334	2022-09-05 09:53:00	4092	performance	96	100.0
39335	2022-09-05 09:53:10	4092	performance	91	-5.4945054
39336	2022-09-05 09:53:20	4092	performance	99	8.080808
39337	2022-09-05 09:53:30	4092	performance	99	0.0
39338	2022-09-05 09:53:40	4092	performance	99	0.0
39339	2022-09-05 09:53:50	4092	performance	96	-3.125
39340	2022-09-05 09:54:00	4092	performance	93	-3.2258062
39341	2022-09-05 09:53:00	4093	performance	95	100.0
39342	2022-09-05 09:53:10	4093	performance	95	0.0
39343	2022-09-05 09:53:20	4093	performance	95	0.0
39344	2022-09-05 09:53:30	4093	performance	91	-4.3956046
39345	2022-09-05 09:53:40	4093	performance	97	6.185567
39346	2022-09-05 09:53:50	4093	performance	97	0.0
39347	2022-09-05 09:54:00	4093	performance	94	-3.1914895
39348	2022-09-05 09:53:00	4878	performance	93	100.0
39349	2022-09-05 09:53:10	4878	performance	93	0.0
39350	2022-09-05 09:53:20	4878	performance	91	-2.1978023
39351	2022-09-05 09:53:30	4878	performance	99	8.080808
39352	2022-09-05 09:53:40	4878	performance	94	-5.319149
39353	2022-09-05 09:53:50	4878	performance	93	-1.0752689
39354	2022-09-05 09:54:00	4878	performance	92	-1.0869565
39355	2022-09-05 09:53:00	4879	performance	90	100.0
39356	2022-09-05 09:53:10	4879	performance	94	4.255319
39357	2022-09-05 09:53:20	4879	performance	90	-4.4444447
39358	2022-09-05 09:53:30	4879	performance	100	10.0
39359	2022-09-05 09:53:40	4879	performance	98	-2.0408163
39360	2022-09-05 09:53:50	4879	performance	97	-1.0309278
39361	2022-09-05 09:54:00	4879	performance	99	2.020202
39362	2022-09-05 09:53:00	4880	performance	97	100.0
39363	2022-09-05 09:53:10	4880	performance	92	-5.4347825
39364	2022-09-05 09:53:20	4880	performance	100	8.0
39365	2022-09-05 09:53:30	4880	performance	96	-4.166667
39366	2022-09-05 09:53:40	4880	performance	96	0.0
39367	2022-09-05 09:53:50	4880	performance	95	-1.0526316
39368	2022-09-05 09:54:00	4880	performance	96	1.0416667
39369	2022-09-05 09:53:00	4553	performance	98	100.0
39370	2022-09-05 09:53:10	4553	performance	100	2.0
39371	2022-09-05 09:53:20	4553	performance	95	-5.263158
39372	2022-09-05 09:53:30	4553	performance	92	-3.2608695
39373	2022-09-05 09:53:40	4553	performance	98	6.122449
39374	2022-09-05 09:53:50	4553	performance	99	1.010101
39375	2022-09-05 09:54:00	4553	performance	93	-6.4516125
39376	2022-09-05 09:53:00	4554	performance	92	100.0
39377	2022-09-05 09:53:10	4554	performance	98	6.122449
39378	2022-09-05 09:53:20	4554	performance	95	-3.1578946
39379	2022-09-05 09:53:30	4554	performance	98	3.0612245
39380	2022-09-05 09:53:40	4554	performance	97	-1.0309278
39381	2022-09-05 09:53:50	4554	performance	94	-3.1914895
39382	2022-09-05 09:54:00	4554	performance	95	1.0526316
39383	2022-09-05 09:53:00	4317	performance	97	100.0
39384	2022-09-05 09:53:10	4317	performance	91	-6.593407
39385	2022-09-05 09:53:20	4317	performance	96	5.208333
39386	2022-09-05 09:53:30	4317	performance	98	2.0408163
39387	2022-09-05 09:53:40	4317	performance	95	-3.1578946
39388	2022-09-05 09:53:50	4317	performance	92	-3.2608695
39389	2022-09-05 09:54:00	4317	performance	91	-1.0989012
39390	2022-09-05 09:53:00	4318	performance	90	100.0
39391	2022-09-05 09:53:10	4318	performance	91	1.0989012
39392	2022-09-05 09:53:20	4318	performance	95	4.2105265
39393	2022-09-05 09:53:30	4318	performance	98	3.0612245
39394	2022-09-05 09:53:40	4318	performance	95	-3.1578946
39395	2022-09-05 09:53:50	4318	performance	94	-1.0638298
39396	2022-09-05 09:54:00	4318	performance	96	2.0833335
39397	2022-09-05 09:53:00	4881	performance	95	100.0
39398	2022-09-05 09:53:10	4881	performance	93	-2.1505377
39399	2022-09-05 09:53:20	4881	performance	92	-1.0869565
39400	2022-09-05 09:53:30	4881	performance	92	0.0
39401	2022-09-05 09:53:40	4881	performance	94	2.1276596
39402	2022-09-05 09:53:50	4881	performance	98	4.0816326
39403	2022-09-05 09:54:00	4881	performance	93	-5.376344
39404	2022-09-05 09:53:00	4555	performance	100	100.0
39405	2022-09-05 09:53:10	4555	performance	95	-5.263158
39406	2022-09-05 09:53:20	4555	performance	98	3.0612245
39407	2022-09-05 09:53:30	4555	performance	97	-1.0309278
39408	2022-09-05 09:53:40	4555	performance	95	-2.1052632
39409	2022-09-05 09:53:50	4555	performance	99	4.040404
39410	2022-09-05 09:54:00	4555	performance	90	-10.0
39411	2022-09-05 09:53:00	4094	performance	93	100.0
39412	2022-09-05 09:53:10	4094	performance	94	1.0638298
39413	2022-09-05 09:53:20	4094	performance	96	2.0833335
39414	2022-09-05 09:53:30	4094	performance	97	1.0309278
39415	2022-09-05 09:53:40	4094	performance	96	-1.0416667
39416	2022-09-05 09:53:50	4094	performance	96	0.0
39417	2022-09-05 09:54:00	4094	performance	95	-1.0526316
39418	2022-09-05 09:53:00	4882	performance	100	100.0
39419	2022-09-05 09:53:10	4882	performance	100	0.0
39420	2022-09-05 09:53:20	4882	performance	93	-7.526882
39421	2022-09-05 09:53:30	4882	performance	93	0.0
39422	2022-09-05 09:53:40	4882	performance	98	5.102041
39423	2022-09-05 09:53:50	4882	performance	94	-4.255319
39424	2022-09-05 09:54:00	4882	performance	98	4.0816326
39425	2022-09-05 09:53:00	4883	performance	100	100.0
39426	2022-09-05 09:53:10	4883	performance	91	-9.89011
39427	2022-09-05 09:53:20	4883	performance	97	6.185567
39428	2022-09-05 09:53:30	4883	performance	98	1.0204082
39429	2022-09-05 09:53:40	4883	performance	99	1.010101
39430	2022-09-05 09:53:50	4883	performance	96	-3.125
39431	2022-09-05 09:54:00	4883	performance	91	-5.4945054
39432	2022-09-05 09:53:00	4319	performance	90	100.0
39433	2022-09-05 09:53:10	4319	performance	92	2.173913
39434	2022-09-05 09:53:20	4319	performance	98	6.122449
39435	2022-09-05 09:53:30	4319	performance	94	-4.255319
39436	2022-09-05 09:53:40	4319	performance	93	-1.0752689
39437	2022-09-05 09:53:50	4319	performance	96	3.125
39438	2022-09-05 09:54:00	4319	performance	100	4.0
39439	2022-09-05 09:53:00	4095	performance	91	100.0
39440	2022-09-05 09:53:10	4095	performance	100	9.0
39441	2022-09-05 09:53:20	4095	performance	98	-2.0408163
39442	2022-09-05 09:53:30	4095	performance	93	-5.376344
39443	2022-09-05 09:53:40	4095	performance	100	7.0
39444	2022-09-05 09:53:50	4095	performance	92	-8.695652
39445	2022-09-05 09:54:00	4095	performance	91	-1.0989012
39446	2022-09-05 09:53:00	4556	performance	90	100.0
39447	2022-09-05 09:53:10	4556	performance	100	10.0
39448	2022-09-05 09:53:20	4556	performance	98	-2.0408163
39449	2022-09-05 09:53:30	4556	performance	94	-4.255319
39450	2022-09-05 09:53:40	4556	performance	96	2.0833335
39451	2022-09-05 09:53:50	4556	performance	94	-2.1276596
39452	2022-09-05 09:54:00	4556	performance	99	5.050505
39453	2022-09-05 09:53:00	4320	performance	98	100.0
39454	2022-09-05 09:53:10	4320	performance	92	-6.521739
39455	2022-09-05 09:53:20	4320	performance	100	8.0
39456	2022-09-05 09:53:30	4320	performance	95	-5.263158
39457	2022-09-05 09:53:40	4320	performance	99	4.040404
39458	2022-09-05 09:53:50	4320	performance	93	-6.4516125
39459	2022-09-05 09:54:00	4320	performance	90	-3.3333335
39460	2022-09-05 09:53:00	4884	performance	92	100.0
39461	2022-09-05 09:53:10	4884	performance	96	4.166667
39462	2022-09-05 09:53:20	4884	performance	100	4.0
39463	2022-09-05 09:53:30	4884	performance	95	-5.263158
39464	2022-09-05 09:53:40	4884	performance	93	-2.1505377
39465	2022-09-05 09:53:50	4884	performance	94	1.0638298
39466	2022-09-05 09:54:00	4884	performance	92	-2.173913
39467	2022-09-05 09:53:00	4885	performance	92	100.0
39468	2022-09-05 09:53:10	4885	performance	97	5.1546392
39469	2022-09-05 09:53:20	4885	performance	99	2.020202
39470	2022-09-05 09:53:30	4885	performance	92	-7.6086955
39471	2022-09-05 09:53:40	4885	performance	90	-2.2222223
39472	2022-09-05 09:53:50	4885	performance	91	1.0989012
39473	2022-09-05 09:54:00	4885	performance	94	3.1914895
39474	2022-09-05 09:53:00	4557	performance	93	100.0
39475	2022-09-05 09:53:10	4557	performance	90	-3.3333335
39476	2022-09-05 09:53:20	4557	performance	98	8.163265
39477	2022-09-05 09:53:30	4557	performance	92	-6.521739
39478	2022-09-05 09:53:40	4557	performance	91	-1.0989012
39479	2022-09-05 09:53:50	4557	performance	95	4.2105265
39480	2022-09-05 09:54:00	4557	performance	90	-5.555556
39481	2022-09-05 09:53:00	4558	performance	91	100.0
39482	2022-09-05 09:53:10	4558	performance	92	1.0869565
39483	2022-09-05 09:53:20	4558	performance	90	-2.2222223
39484	2022-09-05 09:53:30	4558	performance	100	10.0
39485	2022-09-05 09:53:40	4558	performance	96	-4.166667
39486	2022-09-05 09:53:50	4558	performance	99	3.030303
39487	2022-09-05 09:54:00	4558	performance	90	-10.0
39488	2022-09-05 09:53:00	4886	performance	92	100.0
39489	2022-09-05 09:53:10	4886	performance	91	-1.0989012
39490	2022-09-05 09:53:20	4886	performance	94	3.1914895
39491	2022-09-05 09:53:30	4886	performance	97	3.0927835
39492	2022-09-05 09:53:40	4886	performance	90	-7.777778
39493	2022-09-05 09:53:50	4886	performance	92	2.173913
39494	2022-09-05 09:54:00	4886	performance	96	4.166667
39495	2022-09-05 09:53:00	4321	performance	93	100.0
39496	2022-09-05 09:53:10	4321	performance	95	2.1052632
39497	2022-09-05 09:53:20	4321	performance	93	-2.1505377
39498	2022-09-05 09:53:30	4321	performance	92	-1.0869565
39499	2022-09-05 09:53:40	4321	performance	92	0.0
39500	2022-09-05 09:53:50	4321	performance	95	3.1578946
39501	2022-09-05 09:54:00	4321	performance	97	2.0618556
39502	2022-09-05 09:53:00	4322	performance	97	100.0
39503	2022-09-05 09:53:10	4322	performance	94	-3.1914895
39504	2022-09-05 09:53:20	4322	performance	99	5.050505
39505	2022-09-05 09:53:30	4322	performance	95	-4.2105265
39506	2022-09-05 09:53:40	4322	performance	92	-3.2608695
39507	2022-09-05 09:53:50	4322	performance	97	5.1546392
39508	2022-09-05 09:54:00	4322	performance	98	1.0204082
39509	2022-09-05 09:53:00	4096	performance	98	100.0
39510	2022-09-05 09:53:10	4096	performance	93	-5.376344
39511	2022-09-05 09:53:20	4096	performance	93	0.0
39512	2022-09-05 09:53:30	4096	performance	96	3.125
39513	2022-09-05 09:53:40	4096	performance	96	0.0
39514	2022-09-05 09:53:50	4096	performance	99	3.030303
39515	2022-09-05 09:54:00	4096	performance	100	1.0
39516	2022-09-05 09:53:00	4097	performance	91	100.0
39517	2022-09-05 09:53:10	4097	performance	98	7.1428576
39518	2022-09-05 09:53:20	4097	performance	96	-2.0833335
39519	2022-09-05 09:53:30	4097	performance	97	1.0309278
39520	2022-09-05 09:53:40	4097	performance	99	2.020202
39521	2022-09-05 09:53:50	4097	performance	94	-5.319149
39522	2022-09-05 09:54:00	4097	performance	99	5.050505
39523	2022-09-05 09:53:00	4887	performance	91	100.0
39524	2022-09-05 09:53:10	4887	performance	93	2.1505377
39525	2022-09-05 09:53:20	4887	performance	92	-1.0869565
39526	2022-09-05 09:53:30	4887	performance	91	-1.0989012
39527	2022-09-05 09:53:40	4887	performance	96	5.208333
39528	2022-09-05 09:53:50	4887	performance	97	1.0309278
39529	2022-09-05 09:54:00	4887	performance	99	2.020202
39530	2022-09-05 09:53:00	4888	performance	96	100.0
39531	2022-09-05 09:53:10	4888	performance	92	-4.347826
39532	2022-09-05 09:53:20	4888	performance	95	3.1578946
39533	2022-09-05 09:53:30	4888	performance	92	-3.2608695
39534	2022-09-05 09:53:40	4888	performance	99	7.070707
39535	2022-09-05 09:53:50	4888	performance	90	-10.0
39536	2022-09-05 09:54:00	4888	performance	91	1.0989012
39537	2022-09-05 09:53:00	4889	performance	90	100.0
39538	2022-09-05 09:53:10	4889	performance	96	6.25
39539	2022-09-05 09:53:20	4889	performance	90	-6.666667
39540	2022-09-05 09:53:30	4889	performance	90	0.0
39541	2022-09-05 09:53:40	4889	performance	92	2.173913
39542	2022-09-05 09:53:50	4889	performance	94	2.1276596
39543	2022-09-05 09:54:00	4889	performance	91	-3.2967036
39544	2022-09-05 09:53:00	4559	performance	98	100.0
39545	2022-09-05 09:53:10	4559	performance	94	-4.255319
39546	2022-09-05 09:53:20	4559	performance	90	-4.4444447
39547	2022-09-05 09:53:30	4559	performance	99	9.090909
39548	2022-09-05 09:53:40	4559	performance	90	-10.0
39549	2022-09-05 09:53:50	4559	performance	97	7.2164946
39550	2022-09-05 09:54:00	4559	performance	100	3.0
39551	2022-09-05 09:53:00	4560	performance	92	100.0
39552	2022-09-05 09:53:10	4560	performance	94	2.1276596
39553	2022-09-05 09:53:20	4560	performance	98	4.0816326
39554	2022-09-05 09:53:30	4560	performance	92	-6.521739
39555	2022-09-05 09:53:40	4560	performance	95	3.1578946
39556	2022-09-05 09:53:50	4560	performance	97	2.0618556
39557	2022-09-05 09:54:00	4560	performance	90	-7.777778
39558	2022-09-05 09:53:00	4323	performance	95	100.0
39559	2022-09-05 09:53:10	4323	performance	93	-2.1505377
39560	2022-09-05 09:53:20	4323	performance	96	3.125
39561	2022-09-05 09:53:30	4323	performance	99	3.030303
39562	2022-09-05 09:53:40	4323	performance	100	1.0
39563	2022-09-05 09:53:50	4323	performance	100	0.0
39564	2022-09-05 09:54:00	4323	performance	92	-8.695652
39565	2022-09-05 09:53:00	4324	performance	94	100.0
39566	2022-09-05 09:53:10	4324	performance	100	6.0
39567	2022-09-05 09:53:20	4324	performance	96	-4.166667
39568	2022-09-05 09:53:30	4324	performance	95	-1.0526316
39569	2022-09-05 09:53:40	4324	performance	100	5.0
39570	2022-09-05 09:53:50	4324	performance	94	-6.382979
39571	2022-09-05 09:54:00	4324	performance	91	-3.2967036
39572	2022-09-05 09:53:00	4890	performance	98	100.0
39573	2022-09-05 09:53:10	4890	performance	95	-3.1578946
39574	2022-09-05 09:53:20	4890	performance	99	4.040404
39575	2022-09-05 09:53:30	4890	performance	92	-7.6086955
39576	2022-09-05 09:53:40	4890	performance	96	4.166667
39577	2022-09-05 09:53:50	4890	performance	96	0.0
39578	2022-09-05 09:54:00	4890	performance	90	-6.666667
39579	2022-09-05 09:53:00	4561	performance	98	100.0
39580	2022-09-05 09:53:10	4561	performance	100	2.0
39581	2022-09-05 09:53:20	4561	performance	97	-3.0927835
39582	2022-09-05 09:53:30	4561	performance	92	-5.4347825
39583	2022-09-05 09:53:40	4561	performance	97	5.1546392
39584	2022-09-05 09:53:50	4561	performance	95	-2.1052632
39585	2022-09-05 09:54:00	4561	performance	93	-2.1505377
39586	2022-09-05 09:53:00	4098	performance	95	100.0
39587	2022-09-05 09:53:10	4098	performance	99	4.040404
39588	2022-09-05 09:53:20	4098	performance	93	-6.4516125
39589	2022-09-05 09:53:30	4098	performance	98	5.102041
39590	2022-09-05 09:53:40	4098	performance	95	-3.1578946
39591	2022-09-05 09:53:50	4098	performance	95	0.0
39592	2022-09-05 09:54:00	4098	performance	90	-5.555556
39593	2022-09-05 09:53:00	4891	performance	100	100.0
39594	2022-09-05 09:53:10	4891	performance	92	-8.695652
39595	2022-09-05 09:53:20	4891	performance	98	6.122449
39596	2022-09-05 09:53:30	4891	performance	98	0.0
39597	2022-09-05 09:53:40	4891	performance	96	-2.0833335
39598	2022-09-05 09:53:50	4891	performance	100	4.0
39599	2022-09-05 09:54:00	4891	performance	91	-9.89011
39600	2022-09-05 09:53:00	4892	performance	97	100.0
39601	2022-09-05 09:53:10	4892	performance	96	-1.0416667
39602	2022-09-05 09:53:20	4892	performance	100	4.0
39603	2022-09-05 09:53:30	4892	performance	94	-6.382979
39604	2022-09-05 09:53:40	4892	performance	94	0.0
39605	2022-09-05 09:53:50	4892	performance	94	0.0
39606	2022-09-05 09:54:00	4892	performance	97	3.0927835
39607	2022-09-05 09:53:00	4325	performance	94	100.0
39608	2022-09-05 09:53:10	4325	performance	97	3.0927835
39609	2022-09-05 09:53:20	4325	performance	97	0.0
39610	2022-09-05 09:53:30	4325	performance	90	-7.777778
39611	2022-09-05 09:53:40	4325	performance	92	2.173913
39612	2022-09-05 09:53:50	4325	performance	95	3.1578946
39613	2022-09-05 09:54:00	4325	performance	99	4.040404
39614	2022-09-05 09:53:00	4099	performance	99	100.0
39615	2022-09-05 09:53:10	4099	performance	93	-6.4516125
39616	2022-09-05 09:53:20	4099	performance	96	3.125
39617	2022-09-05 09:53:30	4099	performance	96	0.0
39618	2022-09-05 09:53:40	4099	performance	90	-6.666667
39619	2022-09-05 09:53:50	4099	performance	98	8.163265
39620	2022-09-05 09:54:00	4099	performance	93	-5.376344
39621	2022-09-05 09:53:00	4562	performance	97	100.0
39622	2022-09-05 09:53:10	4562	performance	94	-3.1914895
39623	2022-09-05 09:53:20	4562	performance	92	-2.173913
39624	2022-09-05 09:53:30	4562	performance	93	1.0752689
39625	2022-09-05 09:53:40	4562	performance	92	-1.0869565
39626	2022-09-05 09:53:50	4562	performance	94	2.1276596
39627	2022-09-05 09:54:00	4562	performance	94	0.0
39628	2022-09-05 09:53:00	4326	performance	99	100.0
39629	2022-09-05 09:53:10	4326	performance	97	-2.0618556
39630	2022-09-05 09:53:20	4326	performance	99	2.020202
39631	2022-09-05 09:53:30	4326	performance	94	-5.319149
39632	2022-09-05 09:53:40	4326	performance	97	3.0927835
39633	2022-09-05 09:53:50	4326	performance	97	0.0
39634	2022-09-05 09:54:00	4326	performance	95	-2.1052632
39635	2022-09-05 09:53:00	4893	performance	95	100.0
39636	2022-09-05 09:53:10	4893	performance	97	2.0618556
39637	2022-09-05 09:53:20	4893	performance	95	-2.1052632
39638	2022-09-05 09:53:30	4893	performance	96	1.0416667
39639	2022-09-05 09:53:40	4893	performance	100	4.0
39640	2022-09-05 09:53:50	4893	performance	96	-4.166667
39641	2022-09-05 09:54:00	4893	performance	97	1.0309278
39642	2022-09-05 09:53:00	4894	performance	95	100.0
39643	2022-09-05 09:53:10	4894	performance	93	-2.1505377
39644	2022-09-05 09:53:20	4894	performance	98	5.102041
39645	2022-09-05 09:53:30	4894	performance	92	-6.521739
39646	2022-09-05 09:53:40	4894	performance	97	5.1546392
39647	2022-09-05 09:53:50	4894	performance	94	-3.1914895
39648	2022-09-05 09:54:00	4894	performance	99	5.050505
39649	2022-09-05 09:53:00	4563	performance	94	100.0
39650	2022-09-05 09:53:10	4563	performance	100	6.0
39651	2022-09-05 09:53:20	4563	performance	93	-7.526882
39652	2022-09-05 09:53:30	4563	performance	93	0.0
39653	2022-09-05 09:53:40	4563	performance	91	-2.1978023
39654	2022-09-05 09:53:50	4563	performance	90	-1.1111112
39655	2022-09-05 09:54:00	4563	performance	97	7.2164946
39656	2022-09-05 09:53:00	4564	performance	95	100.0
39657	2022-09-05 09:53:10	4564	performance	100	5.0
39658	2022-09-05 09:53:20	4564	performance	93	-7.526882
39659	2022-09-05 09:53:30	4564	performance	95	2.1052632
39660	2022-09-05 09:53:40	4564	performance	93	-2.1505377
39661	2022-09-05 09:53:50	4564	performance	99	6.060606
39662	2022-09-05 09:54:00	4564	performance	97	-2.0618556
39663	2022-09-05 09:53:00	4895	performance	96	100.0
39664	2022-09-05 09:53:10	4895	performance	99	3.030303
39665	2022-09-05 09:53:20	4895	performance	94	-5.319149
39666	2022-09-05 09:53:30	4895	performance	96	2.0833335
39667	2022-09-05 09:53:40	4895	performance	90	-6.666667
39668	2022-09-05 09:53:50	4895	performance	99	9.090909
39669	2022-09-05 09:54:00	4895	performance	100	1.0
39670	2022-09-05 09:53:00	4327	performance	97	100.0
39671	2022-09-05 09:53:10	4327	performance	95	-2.1052632
39672	2022-09-05 09:53:20	4327	performance	93	-2.1505377
39673	2022-09-05 09:53:30	4327	performance	94	1.0638298
39674	2022-09-05 09:53:40	4327	performance	96	2.0833335
39675	2022-09-05 09:53:50	4327	performance	95	-1.0526316
39676	2022-09-05 09:54:00	4327	performance	92	-3.2608695
39677	2022-09-05 09:53:00	4328	performance	92	100.0
39678	2022-09-05 09:53:10	4328	performance	96	4.166667
39679	2022-09-05 09:53:20	4328	performance	96	0.0
39680	2022-09-05 09:53:30	4328	performance	99	3.030303
39681	2022-09-05 09:53:40	4328	performance	94	-5.319149
39682	2022-09-05 09:53:50	4328	performance	100	6.0
39683	2022-09-05 09:54:00	4328	performance	92	-8.695652
39684	2022-09-05 09:53:00	4100	performance	94	100.0
39685	2022-09-05 09:53:10	4100	performance	97	3.0927835
39686	2022-09-05 09:53:20	4100	performance	92	-5.4347825
39687	2022-09-05 09:53:30	4100	performance	91	-1.0989012
39688	2022-09-05 09:53:40	4100	performance	100	9.0
39689	2022-09-05 09:53:50	4100	performance	94	-6.382979
39690	2022-09-05 09:54:00	4100	performance	100	6.0
39691	2022-09-05 09:53:00	4101	performance	93	100.0
39692	2022-09-05 09:53:10	4101	performance	95	2.1052632
39693	2022-09-05 09:53:20	4101	performance	94	-1.0638298
39694	2022-09-05 09:53:30	4101	performance	94	0.0
39695	2022-09-05 09:53:40	4101	performance	95	1.0526316
39696	2022-09-05 09:53:50	4101	performance	91	-4.3956046
39697	2022-09-05 09:54:00	4101	performance	94	3.1914895
39698	2022-09-05 09:53:00	4896	performance	98	100.0
39699	2022-09-05 09:53:10	4896	performance	100	2.0
39700	2022-09-05 09:53:20	4896	performance	97	-3.0927835
39701	2022-09-05 09:53:30	4896	performance	100	3.0
39702	2022-09-05 09:53:40	4896	performance	94	-6.382979
39703	2022-09-05 09:53:50	4896	performance	92	-2.173913
39704	2022-09-05 09:54:00	4896	performance	90	-2.2222223
39705	2022-09-05 09:53:00	4897	performance	91	100.0
39706	2022-09-05 09:53:10	4897	performance	92	1.0869565
39707	2022-09-05 09:53:20	4897	performance	98	6.122449
39708	2022-09-05 09:53:30	4897	performance	99	1.010101
39709	2022-09-05 09:53:40	4897	performance	97	-2.0618556
39710	2022-09-05 09:53:50	4897	performance	97	0.0
39711	2022-09-05 09:54:00	4897	performance	100	3.0
39712	2022-09-05 09:53:00	4898	performance	98	100.0
39713	2022-09-05 09:53:10	4898	performance	96	-2.0833335
39714	2022-09-05 09:53:20	4898	performance	90	-6.666667
39715	2022-09-05 09:53:30	4898	performance	98	8.163265
39716	2022-09-05 09:53:40	4898	performance	94	-4.255319
39717	2022-09-05 09:53:50	4898	performance	100	6.0
39718	2022-09-05 09:54:00	4898	performance	100	0.0
39719	2022-09-05 09:53:00	4565	performance	93	100.0
39720	2022-09-05 09:53:10	4565	performance	97	4.123711
39721	2022-09-05 09:53:20	4565	performance	96	-1.0416667
39722	2022-09-05 09:53:30	4565	performance	96	0.0
39723	2022-09-05 09:53:40	4565	performance	95	-1.0526316
39724	2022-09-05 09:53:50	4565	performance	99	4.040404
39725	2022-09-05 09:54:00	4565	performance	100	1.0
39726	2022-09-05 09:53:00	4566	performance	98	100.0
39727	2022-09-05 09:53:10	4566	performance	99	1.010101
39728	2022-09-05 09:53:20	4566	performance	94	-5.319149
39729	2022-09-05 09:53:30	4566	performance	99	5.050505
39730	2022-09-05 09:53:40	4566	performance	97	-2.0618556
39731	2022-09-05 09:53:50	4566	performance	98	1.0204082
39732	2022-09-05 09:54:00	4566	performance	97	-1.0309278
39733	2022-09-05 09:53:00	4329	performance	99	100.0
39734	2022-09-05 09:53:10	4329	performance	94	-5.319149
39735	2022-09-05 09:53:20	4329	performance	92	-2.173913
39736	2022-09-05 09:53:30	4329	performance	95	3.1578946
39737	2022-09-05 09:53:40	4329	performance	97	2.0618556
39738	2022-09-05 09:53:50	4329	performance	96	-1.0416667
39739	2022-09-05 09:54:00	4329	performance	97	1.0309278
39740	2022-09-05 09:53:00	4330	performance	93	100.0
39741	2022-09-05 09:53:10	4330	performance	99	6.060606
39742	2022-09-05 09:53:20	4330	performance	99	0.0
39743	2022-09-05 09:53:30	4330	performance	99	0.0
39744	2022-09-05 09:53:40	4330	performance	97	-2.0618556
39745	2022-09-05 09:53:50	4330	performance	95	-2.1052632
39746	2022-09-05 09:54:00	4330	performance	92	-3.2608695
39747	2022-09-05 09:53:00	4899	performance	99	100.0
39748	2022-09-05 09:53:10	4899	performance	95	-4.2105265
39749	2022-09-05 09:53:20	4899	performance	96	1.0416667
39750	2022-09-05 09:53:30	4899	performance	95	-1.0526316
39751	2022-09-05 09:53:40	4899	performance	95	0.0
39752	2022-09-05 09:53:50	4899	performance	95	0.0
39753	2022-09-05 09:54:00	4899	performance	96	1.0416667
39754	2022-09-05 09:53:00	4567	performance	100	100.0
39755	2022-09-05 09:53:10	4567	performance	90	-11.111112
39756	2022-09-05 09:53:20	4567	performance	97	7.2164946
39757	2022-09-05 09:53:30	4567	performance	93	-4.3010755
39758	2022-09-05 09:53:40	4567	performance	91	-2.1978023
39759	2022-09-05 09:53:50	4567	performance	91	0.0
39760	2022-09-05 09:54:00	4567	performance	91	0.0
39761	2022-09-05 09:53:00	4102	performance	99	100.0
39762	2022-09-05 09:53:10	4102	performance	92	-7.6086955
39763	2022-09-05 09:53:20	4102	performance	97	5.1546392
39764	2022-09-05 09:53:30	4102	performance	97	0.0
39765	2022-09-05 09:53:40	4102	performance	92	-5.4347825
39766	2022-09-05 09:53:50	4102	performance	94	2.1276596
39767	2022-09-05 09:54:00	4102	performance	95	1.0526316
39768	2022-09-05 09:53:00	4900	performance	98	100.0
39769	2022-09-05 09:53:10	4900	performance	98	0.0
39770	2022-09-05 09:53:20	4900	performance	94	-4.255319
39771	2022-09-05 09:53:30	4900	performance	90	-4.4444447
39772	2022-09-05 09:53:40	4900	performance	91	1.0989012
39773	2022-09-05 09:53:50	4900	performance	95	4.2105265
39774	2022-09-05 09:54:00	4900	performance	93	-2.1505377
39775	2022-09-05 09:53:00	4901	performance	100	100.0
39776	2022-09-05 09:53:10	4901	performance	92	-8.695652
39777	2022-09-05 09:53:20	4901	performance	91	-1.0989012
39778	2022-09-05 09:53:30	4901	performance	97	6.185567
39779	2022-09-05 09:53:40	4901	performance	94	-3.1914895
39780	2022-09-05 09:53:50	4901	performance	94	0.0
39781	2022-09-05 09:54:00	4901	performance	91	-3.2967036
39782	2022-09-05 09:53:00	4331	performance	96	100.0
39783	2022-09-05 09:53:10	4331	performance	93	-3.2258062
39784	2022-09-05 09:53:20	4331	performance	93	0.0
39785	2022-09-05 09:53:30	4331	performance	92	-1.0869565
39786	2022-09-05 09:53:40	4331	performance	92	0.0
39787	2022-09-05 09:53:50	4331	performance	97	5.1546392
39788	2022-09-05 09:54:00	4331	performance	96	-1.0416667
39789	2022-09-05 09:53:00	4103	performance	94	100.0
39790	2022-09-05 09:53:10	4103	performance	94	0.0
39791	2022-09-05 09:53:20	4103	performance	90	-4.4444447
39792	2022-09-05 09:53:30	4103	performance	90	0.0
39793	2022-09-05 09:53:40	4103	performance	92	2.173913
39794	2022-09-05 09:53:50	4103	performance	95	3.1578946
39795	2022-09-05 09:54:00	4103	performance	100	5.0
39796	2022-09-05 09:53:00	4568	performance	93	100.0
39797	2022-09-05 09:53:10	4568	performance	99	6.060606
39798	2022-09-05 09:53:20	4568	performance	91	-8.791209
39799	2022-09-05 09:53:30	4568	performance	95	4.2105265
39800	2022-09-05 09:53:40	4568	performance	90	-5.555556
39801	2022-09-05 09:53:50	4568	performance	92	2.173913
39802	2022-09-05 09:54:00	4568	performance	95	3.1578946
39803	2022-09-05 09:53:00	4332	performance	96	100.0
39804	2022-09-05 09:53:10	4332	performance	93	-3.2258062
39805	2022-09-05 09:53:20	4332	performance	93	0.0
39806	2022-09-05 09:53:30	4332	performance	94	1.0638298
39807	2022-09-05 09:53:40	4332	performance	91	-3.2967036
39808	2022-09-05 09:53:50	4332	performance	92	1.0869565
39809	2022-09-05 09:54:00	4332	performance	96	4.166667
39810	2022-09-05 09:53:00	4902	performance	93	100.0
39811	2022-09-05 09:53:10	4902	performance	98	5.102041
39812	2022-09-05 09:53:20	4902	performance	90	-8.888889
39813	2022-09-05 09:53:30	4902	performance	97	7.2164946
39814	2022-09-05 09:53:40	4902	performance	100	3.0
39815	2022-09-05 09:53:50	4902	performance	99	-1.010101
39816	2022-09-05 09:54:00	4902	performance	95	-4.2105265
39817	2022-09-05 09:53:00	4903	performance	98	100.0
39818	2022-09-05 09:53:10	4903	performance	94	-4.255319
39819	2022-09-05 09:53:20	4903	performance	94	0.0
39820	2022-09-05 09:53:30	4903	performance	95	1.0526316
39821	2022-09-05 09:53:40	4903	performance	95	0.0
39822	2022-09-05 09:53:50	4903	performance	98	3.0612245
39823	2022-09-05 09:54:00	4903	performance	96	-2.0833335
39824	2022-09-05 09:53:00	4569	performance	97	100.0
39825	2022-09-05 09:53:10	4569	performance	96	-1.0416667
39826	2022-09-05 09:53:20	4569	performance	100	4.0
39827	2022-09-05 09:53:30	4569	performance	96	-4.166667
39828	2022-09-05 09:53:40	4569	performance	94	-2.1276596
39829	2022-09-05 09:53:50	4569	performance	97	3.0927835
39830	2022-09-05 09:54:00	4569	performance	95	-2.1052632
39831	2022-09-05 09:53:00	4570	performance	91	100.0
39832	2022-09-05 09:53:10	4570	performance	99	8.080808
39833	2022-09-05 09:53:20	4570	performance	93	-6.4516125
39834	2022-09-05 09:53:30	4570	performance	93	0.0
39835	2022-09-05 09:53:40	4570	performance	91	-2.1978023
39836	2022-09-05 09:53:50	4570	performance	95	4.2105265
39837	2022-09-05 09:54:00	4570	performance	100	5.0
39838	2022-09-05 09:53:00	4904	performance	94	100.0
39839	2022-09-05 09:53:10	4904	performance	100	6.0
39840	2022-09-05 09:53:20	4904	performance	90	-11.111112
39841	2022-09-05 09:53:30	4904	performance	98	8.163265
39842	2022-09-05 09:53:40	4904	performance	100	2.0
39843	2022-09-05 09:53:50	4904	performance	99	-1.010101
39844	2022-09-05 09:54:00	4904	performance	99	0.0
39845	2022-09-05 09:53:00	4333	performance	93	100.0
39846	2022-09-05 09:53:10	4333	performance	96	3.125
39847	2022-09-05 09:53:20	4333	performance	98	2.0408163
39848	2022-09-05 09:53:30	4333	performance	90	-8.888889
39849	2022-09-05 09:53:40	4333	performance	94	4.255319
39850	2022-09-05 09:53:50	4333	performance	92	-2.173913
39851	2022-09-05 09:54:00	4333	performance	90	-2.2222223
39852	2022-09-05 09:53:00	4334	performance	90	100.0
39853	2022-09-05 09:53:10	4334	performance	98	8.163265
39854	2022-09-05 09:53:20	4334	performance	90	-8.888889
39855	2022-09-05 09:53:30	4334	performance	93	3.2258062
39856	2022-09-05 09:53:40	4334	performance	90	-3.3333335
39857	2022-09-05 09:53:50	4334	performance	100	10.0
39858	2022-09-05 09:54:00	4334	performance	90	-11.111112
39859	2022-09-05 09:53:00	4104	performance	95	100.0
39860	2022-09-05 09:53:10	4104	performance	98	3.0612245
39861	2022-09-05 09:53:20	4104	performance	100	2.0
39862	2022-09-05 09:53:30	4104	performance	96	-4.166667
39863	2022-09-05 09:53:40	4104	performance	92	-4.347826
39864	2022-09-05 09:53:50	4104	performance	96	4.166667
39865	2022-09-05 09:54:00	4104	performance	92	-4.347826
39866	2022-09-05 09:53:00	4105	performance	93	100.0
39867	2022-09-05 09:53:10	4105	performance	94	1.0638298
39868	2022-09-05 09:53:20	4105	performance	96	2.0833335
39869	2022-09-05 09:53:30	4105	performance	98	2.0408163
39870	2022-09-05 09:53:40	4105	performance	91	-7.692308
39871	2022-09-05 09:53:50	4105	performance	98	7.1428576
39872	2022-09-05 09:54:00	4105	performance	98	0.0
39873	2022-09-05 09:53:00	4905	performance	94	100.0
39874	2022-09-05 09:53:10	4905	performance	94	0.0
39875	2022-09-05 09:53:20	4905	performance	95	1.0526316
39876	2022-09-05 09:53:30	4905	performance	97	2.0618556
39877	2022-09-05 09:53:40	4905	performance	92	-5.4347825
39878	2022-09-05 09:53:50	4905	performance	92	0.0
39879	2022-09-05 09:54:00	4905	performance	91	-1.0989012
39880	2022-09-05 09:53:00	4906	performance	100	100.0
39881	2022-09-05 09:53:10	4906	performance	90	-11.111112
39882	2022-09-05 09:53:20	4906	performance	96	6.25
39883	2022-09-05 09:53:30	4906	performance	91	-5.4945054
39884	2022-09-05 09:53:40	4906	performance	100	9.0
39885	2022-09-05 09:53:50	4906	performance	94	-6.382979
39886	2022-09-05 09:54:00	4906	performance	92	-2.173913
39887	2022-09-05 09:53:00	4907	performance	92	100.0
39888	2022-09-05 09:53:10	4907	performance	92	0.0
39889	2022-09-05 09:53:20	4907	performance	90	-2.2222223
39890	2022-09-05 09:53:30	4907	performance	94	4.255319
39891	2022-09-05 09:53:40	4907	performance	100	6.0
39892	2022-09-05 09:53:50	4907	performance	95	-5.263158
39893	2022-09-05 09:54:00	4907	performance	92	-3.2608695
39894	2022-09-05 09:53:00	4571	performance	92	100.0
39895	2022-09-05 09:53:10	4571	performance	95	3.1578946
39896	2022-09-05 09:53:20	4571	performance	92	-3.2608695
39897	2022-09-05 09:53:30	4571	performance	97	5.1546392
39898	2022-09-05 09:53:40	4571	performance	95	-2.1052632
39899	2022-09-05 09:53:50	4571	performance	96	1.0416667
39900	2022-09-05 09:54:00	4571	performance	93	-3.2258062
39901	2022-09-05 09:53:00	4572	performance	100	100.0
39902	2022-09-05 09:53:10	4572	performance	91	-9.89011
39903	2022-09-05 09:53:20	4572	performance	95	4.2105265
39904	2022-09-05 09:53:30	4572	performance	98	3.0612245
39905	2022-09-05 09:53:40	4572	performance	91	-7.692308
39906	2022-09-05 09:53:50	4572	performance	91	0.0
39907	2022-09-05 09:54:00	4572	performance	96	5.208333
39908	2022-09-05 09:53:00	4335	performance	96	100.0
39909	2022-09-05 09:53:10	4335	performance	98	2.0408163
39910	2022-09-05 09:53:20	4335	performance	94	-4.255319
39911	2022-09-05 09:53:30	4335	performance	92	-2.173913
39912	2022-09-05 09:53:40	4335	performance	97	5.1546392
39913	2022-09-05 09:53:50	4335	performance	95	-2.1052632
39914	2022-09-05 09:54:00	4335	performance	94	-1.0638298
39915	2022-09-05 09:53:00	4336	performance	96	100.0
39916	2022-09-05 09:53:10	4336	performance	92	-4.347826
39917	2022-09-05 09:53:20	4336	performance	91	-1.0989012
39918	2022-09-05 09:53:30	4336	performance	99	8.080808
39919	2022-09-05 09:53:40	4336	performance	95	-4.2105265
39920	2022-09-05 09:53:50	4336	performance	92	-3.2608695
39921	2022-09-05 09:54:00	4336	performance	100	8.0
39922	2022-09-05 09:53:00	4908	performance	92	100.0
39923	2022-09-05 09:53:10	4908	performance	97	5.1546392
39924	2022-09-05 09:53:20	4908	performance	92	-5.4347825
39925	2022-09-05 09:53:30	4908	performance	99	7.070707
39926	2022-09-05 09:53:40	4908	performance	94	-5.319149
39927	2022-09-05 09:53:50	4908	performance	90	-4.4444447
39928	2022-09-05 09:54:00	4908	performance	90	0.0
39929	2022-09-05 09:53:00	4573	performance	100	100.0
39930	2022-09-05 09:53:10	4573	performance	95	-5.263158
39931	2022-09-05 09:53:20	4573	performance	90	-5.555556
39932	2022-09-05 09:53:30	4573	performance	90	0.0
39933	2022-09-05 09:53:40	4573	performance	98	8.163265
39934	2022-09-05 09:53:50	4573	performance	92	-6.521739
39935	2022-09-05 09:54:00	4573	performance	95	3.1578946
39936	2022-09-05 09:53:00	4106	performance	95	100.0
39937	2022-09-05 09:53:10	4106	performance	99	4.040404
39938	2022-09-05 09:53:20	4106	performance	93	-6.4516125
39939	2022-09-05 09:53:30	4106	performance	98	5.102041
39940	2022-09-05 09:53:40	4106	performance	91	-7.692308
39941	2022-09-05 09:53:50	4106	performance	98	7.1428576
39942	2022-09-05 09:54:00	4106	performance	98	0.0
39943	2022-09-05 09:53:00	4909	performance	93	100.0
39944	2022-09-05 09:53:10	4909	performance	91	-2.1978023
39945	2022-09-05 09:53:20	4909	performance	100	9.0
39946	2022-09-05 09:53:30	4909	performance	90	-11.111112
39947	2022-09-05 09:53:40	4909	performance	91	1.0989012
39948	2022-09-05 09:53:50	4909	performance	94	3.1914895
39949	2022-09-05 09:54:00	4909	performance	95	1.0526316
39950	2022-09-05 09:53:00	4910	performance	93	100.0
39951	2022-09-05 09:53:10	4910	performance	100	7.0
39952	2022-09-05 09:53:20	4910	performance	92	-8.695652
39953	2022-09-05 09:53:30	4910	performance	100	8.0
39954	2022-09-05 09:53:40	4910	performance	96	-4.166667
39955	2022-09-05 09:53:50	4910	performance	92	-4.347826
39956	2022-09-05 09:54:00	4910	performance	97	5.1546392
39957	2022-09-05 09:53:00	4337	performance	94	100.0
39958	2022-09-05 09:53:10	4337	performance	91	-3.2967036
39959	2022-09-05 09:53:20	4337	performance	97	6.185567
39960	2022-09-05 09:53:30	4337	performance	95	-2.1052632
39961	2022-09-05 09:53:40	4337	performance	92	-3.2608695
39962	2022-09-05 09:53:50	4337	performance	97	5.1546392
39963	2022-09-05 09:54:00	4337	performance	95	-2.1052632
39964	2022-09-05 09:53:00	4107	performance	90	100.0
39965	2022-09-05 09:53:10	4107	performance	96	6.25
39966	2022-09-05 09:53:20	4107	performance	93	-3.2258062
39967	2022-09-05 09:53:30	4107	performance	91	-2.1978023
39968	2022-09-05 09:53:40	4107	performance	97	6.185567
39969	2022-09-05 09:53:50	4107	performance	99	2.020202
39970	2022-09-05 09:54:00	4107	performance	90	-10.0
39971	2022-09-05 09:53:00	4574	performance	90	100.0
39972	2022-09-05 09:53:10	4574	performance	90	0.0
39973	2022-09-05 09:53:20	4574	performance	93	3.2258062
39974	2022-09-05 09:53:30	4574	performance	91	-2.1978023
39975	2022-09-05 09:53:40	4574	performance	95	4.2105265
39976	2022-09-05 09:53:50	4574	performance	100	5.0
39977	2022-09-05 09:54:00	4574	performance	96	-4.166667
39978	2022-09-05 09:53:00	4338	performance	91	100.0
39979	2022-09-05 09:53:10	4338	performance	99	8.080808
39980	2022-09-05 09:53:20	4338	performance	92	-7.6086955
39981	2022-09-05 09:53:30	4338	performance	91	-1.0989012
39982	2022-09-05 09:53:40	4338	performance	99	8.080808
39983	2022-09-05 09:53:50	4338	performance	91	-8.791209
39984	2022-09-05 09:54:00	4338	performance	100	9.0
39985	2022-09-05 09:53:00	4911	performance	99	100.0
39986	2022-09-05 09:53:10	4911	performance	96	-3.125
39987	2022-09-05 09:53:20	4911	performance	92	-4.347826
39988	2022-09-05 09:53:30	4911	performance	93	1.0752689
39989	2022-09-05 09:53:40	4911	performance	100	7.0
39990	2022-09-05 09:53:50	4911	performance	94	-6.382979
39991	2022-09-05 09:54:00	4911	performance	92	-2.173913
39992	2022-09-05 09:53:00	4912	performance	91	100.0
39993	2022-09-05 09:53:10	4912	performance	92	1.0869565
39994	2022-09-05 09:53:20	4912	performance	91	-1.0989012
39995	2022-09-05 09:53:30	4912	performance	95	4.2105265
39996	2022-09-05 09:53:40	4912	performance	99	4.040404
39997	2022-09-05 09:53:50	4912	performance	99	0.0
39998	2022-09-05 09:54:00	4912	performance	96	-3.125
39999	2022-09-05 09:53:00	4575	performance	93	100.0
40000	2022-09-05 09:53:10	4575	performance	91	-2.1978023
40001	2022-09-05 09:53:20	4575	performance	96	5.208333
40002	2022-09-05 09:53:30	4575	performance	92	-4.347826
40003	2022-09-05 09:53:40	4575	performance	93	1.0752689
40004	2022-09-05 09:53:50	4575	performance	92	-1.0869565
40005	2022-09-05 09:54:00	4575	performance	95	3.1578946
40006	2022-09-05 09:53:00	4576	performance	92	100.0
40007	2022-09-05 09:53:10	4576	performance	97	5.1546392
40008	2022-09-05 09:53:20	4576	performance	94	-3.1914895
40009	2022-09-05 09:53:30	4576	performance	93	-1.0752689
40010	2022-09-05 09:53:40	4576	performance	92	-1.0869565
40011	2022-09-05 09:53:50	4576	performance	95	3.1578946
40012	2022-09-05 09:54:00	4576	performance	94	-1.0638298
40013	2022-09-05 09:53:00	4913	performance	93	100.0
40014	2022-09-05 09:53:10	4913	performance	97	4.123711
40015	2022-09-05 09:53:20	4913	performance	92	-5.4347825
40016	2022-09-05 09:53:30	4913	performance	96	4.166667
40017	2022-09-05 09:53:40	4913	performance	100	4.0
40018	2022-09-05 09:53:50	4913	performance	96	-4.166667
40019	2022-09-05 09:54:00	4913	performance	92	-4.347826
40020	2022-09-05 09:53:00	4339	performance	91	100.0
40021	2022-09-05 09:53:10	4339	performance	92	1.0869565
40022	2022-09-05 09:53:20	4339	performance	93	1.0752689
40023	2022-09-05 09:53:30	4339	performance	91	-2.1978023
40024	2022-09-05 09:53:40	4339	performance	100	9.0
40025	2022-09-05 09:53:50	4339	performance	100	0.0
40026	2022-09-05 09:54:00	4339	performance	98	-2.0408163
40027	2022-09-05 09:53:00	4340	performance	90	100.0
40028	2022-09-05 09:53:10	4340	performance	91	1.0989012
40029	2022-09-05 09:53:20	4340	performance	94	3.1914895
40030	2022-09-05 09:53:30	4340	performance	98	4.0816326
40031	2022-09-05 09:53:40	4340	performance	100	2.0
40032	2022-09-05 09:53:50	4340	performance	94	-6.382979
40033	2022-09-05 09:54:00	4340	performance	99	5.050505
40034	2022-09-05 09:53:00	4108	performance	94	100.0
40035	2022-09-05 09:53:10	4108	performance	93	-1.0752689
40036	2022-09-05 09:53:20	4108	performance	97	4.123711
40037	2022-09-05 09:53:30	4108	performance	90	-7.777778
40038	2022-09-05 09:53:40	4108	performance	94	4.255319
40039	2022-09-05 09:53:50	4108	performance	92	-2.173913
40040	2022-09-05 09:54:00	4108	performance	92	0.0
40041	2022-09-05 09:53:00	4109	performance	96	100.0
40042	2022-09-05 09:53:10	4109	performance	94	-2.1276596
40043	2022-09-05 09:53:20	4109	performance	92	-2.173913
40044	2022-09-05 09:53:30	4109	performance	94	2.1276596
40045	2022-09-05 09:53:40	4109	performance	90	-4.4444447
40046	2022-09-05 09:53:50	4109	performance	94	4.255319
40047	2022-09-05 09:54:00	4109	performance	100	6.0
40048	2022-09-05 09:53:00	4914	performance	100	100.0
40049	2022-09-05 09:53:10	4914	performance	94	-6.382979
40050	2022-09-05 09:53:20	4914	performance	95	1.0526316
40051	2022-09-05 09:53:30	4914	performance	90	-5.555556
40052	2022-09-05 09:53:40	4914	performance	98	8.163265
40053	2022-09-05 09:53:50	4914	performance	98	0.0
40054	2022-09-05 09:54:00	4914	performance	92	-6.521739
40055	2022-09-05 09:53:00	4915	performance	93	100.0
40056	2022-09-05 09:53:10	4915	performance	99	6.060606
40057	2022-09-05 09:53:20	4915	performance	98	-1.0204082
40058	2022-09-05 09:53:30	4915	performance	93	-5.376344
40059	2022-09-05 09:53:40	4915	performance	93	0.0
40060	2022-09-05 09:53:50	4915	performance	93	0.0
40061	2022-09-05 09:54:00	4915	performance	98	5.102041
40062	2022-09-05 09:53:00	4916	performance	95	100.0
40063	2022-09-05 09:53:10	4916	performance	98	3.0612245
40064	2022-09-05 09:53:20	4916	performance	97	-1.0309278
40065	2022-09-05 09:53:30	4916	performance	90	-7.777778
40066	2022-09-05 09:53:40	4916	performance	95	5.263158
40067	2022-09-05 09:53:50	4916	performance	95	0.0
40068	2022-09-05 09:54:00	4916	performance	99	4.040404
40069	2022-09-05 09:53:00	4577	performance	90	100.0
40070	2022-09-05 09:53:10	4577	performance	97	7.2164946
40071	2022-09-05 09:53:20	4577	performance	97	0.0
40072	2022-09-05 09:53:30	4577	performance	95	-2.1052632
40073	2022-09-05 09:53:40	4577	performance	91	-4.3956046
40074	2022-09-05 09:53:50	4577	performance	91	0.0
40075	2022-09-05 09:54:00	4577	performance	97	6.185567
40076	2022-09-05 09:53:00	4578	performance	92	100.0
40077	2022-09-05 09:53:10	4578	performance	92	0.0
40078	2022-09-05 09:53:20	4578	performance	99	7.070707
40079	2022-09-05 09:53:30	4578	performance	97	-2.0618556
40080	2022-09-05 09:53:40	4578	performance	96	-1.0416667
40081	2022-09-05 09:53:50	4578	performance	96	0.0
40082	2022-09-05 09:54:00	4578	performance	96	0.0
40083	2022-09-05 09:53:00	4341	performance	90	100.0
40084	2022-09-05 09:53:10	4341	performance	99	9.090909
40085	2022-09-05 09:53:20	4341	performance	98	-1.0204082
40086	2022-09-05 09:53:30	4341	performance	97	-1.0309278
40087	2022-09-05 09:53:40	4341	performance	99	2.020202
40088	2022-09-05 09:53:50	4341	performance	94	-5.319149
40089	2022-09-05 09:54:00	4341	performance	90	-4.4444447
40090	2022-09-05 09:53:00	4342	performance	98	100.0
40091	2022-09-05 09:53:10	4342	performance	100	2.0
40092	2022-09-05 09:53:20	4342	performance	94	-6.382979
40093	2022-09-05 09:53:30	4342	performance	99	5.050505
40094	2022-09-05 09:53:40	4342	performance	95	-4.2105265
40095	2022-09-05 09:53:50	4342	performance	96	1.0416667
40096	2022-09-05 09:54:00	4342	performance	98	2.0408163
40097	2022-09-05 09:53:00	4917	performance	93	100.0
40098	2022-09-05 09:53:10	4917	performance	94	1.0638298
40099	2022-09-05 09:53:20	4917	performance	90	-4.4444447
40100	2022-09-05 09:53:30	4917	performance	95	5.263158
40101	2022-09-05 09:53:40	4917	performance	97	2.0618556
40102	2022-09-05 09:53:50	4917	performance	94	-3.1914895
40103	2022-09-05 09:54:00	4917	performance	97	3.0927835
40104	2022-09-05 09:53:00	4579	performance	91	100.0
40105	2022-09-05 09:53:10	4579	performance	93	2.1505377
40106	2022-09-05 09:53:20	4579	performance	90	-3.3333335
40107	2022-09-05 09:53:30	4579	performance	97	7.2164946
40108	2022-09-05 09:53:40	4579	performance	90	-7.777778
40109	2022-09-05 09:53:50	4579	performance	92	2.173913
40110	2022-09-05 09:54:00	4579	performance	95	3.1578946
40111	2022-09-05 09:53:00	4110	performance	92	100.0
40112	2022-09-05 09:53:10	4110	performance	95	3.1578946
40113	2022-09-05 09:53:20	4110	performance	91	-4.3956046
40114	2022-09-05 09:53:30	4110	performance	93	2.1505377
40115	2022-09-05 09:53:40	4110	performance	95	2.1052632
40116	2022-09-05 09:53:50	4110	performance	92	-3.2608695
40117	2022-09-05 09:54:00	4110	performance	95	3.1578946
40118	2022-09-05 09:53:00	4918	performance	95	100.0
40119	2022-09-05 09:53:10	4918	performance	93	-2.1505377
40120	2022-09-05 09:53:20	4918	performance	91	-2.1978023
40121	2022-09-05 09:53:30	4918	performance	90	-1.1111112
40122	2022-09-05 09:53:40	4918	performance	98	8.163265
40123	2022-09-05 09:53:50	4918	performance	95	-3.1578946
40124	2022-09-05 09:54:00	4918	performance	97	2.0618556
40125	2022-09-05 09:53:00	4919	performance	92	100.0
40126	2022-09-05 09:53:10	4919	performance	93	1.0752689
40127	2022-09-05 09:53:20	4919	performance	96	3.125
40128	2022-09-05 09:53:30	4919	performance	93	-3.2258062
40129	2022-09-05 09:53:40	4919	performance	100	7.0
40130	2022-09-05 09:53:50	4919	performance	94	-6.382979
40131	2022-09-05 09:54:00	4919	performance	90	-4.4444447
40132	2022-09-05 09:53:00	4343	performance	92	100.0
40133	2022-09-05 09:53:10	4343	performance	94	2.1276596
40134	2022-09-05 09:53:20	4343	performance	95	1.0526316
40135	2022-09-05 09:53:30	4343	performance	95	0.0
40136	2022-09-05 09:53:40	4343	performance	99	4.040404
40137	2022-09-05 09:53:50	4343	performance	94	-5.319149
40138	2022-09-05 09:54:00	4343	performance	90	-4.4444447
40139	2022-09-05 09:53:00	4111	performance	95	100.0
40140	2022-09-05 09:53:10	4111	performance	91	-4.3956046
40141	2022-09-05 09:53:20	4111	performance	91	0.0
40142	2022-09-05 09:53:30	4111	performance	90	-1.1111112
40143	2022-09-05 09:53:40	4111	performance	98	8.163265
40144	2022-09-05 09:53:50	4111	performance	91	-7.692308
40145	2022-09-05 09:54:00	4111	performance	96	5.208333
40146	2022-09-05 09:53:00	4580	performance	97	100.0
40147	2022-09-05 09:53:10	4580	performance	92	-5.4347825
40148	2022-09-05 09:53:20	4580	performance	96	4.166667
40149	2022-09-05 09:53:30	4580	performance	97	1.0309278
40150	2022-09-05 09:53:40	4580	performance	98	1.0204082
40151	2022-09-05 09:53:50	4580	performance	97	-1.0309278
40152	2022-09-05 09:54:00	4580	performance	96	-1.0416667
40153	2022-09-05 09:53:00	4344	performance	98	100.0
40154	2022-09-05 09:53:10	4344	performance	95	-3.1578946
40155	2022-09-05 09:53:20	4344	performance	98	3.0612245
40156	2022-09-05 09:53:30	4344	performance	92	-6.521739
40157	2022-09-05 09:53:40	4344	performance	98	6.122449
40158	2022-09-05 09:53:50	4344	performance	97	-1.0309278
40159	2022-09-05 09:54:00	4344	performance	93	-4.3010755
40160	2022-09-05 09:53:00	4920	performance	94	100.0
40161	2022-09-05 09:53:10	4920	performance	90	-4.4444447
40162	2022-09-05 09:53:20	4920	performance	91	1.0989012
40163	2022-09-05 09:53:30	4920	performance	99	8.080808
40164	2022-09-05 09:53:40	4920	performance	96	-3.125
40165	2022-09-05 09:53:50	4920	performance	96	0.0
40166	2022-09-05 09:54:00	4920	performance	96	0.0
40167	2022-09-05 09:53:00	4921	performance	90	100.0
40168	2022-09-05 09:53:10	4921	performance	93	3.2258062
40169	2022-09-05 09:53:20	4921	performance	98	5.102041
40170	2022-09-05 09:53:30	4921	performance	96	-2.0833335
40171	2022-09-05 09:53:40	4921	performance	90	-6.666667
40172	2022-09-05 09:53:50	4921	performance	95	5.263158
40173	2022-09-05 09:54:00	4921	performance	90	-5.555556
40174	2022-09-05 09:53:00	4581	performance	93	100.0
40175	2022-09-05 09:53:10	4581	performance	99	6.060606
40176	2022-09-05 09:53:20	4581	performance	90	-10.0
40177	2022-09-05 09:53:30	4581	performance	90	0.0
40178	2022-09-05 09:53:40	4581	performance	93	3.2258062
40179	2022-09-05 09:53:50	4581	performance	97	4.123711
40180	2022-09-05 09:54:00	4581	performance	92	-5.4347825
40181	2022-09-05 09:53:00	4582	performance	91	100.0
40182	2022-09-05 09:53:10	4582	performance	90	-1.1111112
40183	2022-09-05 09:53:20	4582	performance	96	6.25
40184	2022-09-05 09:53:30	4582	performance	94	-2.1276596
40185	2022-09-05 09:53:40	4582	performance	90	-4.4444447
40186	2022-09-05 09:53:50	4582	performance	93	3.2258062
40187	2022-09-05 09:54:00	4582	performance	93	0.0
40188	2022-09-05 09:53:00	4922	performance	94	100.0
40189	2022-09-05 09:53:10	4922	performance	94	0.0
40190	2022-09-05 09:53:20	4922	performance	95	1.0526316
40191	2022-09-05 09:53:30	4922	performance	90	-5.555556
40192	2022-09-05 09:53:40	4922	performance	96	6.25
40193	2022-09-05 09:53:50	4922	performance	91	-5.4945054
40194	2022-09-05 09:54:00	4922	performance	93	2.1505377
40195	2022-09-05 09:53:00	4345	performance	96	100.0
40196	2022-09-05 09:53:10	4345	performance	91	-5.4945054
40197	2022-09-05 09:53:20	4345	performance	98	7.1428576
40198	2022-09-05 09:53:30	4345	performance	96	-2.0833335
40199	2022-09-05 09:53:40	4345	performance	99	3.030303
40200	2022-09-05 09:53:50	4345	performance	90	-10.0
40201	2022-09-05 09:54:00	4345	performance	92	2.173913
40202	2022-09-05 09:53:00	4346	performance	91	100.0
40203	2022-09-05 09:53:10	4346	performance	98	7.1428576
40204	2022-09-05 09:53:20	4346	performance	99	1.010101
40205	2022-09-05 09:53:30	4346	performance	97	-2.0618556
40206	2022-09-05 09:53:40	4346	performance	95	-2.1052632
40207	2022-09-05 09:53:50	4346	performance	94	-1.0638298
40208	2022-09-05 09:54:00	4346	performance	99	5.050505
40209	2022-09-05 09:53:00	4112	performance	97	100.0
40210	2022-09-05 09:53:10	4112	performance	92	-5.4347825
40211	2022-09-05 09:53:20	4112	performance	90	-2.2222223
40212	2022-09-05 09:53:30	4112	performance	94	4.255319
40213	2022-09-05 09:53:40	4112	performance	95	1.0526316
40214	2022-09-05 09:53:50	4112	performance	96	1.0416667
40215	2022-09-05 09:54:00	4112	performance	94	-2.1276596
40216	2022-09-05 09:53:00	4113	performance	90	100.0
40217	2022-09-05 09:53:10	4113	performance	97	7.2164946
40218	2022-09-05 09:53:20	4113	performance	95	-2.1052632
40219	2022-09-05 09:53:30	4113	performance	98	3.0612245
40220	2022-09-05 09:53:40	4113	performance	93	-5.376344
40221	2022-09-05 09:53:50	4113	performance	90	-3.3333335
40222	2022-09-05 09:54:00	4113	performance	94	4.255319
40223	2022-09-05 09:53:00	4923	performance	93	100.0
40224	2022-09-05 09:53:10	4923	performance	92	-1.0869565
40225	2022-09-05 09:53:20	4923	performance	97	5.1546392
40226	2022-09-05 09:53:30	4923	performance	97	0.0
40227	2022-09-05 09:53:40	4923	performance	99	2.020202
40228	2022-09-05 09:53:50	4923	performance	94	-5.319149
40229	2022-09-05 09:54:00	4923	performance	92	-2.173913
40230	2022-09-05 09:53:00	4924	performance	97	100.0
40231	2022-09-05 09:53:10	4924	performance	93	-4.3010755
40232	2022-09-05 09:53:20	4924	performance	97	4.123711
40233	2022-09-05 09:53:30	4924	performance	97	0.0
40234	2022-09-05 09:53:40	4924	performance	91	-6.593407
40235	2022-09-05 09:53:50	4924	performance	93	2.1505377
40236	2022-09-05 09:54:00	4924	performance	93	0.0
40237	2022-09-05 09:53:00	4925	performance	91	100.0
40238	2022-09-05 09:53:10	4925	performance	93	2.1505377
40239	2022-09-05 09:53:20	4925	performance	96	3.125
40240	2022-09-05 09:53:30	4925	performance	93	-3.2258062
40241	2022-09-05 09:53:40	4925	performance	100	7.0
40242	2022-09-05 09:53:50	4925	performance	98	-2.0408163
40243	2022-09-05 09:54:00	4925	performance	92	-6.521739
40244	2022-09-05 09:53:00	4583	performance	97	100.0
40245	2022-09-05 09:53:10	4583	performance	98	1.0204082
40246	2022-09-05 09:53:20	4583	performance	90	-8.888889
40247	2022-09-05 09:53:30	4583	performance	100	10.0
40248	2022-09-05 09:53:40	4583	performance	98	-2.0408163
40249	2022-09-05 09:53:50	4583	performance	99	1.010101
40250	2022-09-05 09:54:00	4583	performance	99	0.0
40251	2022-09-05 09:53:00	4584	performance	90	100.0
40252	2022-09-05 09:53:10	4584	performance	96	6.25
40253	2022-09-05 09:53:20	4584	performance	91	-5.4945054
40254	2022-09-05 09:53:30	4584	performance	99	8.080808
40255	2022-09-05 09:53:40	4584	performance	90	-10.0
40256	2022-09-05 09:53:50	4584	performance	92	2.173913
40257	2022-09-05 09:54:00	4584	performance	95	3.1578946
40258	2022-09-05 09:53:00	4347	performance	96	100.0
40259	2022-09-05 09:53:10	4347	performance	100	4.0
40260	2022-09-05 09:53:20	4347	performance	100	0.0
40261	2022-09-05 09:53:30	4347	performance	94	-6.382979
40262	2022-09-05 09:53:40	4347	performance	97	3.0927835
40263	2022-09-05 09:53:50	4347	performance	95	-2.1052632
40264	2022-09-05 09:54:00	4347	performance	100	5.0
40265	2022-09-05 09:53:00	4348	performance	99	100.0
40266	2022-09-05 09:53:10	4348	performance	100	1.0
40267	2022-09-05 09:53:20	4348	performance	92	-8.695652
40268	2022-09-05 09:53:30	4348	performance	100	8.0
40269	2022-09-05 09:53:40	4348	performance	90	-11.111112
40270	2022-09-05 09:53:50	4348	performance	100	10.0
40271	2022-09-05 09:54:00	4348	performance	96	-4.166667
40272	2022-09-05 09:53:00	4926	performance	90	100.0
40273	2022-09-05 09:53:10	4926	performance	94	4.255319
40274	2022-09-05 09:53:20	4926	performance	96	2.0833335
40275	2022-09-05 09:53:30	4926	performance	93	-3.2258062
40276	2022-09-05 09:53:40	4926	performance	99	6.060606
40277	2022-09-05 09:53:50	4926	performance	96	-3.125
40278	2022-09-05 09:54:00	4926	performance	100	4.0
40279	2022-09-05 09:53:00	4585	performance	90	100.0
40280	2022-09-05 09:53:10	4585	performance	93	3.2258062
40281	2022-09-05 09:53:20	4585	performance	92	-1.0869565
40282	2022-09-05 09:53:30	4585	performance	100	8.0
40283	2022-09-05 09:53:40	4585	performance	91	-9.89011
40284	2022-09-05 09:53:50	4585	performance	99	8.080808
40285	2022-09-05 09:54:00	4585	performance	91	-8.791209
40286	2022-09-05 09:53:00	4114	performance	97	100.0
40287	2022-09-05 09:53:10	4114	performance	92	-5.4347825
40288	2022-09-05 09:53:20	4114	performance	95	3.1578946
40289	2022-09-05 09:53:30	4114	performance	92	-3.2608695
40290	2022-09-05 09:53:40	4114	performance	91	-1.0989012
40291	2022-09-05 09:53:50	4114	performance	97	6.185567
40292	2022-09-05 09:54:00	4114	performance	97	0.0
40293	2022-09-05 09:53:00	4927	performance	98	100.0
40294	2022-09-05 09:53:10	4927	performance	91	-7.692308
40295	2022-09-05 09:53:20	4927	performance	100	9.0
40296	2022-09-05 09:53:30	4927	performance	90	-11.111112
40297	2022-09-05 09:53:40	4927	performance	99	9.090909
40298	2022-09-05 09:53:50	4927	performance	99	0.0
40299	2022-09-05 09:54:00	4927	performance	92	-7.6086955
40300	2022-09-05 09:53:00	4928	performance	96	100.0
40301	2022-09-05 09:53:10	4928	performance	93	-3.2258062
40302	2022-09-05 09:53:20	4928	performance	95	2.1052632
40303	2022-09-05 09:53:30	4928	performance	96	1.0416667
40304	2022-09-05 09:53:40	4928	performance	93	-3.2258062
40305	2022-09-05 09:53:50	4928	performance	97	4.123711
40306	2022-09-05 09:54:00	4928	performance	91	-6.593407
40307	2022-09-05 09:53:00	4349	performance	96	100.0
40308	2022-09-05 09:53:10	4349	performance	92	-4.347826
40309	2022-09-05 09:53:20	4349	performance	97	5.1546392
40310	2022-09-05 09:53:30	4349	performance	97	0.0
40311	2022-09-05 09:53:40	4349	performance	93	-4.3010755
40312	2022-09-05 09:53:50	4349	performance	100	7.0
40313	2022-09-05 09:54:00	4349	performance	97	-3.0927835
40314	2022-09-05 09:53:00	4115	performance	100	100.0
40315	2022-09-05 09:53:10	4115	performance	97	-3.0927835
40316	2022-09-05 09:53:20	4115	performance	90	-7.777778
40317	2022-09-05 09:53:30	4115	performance	94	4.255319
40318	2022-09-05 09:53:40	4115	performance	96	2.0833335
40319	2022-09-05 09:53:50	4115	performance	100	4.0
40320	2022-09-05 09:54:00	4115	performance	95	-5.263158
40321	2022-09-05 09:53:00	4586	performance	91	100.0
40322	2022-09-05 09:53:10	4586	performance	99	8.080808
40323	2022-09-05 09:53:20	4586	performance	99	0.0
40324	2022-09-05 09:53:30	4586	performance	99	0.0
40325	2022-09-05 09:53:40	4586	performance	91	-8.791209
40326	2022-09-05 09:53:50	4586	performance	97	6.185567
40327	2022-09-05 09:54:00	4586	performance	97	0.0
40328	2022-09-05 09:53:00	4350	performance	95	100.0
40329	2022-09-05 09:53:10	4350	performance	94	-1.0638298
40330	2022-09-05 09:53:20	4350	performance	93	-1.0752689
40331	2022-09-05 09:53:30	4350	performance	98	5.102041
40332	2022-09-05 09:53:40	4350	performance	95	-3.1578946
40333	2022-09-05 09:53:50	4350	performance	92	-3.2608695
40334	2022-09-05 09:54:00	4350	performance	91	-1.0989012
40335	2022-09-05 09:53:00	4929	performance	92	100.0
40336	2022-09-05 09:53:10	4929	performance	92	0.0
40337	2022-09-05 09:53:20	4929	performance	97	5.1546392
40338	2022-09-05 09:53:30	4929	performance	100	3.0
40339	2022-09-05 09:53:40	4929	performance	94	-6.382979
40340	2022-09-05 09:53:50	4929	performance	91	-3.2967036
40341	2022-09-05 09:54:00	4929	performance	94	3.1914895
40342	2022-09-05 09:53:00	4930	performance	99	100.0
40343	2022-09-05 09:53:10	4930	performance	97	-2.0618556
40344	2022-09-05 09:53:20	4930	performance	90	-7.777778
40345	2022-09-05 09:53:30	4930	performance	94	4.255319
40346	2022-09-05 09:53:40	4930	performance	100	6.0
40347	2022-09-05 09:53:50	4930	performance	99	-1.010101
40348	2022-09-05 09:54:00	4930	performance	99	0.0
40349	2022-09-05 09:53:00	4587	performance	93	100.0
40350	2022-09-05 09:53:10	4587	performance	99	6.060606
40351	2022-09-05 09:53:20	4587	performance	92	-7.6086955
40352	2022-09-05 09:53:30	4587	performance	95	3.1578946
40353	2022-09-05 09:53:40	4587	performance	93	-2.1505377
40354	2022-09-05 09:53:50	4587	performance	97	4.123711
40355	2022-09-05 09:54:00	4587	performance	91	-6.593407
40356	2022-09-05 09:53:00	4588	performance	93	100.0
40357	2022-09-05 09:53:10	4588	performance	97	4.123711
40358	2022-09-05 09:53:20	4588	performance	93	-4.3010755
40359	2022-09-05 09:53:30	4588	performance	94	1.0638298
40360	2022-09-05 09:53:40	4588	performance	96	2.0833335
40361	2022-09-05 09:53:50	4588	performance	97	1.0309278
40362	2022-09-05 09:54:00	4588	performance	99	2.020202
40363	2022-09-05 09:53:00	4931	performance	98	100.0
40364	2022-09-05 09:53:10	4931	performance	93	-5.376344
40365	2022-09-05 09:53:20	4931	performance	91	-2.1978023
40366	2022-09-05 09:53:30	4931	performance	97	6.185567
40367	2022-09-05 09:53:40	4931	performance	98	1.0204082
40368	2022-09-05 09:53:50	4931	performance	91	-7.692308
40369	2022-09-05 09:54:00	4931	performance	91	0.0
40370	2022-09-05 09:53:00	4351	performance	98	100.0
40371	2022-09-05 09:53:10	4351	performance	91	-7.692308
40372	2022-09-05 09:53:20	4351	performance	99	8.080808
40373	2022-09-05 09:53:30	4351	performance	95	-4.2105265
40374	2022-09-05 09:53:40	4351	performance	96	1.0416667
40375	2022-09-05 09:53:50	4351	performance	95	-1.0526316
40376	2022-09-05 09:54:00	4351	performance	98	3.0612245
40377	2022-09-05 09:53:00	4352	performance	91	100.0
40378	2022-09-05 09:53:10	4352	performance	94	3.1914895
40379	2022-09-05 09:53:20	4352	performance	90	-4.4444447
40380	2022-09-05 09:53:30	4352	performance	97	7.2164946
40381	2022-09-05 09:53:40	4352	performance	95	-2.1052632
40382	2022-09-05 09:53:50	4352	performance	97	2.0618556
40383	2022-09-05 09:54:00	4352	performance	94	-3.1914895
40384	2022-09-05 09:53:00	4060	performance	100	100.0
40385	2022-09-05 09:53:10	4060	performance	99	-1.010101
40386	2022-09-05 09:53:20	4060	performance	100	1.0
40387	2022-09-05 09:53:30	4060	performance	96	-4.166667
40388	2022-09-05 09:53:40	4060	performance	97	1.0309278
40389	2022-09-05 09:53:50	4060	performance	99	2.020202
40390	2022-09-05 09:54:00	4060	performance	92	-7.6086955
40391	2022-09-05 09:53:00	4141	performance	97	100.0
40392	2022-09-05 09:53:10	4141	performance	94	-3.1914895
40393	2022-09-05 09:53:20	4141	performance	93	-1.0752689
40394	2022-09-05 09:53:30	4141	performance	90	-3.3333335
40395	2022-09-05 09:53:40	4141	performance	92	2.173913
40396	2022-09-05 09:53:50	4141	performance	92	0.0
40397	2022-09-05 09:54:00	4141	performance	96	4.166667
40398	2022-09-05 09:53:00	4353	performance	94	100.0
40399	2022-09-05 09:53:10	4353	performance	98	4.0816326
40400	2022-09-05 09:53:20	4353	performance	90	-8.888889
40401	2022-09-05 09:53:30	4353	performance	100	10.0
40402	2022-09-05 09:53:40	4353	performance	96	-4.166667
40403	2022-09-05 09:53:50	4353	performance	100	4.0
40404	2022-09-05 09:54:00	4353	performance	90	-11.111112
40405	2022-09-05 09:53:00	4932	performance	99	100.0
40406	2022-09-05 09:53:10	4932	performance	90	-10.0
40407	2022-09-05 09:53:20	4932	performance	95	5.263158
40408	2022-09-05 09:53:30	4932	performance	96	1.0416667
40409	2022-09-05 09:53:40	4932	performance	96	0.0
40410	2022-09-05 09:53:50	4932	performance	99	3.030303
40411	2022-09-05 09:54:00	4932	performance	95	-4.2105265
40412	2022-09-05 09:53:00	4933	performance	98	100.0
40413	2022-09-05 09:53:10	4933	performance	97	-1.0309278
40414	2022-09-05 09:53:20	4933	performance	93	-4.3010755
40415	2022-09-05 09:53:30	4933	performance	99	6.060606
40416	2022-09-05 09:53:40	4933	performance	94	-5.319149
40417	2022-09-05 09:53:50	4933	performance	100	6.0
40418	2022-09-05 09:54:00	4933	performance	96	-4.166667
40419	2022-09-05 09:53:00	4934	performance	90	100.0
40420	2022-09-05 09:53:10	4934	performance	92	2.173913
40421	2022-09-05 09:53:20	4934	performance	91	-1.0989012
40422	2022-09-05 09:53:30	4934	performance	100	9.0
40423	2022-09-05 09:53:40	4934	performance	96	-4.166667
40424	2022-09-05 09:53:50	4934	performance	94	-2.1276596
40425	2022-09-05 09:54:00	4934	performance	98	4.0816326
40426	2022-09-05 09:53:00	4117	performance	98	100.0
40427	2022-09-05 09:53:10	4117	performance	93	-5.376344
40428	2022-09-05 09:53:20	4117	performance	98	5.102041
40429	2022-09-05 09:53:30	4117	performance	99	1.010101
40430	2022-09-05 09:53:40	4117	performance	98	-1.0204082
40431	2022-09-05 09:53:50	4117	performance	94	-4.255319
40432	2022-09-05 09:54:00	4117	performance	90	-4.4444447
40433	2022-09-05 09:53:00	4589	performance	90	100.0
40434	2022-09-05 09:53:10	4589	performance	92	2.173913
40435	2022-09-05 09:53:20	4589	performance	95	3.1578946
40436	2022-09-05 09:53:30	4589	performance	95	0.0
40437	2022-09-05 09:53:40	4589	performance	92	-3.2608695
40438	2022-09-05 09:53:50	4589	performance	94	2.1276596
40439	2022-09-05 09:54:00	4589	performance	93	-1.0752689
40440	2022-09-05 09:53:00	4590	performance	94	100.0
40441	2022-09-05 09:53:10	4590	performance	94	0.0
40442	2022-09-05 09:53:20	4590	performance	93	-1.0752689
40443	2022-09-05 09:53:30	4590	performance	91	-2.1978023
40444	2022-09-05 09:53:40	4590	performance	97	6.185567
40445	2022-09-05 09:53:50	4590	performance	93	-4.3010755
40446	2022-09-05 09:54:00	4590	performance	92	-1.0869565
40447	2022-09-05 09:53:00	4216	performance	97	100.0
40448	2022-09-05 09:53:10	4216	performance	96	-1.0416667
40449	2022-09-05 09:53:20	4216	performance	91	-5.4945054
40450	2022-09-05 09:53:30	4216	performance	96	5.208333
40451	2022-09-05 09:53:40	4216	performance	92	-4.347826
40452	2022-09-05 09:53:50	4216	performance	93	1.0752689
40453	2022-09-05 09:54:00	4216	performance	96	3.125
40454	2022-09-05 09:53:00	4452	performance	91	100.0
40455	2022-09-05 09:53:10	4452	performance	97	6.185567
40456	2022-09-05 09:53:20	4452	performance	93	-4.3010755
40457	2022-09-05 09:53:30	4452	performance	94	1.0638298
40458	2022-09-05 09:53:40	4452	performance	92	-2.173913
40459	2022-09-05 09:53:50	4452	performance	100	8.0
40460	2022-09-05 09:54:00	4452	performance	97	-3.0927835
40461	2022-09-05 09:53:00	4019	performance	91	100.0
40462	2022-09-05 09:53:10	4019	performance	92	1.0869565
40463	2022-09-05 09:53:20	4019	performance	96	4.166667
40464	2022-09-05 09:53:30	4019	performance	93	-3.2258062
40465	2022-09-05 09:53:40	4019	performance	98	5.102041
40466	2022-09-05 09:53:50	4019	performance	96	-2.0833335
40467	2022-09-05 09:54:00	4019	performance	96	0.0
40468	2022-09-05 09:53:00	4728	performance	100	100.0
40469	2022-09-05 09:53:10	4728	performance	92	-8.695652
40470	2022-09-05 09:53:20	4728	performance	92	0.0
40471	2022-09-05 09:53:30	4728	performance	91	-1.0989012
40472	2022-09-05 09:53:40	4728	performance	97	6.185567
40473	2022-09-05 09:53:50	4728	performance	98	1.0204082
40474	2022-09-05 09:54:00	4728	performance	92	-6.521739
40475	2022-09-05 09:53:00	4729	performance	93	100.0
40476	2022-09-05 09:53:10	4729	performance	92	-1.0869565
40477	2022-09-05 09:53:20	4729	performance	98	6.122449
40478	2022-09-05 09:53:30	4729	performance	90	-8.888889
40479	2022-09-05 09:53:40	4729	performance	96	6.25
40480	2022-09-05 09:53:50	4729	performance	92	-4.347826
40481	2022-09-05 09:54:00	4729	performance	100	8.0
40482	2022-09-05 09:53:00	4730	performance	97	100.0
40483	2022-09-05 09:53:10	4730	performance	100	3.0
40484	2022-09-05 09:53:20	4730	performance	92	-8.695652
40485	2022-09-05 09:53:30	4730	performance	98	6.122449
40486	2022-09-05 09:53:40	4730	performance	93	-5.376344
40487	2022-09-05 09:53:50	4730	performance	90	-3.3333335
40488	2022-09-05 09:54:00	4730	performance	90	0.0
\.


--
-- Data for Name: service_billing; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.service_billing (id, period_from, period_to, due_date, amount, description, status, created_on, updated_on, updated_by, created_by, product_id, services_id, department_id) FROM stdin;
601	2022-04-08	2022-04-07	2022-04-08	91262	UNPAID	UNPAID	2022-04-11 06:47:52.226962	2022-04-11 06:47:52.226962	Postman	Postman	451	502	302
602	2022-04-08	2022-04-07	2022-04-08	91262	UNPAID	UNPAID	2022-04-11 06:48:19.054903	2022-04-11 06:48:19.054903	Postman	Postman	451	503	302
603	2022-04-08	2022-04-07	2022-04-08	91262	UNPAID	UNPAID	2022-04-11 06:48:35.012878	2022-04-11 06:48:35.012878	Postman	Postman	451	501	302
604	2022-04-08	2022-04-07	2022-04-08	91262	UNPAID	UNPAID	2022-04-11 06:49:38.093089	2022-04-11 06:49:38.093089	Postman	Postman	452	501	303
605	2022-04-08	2022-04-07	2022-04-08	91262	UNPAID	UNPAID	2022-04-11 06:49:56.850474	2022-04-11 06:49:56.850474	Postman	Postman	452	504	303
\.


--
-- Data for Name: service_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.service_category (id, name, description, status, created_on, updated_on, updated_by, created_by) FROM stdin;
854	Business Services	Business Services	ACTIVE	2022-04-13 05:19:13.012881	2022-04-13 05:19:13.012881	Postman	Postman
1001	Common Services	Common Services	ACTIVE	2022-04-14 09:27:36.855905	2022-04-14 09:27:36.855905	Postman	Postman
1201	Load Balancer	Load Balancer	ACTIVE	2022-04-15 10:17:54.137579	2022-04-19 09:37:32.842525	Postman	Postman
1202	Firewall	Firewall	ACTIVE	2022-04-15 10:18:09.809373	2022-04-19 09:37:47.945311	Postman	Postman
1401	Gateway Services	Gateway Services	ACTIVE	2022-04-19 09:38:35.930168	2022-04-19 09:38:35.930168	Postman	Postman
\.


--
-- Data for Name: service_detail; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.service_detail (id, metadata_json, view_json, sla_json) FROM stdin;
55807	{"name": "FileRepo-data1", "security": {"score": 51}, "description": "File repo DynamoDB common service", "performance": {"score": 60}, "serviceType": "Data", "associatedOU": "Synectiks", "availability": {"score": 13}, "associatedEnv": "PROD", "serviceNature": "Common", "associatedDept": "LOGISTICS", "dataProtection": {"score": 24}, "userExperiance": {"score": 15}, "associatedCluster": "897373451-VPC1-Cluster1", "associatedProduct": "HRMS", "serviceHostingType": "Cluster", "associatedLandingZone": "897373451", "associatedCloudElement": "Dynamodb", "associatedCommonService": "FileRepo", "associatedCloudElementId": "formkiq-core-prod-documents", "associatedProductEnclave": "897373451-VPC1", "associatedBusinessService": "", "associatedClusterNamespace": "HRMS", "associatedGlobalServiceLocation": "", "associatedManagedCloudServiceLocation": ""}	null	null
55808	{"name": "FileRepo-app1", "security": {"score": 26}, "description": "File repo API Gateway common service", "performance": {"score": 65}, "serviceType": "App", "associatedOU": "Synectiks", "availability": {"score": 25}, "associatedEnv": "PROD", "serviceNature": "Common", "associatedDept": "LOGISTICS", "dataProtection": {"score": 32}, "userExperiance": {"score": 60}, "associatedCluster": "897373451-VPC1-Cluster1", "associatedProduct": "EMS", "serviceHostingType": "Cluster", "associatedLandingZone": "897373451", "associatedCloudElement": "API-Gateway", "associatedCommonService": "FileRepo", "associatedCloudElementId": "0f46r83d5a", "associatedProductEnclave": "897373451-VPC1", "associatedBusinessService": "", "associatedClusterNamespace": "EMS", "associatedGlobalServiceLocation": "", "associatedManagedCloudServiceLocation": ""}	null	null
55806	{"name": "FileRepo-app1", "security": {"score": 80}, "description": "File repo API Gateway common service", "performance": {"score": 38}, "serviceType": "App", "associatedOU": "Synectiks", "availability": {"score": 52}, "associatedEnv": "PROD", "serviceNature": "Common", "associatedDept": "LOGISTICS", "dataProtection": {"score": 74}, "userExperiance": {"score": 79}, "associatedCluster": "897373451-VPC1-Cluster1", "associatedProduct": "HRMS", "serviceHostingType": "Cluster", "associatedLandingZone": "897373451", "associatedCloudElement": "API-Gateway", "associatedCommonService": "FileRepo", "associatedCloudElementId": "0f46r83d5a", "associatedProductEnclave": "897373451-VPC1", "associatedBusinessService": "", "associatedClusterNamespace": "HRMS", "associatedGlobalServiceLocation": "", "associatedManagedCloudServiceLocation": ""}	null	null
\.


--
-- Data for Name: service_provider_cloud_account; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.service_provider_cloud_account (id, cloud_type, account_id, access_key, secret_key, region, status, created_on, updated_on, updated_by, created_by) FROM stdin;
1	AWS	657907747545	AKIAZSLS3RLMX72WGAMX	SPY4XASMcdJ1UJpcH8nsALjBn8sCDaTRTdQQiwBn	us-east-1	\N	\N	\N	\N	\N
\.


--
-- Data for Name: service_tag; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.service_tag (id, tag_name, status, created_on, updated_on, updated_by, created_by, service_category_id) FROM stdin;
1101	APP	ACTIVE	2022-04-14 10:59:20.899216	2022-04-14 10:59:20.899216	Postman	Postman	854
1102	DATA	ACTIVE	2022-04-14 10:59:38.171427	2022-04-14 10:59:38.171427	Postman	Postman	854
1103	NETWORK	ACTIVE	2022-04-14 10:59:43.374019	2022-04-14 10:59:43.374019	Postman	Postman	854
1251	APP	ACTIVE	2022-04-15 10:48:52.121882	2022-04-15 10:48:52.121882	Postman	Postman	1001
1252	DATA	ACTIVE	2022-04-15 10:48:56.472345	2022-04-15 10:48:56.472345	Postman	Postman	1001
1253	NETWORK	ACTIVE	2022-04-15 10:49:01.622211	2022-04-15 10:49:01.622211	Postman	Postman	1001
2051	UNLINKED	ACTIVE	2022-04-21 11:11:05.29098	2022-04-21 11:11:05.29098	Postman	Postman	1202
2052	UNLINKED	ACTIVE	2022-04-21 11:11:26.192385	2022-04-21 11:11:26.192385	Postman	Postman	1201
2053	UNLINKED	ACTIVE	2022-04-21 11:11:39.027243	2022-04-21 11:11:39.027243	Postman	Postman	1401
2251	OTHER	ACTIVE	2022-04-22 08:26:58.135531	2022-04-22 08:26:58.135531	Postman	Postman	854
2252	OTHER	ACTIVE	2022-04-22 08:27:06.48571	2022-04-22 08:27:06.48571	Postman	Postman	1001
\.


--
-- Data for Name: service_tag_link; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.service_tag_link (id, description, status, created_on, updated_on, updated_by, created_by, services_id, service_tag_id, hosting_type, name) FROM stdin;
1152	Profile java api	ACTIVE	2022-04-15 04:27:45.939843	2022-04-22 09:20:40.623918	Postman	Postman	502	1101	InCluster	Profile
1153	postgres database of profile service	ACTIVE	2022-04-15 04:29:32.104731	2022-04-22 09:21:59.619526	Postman	Postman	502	1102	CloudManaged	Postgresql
1154	Preferences java api	ACTIVE	2022-04-15 04:30:30.494197	2022-04-22 09:25:17.067163	Postman	Postman	503	1251	InCluster	Preferences
1155	postgres database of Preferences service	ACTIVE	2022-04-15 04:31:13.511154	2022-04-22 09:27:00.75811	Postman	Postman	503	1252	CloudManaged	Postgresql
1156	Security java api	ACTIVE	2022-04-15 04:31:35.685694	2022-04-22 09:27:58.706142	Postman	Postman	501	1251	InCluster	Security
1157	postgres database of Security service	ACTIVE	2022-04-15 04:31:52.78466	2022-04-22 09:29:05.554439	Postman	Postman	501	1252	CloudManaged	Postgresql
1158	ProcurementService java api	ACTIVE	2022-04-15 04:32:13.752323	2022-04-22 09:30:17.112962	Postman	Postman	504	1101	InCluster	ProcurementService
1159	postgres database of ProcurementService service	ACTIVE	2022-04-15 04:32:33.340198	2022-04-22 09:31:16.344618	Postman	Postman	504	1102	CloudManaged	Postgresql
1951	Firewall Service	ACTIVE	2022-04-21 10:06:08.57137	2022-04-22 09:47:59.280671	Postman	Postman	1451	2051	CloudManaged	Firewall
1952	Load Balance Service	ACTIVE	2022-04-21 10:06:54.720439	2022-04-22 09:49:03.508947	Postman	Postman	1452	2052	CloudManaged	Load Balance
1953	Gateway Service	ACTIVE	2022-04-21 10:07:16.471903	2022-04-22 09:49:50.701484	Postman	Postman	1453	2053	CloudManaged	Gateway Service
2201	sales report java API	ACTIVE	2022-04-22 06:51:02.371151	2022-04-22 09:51:24.038893	Postman	Postman	1705	1101	InCluster	Sales Report
2202	postgres database of sales report service	ACTIVE	2022-04-22 06:52:08.831065	2022-04-22 09:52:28.271564	Postman	Postman	1705	1102	CloudManaged	Postgresql
2203	purchase report java API	ACTIVE	2022-04-22 07:03:49.961257	2022-04-22 09:53:29.738708	Postman	Postman	1706	1101	InCluster	Purchase Report
2205	postgres database of purchase report service	ACTIVE	2022-04-22 07:06:26.011902	2022-04-22 09:54:14.998731	Postman	Postman	1706	1102	CloudManaged	Postgresql
2302	GoLang CloudManaged service	ACTIVE	2022-04-22 11:43:51.617302	2022-04-22 11:43:51.617302	Postman	Postman	1704	1251	CloudManaged	GoLang
2303	Asset service java API	ACTIVE	2022-04-23 17:25:39.598021	2022-04-23 17:25:39.598021	Postman	Postman	1703	1101	InCluster	Asset Service
2304	postgres database of asset service	ACTIVE	2022-04-23 17:28:22.316027	2022-04-23 17:28:22.316027	Postman	Postman	1703	1102	CloudManaged	Postgresql
\.


--
-- Data for Name: services; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.services (id, name, description, status, created_on, updated_on, updated_by, created_by, service_category_id) FROM stdin;
502	Profile	Profile service	ACTIVE	2022-04-11 06:38:53.516429	2022-04-13 06:18:37.269165	Postman	Postman	854
504	ProcurementService	ProcurementService service	ACTIVE	2022-04-11 06:39:16.30207	2022-04-13 06:19:46.970513	Postman	Postman	854
501	Security	Security service	ACTIVE	2022-04-08 01:02:39	2022-04-15 04:44:39.88747	Postman	Postman	1001
503	Preferences	Preferences service	ACTIVE	2022-04-11 06:39:06.031212	2022-04-15 04:45:44.581827	Postman	Postman	1001
1454	Fee	Fee	ACTIVE	2022-04-19 09:43:47.559583	2022-04-20 08:50:38.326249	Postman	Postman	854
1706	Purchase	Purchase service	ACTIVE	2022-04-20 08:58:11.329708	2022-04-22 08:38:56.308749	Postman	Postman	854
1705	Sales	Sales service	ACTIVE	2022-04-20 08:57:55.525044	2022-04-22 08:39:35.145269	Postman	Postman	854
953	Elastic search	Elastic search	ACTIVE	2022-04-13 06:23:47.122218	2022-04-22 08:40:39.237893	Postman	Postman	1001
1451	Firewall	Firewall Service	ACTIVE	2022-04-19 09:41:43.454154	2022-04-22 08:41:41.637087	Postman	Postman	1202
1452	Load Balancer	Load Balancer service	ACTIVE	2022-04-19 09:42:13.226555	2022-04-22 08:42:28.561174	Postman	Postman	1201
1453	Gateway	Gateway service	ACTIVE	2022-04-19 09:42:34.416899	2022-04-22 08:43:13.747168	Postman	Postman	1401
1701	IBM Power	IBM Power service	ACTIVE	2022-04-20 08:54:29.514628	2022-04-22 08:44:13.24788	Postman	Postman	1001
1702	Linux	Linux server service	ACTIVE	2022-04-20 08:54:46.378266	2022-04-22 08:44:52.81467	Postman	Postman	1001
2151	Postgresql	database service	ACTIVE	2022-04-22 06:47:53.442332	2022-04-22 06:47:53.442332	Postman	Postman	854
2152	Postgresql	database service	ACTIVE	2022-04-22 06:48:10.120156	2022-04-22 06:48:10.120156	Postman	Postman	1001
1704	GoLang	Go programming language	ACTIVE	2022-04-20 08:55:14.410439	2022-04-22 11:30:33.209793	Postman	Postman	1001
1703	Asset Service	Appkube asset microservice	ACTIVE	2022-04-20 08:55:00.07509	2022-04-23 17:19:41.242037	Postman	Postman	854
\.


--
-- Name: demo_catalogues_detail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.demo_catalogues_detail_id_seq', 1, false);


--
-- Name: demo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.demo_id_seq', 5695, true);


--
-- Name: sequence_generator; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sequence_generator', 55900, true);


--
-- Name: account_services account_services_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_services
    ADD CONSTRAINT account_services_pkey PRIMARY KEY (id);


--
-- Name: catalogue catalogue_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.catalogue
    ADD CONSTRAINT catalogue_pkey PRIMARY KEY (id);


--
-- Name: cloud_element cloud_element_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cloud_element
    ADD CONSTRAINT cloud_element_pkey PRIMARY KEY (id);


--
-- Name: cloud_environment cloud_environment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cloud_environment
    ADD CONSTRAINT cloud_environment_pkey PRIMARY KEY (id);


--
-- Name: cloud cloud_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cloud
    ADD CONSTRAINT cloud_pkey PRIMARY KEY (id);


--
-- Name: data_source data_source_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_source
    ADD CONSTRAINT data_source_pkey PRIMARY KEY (id);


--
-- Name: databasechangeloglock databasechangeloglock_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.databasechangeloglock
    ADD CONSTRAINT databasechangeloglock_pkey PRIMARY KEY (id);


--
-- Name: demo_catalogues_detail demo_catalogues_detail_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.demo_catalogues_detail
    ADD CONSTRAINT demo_catalogues_detail_pkey PRIMARY KEY (id);


--
-- Name: demo demo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.demo
    ADD CONSTRAINT demo_pkey PRIMARY KEY (id);


--
-- Name: department department_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.department
    ADD CONSTRAINT department_pkey PRIMARY KEY (id);


--
-- Name: department_product department_product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.department_product
    ADD CONSTRAINT department_product_pkey PRIMARY KEY (id);


--
-- Name: deployment_environment deployment_environment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deployment_environment
    ADD CONSTRAINT deployment_environment_pkey PRIMARY KEY (id);


--
-- Name: jhi_persistent_audit_event jhi_persistent_audit_event_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jhi_persistent_audit_event
    ADD CONSTRAINT jhi_persistent_audit_event_pkey PRIMARY KEY (event_id);


--
-- Name: jhi_persistent_audit_evt_data jhi_persistent_audit_evt_data_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jhi_persistent_audit_evt_data
    ADD CONSTRAINT jhi_persistent_audit_evt_data_pkey PRIMARY KEY (event_id, name);


--
-- Name: product_billing product_billing_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_billing
    ADD CONSTRAINT product_billing_pkey PRIMARY KEY (id);


--
-- Name: product_deployment product_deployment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_deployment
    ADD CONSTRAINT product_deployment_pkey PRIMARY KEY (id);


--
-- Name: product_enclave product_enclave_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_enclave
    ADD CONSTRAINT product_enclave_pkey PRIMARY KEY (id);


--
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);


--
-- Name: product_service product_service_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_service
    ADD CONSTRAINT product_service_pkey PRIMARY KEY (id);


--
-- Name: product_services_detail product_services_detail_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_services_detail
    ADD CONSTRAINT product_services_detail_pkey PRIMARY KEY (id);


--
-- Name: service_analytics service_analytics_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_analytics
    ADD CONSTRAINT service_analytics_pkey PRIMARY KEY (id);


--
-- Name: service_billing service_billing_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_billing
    ADD CONSTRAINT service_billing_pkey PRIMARY KEY (id);


--
-- Name: service_category service_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_category
    ADD CONSTRAINT service_category_pkey PRIMARY KEY (id);


--
-- Name: service_detail service_detail_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_detail
    ADD CONSTRAINT service_detail_pkey PRIMARY KEY (id);


--
-- Name: service_provider_cloud_account service_provider_cloud_account_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_provider_cloud_account
    ADD CONSTRAINT service_provider_cloud_account_pkey PRIMARY KEY (id);


--
-- Name: service_tag_link service_tag_link_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_tag_link
    ADD CONSTRAINT service_tag_link_pkey PRIMARY KEY (id);


--
-- Name: service_tag service_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_tag
    ADD CONSTRAINT service_tag_pkey PRIMARY KEY (id);


--
-- Name: services services_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_pkey PRIMARY KEY (id);


--
-- Name: idx_persistent_audit_event; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_persistent_audit_event ON public.jhi_persistent_audit_event USING btree (principal, event_date);


--
-- Name: idx_persistent_audit_evt_data; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_persistent_audit_evt_data ON public.jhi_persistent_audit_evt_data USING btree (event_id);


--
-- Name: services_service_tag_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX services_service_tag_unique ON public.service_tag_link USING btree (services_id, service_tag_id);


--
-- Name: cloud_element fk_cloud_element__cloud_environment_id_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cloud_element
    ADD CONSTRAINT fk_cloud_element__cloud_environment_id_id FOREIGN KEY (cloud_environment_id_id) REFERENCES public.cloud_environment(id);


--
-- Name: cloud_element fk_cloud_element__product_enclave_id_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cloud_element
    ADD CONSTRAINT fk_cloud_element__product_enclave_id_id FOREIGN KEY (product_enclave_id_id) REFERENCES public.product_enclave(id);


--
-- Name: cloud_environment fk_cloud_environment__cloud_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cloud_environment
    ADD CONSTRAINT fk_cloud_environment__cloud_id FOREIGN KEY (cloud_id) REFERENCES public.cloud(id);


--
-- Name: cloud_environment fk_cloud_environment__department_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cloud_environment
    ADD CONSTRAINT fk_cloud_environment__department_id FOREIGN KEY (department_id) REFERENCES public.department(id);


--
-- Name: data_source fk_data_source__cloud_environment_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_source
    ADD CONSTRAINT fk_data_source__cloud_environment_id FOREIGN KEY (cloud_environment_id) REFERENCES public.cloud_environment(id);


--
-- Name: department_product fk_department_product__cloud_environment_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.department_product
    ADD CONSTRAINT fk_department_product__cloud_environment_id FOREIGN KEY (cloud_environment_id) REFERENCES public.cloud_environment(id);


--
-- Name: department_product fk_department_product__department_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.department_product
    ADD CONSTRAINT fk_department_product__department_id FOREIGN KEY (department_id) REFERENCES public.department(id);


--
-- Name: department_product fk_department_product__product_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.department_product
    ADD CONSTRAINT fk_department_product__product_id FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- Name: jhi_persistent_audit_evt_data fk_evt_pers_audit_evt_data; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jhi_persistent_audit_evt_data
    ADD CONSTRAINT fk_evt_pers_audit_evt_data FOREIGN KEY (event_id) REFERENCES public.jhi_persistent_audit_event(event_id);


--
-- Name: product_billing fk_product_billing__department_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_billing
    ADD CONSTRAINT fk_product_billing__department_id FOREIGN KEY (department_id) REFERENCES public.department(id);


--
-- Name: product_billing fk_product_billing__deployment_environment_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_billing
    ADD CONSTRAINT fk_product_billing__deployment_environment_id FOREIGN KEY (deployment_environment_id) REFERENCES public.deployment_environment(id);


--
-- Name: product_billing fk_product_billing__product_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_billing
    ADD CONSTRAINT fk_product_billing__product_id FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- Name: product_deployment fk_product_deployment__department_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_deployment
    ADD CONSTRAINT fk_product_deployment__department_id FOREIGN KEY (department_id) REFERENCES public.department(id);


--
-- Name: product_deployment fk_product_deployment__deployment_environment_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_deployment
    ADD CONSTRAINT fk_product_deployment__deployment_environment_id FOREIGN KEY (deployment_environment_id) REFERENCES public.deployment_environment(id);


--
-- Name: product_deployment fk_product_deployment__product_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_deployment
    ADD CONSTRAINT fk_product_deployment__product_id FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- Name: product_enclave fk_product_enclave__cloud_environment_id_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_enclave
    ADD CONSTRAINT fk_product_enclave__cloud_environment_id_id FOREIGN KEY (cloud_environment_id_id) REFERENCES public.cloud_environment(id);


--
-- Name: product_service fk_product_service__product_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_service
    ADD CONSTRAINT fk_product_service__product_id FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- Name: product_service fk_product_service__services_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_service
    ADD CONSTRAINT fk_product_service__services_id FOREIGN KEY (services_id) REFERENCES public.services(id);


--
-- Name: service_billing fk_service_billing__department_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_billing
    ADD CONSTRAINT fk_service_billing__department_id FOREIGN KEY (department_id) REFERENCES public.department(id);


--
-- Name: service_billing fk_service_billing__product_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_billing
    ADD CONSTRAINT fk_service_billing__product_id FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- Name: service_billing fk_service_billing__service_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_billing
    ADD CONSTRAINT fk_service_billing__service_id FOREIGN KEY (services_id) REFERENCES public.services(id);


--
-- Name: service_tag fk_service_tag__service_category_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_tag
    ADD CONSTRAINT fk_service_tag__service_category_id FOREIGN KEY (service_category_id) REFERENCES public.service_category(id);


--
-- Name: service_tag_link fk_service_tag_link__service_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_tag_link
    ADD CONSTRAINT fk_service_tag_link__service_tag_id FOREIGN KEY (service_tag_id) REFERENCES public.service_tag(id);


--
-- Name: service_tag_link fk_service_tag_link__services_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_tag_link
    ADD CONSTRAINT fk_service_tag_link__services_id FOREIGN KEY (services_id) REFERENCES public.services(id);


--
-- Name: services fk_services__service_category_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT fk_services__service_category_id FOREIGN KEY (service_category_id) REFERENCES public.service_category(id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM rdsadmin;
REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

