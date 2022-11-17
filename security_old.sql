--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5
-- Dumped by pg_dump version 14.5

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
-- Name: organization; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.organization (
    id bigint NOT NULL,
    created_at timestamp without time zone,
    created_by character varying(255),
    updated_at timestamp without time zone,
    updated_by character varying(255),
    address character varying(255),
    date_of_establishment timestamp without time zone,
    description character varying(5000),
    email character varying(255),
    fax character varying(255),
    name character varying(255),
    phone character varying(255),
    status character varying(255)
);


ALTER TABLE public.organization OWNER TO postgres;

--
-- Name: organizational_unit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.organizational_unit (
    id bigint NOT NULL,
    created_at timestamp without time zone,
    created_by character varying(255),
    updated_at timestamp without time zone,
    updated_by character varying(255),
    description character varying(5000),
    name character varying(255),
    status character varying(255),
    organization_id bigint
);


ALTER TABLE public.organizational_unit OWNER TO postgres;

--
-- Name: permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.permission (
    id bigint NOT NULL,
    created_at timestamp without time zone,
    created_by character varying(255),
    updated_at timestamp without time zone,
    updated_by character varying(255),
    description character varying(255),
    name character varying(255),
    permission character varying(255),
    version bigint
);


ALTER TABLE public.permission OWNER TO postgres;

--
-- Name: policy_rule_result_hits; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.policy_rule_result_hits (
    policy_rule_result_id bigint NOT NULL,
    hits character varying(255)
);


ALTER TABLE public.policy_rule_result_hits OWNER TO postgres;

--
-- Name: psql_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.psql_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.psql_seq OWNER TO postgres;

--
-- Name: result; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.result (
    id bigint NOT NULL,
    created_at timestamp without time zone,
    created_by character varying(255),
    updated_at timestamp without time zone,
    updated_by character varying(255),
    policy_id bigint NOT NULL,
    rule_id bigint NOT NULL,
    scroll_id character varying(255),
    terminated_early boolean NOT NULL,
    time_out boolean NOT NULL,
    took_in_millis bigint NOT NULL,
    total_hits bigint NOT NULL
);


ALTER TABLE public.result OWNER TO postgres;

--
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id bigint NOT NULL,
    created_at timestamp without time zone,
    created_by character varying(255),
    updated_at timestamp without time zone,
    updated_by character varying(255),
    description character varying(255),
    grp boolean NOT NULL,
    name character varying(255),
    version bigint
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- Name: roles_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles_permissions (
    role_id bigint NOT NULL,
    permissions_id bigint NOT NULL
);


ALTER TABLE public.roles_permissions OWNER TO postgres;

--
-- Name: roles_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles_roles (
    role_id bigint NOT NULL,
    roles_id bigint NOT NULL
);


ALTER TABLE public.roles_roles OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    created_at timestamp without time zone,
    created_by character varying(255),
    updated_at timestamp without time zone,
    updated_by character varying(255),
    active boolean NOT NULL,
    email character varying(255),
    google_mfa_key character varying(255),
    invite_code character varying(255),
    invite_link character varying(1000),
    invite_sent_on timestamp without time zone,
    invite_status character varying(255),
    is_mfa_enable character varying(255),
    mfa_qr_image_file_path character varying(255),
    password character varying(255),
    temp_password character varying(255),
    type character varying(255),
    username character varying(255),
    organization_id bigint,
    owner_id bigint
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_roles (
    user_id bigint NOT NULL,
    roles_id bigint NOT NULL
);


ALTER TABLE public.users_roles OWNER TO postgres;

--
-- Data for Name: organization; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.organization (id, created_at, created_by, updated_at, updated_by, address, date_of_establishment, description, email, fax, name, phone, status) FROM stdin;
9	2022-05-02 11:20:42.352	test	2022-05-02 11:20:42.352	test	\N	\N	\N	\N	\N	synectiks	\N	\N
17	2022-06-28 16:35:28.243	mohit	2022-06-28 16:35:28.243	mohit	\N	\N	\N	\N	\N	mohit	\N	\N
20	2022-08-22 13:41:42.874	test@synectiks.com	2022-08-22 13:41:42.874	test@synectiks.com	\N	\N	\N	\N	\N	Synectiks	\N	\N
\.


--
-- Data for Name: organizational_unit; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.organizational_unit (id, created_at, created_by, updated_at, updated_by, description, name, status, organization_id) FROM stdin;
\.


--
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.permission (id, created_at, created_by, updated_at, updated_by, description, name, permission, version) FROM stdin;
24	\N	\N	\N	\N	Team Menu	Test Permision	Team	1
25	\N	\N	\N	\N	Team MenuxbMY	Test PermisionouSW	TeamhIkV	3048
26	\N	\N	\N	\N	Team menu	Test Permision	Team	1
27	\N	\N	\N	\N	Team Menu _RtgZ	Test Permision_wsve	TestTeam _fANs	2660
28	\N	\N	\N	\N	Team Menu _nDcO	Test Permision_COWX	TestTeam _Kzrc	6222
29	\N	\N	\N	\N	Team Menu _KXsu	Test Permision_tZjF	TestTeam _nhDb	1660
30	\N	\N	\N	\N	Team Menu _KXsu	Test Permision_tZjF_Updated	TestTeam _nhDb	1660
31	\N	\N	\N	\N	Team Menu _zkvU	Test Permision_ZuKj	TestTeam _tYXo	9657
32	\N	\N	\N	\N	Team Menu _zkvU	Test Permision_ZuKj_Updated	TestTeam _tYXo	9657
33	\N	\N	\N	\N	Team Menu _uihQ	Test Permision_Ctqo	TestTeam _nBpa	9051
34	\N	\N	\N	\N	Team Menu _uihQ	Test Permision_Ctqo_Updated	TestTeam _nBpa	9051
35	\N	\N	\N	\N	Team Menu _hhJN	Test Permision_EBng_Updated	TestTeam _YZOM	5136
36	\N	\N	\N	\N	Team Menu _ueiN	Test Permision_Jkuo_Updated	TestTeam _iZdr	5487
37	\N	\N	\N	\N	Team Menu _ukfU	Test Permision_Vbnl_Updated	TestTeam _meUd	9534
38	\N	\N	\N	\N	Team Menu _RqAo	Test Permision_fhfE_Updated	TestTeam _srDp	1487
39	\N	\N	\N	\N	Team Menu _bgNz	Test Permision_loBp_Updated	TestTeam _uPMv	5097
40	\N	\N	\N	\N	Team Menu _MFci	Test Permision_NxmY_Updated	TestTeam _zKEQ	4479
41	\N	\N	\N	\N	Team Menu _htch	Test Permision_lQVa_Updated	TestTeam _WtjG	7796
42	\N	\N	\N	\N	Team Menu _cqmF	Test Permision_cHIV_Updated	TestTeam _OBqp	1456
\.


--
-- Data for Name: policy_rule_result_hits; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.policy_rule_result_hits (policy_rule_result_id, hits) FROM stdin;
\.


--
-- Data for Name: result; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.result (id, created_at, created_by, updated_at, updated_by, policy_id, rule_id, scroll_id, terminated_early, time_out, took_in_millis, total_hits) FROM stdin;
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (id, created_at, created_by, updated_at, updated_by, description, grp, name, version) FROM stdin;
1	\N	\N	\N	\N	\N	f	GENERAL_DIRECTOR	\N
2	\N	\N	\N	\N	\N	f	PSDS_ADMIN	\N
5	\N	\N	\N	\N	\N	t	PSDS_ADMIN_GRP	\N
6	\N	\N	\N	\N	\N	t	GENERAL_DIRECTOR_GRP	\N
13	\N	\N	\N	\N	\N	t	BUDGET_HOLDER_GRP	\N
14	\N	\N	\N	\N	\N	f	BUDGET_HOLDER	\N
45	\N	\N	\N	\N	Account setting	f	GAMA_USER	1
47	\N	\N	\N	\N	This role is for Account setting _LtCi	f	GAMA_USER_WbyE	7433
49	\N	\N	\N	\N	This role is for Account setting _srzn	f	GAMA_USER_cnYw	3296
51	\N	\N	\N	\N	This role is for Account setting _aGvd	f	GAMA_USER_XmQE	6094
54	\N	\N	\N	\N	This role is for Account setting _mhVt	f	GAMA_USER_KAUV	6549
55	\N	\N	\N	\N	This role is for Account setting _PRch	f	GAMA_USER_zOWJ	3189
57	\N	\N	\N	\N	This role is for Account setting _esha	f	GAMA_USER_QTpa_Updated	5562
60	\N	\N	\N	\N	This role is for Account setting _zfNN	f	GAMA_USER_ISos_Updated	4504
63	\N	\N	\N	\N	This role is for Account setting _Clpz	f	GAMA_USER_dwSi_Updated	91
66	\N	\N	\N	\N	This role is for Account setting _zBLK	f	GAMA_USER_ocyf_Updated	9122
69	\N	\N	\N	\N	This role is for Account setting _DFpr	f	GAMA_USER_UVbG_Updated	7765
72	\N	\N	\N	\N	This role is for Account setting _MIfZ	f	GAMA_USER_LVyy_Updated	5630
75	\N	\N	\N	\N	This role is for Account setting _odjm	f	GAMA_USER_PQrb_Updated	4235
78	\N	\N	\N	\N	This role is for Account setting _KXsT	f	GAMA_USER_mCQL_Updated	8894
81	\N	\N	\N	\N	This role is for Account setting _crWl	f	GAMA_USER_cmZa_Updated	268
84	\N	\N	\N	\N	This role is for Account setting _YUEE	f	GAMA_USER_qEEQ_Updated	7290
87	\N	\N	\N	\N	This role is for Account setting _QMAE	f	GAMA_USER_sSzm_Updated	5955
90	\N	\N	\N	\N	This role is for Account setting _tvrE	f	GAMA_USER_mIyT_Updated	5833
93	\N	\N	\N	\N	This role is for Account setting _kprQ	f	GAMA_USER_bUqv_Updated	6703
96	\N	\N	\N	\N	This role is for Account setting _IOKT	f	GAMA_USER_qYNi_Updated	7604
99	\N	\N	\N	\N	This role is for Account setting _SwNe	f	GAMA_USER_DxiU_Updated	2950
102	\N	\N	\N	\N	This role is for Account setting _Hjiz	f	GAMA_USER_mKmE_Updated	6363
105	\N	\N	\N	\N	This role is for Account setting _EyYF	f	GAMA_USER_XWyN_Updated	284
108	\N	\N	\N	\N	This role is for Account setting _fpoz	f	GAMA_USER_KMyn_Updated	5744
111	\N	\N	\N	\N	This role is for Account setting _EyIn	f	GAMA_USER_pdgE_Updated	8453
114	\N	\N	\N	\N	This role is for Account setting _gKpw	f	GAMA_USER_sxXj_Updated	8124
117	\N	\N	\N	\N	This role is for Account setting _rgHf	f	GAMA_USER_lUKI_Updated	9848
120	\N	\N	\N	\N	This role is for Account setting _JrEd	f	GAMA_USER_tVnm_Updated	7664
123	\N	\N	\N	\N	This role is for Account setting _apMc	f	GAMA_USER_TleZ_Updated	8403
126	\N	\N	\N	\N	This role is for Account setting _TAnK	f	GAMA_USER_DEoz_Updated	5596
129	\N	\N	\N	\N	This role is for Account setting _NzxA	f	GAMA_USER_QjWW_Updated	4790
132	\N	\N	\N	\N	This role is for Account setting _ZgoI	f	GAMA_USER_PKoc_Updated	5727
135	\N	\N	\N	\N	This role is for Account setting _lCuZ	f	GAMA_USER_mnst_Updated	4759
138	\N	\N	\N	\N	This role is for Account setting _hgTx	f	GAMA_USER_mQLO_Updated	6496
141	\N	\N	\N	\N	This role is for Account setting _pszv	f	GAMA_USER_jtje_Updated	116
144	\N	\N	\N	\N	This role is for Account setting _lRSx	f	GAMA_USER_Zjtw_Updated	5880
147	\N	\N	\N	\N	This role is for Account setting _irif	f	GAMA_USER_YUMD_Updated	4849
150	\N	\N	\N	\N	This role is for Account setting _oYIC	f	GAMA_USER_YoSX_Updated	1149
153	\N	\N	\N	\N	This role is for Account setting _MQyZ	f	GAMA_USER_AafQ_Updated	267
156	\N	\N	\N	\N	This role is for Account setting _LKUR	f	GAMA_USER_NUgJ_Updated	5147
159	\N	\N	\N	\N	This role is for Account setting _SnIa	f	GAMA_USER_IVLt_Updated	4310
162	\N	\N	\N	\N	This role is for Account setting _FQVi	f	GAMA_USER_tofy_Updated	7735
165	\N	\N	\N	\N	This role is for Account setting _cGFh	f	GAMA_USER_MPBQ_Updated	3534
168	\N	\N	\N	\N	This role is for Account setting _fgVx	f	GAMA_USER_BWMg_Updated	6250
171	\N	\N	\N	\N	This role is for Account setting _jJxc	f	GAMA_USER_SRNR_Updated	7281
174	\N	\N	\N	\N	This role is for Account setting _tfea	f	GAMA_USER_cRYs_Updated	472
177	\N	\N	\N	\N	This role is for Account setting _Ipjw	f	GAMA_USER_Pdko_Updated	124
180	\N	\N	\N	\N	This role is for Account setting _KAAr	f	GAMA_USER_lAQE_Updated	7104
183	\N	\N	\N	\N	This role is for Account setting _PZBL	f	GAMA_USER_axxN_Updated	935
186	\N	\N	\N	\N	This role is for Account setting _fCwu	f	GAMA_USER_ankV_Updated	7221
189	\N	\N	\N	\N	This role is for Account setting _sAhP	f	GAMA_USER_Csfu_Updated	467
192	\N	\N	\N	\N	This role is for Account setting _WYvS	f	GAMA_USER_XmBa_Updated	9676
195	\N	\N	\N	\N	This role is for Account setting _DlFK	f	GAMA_USER_IhaH_Updated	922
198	\N	\N	\N	\N	This role is for Account setting _DyhG	f	GAMA_USER_pvND_Updated	2705
201	\N	\N	\N	\N	This role is for Account setting _UAtq	f	GAMA_USER_vBVx_Updated	806
204	\N	\N	\N	\N	This role is for Account setting _xyia	f	GAMA_USER_jZfT_Updated	2307
207	\N	\N	\N	\N	This role is for Account setting _IdFi	f	GAMA_USER_ILsG_Updated	3049
210	\N	\N	\N	\N	This role is for Account setting _eRod	f	GAMA_USER_SaJJ_Updated	6732
213	\N	\N	\N	\N	This role is for Account setting _KUBO	f	GAMA_USER_qWhT_Updated	2597
216	\N	\N	\N	\N	This role is for Account setting _wFDz	f	GAMA_USER_YmUP_Updated	8744
219	\N	\N	\N	\N	This role is for Account setting _icJd	f	GAMA_USER_cVQX_Updated	378
222	\N	\N	\N	\N	This role is for Account setting _JRZd	f	GAMA_USER_xwcl_Updated	5974
225	\N	\N	\N	\N	This role is for Account setting _tVkF	f	GAMA_USER_CbSV_Updated	1465
228	\N	\N	\N	\N	This role is for Account setting _qUyg	f	GAMA_USER_lsjE_Updated	7079
237	\N	\N	\N	\N	This role is for Account setting _JKgX	f	GAMA_USER_xZPs_Updated	7794
231	\N	\N	\N	\N	This role is for Account setting _ffaA	f	GAMA_USER_xkPm_Updated	7393
234	\N	\N	\N	\N	This role is for Account setting _XHDc	f	GAMA_USER_geBn_Updated	8099
240	\N	\N	\N	\N	This role is for Account setting _TBti	f	GAMA_USER_yqZe_Updated	555
243	\N	\N	\N	\N	This role is for Account setting _xtbi	f	GAMA_USER_VGmx_Updated	7831
246	\N	\N	\N	\N	This role is for Account setting _XMii	f	GAMA_USER_SIyP_Updated	4846
249	\N	\N	\N	\N	This role is for Account setting _VADH	f	GAMA_USER_kqhG_Updated	7096
252	\N	\N	\N	\N	This role is for Account setting _WIrE	f	GAMA_USER_ZNtf_Updated	8976
\.


--
-- Data for Name: roles_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles_permissions (role_id, permissions_id) FROM stdin;
\.


--
-- Data for Name: roles_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles_roles (role_id, roles_id) FROM stdin;
5	2
6	1
14	13
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, created_at, created_by, updated_at, updated_by, active, email, google_mfa_key, invite_code, invite_link, invite_sent_on, invite_status, is_mfa_enable, mfa_qr_image_file_path, password, temp_password, type, username, organization_id, owner_id) FROM stdin;
11	2022-05-02 11:28:14.631	admin	2022-05-02 11:28:14.631	admin	t	admin.test@synectiks.com	\N	\N	\N	\N	\N	\N	\N	$shiro1$SHA-256$500000$r1wbw4YffyGIvn4TfI82rQ==$ZDCiG1BpC69MU6B+FcHZ8KEw7P+CRfyXc01SJMFWVis=	\N	\N	admin.test@synectiks.com	9	\N
10	2022-05-02 11:20:42.352	test	2022-05-02 11:20:42.352	test	t	test.test@synectiks.com	\N	\N	\N	\N	\N	\N	\N	$shiro1$SHA-256$500000$ZFnWHu89/xN6DaZW7O8GWg==$ypzqXYxWeyqApS0ZJWlIVOAhB2SClfKFe2u/CFxmGdE=	\N	\N	test.test@synectiks.com	9	\N
15	2022-05-04 17:10:24.385	user	2022-05-04 17:10:24.385	user	t	user.test@synectiks.com	\N	\N	\N	\N	\N	\N	\N	$shiro1$SHA-256$500000$tS115KIjRtfeuTBly2G2hw==$fJCBQCKnwAJ7sOv3/awfbqnLf7Fw4MwXL1aYHA8pu64=	\N	\N	user.test@synectiks.com	9	\N
18	2022-06-28 16:35:28.243	mohit	2022-06-28 16:35:28.243	mohit	f	mohit@gmail.com	\N	\N	\N	\N	\N	\N	\N	$shiro1$SHA-256$500000$IJegzGp94IepszzguxScMQ==$qJ9A5oUdASGP0MRZTGT+ha1gipKZoKeCGt9o5GnRiuw=	\N	\N	mohit	17	\N
19	2022-06-28 16:42:41.954	hgh	2022-06-28 16:42:41.954	hgh	f	gggg@gmail.com	\N	\N	\N	\N	\N	\N	\N	$shiro1$SHA-256$500000$XyFATZr2Ku+3ndSr9tBydg==$LYWRNVgnnx9GYIIp/Dg+evh4d5O1CDT/q6XF+NArhfs=	\N	\N	hgh	17	\N
21	2022-08-22 13:41:42.874	test@synectiks.com	2022-08-22 13:41:42.874	test@synectiks.com	t	test@synectiks.com	\N	\N	\N	\N	\N	\N	\N	$shiro1$SHA-256$500000$kMDTI5xwNdh2Wq8WUUmaaA==$X8wERhaIBC6uBE6z5qecnXrpQy+pNA8YwBGrdh7hnq4=	\N	\N	test@synectiks.com	20	\N
22	2022-08-22 13:43:56.141	test@gmail.com	2022-08-22 13:43:56.141	test@gmail.com	t	test@gmail.com	\N	\N	\N	\N	\N	\N	\N	$shiro1$SHA-256$500000$s44eR+6UzgclOaw3qInhhw==$F+XBuUL10XAbJ6tBn2MR8gFAeGzMFwxHrsEyL/tKZsI=	\N	\N	test@gmail.com	20	\N
\.


--
-- Data for Name: users_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_roles (user_id, roles_id) FROM stdin;
10	5
11	6
15	14
\.


--
-- Name: psql_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.psql_seq', 252, true);


--
-- Name: organization organization_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organization
    ADD CONSTRAINT organization_pkey PRIMARY KEY (id);


--
-- Name: organizational_unit organizational_unit_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organizational_unit
    ADD CONSTRAINT organizational_unit_pkey PRIMARY KEY (id);


--
-- Name: permission permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- Name: result result_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.result
    ADD CONSTRAINT result_pkey PRIMARY KEY (id);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: roles_roles roles_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles_roles
    ADD CONSTRAINT roles_roles_pkey PRIMARY KEY (role_id, roles_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users_roles fk2o0jvgh89lemvvo17cbqvdxaa; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_roles
    ADD CONSTRAINT fk2o0jvgh89lemvvo17cbqvdxaa FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: users fk9q8fdenwsqjwrjfivd5ovv5k3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT fk9q8fdenwsqjwrjfivd5ovv5k3 FOREIGN KEY (organization_id) REFERENCES public.organization(id);


--
-- Name: roles_permissions fka1duuqu7fiw2v9r5va5esghd5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles_permissions
    ADD CONSTRAINT fka1duuqu7fiw2v9r5va5esghd5 FOREIGN KEY (permissions_id) REFERENCES public.permission(id);


--
-- Name: users_roles fka62j07k5mhgifpp955h37ponj; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_roles
    ADD CONSTRAINT fka62j07k5mhgifpp955h37ponj FOREIGN KEY (roles_id) REFERENCES public.roles(id);


--
-- Name: roles_roles fkh0er2qrwpns8hej8uk95j4f6h; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles_roles
    ADD CONSTRAINT fkh0er2qrwpns8hej8uk95j4f6h FOREIGN KEY (role_id) REFERENCES public.roles(id);


--
-- Name: organizational_unit fkjp8up3ysmx52e26hat4ddfvwc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organizational_unit
    ADD CONSTRAINT fkjp8up3ysmx52e26hat4ddfvwc FOREIGN KEY (organization_id) REFERENCES public.organization(id);


--
-- Name: users fkntyuh06i5y3y6ir598luxy3k9; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT fkntyuh06i5y3y6ir598luxy3k9 FOREIGN KEY (owner_id) REFERENCES public.users(id);


--
-- Name: roles_roles fkqao0vjvqum05dlyy56wc7r5mi; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles_roles
    ADD CONSTRAINT fkqao0vjvqum05dlyy56wc7r5mi FOREIGN KEY (roles_id) REFERENCES public.roles(id);


--
-- Name: roles_permissions fkqi9odri6c1o81vjox54eedwyh; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles_permissions
    ADD CONSTRAINT fkqi9odri6c1o81vjox54eedwyh FOREIGN KEY (role_id) REFERENCES public.roles(id);


--
-- Name: policy_rule_result_hits fktgfw2q551t5fwvtav8uataand; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.policy_rule_result_hits
    ADD CONSTRAINT fktgfw2q551t5fwvtav8uataand FOREIGN KEY (policy_rule_result_id) REFERENCES public.result(id);


--
-- PostgreSQL database dump complete
--

