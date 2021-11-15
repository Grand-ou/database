--
-- PostgreSQL database dump
--

-- Dumped from database version 14.0
-- Dumped by pg_dump version 14.0

-- Started on 2021-11-15 10:41:14 CST

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

--
-- TOC entry 5 (class 2615 OID 25370)
-- Name: stock; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA stock;


ALTER SCHEMA stock OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 225 (class 1259 OID 25486)
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 25485)
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- TOC entry 3768 (class 0 OID 0)
-- Dependencies: 224
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- TOC entry 227 (class 1259 OID 25495)
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 25494)
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- TOC entry 3769 (class 0 OID 0)
-- Dependencies: 226
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- TOC entry 223 (class 1259 OID 25479)
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 25478)
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- TOC entry 3770 (class 0 OID 0)
-- Dependencies: 222
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- TOC entry 229 (class 1259 OID 25502)
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 25511)
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 25510)
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- TOC entry 3771 (class 0 OID 0)
-- Dependencies: 230
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- TOC entry 228 (class 1259 OID 25501)
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- TOC entry 3772 (class 0 OID 0)
-- Dependencies: 228
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- TOC entry 233 (class 1259 OID 25518)
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 25517)
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- TOC entry 3773 (class 0 OID 0)
-- Dependencies: 232
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- TOC entry 235 (class 1259 OID 25577)
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 25576)
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- TOC entry 3774 (class 0 OID 0)
-- Dependencies: 234
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- TOC entry 221 (class 1259 OID 25470)
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 25469)
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- TOC entry 3775 (class 0 OID 0)
-- Dependencies: 220
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- TOC entry 219 (class 1259 OID 25461)
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 25460)
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- TOC entry 3776 (class 0 OID 0)
-- Dependencies: 218
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- TOC entry 236 (class 1259 OID 25696)
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 25380)
-- Name: company; Type: TABLE; Schema: stock; Owner: postgres
--

CREATE TABLE stock.company (
    cid character varying NOT NULL,
    cname character varying NOT NULL,
    cowner character varying NOT NULL,
    yield numeric,
    pe_ratio numeric,
    industry_type character varying NOT NULL
);


ALTER TABLE stock.company OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 25447)
-- Name: deal; Type: TABLE; Schema: stock; Owner: postgres
--

CREATE TABLE stock.deal (
    company_id character varying NOT NULL,
    ddate date NOT NULL,
    open_price numeric NOT NULL,
    close_price numeric NOT NULL,
    volume character varying,
    high numeric,
    low numeric
);


ALTER TABLE stock.deal OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 25435)
-- Name: ema; Type: TABLE; Schema: stock; Owner: postgres
--

CREATE TABLE stock.ema (
    sid integer NOT NULL,
    company_id character varying NOT NULL,
    fast_line numeric,
    slow_line numeric,
    loss numeric,
    profit numeric
);


ALTER TABLE stock.ema OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 25371)
-- Name: investor; Type: TABLE; Schema: stock; Owner: postgres
--

CREATE TABLE stock.investor (
    iid integer NOT NULL,
    iname character varying(10) NOT NULL,
    acct_no character varying(10) NOT NULL,
    pwd character varying NOT NULL,
    phone character varying
);


ALTER TABLE stock.investor OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 25411)
-- Name: kd; Type: TABLE; Schema: stock; Owner: postgres
--

CREATE TABLE stock.kd (
    sid integer NOT NULL,
    company_id character varying NOT NULL,
    threshold numeric,
    kd_length numeric,
    loss numeric,
    profit numeric
);


ALTER TABLE stock.kd OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 25423)
-- Name: macd; Type: TABLE; Schema: stock; Owner: postgres
--

CREATE TABLE stock.macd (
    sid integer NOT NULL,
    company_id character varying NOT NULL,
    fast_line numeric,
    slow_line numeric,
    loss numeric,
    profit numeric
);


ALTER TABLE stock.macd OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 25399)
-- Name: rsi; Type: TABLE; Schema: stock; Owner: postgres
--

CREATE TABLE stock.rsi (
    sid integer NOT NULL,
    company_id character varying NOT NULL,
    threshold numeric,
    rsi_length numeric,
    loss numeric,
    profit numeric
);


ALTER TABLE stock.rsi OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 25387)
-- Name: strategy; Type: TABLE; Schema: stock; Owner: postgres
--

CREATE TABLE stock.strategy (
    sid integer NOT NULL,
    budget numeric NOT NULL,
    creator_id integer,
    strategy_type character(1) NOT NULL
);


ALTER TABLE stock.strategy OWNER TO postgres;

--
-- TOC entry 3510 (class 2604 OID 25489)
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- TOC entry 3511 (class 2604 OID 25498)
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- TOC entry 3509 (class 2604 OID 25482)
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- TOC entry 3512 (class 2604 OID 25505)
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- TOC entry 3513 (class 2604 OID 25514)
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- TOC entry 3514 (class 2604 OID 25521)
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- TOC entry 3515 (class 2604 OID 25580)
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- TOC entry 3508 (class 2604 OID 25473)
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- TOC entry 3507 (class 2604 OID 25464)
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- TOC entry 3751 (class 0 OID 25486)
-- Dependencies: 225
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- TOC entry 3753 (class 0 OID 25495)
-- Dependencies: 227
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- TOC entry 3749 (class 0 OID 25479)
-- Dependencies: 223
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add investor	7	add_investor
26	Can change investor	7	change_investor
27	Can delete investor	7	delete_investor
28	Can view investor	7	view_investor
29	Can add company	8	add_company
30	Can change company	8	change_company
31	Can delete company	8	delete_company
32	Can view company	8	view_company
33	Can add strategy	9	add_strategy
34	Can change strategy	9	change_strategy
35	Can delete strategy	9	delete_strategy
36	Can view strategy	9	view_strategy
37	Can add rsi	10	add_rsi
38	Can change rsi	10	change_rsi
39	Can delete rsi	10	delete_rsi
40	Can view rsi	10	view_rsi
41	Can add kd	11	add_kd
42	Can change kd	11	change_kd
43	Can delete kd	11	delete_kd
44	Can view kd	11	view_kd
45	Can add macd	12	add_macd
46	Can change macd	12	change_macd
47	Can delete macd	12	delete_macd
48	Can view macd	12	view_macd
49	Can add ema	13	add_ema
50	Can change ema	13	change_ema
51	Can delete ema	13	delete_ema
52	Can view ema	13	view_ema
53	Can add deal	14	add_deal
54	Can change deal	14	change_deal
55	Can delete deal	14	delete_deal
56	Can view deal	14	view_deal
\.


--
-- TOC entry 3755 (class 0 OID 25502)
-- Dependencies: 229
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
\.


--
-- TOC entry 3757 (class 0 OID 25511)
-- Dependencies: 231
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- TOC entry 3759 (class 0 OID 25518)
-- Dependencies: 233
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- TOC entry 3761 (class 0 OID 25577)
-- Dependencies: 235
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- TOC entry 3747 (class 0 OID 25470)
-- Dependencies: 221
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	myapp	investor
8	myapp	company
9	myapp	strategy
10	myapp	rsi
11	myapp	kd
12	myapp	macd
13	myapp	ema
14	myapp	deal
\.


--
-- TOC entry 3745 (class 0 OID 25461)
-- Dependencies: 219
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2021-11-14 16:52:09.849492+08
2	auth	0001_initial	2021-11-14 16:52:10.106744+08
3	admin	0001_initial	2021-11-14 16:52:10.160519+08
4	admin	0002_logentry_remove_auto_add	2021-11-14 16:52:10.189103+08
5	admin	0003_logentry_add_action_flag_choices	2021-11-14 16:52:10.210871+08
6	contenttypes	0002_remove_content_type_name	2021-11-14 16:52:10.290162+08
7	auth	0002_alter_permission_name_max_length	2021-11-14 16:52:10.310964+08
8	auth	0003_alter_user_email_max_length	2021-11-14 16:52:10.341853+08
9	auth	0004_alter_user_username_opts	2021-11-14 16:52:10.363032+08
10	auth	0005_alter_user_last_login_null	2021-11-14 16:52:10.406441+08
11	auth	0006_require_contenttypes_0002	2021-11-14 16:52:10.43887+08
12	auth	0007_alter_validators_add_error_messages	2021-11-14 16:52:10.461859+08
13	auth	0008_alter_user_username_max_length	2021-11-14 16:52:10.539201+08
14	auth	0009_alter_user_last_name_max_length	2021-11-14 16:52:10.590228+08
15	auth	0010_alter_group_name_max_length	2021-11-14 16:52:10.63887+08
16	auth	0011_update_proxy_permissions	2021-11-14 16:52:10.658584+08
17	auth	0012_alter_user_first_name_max_length	2021-11-14 16:52:10.712829+08
18	sessions	0001_initial	2021-11-14 19:18:06.779505+08
\.


--
-- TOC entry 3762 (class 0 OID 25696)
-- Dependencies: 236
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- TOC entry 3737 (class 0 OID 25380)
-- Dependencies: 211
-- Data for Name: company; Type: TABLE DATA; Schema: stock; Owner: postgres
--

COPY stock.company (cid, cname, cowner, yield, pe_ratio, industry_type) FROM stdin;
2330	台積電	劉德音	0.0166	27.33	半導體業
2454	聯發科	蔡明介	0.0376	16.27	半導體業
2412	中華電	謝繼茂	0.0383	124.73	通信網路業
6505	台塑化	陳寶郎	0.0058	18.77	油電燃氣業
2317	鴻海	劉揚偉	0.0367	11.21	其他電子業
\.


--
-- TOC entry 3743 (class 0 OID 25447)
-- Dependencies: 217
-- Data for Name: deal; Type: TABLE DATA; Schema: stock; Owner: postgres
--

COPY stock.deal (company_id, ddate, open_price, close_price, volume, high, low) FROM stdin;
2330	2021-11-12	610	604	128	611	602
2330	2021-11-11	600	606	122	606	600
2330	2021-11-10	611	612	113	612	608
2330	2021-11-09	611	611	259	617	610
2330	2021-11-08	600	602	125	602	598
2330	2021-11-05	598	600	210	600	595
2330	2021-11-04	592	587	111	594	585
2330	2021-11-03	597	592	67.7	597	592
2330	2021-11-02	594	592	98.1	597	590
2330	2021-11-01	591	590	101	593	590
2330	2021-10-29	595	590	164	596	589
2330	2021-10-28	598	595	101	598	591
2330	2021-10-27	598	599	97.1	599	594
2330	2021-10-26	595	599	162	600	593
2330	2021-10-25	597	593	105	597	590
2330	2021-10-22	600	600	85.2	602	594
2330	2021-10-21	602	596	101	603	595
2330	2021-10-20	603	598	105	604	597
2330	2021-10-19	598	600	112	600	593
2330	2021-10-18	604	590	118	604	590
2330	2021-10-15	592	600	329	600	586
2330	2021-10-14	579	573	82.1	579	573
2330	2021-10-13	572	571	110	575	570
2330	2021-10-12	570	575	155	575	564
2330	2021-10-08	582	575	131	583	573
2330	2021-10-07	575	580	165	582	572
2330	2021-10-06	573	571	193	574	565
2330	2021-10-05	562	572	204	572	560
2330	2021-10-04	574	572	127	575	569
2330	2021-10-01	579	574	224	579	571
2330	2021-09-30	580	580	211	585	575
2330	2021-09-29	580	580	300	583	577
2330	2021-09-28	595	594	103	596	592
2330	2021-09-27	600	602	120	602	593
2330	2021-09-24	591	598	103	598	590
2330	2021-09-23	588	588	134	593	588
2330	2021-09-22	586	586	251	589	583
2330	2021-09-17	600	600	255	610	599
2330	2021-09-16	603	600	140	607	599
2330	2021-09-15	610	607	159	613	607
2330	2021-09-14	618	613	98.5	618	612
2330	2021-09-13	619	615	97.4	620	613
2330	2021-09-10	615	622	104	623	614
2330	2021-09-09	612	619	119	620	610
2330	2021-09-08	622	619	240	627	612
2330	2021-09-07	634	623	172	634	623
2330	2021-09-06	623	631	373	638	621
2330	2021-09-03	610	620	333	620	610
2330	2021-09-02	613	607	163	615	607
2330	2021-09-01	614	613	191	614	608
2330	2021-08-31	604	614	359	614	598
2330	2021-08-30	602	605	244	605	599
2330	2021-08-27	596	599	176	600	593
2330	2021-08-26	601	594	268	603	591
2330	2021-08-25	579	585	168	585	574
2330	2021-08-24	574	572	157	575	571
2330	2021-08-23	560	566	197	572	559
2330	2021-08-20	560	552	266	563	551
2330	2021-08-19	573	559	238	573	559
2330	2021-08-18	568	574	269	575	566
2330	2021-08-17	580	580	185	582	578
2330	2021-08-16	582	584	116	586	578
2330	2021-08-13	585	581	148	585	579
2330	2021-08-12	586	586	93.8	588	584
2330	2021-08-11	590	590	119	590	585
2330	2021-08-10	596	591	104	596	589
2330	2021-08-09	590	595	104	595	583
2330	2021-08-06	596	591	82.8	596	588
2330	2021-08-05	598	596	93.4	598	593
2330	2021-08-04	598	596	141	598	594
2330	2021-08-03	594	594	167	594	590
2330	2021-08-02	583	590	146	590	580
2330	2021-07-30	581	580	152	582	578
2330	2021-07-29	585	583	145	585	577
2330	2021-07-28	576	579	229	579	573
2330	2021-07-27	581	580	110	584	580
2330	2021-07-26	591	580	131	591	580
2330	2021-07-23	592	585	92.1	592	583
2330	2021-07-22	589	591	160	594	587
2330	2021-07-21	586	585	154	586	580
2330	2021-07-20	579	581	95	584	579
2330	2021-07-19	583	582	251	584	578
2330	2021-07-16	591	589	366	595	588
2330	2021-07-15	613	614	141	614	608
2330	2021-07-14	613	613	243	615	608
2330	2021-07-13	600	607	332	608	599
2330	2021-07-12	595	593	196	597	590
2330	2021-07-09	582	584	178	585	580
2330	2021-07-08	595	588	127	595	588
2330	2021-07-07	590	594	102	594	588
2330	2021-07-06	595	592	81.8	596	589
2330	2021-07-05	588	591	180	597	588
2330	2021-07-02	590	588	116	593	587
2330	2021-07-01	596	593	111	597	591
2330	2021-06-30	599	595	203	599	595
2330	2021-06-29	598	595	184	598	591
2330	2021-06-28	590	590	90.6	590	586
2330	2021-06-25	598	591	114	598	589
2330	2021-06-24	598	590	114	598	588
2330	2021-06-23	583	595	215	598	581
2330	2021-06-22	585	578	178	588	578
2330	2021-06-21	590	583	277	594	583
2330	2021-06-18	608	603	254	608	601
2330	2021-06-17	601	606	159	606	598
2330	2021-06-16	608	605	174	608	605
2330	2021-06-15	607	609	184	609	606
2330	2021-06-11	602	602	150	603	600
2330	2021-06-10	591	599	177	599	587
2330	2021-06-09	586	586	126	588	583
2330	2021-06-08	590	589	83.1	595	588
2330	2021-06-07	594	592	105	595	583
2330	2021-06-04	591	595	95.2	595	590
2330	2021-06-03	600	596	189	600	596
2330	2021-06-02	600	595	134	600	593
2330	2021-06-01	598	598	110	599	595
2330	2021-05-31	595	597	188	597	590
2330	2021-05-28	587	590	181	592	582
2330	2021-05-27	580	582	406	582	573
2330	2021-05-26	587	585	114	588	581
2330	2021-05-25	576	583	205	584	573
2330	2021-05-24	570	568	90.9	572	566
2330	2021-05-21	572	573	160	577	568
2330	2021-05-20	567	567	207	571	560
2330	2021-05-19	571	567	168	572	565
2330	2021-05-18	563	572	252	573	555
2330	2021-05-17	544	549	321	558	541
2330	2021-05-14	556	557	215	562	552
2330	2021-05-13	547	547	395	563	541
2330	2021-05-12	567	560	763	571	518
2330	2021-05-11	579	571	379	580	570
2330	2021-05-10	596	589	126	597	588
2330	2021-05-07	594	599	171	600	589
2330	2021-05-06	590	587	194	590	580
2330	2021-05-05	594	585	186	594	585
2330	2021-05-04	588	591	268	594	582
2330	2021-05-03	595	588	277	597	588
2330	2021-04-29	609	600	216	609	600
2330	2021-04-28	606	602	148	608	601
2330	2021-04-27	608	610	163	611	605
2330	2021-04-26	605	610	197	610	603
2330	2021-04-23	592	602	173	602	590
2330	2021-04-22	596	591	226	598	591
2330	2021-04-21	599	592	249	599	592
2330	2021-04-20	598	602	220	602	595
2330	2021-04-19	605	603	152	607	601
2330	2021-04-16	610	610	303	611	603
2330	2021-04-15	612	619	223	619	607
2330	2021-04-14	608	612	189	612	600
2330	2021-04-13	604	605	166	613	604
2330	2021-04-12	612	605	142	613	603
2330	2021-04-09	618	610	193	618	609
2330	2021-04-08	606	613	162	613	603
2330	2021-04-07	614	610	172	614	608
2330	2021-04-06	615	610	230	616	608
2330	2021-04-01	598	602	275	602	594
2330	2021-03-31	596	587	262	597	587
2330	2021-03-30	600	597	207	600	592
2330	2021-03-29	599	599	243	602	596
2330	2021-03-26	582	590	223	592	580
2330	2021-03-25	572	575	426	581	570
2330	2021-03-24	571	576	666	582	571
2330	2021-03-23	597	594	191	603	593
2330	2021-03-22	588	593	212	598	586
2330	2021-03-19	594	591	444	598	591
2330	2021-03-18	606	602	183	609	602
2330	2021-03-17	612	604	266	612	602
2330	2021-03-16	610	613	231	613	607
2330	2021-03-15	614	611	182	614	609
2330	2021-03-12	615	614	208	618	609
2330	2021-03-11	596	609	336	612	595
2330	2021-03-10	601	597	249	601	593
2330	2021-03-09	585	595	440	595	585
2330	2021-03-08	608	598	287	610	598
2330	2021-03-05	588	601	510	605	584
2330	2021-03-04	609	601	457	611	601
2330	2021-03-03	609	622	376	622	601
2330	2021-03-02	621	609	356	622	609
2330	2021-02-26	611	606	842	618	606
2330	2021-02-25	636	635	286	636	628
2330	2021-02-24	627	625	503	636	625
2330	2021-02-23	641	641	338	643	633
2330	2021-02-22	660	650	259	662	650
2330	2021-02-19	656	652	337	657	647
2330	2021-02-18	664	660	360	665	656
2330	2021-02-17	663	663	767	668	660
2330	2021-02-05	638	632	364	641	631
2330	2021-02-04	626	627	298	632	620
2330	2021-02-03	638	630	379	642	630
2330	2021-02-02	629	632	509	638	622
2330	2021-02-01	595	611	420	612	587
2330	2021-01-29	619	591	584	619	591
2330	2021-01-28	600	601	626	608	598
2330	2021-01-27	618	615	449	625	611
2330	2021-01-26	632	617	716	640	610
2330	2021-01-25	642	633	626	646	626
2330	2021-01-22	649	649	880	665	649
2330	2021-01-21	640	673	646	679	640
2330	2021-01-20	633	647	613	650	631
2330	2021-01-19	618	627	329	632	613
2330	2021-01-18	608	607	304	608	594
2330	2021-01-15	621	601	619	625	601
2330	2021-01-14	587	592	535	597	587
2330	2021-01-13	595	605	454	605	593
2330	2021-01-12	583	591	310	597	582
2330	2021-01-11	577	584	305	584	574
2330	2021-01-08	580	580	363	580	571
2330	2021-01-07	554	565	300	570	553
2330	2021-01-06	555	549	306	555	541
2330	2021-01-05	536	542	188	542	535
2330	2021-01-04	530	536	211	540	528
2330	2020-12-31	526	530	164	530	524
2330	2020-12-30	516	525	243	525	514
2330	2020-12-29	515	515	104	517	513
2330	2020-12-28	512	515	100	515	509
2330	2020-12-25	514	511	64.5	515	510
2330	2020-12-24	511	510	77.6	512	508
2330	2020-12-23	508	509	93.2	511	506
2330	2020-12-22	512	509	131	516	509
2330	2020-12-21	512	516	180	517	508
2330	2020-12-18	508	510	207	512	507
2330	2020-12-17	515	508	201	515	508
2330	2020-12-16	509	512	275	515	507
2330	2020-12-15	507	504	218	510	504
2330	2020-12-14	512	508	157	513	508
2330	2020-12-11	517	516	263	517	505
2330	2020-12-10	511	512	225	515	510
2330	2020-12-09	521	520	244	524	520
2330	2020-12-08	514	524	217	525	509
2330	2020-12-07	512	514	232	515	506
2330	2020-12-04	498.5	503	273	505	497.5
2330	2020-12-03	499.5	497	184	499.5	495
2330	2020-12-02	499.5	499	300	500	493.5
2330	2020-12-01	489.5	490	187	490	483.5
2330	2020-11-30	493	480.5	721	493.5	480.5
2330	2020-11-27	487.5	489	172	492	486.5
2330	2020-11-26	489	489	156	493.5	488
2330	2020-11-25	495	487	231	495.5	487
2330	2020-11-24	499.5	492	191	500	491.5
2330	2020-11-23	494.5	496.5	217	498.5	492
2330	2020-11-20	486	488	172	490	486
2330	2020-11-19	499	490	233	499	490
2330	2020-11-18	490	497	279	497	486.5
2330	2020-11-17	502	485.5	374	506	485.5
2330	2020-11-16	470	484	397	484.5	469
2317	2021-11-12	108.5	109	29.1	109.5	108
2317	2021-11-11	108.5	107.5	20.2	109	107.5
2317	2021-11-10	108	109	25	109.5	107.5
2317	2021-11-09	107.5	108	25.8	108	107
2317	2021-11-08	107.5	107.5	22.4	108	107
2317	2021-11-05	108	109	19.2	109	107.5
2317	2021-11-04	108.5	108	12.3	108.5	107.5
2317	2021-11-03	107.5	107.5	13.3	108.5	107.5
2317	2021-11-02	107	107.5	23	108.5	107
2317	2021-11-01	108	106.5	19.5	108	106.5
2317	2021-10-29	108.5	107	22.3	108.5	107
2317	2021-10-28	108	108.5	15.4	109	107.5
2317	2021-10-27	109	108	17.2	109	107.5
2317	2021-10-26	108.5	109	19.7	109.5	108
2317	2021-10-25	107.5	108	23	109	107
2317	2021-10-22	108	107.5	15.9	108.5	107
2317	2021-10-21	108	108	33	108.5	107
2317	2021-10-20	107.5	107.5	31.7	108.5	106.5
2317	2021-10-19	108.5	107	28.4	109	106.5
2317	2021-10-18	110.5	107.5	46.1	111	107
2317	2021-10-15	108	109.5	53.7	110	107.5
2317	2021-10-14	107	106.5	19	107.5	106.5
2317	2021-10-13	106	105.5	19.8	106.5	104.5
2317	2021-10-12	106.5	105	40.8	107	104.5
2317	2021-10-08	107.5	108	29.6	108	106.5
2317	2021-10-07	104.5	107	40.8	107	104
2317	2021-10-06	103.5	103	41.8	104.5	103
2317	2021-10-05	102	101.5	44	102.5	101
2317	2021-10-04	104.5	103	26.3	105	102.5
2317	2021-10-01	104.5	103	37.4	105	103
2317	2021-09-30	105	105	25.5	106	104
2317	2021-09-29	105	105	34.4	105.5	104.5
2317	2021-09-28	107	106.5	23.8	107.5	106
2317	2021-09-27	107	107.5	15	108.5	107
2317	2021-09-24	107.5	107.5	16.5	108	107
2317	2021-09-23	107	106.5	20.3	108	106
2317	2021-09-22	106.5	107	41.4	107.5	106
2317	2021-09-17	107.5	108.5	50.6	109.5	107
2317	2021-09-16	108.5	107.5	24.9	109.5	107.5
2317	2021-09-15	108	108.5	70	110.5	107.5
2317	2021-09-14	107.5	107.5	20.7	108	106.5
2317	2021-09-13	107.5	106.5	16.5	108	106.5
2317	2021-09-10	107	108	14.4	108.5	107
2317	2021-09-09	106.5	107	21.9	107.5	106
2317	2021-09-08	108.5	107.5	31	109.5	107
2317	2021-09-07	109.5	108.5	25.4	110	108
2317	2021-09-06	112.5	111	20.6	113	110.5
2317	2021-09-03	112	112.5	27.5	113	111.5
2317	2021-09-02	111	111.5	33.2	113	110.5
2317	2021-09-01	111	111	24.8	112	110
2317	2021-08-31	108.5	111	33.7	111	108
2317	2021-08-30	108.5	109	15.2	109	107.5
2317	2021-08-27	107.5	108	15	108.5	106.5
2317	2021-08-26	108.5	107.5	14.2	109	107
2317	2021-08-25	109	108.5	15.7	109	107.5
2317	2021-08-24	108.5	109	19.5	109	107.5
2317	2021-08-23	105.5	107.5	25.7	108	105.5
2317	2021-08-20	104	104.5	31.8	106	102
2317	2021-08-19	106	103	54.3	106	102.5
2317	2021-08-18	105.5	107	39.1	107.5	104.5
2317	2021-08-17	107.5	106.5	27.9	108	106
2317	2021-08-16	108.5	107.5	37.6	109	106.5
2317	2021-08-13	109.5	109	51	110	108
2317	2021-08-12	109	109	20.3	109.5	108
2317	2021-08-11	107	109	53.7	109	106
2317	2021-08-10	111.5	108.5	47.6	112	108.5
2317	2021-08-09	112	112	26	112.5	111
2317	2021-08-06	111.5	112.5	46.4	113	111
2317	2021-08-05	111	112	22.3	112	111
2317	2021-08-04	112	112	23.8	112.5	111
2317	2021-08-03	112.5	111.5	27.5	113	110.5
2317	2021-08-02	111	113	27.4	113	110
2317	2021-07-30	110	110	32.1	111.5	109.5
2317	2021-07-29	111	111	23.2	111.5	110
2317	2021-07-28	110.5	110.5	36	111	109
2317	2021-07-27	111	111.5	31.5	112	110
2317	2021-07-26	111	110	37	111	108.5
2317	2021-07-23	112	110.5	24.1	112	110
2317	2021-07-22	109	110.5	66.4	112.5	108.5
2317	2021-07-21	116	112.5	72.5	116	112
2317	2021-07-20	115	114.5	30.4	116	114.5
2317	2021-07-19	118.5	116.5	37.4	119	116
2317	2021-07-16	118.5	119.5	40.2	119.5	118
2317	2021-07-15	117	119.5	74.9	120	116.5
2317	2021-07-14	117.5	116	31.8	117.5	116
2317	2021-07-13	116	116.5	42.9	117	115.5
2317	2021-07-12	115.5	115	20.3	116	114.5
2317	2021-07-09	114.5	114	32.6	115	113
2317	2021-07-08	115	115.5	27.6	116.5	115
2317	2021-07-07	116.5	115	32.4	117	115
2317	2021-07-06	116.5	116.5	51.4	117.5	115.5
2317	2021-07-05	112.5	117	93	117	112
2317	2021-07-02	112	111.5	18.7	112.5	111.5
2317	2021-07-01	112.5	112	17.9	112.5	111.5
2317	2021-06-30	112	112	35.2	113.5	112
2317	2021-06-29	112.5	111.5	19.9	112.5	111.5
2317	2021-06-28	113	111.5	26.7	113.5	111
2317	2021-06-25	114	113	40.9	115	113
2317	2021-06-24	111.5	113	36.3	114	111
2317	2021-06-23	109	111.5	30.8	112	108.5
2317	2021-06-22	109.5	108.5	24.2	110	108.5
2317	2021-06-21	110.5	108.5	38.5	110.5	108.5
2317	2021-06-18	112.5	111.5	34.5	113	111.5
2317	2021-06-17	110.5	113	20.3	113	110
2317	2021-06-16	112	111.5	26.9	113	111.5
2317	2021-06-15	113.5	113	26.7	114.5	112
2317	2021-06-11	111.5	113.5	43.8	114.5	111.5
2317	2021-06-10	110	110.5	21.5	111.5	109.5
2317	2021-06-09	110	109.5	26.3	111	109.5
2317	2021-06-08	111	110.5	20.6	111.5	110
2317	2021-06-07	112.5	110.5	22.7	112.5	109
2317	2021-06-04	110	112	33.2	112.5	109
2317	2021-06-03	113	111	26.9	113	110.5
2317	2021-06-02	115	112	37.4	115.5	111
2317	2021-06-01	114.5	114.5	25.6	115	113.5
2317	2021-05-31	112	113.5	38.8	113.5	111.5
2317	2021-05-28	110.5	111	29.9	111.5	110
2317	2021-05-27	110	109.5	67	110.5	107.5
2317	2021-05-26	113.5	111.5	27.7	113.5	110.5
2317	2021-05-25	111	112	57.6	113	110.5
2317	2021-05-24	108.5	109.5	34	110	108
2317	2021-05-21	108	109.5	59.2	110	108
2317	2021-05-20	105	106	48.3	106.5	104.5
2317	2021-05-19	106.5	105	50.1	106.5	104
2317	2021-05-18	101.5	107	85.8	107.5	101
2317	2021-05-17	100	98.2	97.3	102	97.1
2317	2021-05-14	105	104.5	46.3	106	103.5
2317	2021-05-13	99.5	103	72.6	105	98.2
2317	2021-05-12	104	102	152	106.5	96.5
2317	2021-05-11	109.5	107	87.6	110	106
2317	2021-05-10	116	113	47.8	116.5	113
2317	2021-05-07	114.5	117.5	70.6	117.5	114
2317	2021-05-06	112	112.5	42.7	113	110.5
2317	2021-05-05	110	110	73.4	113.5	110
2317	2021-05-04	112	108.5	98	112	107.5
2317	2021-05-03	115	112.5	82.1	115	112
2317	2021-04-29	118	116	54	118.5	116
2317	2021-04-28	118	117	46.2	118.5	117
2317	2021-04-27	118.5	118.5	65.2	120.5	118
2317	2021-04-26	119.5	117.5	49.2	120	117.5
2317	2021-04-23	117	119	46.7	119	117
2317	2021-04-22	122	117.5	81.3	122	117.5
2317	2021-04-21	121	120	42.7	121.5	120
2317	2021-04-20	121.5	122	32	122	121
2317	2021-04-19	123.5	121.5	39.6	123.5	121.5
2317	2021-04-16	122	123.5	65.5	124	122
2317	2021-04-15	121	121	47.9	121	119.5
2317	2021-04-14	123	121.5	65	123.5	119
2317	2021-04-13	121.5	122.5	61	123	121
2317	2021-04-12	120	120.5	84.1	122	119
2317	2021-04-09	123	120	98.4	123	120
2317	2021-04-08	123	122.5	47.9	123	121.5
2317	2021-04-07	124	123.5	42	124.5	122.5
2317	2021-04-06	123.5	122.5	51.7	124	122
2317	2021-04-01	124.5	121.5	120	125.5	120.5
2317	2021-03-31	125	124	165	126.5	123
2317	2021-03-30	129.5	129.5	61.6	130	128.5
2317	2021-03-29	128	128.5	53.4	129	127.5
2317	2021-03-26	127.5	126.5	67.6	128	126
2317	2021-03-25	127	126.5	87.7	129.5	125.5
2317	2021-03-24	130	128	107	132	126.5
2317	2021-03-23	133	130.5	151	134.5	130
2317	2021-03-22	124	130	140	130	124
2317	2021-03-19	127	123.5	210	127	123.5
2317	2021-03-18	128	129.5	181	131.5	128
2317	2021-03-17	123.5	126	183	128	123
2317	2021-03-16	121.5	123	115	123.5	121
2317	2021-03-15	120	121	84.3	122	118.5
2317	2021-03-12	117.5	120	117	120	117.5
2317	2021-03-11	116.5	117	88.9	118	116
2317	2021-03-10	116	115.5	56.8	117	115
2317	2021-03-09	113	115	50.2	115	112
2317	2021-03-08	116	113.5	62.8	116.5	113
2317	2021-03-05	113.5	115	100	116	112.5
2317	2021-03-04	115.5	114.5	90.6	116	112
2317	2021-03-03	113	115.5	104	116	112
2317	2021-03-02	114.5	112	62.1	114.5	112
2317	2021-02-26	114.5	112	138	115	112
2317	2021-02-25	115	116.5	130	116.5	114
2317	2021-02-24	112	110.5	66.5	114	110.5
2317	2021-02-23	109.5	111.5	56.9	112.5	108.5
2317	2021-02-22	111.5	111	68.2	114	111
2317	2021-02-19	112	110	97	112.5	109.5
2317	2021-02-18	113.5	113	53.8	114.5	113
2317	2021-02-17	115	114	104	116	112.5
2317	2021-02-05	115	113.5	101	116.5	113
2317	2021-02-04	114.5	114	74	116	113
2317	2021-02-03	118	116.5	71.4	118.5	115
2317	2021-02-02	115	116.5	98.3	118	114
2317	2021-02-01	111	113	140	114.5	108
2317	2021-01-29	119	111.5	209	120	111.5
2317	2021-01-28	120	118.5	150	121	118
2317	2021-01-27	124	123	123	124.5	122.5
2317	2021-01-26	122.5	122	159	125	120
2317	2021-01-25	122	123	174	124	117.5
2317	2021-01-22	117.5	121.5	268	121.5	117
2317	2021-01-21	116.5	117	103	117.5	115
2317	2021-01-20	116.5	114.5	155	118.5	114
2317	2021-01-19	115	115	110	116.5	114
2317	2021-01-18	115.5	114	108	116	111
2317	2021-01-15	118	115.5	198	119	113
2317	2021-01-14	109	116	364	117	108
2317	2021-01-13	105	106.5	88.6	107	105
2317	2021-01-12	106.5	104	111	107	103
2317	2021-01-11	108	107.5	75.8	109	106.5
2317	2021-01-08	109	108	124	109.5	106
2317	2021-01-07	108	107	122	108	105.5
2317	2021-01-06	107.5	105	235	109	102
2317	2021-01-05	101	104	242	105	101
2317	2021-01-04	93.4	99.9	226	100	93.3
2317	2020-12-31	91.5	92	29.7	92	91.1
2317	2020-12-30	91	91.6	36.9	91.6	90.1
2317	2020-12-29	91.8	90.4	41.9	91.8	90.4
2317	2020-12-28	92.4	91.8	62.4	93	91.8
2317	2020-12-25	90.9	91.8	105	92.2	90.8
2317	2020-12-24	89.5	89.6	36.9	89.9	89
2317	2020-12-23	88.5	88.8	50	89.4	88.3
2317	2020-12-22	88	87.7	83.7	90.5	87.5
2317	2020-12-21	88.1	88	25.4	88.5	86.9
2317	2020-12-18	88.1	87.7	24.4	88.2	87.5
2317	2020-12-17	88.3	87.8	24.7	88.4	87.6
2317	2020-12-16	88	88.2	41.3	88.2	87.4
2317	2020-12-15	88.3	87.1	33.9	88.3	86.5
2317	2020-12-14	88.3	87.7	42.4	89	87.7
2317	2020-12-11	88.5	87.6	53.5	88.5	85.8
2317	2020-12-10	88.4	87.7	48	88.7	87.1
2317	2020-12-09	88.5	89	60.3	89.3	88.2
2317	2020-12-08	88.4	87.6	105	89.7	87.3
2317	2020-12-07	83.3	87.9	141	88.1	83.1
2317	2020-12-04	83	82.9	39.9	83.4	82.6
2317	2020-12-03	82.3	82	25.2	82.4	81.9
2317	2020-12-02	83	82.7	31.9	83.3	82.4
2317	2020-12-01	82.5	82.9	20.5	82.9	82.2
2317	2020-11-30	82.7	82.3	54.4	83	82
2317	2020-11-27	83	82.6	17.8	83	82.5
2317	2020-11-26	82.6	83	29.6	83.2	82.5
2317	2020-11-25	82.4	82	19.2	82.5	81.5
2317	2020-11-24	83.1	82	18.9	83.1	82
2317	2020-11-23	82.9	82.9	20.4	83.2	82.5
2317	2020-11-20	83.3	82.5	20.5	83.3	82.1
2317	2020-11-19	82.7	82.9	19.9	83.2	82.5
2317	2020-11-18	82.9	83.2	25.8	83.4	82.7
2317	2020-11-17	83.1	83	37.6	83.3	82.3
2317	2020-11-16	82	82.6	41.8	82.9	81.9
2412	2021-11-12	112	112.5	8.48	112.5	112
2412	2021-11-11	112	112.5	12.1	112.5	111
2412	2021-11-10	111.5	112	9.64	112	111
2412	2021-11-09	111	111.5	6.94	111.5	110.5
2412	2021-11-08	111	111.5	9.75	111.5	110.5
2412	2021-11-05	111	111	7.47	111	110.5
2412	2021-11-04	110.5	111	6.31	111	110.5
2412	2021-11-03	110.5	110.5	9.39	111	110
2412	2021-11-02	111	110.5	8.31	111	110
2412	2021-11-01	111	111	7.43	111	110.5
2412	2021-10-29	110.5	110.5	8.4	111	110
2412	2021-10-28	111	110	10.4	111	110
2412	2021-10-27	110.5	110.5	5.9	111	110.5
2412	2021-10-26	111	110.5	13.9	111	110.5
2412	2021-10-25	111	111	12.4	111.5	110.5
2412	2021-10-22	110.5	111.5	7.9	111.5	110.5
2412	2021-10-21	111	110.5	8.64	111.5	110.5
2412	2021-10-20	111	111	8.43	111.5	110.5
2412	2021-10-19	111	111.5	5.65	111.5	111
2412	2021-10-18	111	111	6.81	111.5	110.5
2412	2021-10-15	110.5	111	10.4	111	110.5
2412	2021-10-14	111.5	110.5	8.52	111.5	110.5
2412	2021-10-13	111.5	111.5	9.59	111.5	110.5
2412	2021-10-12	111	111.5	19.6	111.5	110.5
2412	2021-10-08	111	111.5	13.2	112	111
2412	2021-10-07	111.5	111.5	7.42	111.5	111
2412	2021-10-06	110.5	111	10.5	111	110.5
2412	2021-10-05	111	110.5	7.85	111	110.5
2412	2021-10-04	111	111	6.87	111	110.5
2412	2021-10-01	110.5	110.5	11.3	111	110
2412	2021-09-30	111	110.5	12.7	111.5	110.5
2412	2021-09-29	111	111.5	11.3	111.5	110.5
2412	2021-09-28	111	111	6.06	111.5	111
2412	2021-09-27	111.5	111	4.1	111.5	111
2412	2021-09-24	111.5	111.5	3.74	111.5	111
2412	2021-09-23	111	111	6.45	111.5	111
2412	2021-09-22	110.5	111	13	111.5	110
2412	2021-09-17	111.5	111	12.1	111.5	111
2412	2021-09-16	111	111.5	7.4	111.5	111
2412	2021-09-15	111	111	8.25	112	111
2412	2021-09-14	111	111	7.51	111.5	110.5
2412	2021-09-13	111	111	6.67	111	110.5
2412	2021-09-10	110.5	110.5	4.57	111	110.5
2412	2021-09-09	111	110.5	4.59	111.5	110.5
2412	2021-09-08	111.5	111	12.2	111.5	110.5
2412	2021-09-07	111	111	7.8	111.5	111
2412	2021-09-06	111	111	8.87	111.5	110.5
2412	2021-09-03	111	111	7.04	111.5	111
2412	2021-09-02	110.5	111	4.91	111.5	110.5
2412	2021-09-01	112	110.5	13.8	112.5	110.5
2412	2021-08-31	111.5	112	23.9	112.5	111
2412	2021-08-30	110.5	111	12.5	111.5	110
2412	2021-08-27	110	110	9.01	110.5	109.5
2412	2021-08-26	110	110	13.8	110.5	109.5
2412	2021-08-25	110.5	110	42	111	109
2412	2021-08-24	115.5	115.5	17.4	116	115
2412	2021-08-23	116	115.5	10	116.5	115.5
2412	2021-08-20	116.5	116	13.3	117	115.5
2412	2021-08-19	117.5	116.5	10.9	117.5	116
2412	2021-08-18	117.5	117.5	7.93	117.5	117
2412	2021-08-17	117.5	117.5	12.4	117.5	117
2412	2021-08-16	117.5	117.5	10.5	117.5	117
2412	2021-08-13	118	117.5	8.81	118	116.5
2412	2021-08-12	118	118	11.4	118.5	117.5
2412	2021-08-11	118	118	10.8	118	117.5
2412	2021-08-10	118	118	9.84	118	117
2412	2021-08-09	117.5	117.5	6.24	118	117
2412	2021-08-06	118	117.5	12.3	118	117.5
2412	2021-08-05	117.5	118	17.2	118	117
2412	2021-08-04	117	117.5	12.6	117.5	116.5
2412	2021-08-03	116.5	117	11.4	117	116.5
2412	2021-08-02	115.5	116.5	12.5	116.5	115.5
2412	2021-07-30	116.5	115	7.78	116.5	115
2412	2021-07-29	115.5	116.5	7.9	116.5	115.5
2412	2021-07-28	115.5	116	8.84	116	114.5
2412	2021-07-27	115	115.5	5.27	115.5	114.5
2412	2021-07-26	115	115	4.19	115.5	114.5
2412	2021-07-23	115.5	115	6.3	116	115
2412	2021-07-22	115	116	8.47	116	115
2412	2021-07-21	114.5	115	6.6	115	114.5
2412	2021-07-20	114.5	115	4.09	115	114.5
2412	2021-07-19	114	115	4.81	115	114
2412	2021-07-16	114	115	7.72	115	113.5
2412	2021-07-15	114	114.5	5.19	114.5	114
2412	2021-07-14	114.5	114.5	5.7	114.5	114
2412	2021-07-13	114	114.5	7.6	114.5	113.5
2412	2021-07-12	114.5	113.5	4.58	114.5	113.5
2412	2021-07-09	113.5	114.5	3.84	114.5	113.5
2412	2021-07-08	114	114	4.03	114.5	113.5
2412	2021-07-07	114	114	3.4	114.5	113.5
2412	2021-07-06	114	114	5.82	114.5	113.5
2412	2021-07-05	114.5	114.5	4.45	114.5	114
2412	2021-07-02	113.5	114	6.52	114	113.5
2412	2021-07-01	114	113.5	6.9	114.5	113.5
2412	2021-06-30	114	114	7.48	114.5	113.5
2412	2021-06-29	114	114	4.42	114.5	114
2412	2021-06-28	114.5	114	3.67	115	114
2412	2021-06-25	114	114.5	4.11	114.5	114
2412	2021-06-24	114.5	114	3.66	115	114
2412	2021-06-23	114	114.5	7.24	115	113.5
2412	2021-06-22	114	114	5.83	114.5	113.5
2412	2021-06-21	113.5	113.5	4.49	114	113
2412	2021-06-18	114	113.5	13.6	114.5	113.5
2412	2021-06-17	114	114.5	4.33	114.5	114
2412	2021-06-16	114	115	7	115	114
2412	2021-06-15	114.5	114.5	5.22	115	114
2412	2021-06-11	114.5	114.5	6.18	115	114
2412	2021-06-10	114	114.5	3.74	114.5	113.5
2412	2021-06-09	114	114	3.78	114.5	114
2412	2021-06-08	114.5	114.5	4.43	114.5	113.5
2412	2021-06-07	114	114	4.12	114	113
2412	2021-06-04	113.5	114	4.82	114	113.5
2412	2021-06-03	114	114	4.12	114.5	113
2412	2021-06-02	113.5	114	4.34	114	113.5
2412	2021-06-01	113.5	113.5	2.39	114	113
2412	2021-05-31	113.5	113.5	6.61	114	113
2412	2021-05-28	113	113	7.7	113.5	112.5
2412	2021-05-27	113.5	112	28.4	113.5	112
2412	2021-05-26	113.5	113	5.66	114	113
2412	2021-05-25	113	114	6.8	114	113
2412	2021-05-24	113.5	113	8.25	113.5	112.5
2412	2021-05-21	113.5	114.5	14.5	114.5	113.5
2412	2021-05-20	112.5	113.5	9.55	113.5	112
2412	2021-05-19	113	112.5	5.34	113.5	112.5
2412	2021-05-18	112	113.5	13.8	113.5	112
2412	2021-05-17	112	112.5	11.4	113.5	111.5
2412	2021-05-14	111.5	113.5	12.4	113.5	111
2412	2021-05-13	112	111	15.7	112.5	111
2412	2021-05-12	114	112.5	31.6	114.5	108.5
2412	2021-05-11	113.5	114.5	12.7	114.5	113
2412	2021-05-10	114	114	6.66	114	113
2412	2021-05-07	113	113.5	4.29	113.5	113
2412	2021-05-06	112.5	113	6.85	113	112.5
2412	2021-05-05	112.5	112	9.2	113	112
2412	2021-05-04	113.5	112.5	18.8	114	112
2412	2021-05-03	113.5	113	10.1	114	113
2412	2021-04-29	113.5	114	5	114	113
2412	2021-04-28	114	114	9.35	114	113
2412	2021-04-27	114	114	10.3	114	113
2412	2021-04-26	114	114	9.09	114	113.5
2412	2021-04-23	114.5	114	6.85	114.5	113.5
2412	2021-04-22	114	114.5	11.6	115	114
2412	2021-04-21	115	114.5	9.99	115	114
2412	2021-04-20	114.5	115	9.7	115	114
2412	2021-04-19	114	114.5	9.25	114.5	113.5
2412	2021-04-16	114	114	12.7	114.5	113.5
2412	2021-04-15	113	114	16.8	114	113
2412	2021-04-14	111.5	113	37.8	114	111.5
2412	2021-04-13	111.5	112	6.77	112	111
2412	2021-04-12	111.5	111	9.75	112	111
2412	2021-04-09	111.5	112	14.5	112	111
2412	2021-04-08	112	111	11.7	112.5	111
2412	2021-04-07	112	112	12.2	112.5	112
2412	2021-04-06	111.5	112	10.4	112	111
2412	2021-04-01	111.5	111.5	7.52	112	111
2412	2021-03-31	111.5	111.5	16.7	112	111
2412	2021-03-30	112	111.5	10.3	112	111
2412	2021-03-29	111.5	112	6.99	112	111
2412	2021-03-26	111.5	111.5	7.12	111.5	111
2412	2021-03-25	111	111.5	8.87	111.5	110.5
2412	2021-03-24	111	111	5.81	111	110.5
2412	2021-03-23	110.5	111	6.11	111	110.5
2412	2021-03-22	110.5	110.5	6.73	110.5	110
2412	2021-03-19	110.5	110	19.9	111	110
2412	2021-03-18	110.5	111	6.71	111	110.5
2412	2021-03-17	110.5	110.5	11.1	111	110
2412	2021-03-16	110.5	110.5	6.07	111	110.5
2412	2021-03-15	110.5	110.5	5.49	111	110
2412	2021-03-12	111	111	3.85	111	110.5
2412	2021-03-11	110.5	111	8.59	111	110
2412	2021-03-10	110.5	110.5	5.7	111	110
2412	2021-03-09	110.5	110.5	6.9	111	110
2412	2021-03-08	110.5	110	12.3	111	109.5
2412	2021-03-05	109.5	110	8.17	110	109
2412	2021-03-04	110	109.5	12.5	110.5	109
2412	2021-03-03	110	109.5	15.1	110.5	109.5
2412	2021-03-02	110	109.5	9.32	110.5	109.5
2412	2021-02-26	110.5	109.5	19.6	111	109
2412	2021-02-25	110	110.5	14.9	110.5	109.5
2412	2021-02-24	109.5	109.5	9.94	110	109.5
2412	2021-02-23	108.5	109.5	12.9	109.5	108.5
2412	2021-02-22	109	108.5	10.3	109	108.5
2412	2021-02-19	108.5	109	9.62	109	108.5
2412	2021-02-18	108.5	108.5	9.99	109	108
2412	2021-02-17	109	108.5	14	109	108
2412	2021-02-05	108.5	108.5	7.52	109	108
2412	2021-02-04	108.5	108	9.35	109	108
2412	2021-02-03	108.5	109	8.65	109	108
2412	2021-02-02	108.5	109	5.91	109	108.5
2412	2021-02-01	108.5	109	11.2	109.5	108
2412	2021-01-29	108.5	108	13.5	109	108
2412	2021-01-28	109	109	11.4	109.5	108
2412	2021-01-27	109	109	9.02	109.5	108.5
2412	2021-01-26	109	108.5	8.14	109.5	108.5
2412	2021-01-25	108.5	109	9.07	109.5	108.5
2412	2021-01-22	109	108.5	9.5	109	108.5
2412	2021-01-21	109	108.5	11.8	110	108.5
2412	2021-01-20	110.5	109	17.7	111	109
2412	2021-01-19	111	111	5.93	111.5	111
2412	2021-01-18	111	111	5.91	111.5	111
2412	2021-01-15	112	111	8.8	112.5	111
2412	2021-01-14	111.5	112	6.99	112	111.5
2412	2021-01-13	111	111.5	11.2	111.5	111
2412	2021-01-12	111	111	10.3	111.5	110.5
2412	2021-01-11	110	111	15.6	111	109.5
2412	2021-01-08	109	110	12.6	110	109
2412	2021-01-07	109	109	5.94	109.5	109
2412	2021-01-06	109	109.5	9.82	109.5	108.5
2412	2021-01-05	109	109.5	6.74	109.5	108.5
2412	2021-01-04	109	109	8.76	109.5	109
2412	2020-12-31	110	109	7.82	110	109
2412	2020-12-30	109	110	7.92	110	109
2412	2020-12-29	109.5	109	5.15	109.5	108.5
2412	2020-12-28	108.5	109.5	8.14	109.5	108.5
2412	2020-12-25	108.5	108.5	9.45	109	108
2412	2020-12-24	108.5	108	8.23	109	108
2412	2020-12-23	109	108.5	10.4	109.5	108
2412	2020-12-22	109.5	109	6.16	109.5	109
2412	2020-12-21	109.5	109.5	7.41	110	109
2412	2020-12-18	109.5	109.5	9.35	109.5	109
2412	2020-12-17	109	109.5	6.65	109.5	109
2412	2020-12-16	108.5	109.5	8.78	109.5	108.5
2412	2020-12-15	108.5	109	6.45	109	108
2412	2020-12-14	108.5	108.5	6.14	109	108
2412	2020-12-11	108.5	108.5	7.14	108.5	108
2412	2020-12-10	108	108.5	5.46	109	108
2412	2020-12-09	109	108.5	10.2	109	108
2412	2020-12-08	108.5	109.5	6.68	109.5	108.5
2412	2020-12-07	109.5	108.5	10.2	109.5	108.5
2412	2020-12-04	109.5	109.5	7.4	109.5	109
2412	2020-12-03	109	108.5	7.39	109	108.5
2412	2020-12-02	108.5	109	9.01	109.5	108.5
2412	2020-12-01	108.5	109	6.8	109.5	108.5
2412	2020-11-30	109.5	108.5	22.5	110	108.5
2412	2020-11-27	109.5	109.5	5.68	110	109
2412	2020-11-26	109	109.5	9.4	110	108.5
2412	2020-11-25	110	109	7.54	110	108.5
2412	2020-11-24	110	109.5	5.41	110	109.5
2412	2020-11-23	110	110.5	9.56	110.5	109.5
2412	2020-11-20	110	109.5	8.05	110	109
2412	2020-11-19	110	110	6.81	110	109.5
2412	2020-11-18	110	110	5.98	110	109.5
2412	2020-11-17	109	110	9.03	110	108.5
2412	2020-11-16	109.5	109.5	7.52	110	109
2454	2021-11-12	964	983	44.1	988	956
2454	2021-11-11	936	954	37.7	960	936
2454	2021-11-10	972	958	34.7	978	958
2454	2021-11-09	1000	978	72.5	1000	976
2454	2021-11-08	947	980	106	983	944
2454	2021-11-05	939	940	36.8	940	927
2454	2021-11-04	945	928	29.3	945	926
2454	2021-11-03	934	932	28.8	939	929
2454	2021-11-02	929	928	27.5	934	919
2454	2021-11-01	925	922	27.4	930	917
2454	2021-10-29	938	913	51	939	913
2454	2021-10-28	942	936	36	947	927
2454	2021-10-27	949	942	77.1	958	932
2454	2021-10-26	951	946	61.3	952	940
2454	2021-10-25	928	938	54.5	944	916
2454	2021-10-22	913	926	43.7	926	906
2454	2021-10-21	912	913	56	924	903
2454	2021-10-20	910	901	41.3	918	901
2454	2021-10-19	877	898	61.7	900	872
2454	2021-10-18	862	867	52.8	878	860
2454	2021-10-15	853	857	55.6	859	847
2454	2021-10-14	870	840	76	873	839
2454	2021-10-13	891	862	50.4	893	862
2454	2021-10-12	907	887	82	908	885
2454	2021-10-08	919	910	44.1	925	906
2454	2021-10-07	885	911	68.2	914	883
2454	2021-10-06	875	871	47.7	890	871
2454	2021-10-05	872	867	78.7	878	855
2454	2021-10-04	892	892	41.2	899	878
2454	2021-10-01	905	885	58.8	905	882
2454	2021-09-30	913	905	79.2	915	896
2454	2021-09-29	940	913	81.4	943	913
2454	2021-09-28	959	957	70.4	969	945
2454	2021-09-27	921	959	105	959	921
2454	2021-09-24	918	920	44.5	923	912
2454	2021-09-23	919	915	48.6	921	905
2454	2021-09-22	918	911	77	925	900
2454	2021-09-17	940	940	69.6	952	936
2454	2021-09-16	930	936	37.6	936	926
2454	2021-09-15	943	935	51.2	945	928
2454	2021-09-14	932	947	80.5	949	932
2454	2021-09-13	918	927	27.9	932	918
2454	2021-09-10	903	925	44.6	925	902
2454	2021-09-09	903	901	57	908	898
2454	2021-09-08	899	912	49	914	895
2454	2021-09-07	901	903	33.8	907	897
2454	2021-09-06	907	896	76.9	917	895
2454	2021-09-03	938	919	55.2	938	917
2454	2021-09-02	930	933	54.5	945	927
2454	2021-09-01	917	927	86.8	930	906
2454	2021-08-31	917	901	69.5	917	885
2454	2021-08-30	902	912	39.2	912	898
2454	2021-08-27	873	896	49.3	896	873
2454	2021-08-26	906	888	88.4	907	870
2454	2021-08-25	915	911	41.2	915	900
2454	2021-08-24	920	909	33.4	920	903
2454	2021-08-23	882	911	48.3	915	882
2454	2021-08-20	899	873	49.1	904	870
2454	2021-08-19	908	888	50.1	914	882
2454	2021-08-18	870	912	54.4	912	865
2454	2021-08-17	903	880	50	905	880
2454	2021-08-16	910	901	34	918	900
2454	2021-08-13	909	910	48.3	916	901
2454	2021-08-12	923	904	39.2	923	901
2454	2021-08-11	913	910	41.8	916	906
2454	2021-08-10	930	922	23.2	930	916
2454	2021-08-09	928	921	40.9	928	911
2454	2021-08-06	956	936	36.4	957	935
2454	2021-08-05	960	961	73.4	964	952
2454	2021-08-04	948	950	59.1	953	941
2454	2021-08-03	948	938	29.7	948	930
2454	2021-08-02	924	934	38.3	934	920
2454	2021-07-30	935	910	56.3	937	907
2454	2021-07-29	915	933	95.7	935	903
2454	2021-07-28	931	890	153	932	887
2454	2021-07-27	928	938	81.4	948	924
2454	2021-07-26	940	923	46.7	940	920
2454	2021-07-23	932	933	42.2	934	924
2454	2021-07-22	915	919	39.2	931	915
2454	2021-07-21	926	912	46.2	931	906
2454	2021-07-20	917	920	29.2	928	915
2454	2021-07-19	941	919	66.6	945	915
2454	2021-07-16	948	957	57.6	960	941
2454	2021-07-15	935	951	70.8	952	930
2454	2021-07-14	929	930	31.7	938	925
2454	2021-07-13	940	926	67.4	944	926
2454	2021-07-12	940	935	53.5	941	930
2454	2021-07-09	915	919	47.7	929	911
2454	2021-07-08	920	920	60.2	929	914
2454	2021-07-07	926	917	49.5	928	917
2454	2021-07-06	937	922	66.8	940	920
2454	2021-07-05	960	957	72.5	975	957
2454	2021-07-02	963	957	45.9	964	953
2454	2021-07-01	971	955	53.9	976	948
2454	2021-06-30	945	962	103	978	943
2454	2021-06-29	942	935	52	949	935
2454	2021-06-28	929	935	36.2	935	922
2454	2021-06-25	940	927	47.4	952	927
2454	2021-06-24	945	929	33.5	947	927
2454	2021-06-23	903	941	83.2	941	898
2454	2021-06-22	902	903	130	916	890
2454	2021-06-21	960	918	110	961	918
2454	2021-06-18	980	965	59.2	990	965
2454	2021-06-17	978	978	61.4	979	968
2454	2021-06-16	995	985	51	995	981
2454	2021-06-15	992	989	54.5	1005	985
2454	2021-06-11	1005	980	60.3	1010	980
2454	2021-06-10	980	998	91.7	1005	977
2454	2021-06-09	963	967	38.8	984	963
2454	2021-06-08	975	966	34.8	977	966
2454	2021-06-07	971	973	52.3	976	948
2454	2021-06-04	971	977	39.7	977	966
2454	2021-06-03	968	981	58.6	984	965
2454	2021-06-02	981	959	70.4	988	957
2454	2021-06-01	1005	977	72.8	1015	976
2454	2021-05-31	971	995	96.1	1010	959
2454	2021-05-28	950	961	73.3	968	938
2454	2021-05-27	945	935	88.2	952	931
2454	2021-05-26	960	951	56.3	968	947
2454	2021-05-25	955	952	84.9	969	947
2454	2021-05-24	950	943	57.8	959	938
2454	2021-05-21	961	955	133	973	936
2454	2021-05-20	938	930	106	949	926
2454	2021-05-19	983	943	122	992	943
2454	2021-05-18	940	994	160	994	920
2454	2021-05-17	880	914	149	937	869
2454	2021-05-14	894	895	108	920	888
2454	2021-05-13	886	873	150	905	861
2454	2021-05-12	900	888	280	919	821
2454	2021-05-11	901	911	232	937	898
2454	2021-05-10	1015	979	197	1025	979
2454	2021-05-07	1055	1060	109	1065	1020
2454	2021-05-06	1030	1055	152	1065	1000
2454	2021-05-05	1090	1005	154	1100	999
2454	2021-05-04	1100	1085	195	1105	1025
2454	2021-05-03	1175	1105	300	1175	1080
2454	2021-04-29	1185	1185	77.8	1185	1185
2454	2021-04-28	1075	1080	97.2	1090	1055
2454	2021-04-27	1075	1065	94.2	1100	1055
2454	2021-04-26	1070	1070	122	1090	1030
2454	2021-04-23	980	1035	115	1035	980
2454	2021-04-22	999	984	61.5	1010	984
2454	2021-04-21	1010	988	67.2	1010	983
2454	2021-04-20	966	998	110	1010	963
2454	2021-04-19	985	963	44.7	985	962
2454	2021-04-16	990	975	63.3	990	967
2454	2021-04-15	971	985	58.3	985	957
2454	2021-04-14	965	965	84.2	969	935
2454	2021-04-13	973	961	96.4	984	952
2454	2021-04-12	997	960	103	1005	956
2454	2021-04-09	1025	999	69.3	1030	999
2454	2021-04-08	988	1020	82.4	1030	985
2454	2021-04-07	1005	998	55.4	1010	988
2454	2021-04-06	985	995	125	1010	984
2454	2021-04-01	978	961	56.1	985	961
2454	2021-03-31	972	969	90.6	984	960
2454	2021-03-30	958	971	123	977	941
2454	2021-03-29	953	941	93	970	941
2454	2021-03-26	951	943	113	955	930
2454	2021-03-25	904	949	156	950	896
2454	2021-03-24	872	894	63.4	895	866
2454	2021-03-23	890	870	76.1	892	870
2454	2021-03-22	880	881	63.9	891	872
2454	2021-03-19	895	885	69.3	896	880
2454	2021-03-18	914	903	42.3	920	903
2454	2021-03-17	924	908	55.6	925	902
2454	2021-03-16	917	919	62.3	919	906
2454	2021-03-15	900	907	62.3	914	900
2454	2021-03-12	900	899	75.3	915	892
2454	2021-03-11	869	888	84.3	895	865
2454	2021-03-10	890	864	83.3	892	860
2454	2021-03-09	860	879	82.8	885	854
2454	2021-03-08	901	867	88.4	909	866
2454	2021-03-05	877	883	93.4	892	870
2454	2021-03-04	919	897	113	919	895
2454	2021-03-03	915	930	88.4	930	895
2454	2021-03-02	920	900	131	939	900
2454	2021-02-26	923	896	142	931	896
2454	2021-02-25	950	944	75.8	955	930
2454	2021-02-24	948	940	80.1	967	940
2454	2021-02-23	945	965	81.4	968	932
2454	2021-02-22	972	951	73	980	951
2454	2021-02-19	971	964	77	975	953
2454	2021-02-18	980	978	62.4	987	968
2454	2021-02-17	1000	980	118	1010	971
2454	2021-02-05	955	950	150	987	950
2454	2021-02-04	933	946	124	953	915
2454	2021-02-03	947	950	111	959	942
2454	2021-02-02	925	931	138	952	920
2454	2021-02-01	886	905	122	909	875
2454	2021-01-29	889	875	162	903	875
2454	2021-01-28	866	869	158	880	863
2454	2021-01-27	881	897	103	905	871
2454	2021-01-26	914	871	92	922	871
2454	2021-01-25	917	910	82.2	925	891
2454	2021-01-22	914	917	153	946	908
2454	2021-01-21	890	934	162	935	888
2454	2021-01-20	885	872	97.8	898	870
2454	2021-01-19	861	879	70.1	880	854
2454	2021-01-18	850	844	75	851	817
2454	2021-01-15	878	850	86	882	842
2454	2021-01-14	872	861	101	881	854
2454	2021-01-13	855	884	149	899	850
2454	2021-01-12	857	846	88.9	868	842
2454	2021-01-11	843	851	68	856	835
2454	2021-01-08	810	838	110	844	802
2454	2021-01-07	794	799	62	808	785
2454	2021-01-06	802	792	74.3	814	785
2454	2021-01-05	796	797	74.9	804	775
2454	2021-01-04	755	792	110	798	752
2454	2020-12-31	747	747	34.9	753	742
2454	2020-12-30	740	746	42.1	746	735
2454	2020-12-29	741	734	34.2	746	734
2454	2020-12-28	724	740	78.6	741	723
2454	2020-12-25	720	715	15.9	722	712
2454	2020-12-24	724	714	24.2	725	714
2454	2020-12-23	708	720	38.5	722	705
2454	2020-12-22	708	703	46	722	703
2454	2020-12-21	698	708	38.2	708	689
2454	2020-12-18	704	699	34.6	708	699
2454	2020-12-17	703	704	42.8	711	699
2454	2020-12-16	711	701	44.3	714	701
2454	2020-12-15	702	701	35.9	706	696
2454	2020-12-14	706	702	27.6	710	699
2454	2020-12-11	720	707	55	722	701
2454	2020-12-10	730	709	56.4	730	706
2454	2020-12-09	735	734	58.5	746	730
2454	2020-12-08	703	730	72.5	731	702
2454	2020-12-07	705	704	38.6	708	695
2454	2020-12-04	700	705	38.2	707	696
2454	2020-12-03	715	700	49.5	715	698
2454	2020-12-02	706	712	63.2	717	695
2454	2020-12-01	700	697	59.7	708	693
2454	2020-11-30	711	704	101	718	703
2454	2020-11-27	725	725	25.5	731	721
2454	2020-11-26	733	730	26.8	737	725
2454	2020-11-25	746	724	52.5	748	724
2454	2020-11-24	752	742	43	752	734
2454	2020-11-23	754	743	53.2	758	738
2454	2020-11-20	732	747	86.6	754	723
2454	2020-11-19	732	733	67.2	738	727
2454	2020-11-18	702	728	153	728	701
2454	2020-11-17	701	696	45.6	703	691
2454	2020-11-16	685	694	43.6	695	681
6505	2021-11-12	101.5	102.5	1.88	103	101.5
6505	2021-11-11	102	102	2.43	102.5	100
6505	2021-11-10	102	102.5	2.33	103	101.5
6505	2021-11-09	102	101.5	1.72	102.5	100.5
6505	2021-11-08	102	102	2.47	103	101.5
6505	2021-11-05	100.5	102	3.51	102.5	100
6505	2021-11-04	101	101.5	2.09	102	100.5
6505	2021-11-03	102	102	3.78	102.5	100.5
6505	2021-11-02	102	102.5	4.43	104	101
6505	2021-11-01	100.5	101.5	2.72	102	100.5
6505	2021-10-29	102	100	3.04	102	100
6505	2021-10-28	103.5	102	3.7	104	101.5
6505	2021-10-27	103.5	104	2	104	102.5
6505	2021-10-26	104	103.5	6.34	104	102.5
6505	2021-10-25	102.5	103.5	3.55	104	102
6505	2021-10-22	102.5	101.5	3.2	103	101
6505	2021-10-21	104.5	103.5	3.86	105	103.5
6505	2021-10-20	106	104	3.79	106	103
6505	2021-10-19	106	104.5	5.12	106	104
6505	2021-10-18	104	105	6.31	106	103.5
6505	2021-10-15	101.5	103	3.88	103.5	100.5
6505	2021-10-14	104	101	3.96	104	100
6505	2021-10-13	102.5	103	7.06	105	102.5
6505	2021-10-12	101	102	4.72	102.5	100
6505	2021-10-08	102.5	101.5	4.31	103	99.8
6505	2021-10-07	101	102	8	103	100
6505	2021-10-06	101.5	101.5	10.9	101.5	98.4
6505	2021-10-05	98.5	98.9	13.5	100.5	98
6505	2021-10-04	99	97.4	4.54	99.7	96.9
6505	2021-10-01	99	96.8	8.72	99	95
6505	2021-09-30	104	99.2	9.66	104.5	99
6505	2021-09-29	100	102	25.7	106	100
6505	2021-09-28	96.7	99.7	5.98	99.8	96.5
6505	2021-09-27	95	96.6	9.37	97.2	94.2
6505	2021-09-24	95.1	95	3.52	96.5	93.9
6505	2021-09-23	93.9	94.5	2.67	95.3	93.5
6505	2021-09-22	94.4	92.8	5.04	94.7	92.5
6505	2021-09-17	97.6	95.7	4.21	97.7	95.7
6505	2021-09-16	98.3	97.5	2.08	99.4	97.1
6505	2021-09-15	98.1	97.3	1.89	98.3	96.8
6505	2021-09-14	97.6	98	2.25	98.3	97.5
6505	2021-09-13	97.2	97.3	0.99	97.3	96.2
6505	2021-09-10	95.4	96.6	1.55	97.3	95.4
6505	2021-09-09	95.1	96	2.59	96.8	94.5
6505	2021-09-08	96.4	95.7	2.76	97.4	95.1
6505	2021-09-07	96.5	96.3	1.04	97.3	96.1
6505	2021-09-06	97.6	96.6	1.08	98	96.5
6505	2021-09-03	97.2	97.7	3.05	97.8	96.6
6505	2021-09-02	96.5	96.2	1.17	96.7	95.5
6505	2021-09-01	96.6	96.7	2.04	97.6	96.6
6505	2021-08-31	98.5	97.8	3.54	98.5	96.5
6505	2021-08-30	96.6	98.5	3.74	98.5	96.5
6505	2021-08-27	95.4	96.3	2.23	96.6	94.8
6505	2021-08-26	94.2	95.4	6.46	96.1	93
6505	2021-08-25	95.2	94.6	1.94	95.7	93.7
6505	2021-08-24	93.9	95	3.76	95.7	93.4
6505	2021-08-23	91.9	92.8	2.61	93.4	91.1
6505	2021-08-20	91.2	91.3	3.18	92.2	90.3
6505	2021-08-19	93.6	91.1	7.16	94.1	90.6
6505	2021-08-18	95	94.4	2.74	95	93.6
6505	2021-08-17	95.6	95.3	1.83	96.2	95
6505	2021-08-16	95.1	95.5	1.77	96.6	95.1
6505	2021-08-13	96.7	96.5	2.18	97	95.3
6505	2021-08-12	97.4	96.9	1.33	97.9	96.8
6505	2021-08-11	96.5	97.4	2.19	97.4	96.4
6505	2021-08-10	96	96.5	1.68	96.8	95.7
6505	2021-08-09	95.8	96.7	3.58	97.2	94.6
6505	2021-08-06	97	96.8	3.51	97	95.4
6505	2021-08-05	97.5	97	3.26	97.9	96.6
6505	2021-08-04	97.9	97.5	2.93	98.2	97
6505	2021-08-03	98.2	97.9	4.35	98.7	96.8
6505	2021-08-02	97.8	99.7	3.52	99.7	97.3
6505	2021-07-30	98.7	97.3	6.2	98.9	97.1
6505	2021-07-29	98.5	99	2.4	99	97.4
6505	2021-07-28	98.7	98.5	6.35	99.8	96.5
6505	2021-07-27	98.3	98.3	4.05	99.7	97.4
6505	2021-07-26	100.5	97.8	8.38	100.5	97.1
6505	2021-07-23	101	100.5	5.08	103.5	100
6505	2021-07-22	101	100.5	3.19	101.5	99.1
6505	2021-07-21	101	100.5	5.61	101.5	98.6
6505	2021-07-20	101	100	2.96	101.5	100
6505	2021-07-19	102	102	3.79	102	100.5
6505	2021-07-16	105.5	102	4.66	105.5	102
6505	2021-07-15	105.5	105.5	1.97	106	104
6505	2021-07-14	107.5	106	1.58	107.5	105.5
6505	2021-07-13	107	106.5	2.19	107.5	106
6505	2021-07-12	109	107	2.87	110	106.5
6505	2021-07-09	108	110	2.89	110	106.5
6505	2021-07-08	111.5	109	3.04	111.5	108.5
6505	2021-07-07	112	112	3.48	112.5	109
6505	2021-07-06	117	114.5	3.63	117.5	114
6505	2021-07-05	112.5	115.5	8.2	117	112.5
6505	2021-07-02	107.5	110	8.23	112	107.5
6505	2021-07-01	106.5	106	2.21	106.5	105.5
6505	2021-06-30	108	106.5	1.5	108.5	106.5
6505	2021-06-29	108	108	2.71	108.5	106
6505	2021-06-28	110	108.5	1.14	110.5	108.5
6505	2021-06-25	108	109	3.21	110.5	108
6505	2021-06-24	110	109.5	2.25	110	108
6505	2021-06-23	105	110	5.15	111	105
6505	2021-06-22	105.5	106	2.41	107	105.5
6505	2021-06-21	104.5	103.5	3.42	105.5	102
6505	2021-06-18	107	104.5	5.88	107	104
6505	2021-06-17	109	108.5	2.96	110	108
6505	2021-06-16	110	111.5	5.55	112	109
6505	2021-06-15	108.5	108.5	2.31	110	108.5
6505	2021-06-11	109.5	108	1.42	109.5	107.5
6505	2021-06-10	110	109.5	2.91	110	108.5
6505	2021-06-09	108	110	4.75	110	107.5
6505	2021-06-08	107.5	107.5	4.58	109	106.5
6505	2021-06-07	108	106.5	3.92	108.5	105
6505	2021-06-04	104.5	106.5	4.04	108	104
6505	2021-06-03	108.5	106	6.08	109	105
6505	2021-06-02	104	106	6.43	106	104
6505	2021-06-01	101.5	102	2.4	102.5	101
6505	2021-05-31	98.1	100	1.75	100.5	98.1
6505	2021-05-28	98.1	98.8	2.62	99.5	97.6
6505	2021-05-27	99.1	97.2	5.86	100	96.9
6505	2021-05-26	100	100.5	1.89	100.5	99
6505	2021-05-25	97.5	99.5	2.49	100.5	97.3
6505	2021-05-24	97.5	97.5	1.11	98.1	97.1
6505	2021-05-21	97.5	98.2	2.71	100.5	96.5
6505	2021-05-20	96.6	97.3	4.2	98.2	95.2
6505	2021-05-19	97.1	98.1	4.02	100.5	97.1
6505	2021-05-18	94.9	99	3.73	99.8	94.9
6505	2021-05-17	96	95.4	4.6	97	94.7
6505	2021-05-14	94.1	96.7	4.44	98.1	93
6505	2021-05-13	98.5	95	7.36	98.5	94.5
6505	2021-05-12	104.5	97.7	11	106	94
6505	2021-05-11	107	104	11.2	109	102.5
6505	2021-05-10	105	107.5	4.4	108	104.5
6505	2021-05-07	107	105	7.07	108.5	102.5
6505	2021-05-06	104	108.5	16	108.5	104
6505	2021-05-05	102	104	3.78	104.5	101
6505	2021-05-04	102.5	101	11.9	105	100.5
6505	2021-05-03	102.5	102	2.86	103.5	102
6505	2021-04-29	102	103.5	4.26	104	101.5
6505	2021-04-28	102.5	103	3.94	103	101.5
6505	2021-04-27	102	103	2.77	103	101.5
6505	2021-04-26	101.5	102.5	3.3	103	101.5
6505	2021-04-23	101	102.5	4.58	102.5	99.8
6505	2021-04-22	99.1	101	6.25	101.5	99.1
6505	2021-04-21	101.5	99	8.63	102	98.2
6505	2021-04-20	102.5	103	3.96	103	102
6505	2021-04-19	102	103	6.22	103	102
6505	2021-04-16	101	102	4.02	102.5	100.5
6505	2021-04-15	100.5	101.5	5.01	102	100.5
6505	2021-04-14	99.6	99.2	4.72	101	98.8
6505	2021-04-13	98.6	100	8.17	101	98.6
6505	2021-04-12	97.4	98.2	5.09	98.4	96.5
6505	2021-04-09	97.5	98	2.55	98.2	97.1
6505	2021-04-08	97.3	98.2	2.96	98.4	97.3
6505	2021-04-07	96.7	98	3.33	98.2	96.7
6505	2021-04-06	97.4	97.4	3.88	98	96.5
6505	2021-04-01	96.8	96.7	2.42	97.8	96.3
6505	2021-03-31	96.6	96.8	4.48	97.3	96.1
6505	2021-03-30	97	96.6	3.86	97.2	95.8
6505	2021-03-29	97.6	96.6	4.14	98.2	96.6
6505	2021-03-26	95.6	96.8	4.09	97.3	95.5
6505	2021-03-25	95.3	95.6	3.94	96.1	94.1
6505	2021-03-24	95.7	95.4	3.25	96.7	94.8
6505	2021-03-23	96.5	96.1	1.63	96.9	96
6505	2021-03-22	95	96.3	2.47	96.8	94.5
6505	2021-03-19	96.9	95.8	8.34	97.2	94.8
6505	2021-03-18	98.3	98.2	4.06	100	97.6
6505	2021-03-17	100	98.2	5.49	100	97.8
6505	2021-03-16	100	100.5	2.33	100.5	98.8
6505	2021-03-15	100.5	100.5	1.72	101	100
6505	2021-03-12	101.5	101.5	3.47	101.5	100
6505	2021-03-11	102	103	4.56	103	101.5
6505	2021-03-10	101.5	101.5	3.04	101.5	100
6505	2021-03-09	102.5	101.5	4.24	103	100.5
6505	2021-03-08	101.5	102.5	7.12	103	100.5
6505	2021-03-05	99.5	99	5.33	100.5	98.5
6505	2021-03-04	99.5	99.8	8.1	100.5	97.7
6505	2021-03-03	96.2	100	9.32	101	96.2
6505	2021-03-02	100	97	6.32	101	97
6505	2021-02-26	100.5	100	10.9	101.5	98.1
6505	2021-02-25	103	102.5	6.07	103	102
6505	2021-02-24	102	100.5	6.3	103	99.8
6505	2021-02-23	98.8	103	9.21	103	98.7
6505	2021-02-22	97.6	98.2	3.64	99	97
6505	2021-02-19	96.7	97	5.62	97.6	95.2
6505	2021-02-18	96	96.6	4.8	97.7	96
6505	2021-02-17	93.5	95.8	9.74	96.5	92
6505	2021-02-05	91.2	91.9	8.23	92.5	90.9
6505	2021-02-04	90.4	91.2	1.49	91.9	90.4
6505	2021-02-03	91.1	91.7	2.52	92	90.3
6505	2021-02-02	88.6	91.4	3.63	92.6	88.4
6505	2021-02-01	89.1	90	2.27	90.5	88.4
6505	2021-01-29	90.2	89.1	6.31	92	88.5
6505	2021-01-28	92.3	91.4	3.93	93.2	90.8
6505	2021-01-27	94.5	94	2.99	95.3	93.7
6505	2021-01-26	95.5	93.7	4.31	95.6	92.9
6505	2021-01-25	94.5	95.9	2.36	95.9	93.8
6505	2021-01-22	97.5	94.5	3.31	97.5	94.4
6505	2021-01-21	96	96.2	2.78	96.9	95.3
6505	2021-01-20	97.9	95.2	6.84	98.5	95.2
6505	2021-01-19	97.6	99.2	3.38	99.5	97.1
6505	2021-01-18	98.6	98	3.45	99	96.6
6505	2021-01-15	101.5	99.1	5.22	102	99
6505	2021-01-14	102	102	2.11	102	100.5
6505	2021-01-13	102	102	5.4	102	100
6505	2021-01-12	101	101	4.23	101	99.6
6505	2021-01-11	103	102	4.62	103.5	100.5
6505	2021-01-08	100.5	104	8.18	104	100.5
6505	2021-01-07	100.5	100	3.54	101	99.9
6505	2021-01-06	98.3	99.5	6.29	100.5	98.3
6505	2021-01-05	100	99.2	4.97	100	98.2
6505	2021-01-04	99.4	100	4.98	100.5	97.6
6505	2020-12-31	99.8	99.8	7.64	101	98.2
6505	2020-12-30	95.9	98.5	7.74	99	95.5
6505	2020-12-29	95.5	95.4	1.48	95.6	94.5
6505	2020-12-28	94.2	95.4	3.64	95.5	93.7
6505	2020-12-25	94.5	94.2	1.57	94.8	93.5
6505	2020-12-24	94	94.5	1.47	94.5	93.5
6505	2020-12-23	93	93.4	3.17	94	92.4
6505	2020-12-22	94.1	93.5	3.32	94.8	93.5
6505	2020-12-21	92.9	94.9	3.53	95	92.4
6505	2020-12-18	93.5	92.8	3.65	94.8	92.8
6505	2020-12-17	94.8	94	3.65	95	93.5
6505	2020-12-16	93.5	94.7	6.08	95.5	93.1
6505	2020-12-15	93.7	93	3.53	94.4	92.3
6505	2020-12-14	94.4	94.5	2.27	94.6	93.5
6505	2020-12-11	93.6	94.4	3.35	94.4	93.5
6505	2020-12-10	93.7	93.2	2.8	94.6	93
6505	2020-12-09	93.3	94.3	3.26	94.9	92.7
6505	2020-12-08	92.7	92.9	3.2	93.2	92.3
6505	2020-12-07	95	93.9	3.49	95	93.6
6505	2020-12-04	93.5	94.9	5.6	95	93
6505	2020-12-03	92.5	92.8	2.67	93.6	92.1
6505	2020-12-02	92	92.9	3.66	93	91.5
6505	2020-12-01	91.1	92.7	3.59	92.9	90.5
6505	2020-11-30	94.5	90.5	10.5	94.9	90.5
6505	2020-11-27	94.8	94.5	2.79	95.2	93.9
6505	2020-11-26	96	95.6	3.44	96.1	94.8
6505	2020-11-25	96.3	95.2	4.61	96.5	94.9
6505	2020-11-24	95	94.8	4.55	96.5	94.7
6505	2020-11-23	94.9	94.7	6.89	96.6	94.1
6505	2020-11-20	93.8	93.9	3.44	94	93
6505	2020-11-19	93	94	3.79	94	92.4
6505	2020-11-18	92.5	93.3	6.42	93.8	92.1
6505	2020-11-17	92.2	92.5	6.2	92.7	91.8
6505	2020-11-16	91.7	92.2	6.14	93	91.7
\.


--
-- TOC entry 3742 (class 0 OID 25435)
-- Dependencies: 216
-- Data for Name: ema; Type: TABLE DATA; Schema: stock; Owner: postgres
--

COPY stock.ema (sid, company_id, fast_line, slow_line, loss, profit) FROM stdin;
\.


--
-- TOC entry 3736 (class 0 OID 25371)
-- Dependencies: 210
-- Data for Name: investor; Type: TABLE DATA; Schema: stock; Owner: postgres
--

COPY stock.investor (iid, iname, acct_no, pwd, phone) FROM stdin;
\.


--
-- TOC entry 3740 (class 0 OID 25411)
-- Dependencies: 214
-- Data for Name: kd; Type: TABLE DATA; Schema: stock; Owner: postgres
--

COPY stock.kd (sid, company_id, threshold, kd_length, loss, profit) FROM stdin;
\.


--
-- TOC entry 3741 (class 0 OID 25423)
-- Dependencies: 215
-- Data for Name: macd; Type: TABLE DATA; Schema: stock; Owner: postgres
--

COPY stock.macd (sid, company_id, fast_line, slow_line, loss, profit) FROM stdin;
\.


--
-- TOC entry 3739 (class 0 OID 25399)
-- Dependencies: 213
-- Data for Name: rsi; Type: TABLE DATA; Schema: stock; Owner: postgres
--

COPY stock.rsi (sid, company_id, threshold, rsi_length, loss, profit) FROM stdin;
\.


--
-- TOC entry 3738 (class 0 OID 25387)
-- Dependencies: 212
-- Data for Name: strategy; Type: TABLE DATA; Schema: stock; Owner: postgres
--

COPY stock.strategy (sid, budget, creator_id, strategy_type) FROM stdin;
\.


--
-- TOC entry 3777 (class 0 OID 0)
-- Dependencies: 224
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- TOC entry 3778 (class 0 OID 0)
-- Dependencies: 226
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- TOC entry 3779 (class 0 OID 0)
-- Dependencies: 222
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 56, true);


--
-- TOC entry 3780 (class 0 OID 0)
-- Dependencies: 230
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- TOC entry 3781 (class 0 OID 0)
-- Dependencies: 228
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, false);


--
-- TOC entry 3782 (class 0 OID 0)
-- Dependencies: 232
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- TOC entry 3783 (class 0 OID 0)
-- Dependencies: 234
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- TOC entry 3784 (class 0 OID 0)
-- Dependencies: 220
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 14, true);


--
-- TOC entry 3785 (class 0 OID 0)
-- Dependencies: 218
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 18, true);


--
-- TOC entry 3548 (class 2606 OID 25604)
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- TOC entry 3553 (class 2606 OID 25534)
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- TOC entry 3556 (class 2606 OID 25500)
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 3550 (class 2606 OID 25491)
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- TOC entry 3543 (class 2606 OID 25525)
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- TOC entry 3545 (class 2606 OID 25484)
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- TOC entry 3564 (class 2606 OID 25516)
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 3567 (class 2606 OID 25549)
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- TOC entry 3558 (class 2606 OID 25507)
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- TOC entry 3570 (class 2606 OID 25523)
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 3573 (class 2606 OID 25563)
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- TOC entry 3561 (class 2606 OID 25599)
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- TOC entry 3576 (class 2606 OID 25585)
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- TOC entry 3538 (class 2606 OID 25477)
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- TOC entry 3540 (class 2606 OID 25475)
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- TOC entry 3536 (class 2606 OID 25468)
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 3580 (class 2606 OID 25702)
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- TOC entry 3522 (class 2606 OID 25386)
-- Name: company company_pkey; Type: CONSTRAINT; Schema: stock; Owner: postgres
--

ALTER TABLE ONLY stock.company
    ADD CONSTRAINT company_pkey PRIMARY KEY (cid);


--
-- TOC entry 3534 (class 2606 OID 25453)
-- Name: deal deal_pkey; Type: CONSTRAINT; Schema: stock; Owner: postgres
--

ALTER TABLE ONLY stock.deal
    ADD CONSTRAINT deal_pkey PRIMARY KEY (company_id, ddate);


--
-- TOC entry 3532 (class 2606 OID 25441)
-- Name: ema ema_pkey; Type: CONSTRAINT; Schema: stock; Owner: postgres
--

ALTER TABLE ONLY stock.ema
    ADD CONSTRAINT ema_pkey PRIMARY KEY (sid);


--
-- TOC entry 3518 (class 2606 OID 25379)
-- Name: investor investor_acct_no_key; Type: CONSTRAINT; Schema: stock; Owner: postgres
--

ALTER TABLE ONLY stock.investor
    ADD CONSTRAINT investor_acct_no_key UNIQUE (acct_no);


--
-- TOC entry 3520 (class 2606 OID 25377)
-- Name: investor investor_pkey; Type: CONSTRAINT; Schema: stock; Owner: postgres
--

ALTER TABLE ONLY stock.investor
    ADD CONSTRAINT investor_pkey PRIMARY KEY (iid);


--
-- TOC entry 3528 (class 2606 OID 25417)
-- Name: kd kd_pkey; Type: CONSTRAINT; Schema: stock; Owner: postgres
--

ALTER TABLE ONLY stock.kd
    ADD CONSTRAINT kd_pkey PRIMARY KEY (sid);


--
-- TOC entry 3530 (class 2606 OID 25429)
-- Name: macd macd_pkey; Type: CONSTRAINT; Schema: stock; Owner: postgres
--

ALTER TABLE ONLY stock.macd
    ADD CONSTRAINT macd_pkey PRIMARY KEY (sid);


--
-- TOC entry 3526 (class 2606 OID 25405)
-- Name: rsi rsi_pkey; Type: CONSTRAINT; Schema: stock; Owner: postgres
--

ALTER TABLE ONLY stock.rsi
    ADD CONSTRAINT rsi_pkey PRIMARY KEY (sid);


--
-- TOC entry 3524 (class 2606 OID 25393)
-- Name: strategy strategy_pkey; Type: CONSTRAINT; Schema: stock; Owner: postgres
--

ALTER TABLE ONLY stock.strategy
    ADD CONSTRAINT strategy_pkey PRIMARY KEY (sid);


--
-- TOC entry 3546 (class 1259 OID 25605)
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- TOC entry 3551 (class 1259 OID 25545)
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- TOC entry 3554 (class 1259 OID 25546)
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- TOC entry 3541 (class 1259 OID 25531)
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- TOC entry 3562 (class 1259 OID 25561)
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- TOC entry 3565 (class 1259 OID 25560)
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- TOC entry 3568 (class 1259 OID 25575)
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- TOC entry 3571 (class 1259 OID 25574)
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- TOC entry 3559 (class 1259 OID 25600)
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- TOC entry 3574 (class 1259 OID 25596)
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- TOC entry 3577 (class 1259 OID 25597)
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- TOC entry 3578 (class 1259 OID 25704)
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- TOC entry 3581 (class 1259 OID 25703)
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- TOC entry 3590 (class 2606 OID 25540)
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3589 (class 2606 OID 25535)
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3588 (class 2606 OID 25526)
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3592 (class 2606 OID 25555)
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3591 (class 2606 OID 25550)
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3594 (class 2606 OID 25569)
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3593 (class 2606 OID 25564)
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3595 (class 2606 OID 25586)
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3596 (class 2606 OID 25591)
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3587 (class 2606 OID 25454)
-- Name: deal deal_company_id_fkey; Type: FK CONSTRAINT; Schema: stock; Owner: postgres
--

ALTER TABLE ONLY stock.deal
    ADD CONSTRAINT deal_company_id_fkey FOREIGN KEY (company_id) REFERENCES stock.company(cid) ON DELETE CASCADE;


--
-- TOC entry 3586 (class 2606 OID 25442)
-- Name: ema ema_sid_fkey; Type: FK CONSTRAINT; Schema: stock; Owner: postgres
--

ALTER TABLE ONLY stock.ema
    ADD CONSTRAINT ema_sid_fkey FOREIGN KEY (sid) REFERENCES stock.strategy(sid) ON DELETE CASCADE;


--
-- TOC entry 3584 (class 2606 OID 25418)
-- Name: kd kd_sid_fkey; Type: FK CONSTRAINT; Schema: stock; Owner: postgres
--

ALTER TABLE ONLY stock.kd
    ADD CONSTRAINT kd_sid_fkey FOREIGN KEY (sid) REFERENCES stock.strategy(sid) ON DELETE CASCADE;


--
-- TOC entry 3585 (class 2606 OID 25430)
-- Name: macd macd_sid_fkey; Type: FK CONSTRAINT; Schema: stock; Owner: postgres
--

ALTER TABLE ONLY stock.macd
    ADD CONSTRAINT macd_sid_fkey FOREIGN KEY (sid) REFERENCES stock.strategy(sid) ON DELETE CASCADE;


--
-- TOC entry 3583 (class 2606 OID 25406)
-- Name: rsi rsi_sid_fkey; Type: FK CONSTRAINT; Schema: stock; Owner: postgres
--

ALTER TABLE ONLY stock.rsi
    ADD CONSTRAINT rsi_sid_fkey FOREIGN KEY (sid) REFERENCES stock.strategy(sid) ON DELETE CASCADE;


--
-- TOC entry 3582 (class 2606 OID 25394)
-- Name: strategy strategy_creator_id_fkey; Type: FK CONSTRAINT; Schema: stock; Owner: postgres
--

ALTER TABLE ONLY stock.strategy
    ADD CONSTRAINT strategy_creator_id_fkey FOREIGN KEY (creator_id) REFERENCES stock.investor(iid) ON DELETE SET NULL;


-- Completed on 2021-11-15 10:41:15 CST

--
-- PostgreSQL database dump complete
--

