--
-- PostgreSQL database dump
--

-- Dumped from database version 10.1
-- Dumped by pg_dump version 10.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry, geography, and raster spatial types and functions';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: asset_devicehistory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.asset_devicehistory (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    date_from date,
    date_till date,
    remarks text,
    created_by_id integer,
    device_id integer NOT NULL,
    updated_by_id integer,
    vehicle_id integer NOT NULL
);


ALTER TABLE public.asset_devicehistory OWNER TO postgres;

--
-- Name: asset_devicehistory_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.asset_devicehistory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asset_devicehistory_id_seq OWNER TO postgres;

--
-- Name: asset_devicehistory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.asset_devicehistory_id_seq OWNED BY public.asset_devicehistory.id;


--
-- Name: asset_driver; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.asset_driver (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    title character varying(255),
    code character varying(255) NOT NULL,
    remarks text,
    name character varying(255) NOT NULL,
    phone character varying(255),
    mobile character varying(255),
    address text,
    image character varying(100),
    license_number character varying(255),
    employee_id character varying(255),
    created_by_id integer,
    group_id integer,
    updated_by_id integer
);


ALTER TABLE public.asset_driver OWNER TO postgres;

--
-- Name: asset_driver_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.asset_driver_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asset_driver_id_seq OWNER TO postgres;

--
-- Name: asset_driver_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.asset_driver_id_seq OWNED BY public.asset_driver.id;


--
-- Name: asset_driverschedule; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.asset_driverschedule (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    from_time timestamp with time zone NOT NULL,
    to_time timestamp with time zone NOT NULL,
    is_current boolean NOT NULL,
    reason text,
    created_by_id integer,
    driver_id integer NOT NULL,
    updated_by_id integer,
    vehicle_id integer NOT NULL
);


ALTER TABLE public.asset_driverschedule OWNER TO postgres;

--
-- Name: asset_driverschedule_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.asset_driverschedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asset_driverschedule_id_seq OWNER TO postgres;

--
-- Name: asset_driverschedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.asset_driverschedule_id_seq OWNED BY public.asset_driverschedule.id;


--
-- Name: asset_vehicle; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.asset_vehicle (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    title character varying(255),
    code character varying(255) NOT NULL,
    remarks text,
    license_plate character varying(255) NOT NULL,
    image character varying(100),
    registration_number character varying(255),
    registration_date date,
    level integer NOT NULL,
    model character varying(255),
    year integer,
    color character varying(255),
    chasis_number character varying(255),
    engine character varying(255),
    description text,
    fuel_consumption_rate double precision NOT NULL,
    related_table character varying(127),
    connected_device_id integer,
    created_by_id integer,
    current_driver_id integer,
    group_id integer NOT NULL,
    tag_id integer NOT NULL,
    updated_by_id integer,
    vehicle_type_id integer NOT NULL
);


ALTER TABLE public.asset_vehicle OWNER TO postgres;

--
-- Name: asset_vehicle_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.asset_vehicle_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asset_vehicle_id_seq OWNER TO postgres;

--
-- Name: asset_vehicle_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.asset_vehicle_id_seq OWNED BY public.asset_vehicle.id;


--
-- Name: asset_vehicletype; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.asset_vehicletype (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    title character varying(255),
    code character varying(255) NOT NULL,
    remarks text,
    name character varying(255) NOT NULL,
    speed_limit integer,
    description text,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.asset_vehicletype OWNER TO postgres;

--
-- Name: asset_vehicletype_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.asset_vehicletype_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asset_vehicletype_id_seq OWNER TO postgres;

--
-- Name: asset_vehicletype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.asset_vehicletype_id_seq OWNED BY public.asset_vehicletype.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
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
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
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
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
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
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
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
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: geo_geofence; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.geo_geofence (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    title character varying(255),
    code character varying(255) NOT NULL,
    remarks text,
    polygon public.geography(MultiPolygon,4326) NOT NULL,
    created_by_id integer,
    group_id integer,
    updated_by_id integer
);


ALTER TABLE public.geo_geofence OWNER TO postgres;

--
-- Name: geo_geofence_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.geo_geofence_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.geo_geofence_id_seq OWNER TO postgres;

--
-- Name: geo_geofence_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.geo_geofence_id_seq OWNED BY public.geo_geofence.id;


--
-- Name: geo_geofence_vehicles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.geo_geofence_vehicles (
    id integer NOT NULL,
    geofence_id integer NOT NULL,
    vehicle_id integer NOT NULL
);


ALTER TABLE public.geo_geofence_vehicles OWNER TO postgres;

--
-- Name: geo_geofence_vehicles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.geo_geofence_vehicles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.geo_geofence_vehicles_id_seq OWNER TO postgres;

--
-- Name: geo_geofence_vehicles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.geo_geofence_vehicles_id_seq OWNED BY public.geo_geofence_vehicles.id;


--
-- Name: geo_photo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.geo_photo (
    id integer NOT NULL,
    serial character varying(127),
    imei character varying(127) NOT NULL,
    sequence character varying(15),
    size character varying(15),
    error character varying(15),
    data text NOT NULL,
    "timestamp" timestamp with time zone,
    image_link character varying(127)
);


ALTER TABLE public.geo_photo OWNER TO postgres;

--
-- Name: geo_photo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.geo_photo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.geo_photo_id_seq OWNER TO postgres;

--
-- Name: geo_photo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.geo_photo_id_seq OWNED BY public.geo_photo.id;


--
-- Name: geo_poi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.geo_poi (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    title character varying(255),
    code character varying(255) NOT NULL,
    remarks text,
    location public.geography(Point,4326) NOT NULL,
    category character varying(127) NOT NULL,
    address text,
    owner_only boolean NOT NULL,
    is_public boolean NOT NULL,
    created_by_id integer,
    group_id integer,
    updated_by_id integer
);


ALTER TABLE public.geo_poi OWNER TO postgres;

--
-- Name: geo_poi_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.geo_poi_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.geo_poi_id_seq OWNER TO postgres;

--
-- Name: geo_poi_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.geo_poi_id_seq OWNED BY public.geo_poi.id;


--
-- Name: inventory_contactperson; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inventory_contactperson (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    first_name character varying(255) NOT NULL,
    last_name character varying(255) NOT NULL,
    address text,
    site character varying(255),
    email character varying(254),
    phone character varying(128),
    mobile character varying(128),
    remarks text,
    is_main_contact boolean NOT NULL,
    created_by_id integer,
    supplier_id integer NOT NULL,
    updated_by_id integer
);


ALTER TABLE public.inventory_contactperson OWNER TO postgres;

--
-- Name: inventory_contactperson_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.inventory_contactperson_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.inventory_contactperson_id_seq OWNER TO postgres;

--
-- Name: inventory_contactperson_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.inventory_contactperson_id_seq OWNED BY public.inventory_contactperson.id;


--
-- Name: inventory_device; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inventory_device (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    imei character varying(255) NOT NULL,
    port integer,
    status character varying(255) NOT NULL,
    purchased_at date,
    purchase_code character varying(255),
    is_free boolean NOT NULL,
    connected_sim_id integer NOT NULL,
    created_by_id integer,
    device_type_id integer NOT NULL,
    updated_by_id integer
);


ALTER TABLE public.inventory_device OWNER TO postgres;

--
-- Name: inventory_device_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.inventory_device_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.inventory_device_id_seq OWNER TO postgres;

--
-- Name: inventory_device_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.inventory_device_id_seq OWNED BY public.inventory_device.id;


--
-- Name: inventory_devicetype; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inventory_devicetype (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    model_name character varying(255),
    model_number character varying(255),
    message_format character varying(255),
    instruction_manual character varying(100),
    image character varying(100),
    remarks text,
    created_by_id integer,
    supplier_id integer NOT NULL,
    updated_by_id integer
);


ALTER TABLE public.inventory_devicetype OWNER TO postgres;

--
-- Name: inventory_devicetype_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.inventory_devicetype_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.inventory_devicetype_id_seq OWNER TO postgres;

--
-- Name: inventory_devicetype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.inventory_devicetype_id_seq OWNED BY public.inventory_devicetype.id;


--
-- Name: inventory_gpslog; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inventory_gpslog (
    id integer NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    is_valid boolean NOT NULL,
    data text NOT NULL,
    port integer,
    imei character varying(255)
);


ALTER TABLE public.inventory_gpslog OWNER TO postgres;

--
-- Name: inventory_gpslog_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.inventory_gpslog_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.inventory_gpslog_id_seq OWNER TO postgres;

--
-- Name: inventory_gpslog_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.inventory_gpslog_id_seq OWNED BY public.inventory_gpslog.id;


--
-- Name: inventory_sim; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inventory_sim (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    sim_number character varying(128) NOT NULL,
    provider character varying(255) NOT NULL,
    imei character varying(255),
    purchased_at date NOT NULL,
    purchase_code character varying(255),
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.inventory_sim OWNER TO postgres;

--
-- Name: inventory_sim_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.inventory_sim_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.inventory_sim_id_seq OWNER TO postgres;

--
-- Name: inventory_sim_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.inventory_sim_id_seq OWNED BY public.inventory_sim.id;


--
-- Name: inventory_supplier; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inventory_supplier (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    name character varying(255) NOT NULL,
    address text,
    site character varying(255),
    email character varying(254),
    phone character varying(128),
    mobile character varying(128),
    country character varying(2),
    remarks text,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.inventory_supplier OWNER TO postgres;

--
-- Name: inventory_supplier_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.inventory_supplier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.inventory_supplier_id_seq OWNER TO postgres;

--
-- Name: inventory_supplier_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.inventory_supplier_id_seq OWNED BY public.inventory_supplier.id;


--
-- Name: setup_appuser; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.setup_appuser (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    title character varying(255),
    code character varying(255) NOT NULL,
    remarks text,
    is_client boolean NOT NULL,
    group_leader boolean NOT NULL,
    level integer NOT NULL,
    designation character varying(255),
    phone character varying(128),
    mobile character varying(128),
    address text,
    country character varying(2),
    client_group_id integer,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.setup_appuser OWNER TO postgres;

--
-- Name: setup_appuser_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.setup_appuser_groups (
    id integer NOT NULL,
    appuser_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.setup_appuser_groups OWNER TO postgres;

--
-- Name: setup_appuser_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.setup_appuser_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.setup_appuser_groups_id_seq OWNER TO postgres;

--
-- Name: setup_appuser_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.setup_appuser_groups_id_seq OWNED BY public.setup_appuser_groups.id;


--
-- Name: setup_appuser_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.setup_appuser_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.setup_appuser_id_seq OWNER TO postgres;

--
-- Name: setup_appuser_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.setup_appuser_id_seq OWNED BY public.setup_appuser.id;


--
-- Name: setup_appuser_tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.setup_appuser_tags (
    id integer NOT NULL,
    appuser_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE public.setup_appuser_tags OWNER TO postgres;

--
-- Name: setup_appuser_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.setup_appuser_tags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.setup_appuser_tags_id_seq OWNER TO postgres;

--
-- Name: setup_appuser_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.setup_appuser_tags_id_seq OWNED BY public.setup_appuser_tags.id;


--
-- Name: setup_appuser_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.setup_appuser_user_permissions (
    id integer NOT NULL,
    appuser_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.setup_appuser_user_permissions OWNER TO postgres;

--
-- Name: setup_appuser_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.setup_appuser_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.setup_appuser_user_permissions_id_seq OWNER TO postgres;

--
-- Name: setup_appuser_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.setup_appuser_user_permissions_id_seq OWNED BY public.setup_appuser_user_permissions.id;


--
-- Name: setup_clientgroup; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.setup_clientgroup (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    title character varying(255),
    code character varying(255) NOT NULL,
    remarks text,
    name character varying(255) NOT NULL,
    group_type character varying(255) NOT NULL,
    date_joined date NOT NULL,
    license_number character varying(255),
    document character varying(100),
    logo character varying(100),
    website character varying(255),
    address text,
    phone character varying(128),
    mobile character varying(128),
    email character varying(254),
    country character varying(2),
    created_by_id integer,
    package_id integer NOT NULL,
    updated_by_id integer
);


ALTER TABLE public.setup_clientgroup OWNER TO postgres;

--
-- Name: setup_clientgroup_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.setup_clientgroup_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.setup_clientgroup_id_seq OWNER TO postgres;

--
-- Name: setup_clientgroup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.setup_clientgroup_id_seq OWNED BY public.setup_clientgroup.id;


--
-- Name: setup_emergencycontact; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.setup_emergencycontact (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    name character varying(255) NOT NULL,
    phone character varying(128) NOT NULL,
    address text,
    client_id integer NOT NULL,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.setup_emergencycontact OWNER TO postgres;

--
-- Name: setup_emergencycontact_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.setup_emergencycontact_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.setup_emergencycontact_id_seq OWNER TO postgres;

--
-- Name: setup_emergencycontact_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.setup_emergencycontact_id_seq OWNED BY public.setup_emergencycontact.id;


--
-- Name: setup_package; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.setup_package (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    title character varying(255),
    code character varying(255) NOT NULL,
    remarks text,
    name character varying(255) NOT NULL,
    description text,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.setup_package OWNER TO postgres;

--
-- Name: setup_package_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.setup_package_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.setup_package_id_seq OWNER TO postgres;

--
-- Name: setup_package_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.setup_package_id_seq OWNED BY public.setup_package.id;


--
-- Name: setup_tag; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.setup_tag (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    title character varying(255),
    code character varying(255) NOT NULL,
    remarks text,
    name character varying(255) NOT NULL,
    description text,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.setup_tag OWNER TO postgres;

--
-- Name: setup_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.setup_tag_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.setup_tag_id_seq OWNER TO postgres;

--
-- Name: setup_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.setup_tag_id_seq OWNED BY public.setup_tag.id;


--
-- Name: asset_devicehistory id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asset_devicehistory ALTER COLUMN id SET DEFAULT nextval('public.asset_devicehistory_id_seq'::regclass);


--
-- Name: asset_driver id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asset_driver ALTER COLUMN id SET DEFAULT nextval('public.asset_driver_id_seq'::regclass);


--
-- Name: asset_driverschedule id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asset_driverschedule ALTER COLUMN id SET DEFAULT nextval('public.asset_driverschedule_id_seq'::regclass);


--
-- Name: asset_vehicle id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asset_vehicle ALTER COLUMN id SET DEFAULT nextval('public.asset_vehicle_id_seq'::regclass);


--
-- Name: asset_vehicletype id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asset_vehicletype ALTER COLUMN id SET DEFAULT nextval('public.asset_vehicletype_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: geo_geofence id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.geo_geofence ALTER COLUMN id SET DEFAULT nextval('public.geo_geofence_id_seq'::regclass);


--
-- Name: geo_geofence_vehicles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.geo_geofence_vehicles ALTER COLUMN id SET DEFAULT nextval('public.geo_geofence_vehicles_id_seq'::regclass);


--
-- Name: geo_photo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.geo_photo ALTER COLUMN id SET DEFAULT nextval('public.geo_photo_id_seq'::regclass);


--
-- Name: geo_poi id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.geo_poi ALTER COLUMN id SET DEFAULT nextval('public.geo_poi_id_seq'::regclass);


--
-- Name: inventory_contactperson id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory_contactperson ALTER COLUMN id SET DEFAULT nextval('public.inventory_contactperson_id_seq'::regclass);


--
-- Name: inventory_device id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory_device ALTER COLUMN id SET DEFAULT nextval('public.inventory_device_id_seq'::regclass);


--
-- Name: inventory_devicetype id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory_devicetype ALTER COLUMN id SET DEFAULT nextval('public.inventory_devicetype_id_seq'::regclass);


--
-- Name: inventory_gpslog id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory_gpslog ALTER COLUMN id SET DEFAULT nextval('public.inventory_gpslog_id_seq'::regclass);


--
-- Name: inventory_sim id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory_sim ALTER COLUMN id SET DEFAULT nextval('public.inventory_sim_id_seq'::regclass);


--
-- Name: inventory_supplier id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory_supplier ALTER COLUMN id SET DEFAULT nextval('public.inventory_supplier_id_seq'::regclass);


--
-- Name: setup_appuser id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.setup_appuser ALTER COLUMN id SET DEFAULT nextval('public.setup_appuser_id_seq'::regclass);


--
-- Name: setup_appuser_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.setup_appuser_groups ALTER COLUMN id SET DEFAULT nextval('public.setup_appuser_groups_id_seq'::regclass);


--
-- Name: setup_appuser_tags id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.setup_appuser_tags ALTER COLUMN id SET DEFAULT nextval('public.setup_appuser_tags_id_seq'::regclass);


--
-- Name: setup_appuser_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.setup_appuser_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.setup_appuser_user_permissions_id_seq'::regclass);


--
-- Name: setup_clientgroup id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.setup_clientgroup ALTER COLUMN id SET DEFAULT nextval('public.setup_clientgroup_id_seq'::regclass);


--
-- Name: setup_emergencycontact id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.setup_emergencycontact ALTER COLUMN id SET DEFAULT nextval('public.setup_emergencycontact_id_seq'::regclass);


--
-- Name: setup_package id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.setup_package ALTER COLUMN id SET DEFAULT nextval('public.setup_package_id_seq'::regclass);


--
-- Name: setup_tag id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.setup_tag ALTER COLUMN id SET DEFAULT nextval('public.setup_tag_id_seq'::regclass);


--
-- Data for Name: asset_devicehistory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.asset_devicehistory (id, created_at, updated_at, date_from, date_till, remarks, created_by_id, device_id, updated_by_id, vehicle_id) FROM stdin;
\.


--
-- Data for Name: asset_driver; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.asset_driver (id, created_at, updated_at, title, code, remarks, name, phone, mobile, address, image, license_number, employee_id, created_by_id, group_id, updated_by_id) FROM stdin;
\.


--
-- Data for Name: asset_driverschedule; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.asset_driverschedule (id, created_at, updated_at, from_time, to_time, is_current, reason, created_by_id, driver_id, updated_by_id, vehicle_id) FROM stdin;
\.


--
-- Data for Name: asset_vehicle; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.asset_vehicle (id, created_at, updated_at, title, code, remarks, license_plate, image, registration_number, registration_date, level, model, year, color, chasis_number, engine, description, fuel_consumption_rate, related_table, connected_device_id, created_by_id, current_driver_id, group_id, tag_id, updated_by_id, vehicle_type_id) FROM stdin;
\.


--
-- Data for Name: asset_vehicletype; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.asset_vehicletype (id, created_at, updated_at, title, code, remarks, name, speed_limit, description, created_by_id, updated_by_id) FROM stdin;
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add permission	2	add_permission
5	Can change permission	2	change_permission
6	Can delete permission	2	delete_permission
7	Can add group	3	add_group
8	Can change group	3	change_group
9	Can delete group	3	delete_group
10	Can add content type	4	add_contenttype
11	Can change content type	4	change_contenttype
12	Can delete content type	4	delete_contenttype
13	Can add session	5	add_session
14	Can change session	5	change_session
15	Can delete session	5	delete_session
16	Can add app user	6	add_appuser
17	Can change app user	6	change_appuser
18	Can delete app user	6	delete_appuser
19	Can view App users	6	can_view_appuser
20	Can add Client group	7	add_clientgroup
21	Can change Client group	7	change_clientgroup
22	Can delete Client group	7	delete_clientgroup
23	Can view Client groups	7	can_view_clientgroup
24	Can add Emergency contact	8	add_emergencycontact
25	Can change Emergency contact	8	change_emergencycontact
26	Can delete Emergency contact	8	delete_emergencycontact
27	Can view Emergency contacts	8	can_view_emergencycontact
28	Can add Package	9	add_package
29	Can change Package	9	change_package
30	Can delete Package	9	delete_package
31	Can view Packages	9	can_view_package
32	Can add Tag	10	add_tag
33	Can change Tag	10	change_tag
34	Can delete Tag	10	delete_tag
35	Can view Tags	10	can_view_tag
36	Can add client	6	add_client
37	Can change client	6	change_client
38	Can delete client	6	delete_client
39	Can view Clients	6	can_view_client
40	Can add staff	6	add_staff
41	Can change staff	6	change_staff
42	Can delete staff	6	delete_staff
43	Can view Staffs	6	can_view_staff
44	Can add Supplier	13	add_supplier
45	Can change Supplier	13	change_supplier
46	Can delete Supplier	13	delete_supplier
47	Can view Suppliers	13	can_view_supplier
48	Can add Contact person	14	add_contactperson
49	Can change Contact person	14	change_contactperson
50	Can delete Contact person	14	delete_contactperson
51	Can view Contact persons	14	can_view_contactperson
52	Can add Device type	15	add_devicetype
53	Can change Device type	15	change_devicetype
54	Can delete Device type	15	delete_devicetype
55	Can view Device types	15	can_view_devicetype
56	Can add Sim	16	add_sim
57	Can change Sim	16	change_sim
58	Can delete Sim	16	delete_sim
59	Can view Sims	16	can_view_sim
60	Can add Device	17	add_device
61	Can change Device	17	change_device
62	Can delete Device	17	delete_device
63	Can view Devices	17	can_view_device
64	Can add GPS Log	18	add_gpslog
65	Can change GPS Log	18	change_gpslog
66	Can delete GPS Log	18	delete_gpslog
67	Can add vehicle type	19	add_vehicletype
68	Can change vehicle type	19	change_vehicletype
69	Can delete vehicle type	19	delete_vehicletype
70	Can view Vehicle types	19	can_view_vehicletype
71	Can add vehicle	20	add_vehicle
72	Can change vehicle	20	change_vehicle
73	Can delete vehicle	20	delete_vehicle
74	Can view Vehicles	20	can_view_vehicle
75	Can add device history	21	add_devicehistory
76	Can change device history	21	change_devicehistory
77	Can delete device history	21	delete_devicehistory
78	Can view Device histories	21	can_view_devicehistory
79	Can add driver	22	add_driver
80	Can change driver	22	change_driver
81	Can delete driver	22	delete_driver
82	Can add driver schedule	23	add_driverschedule
83	Can change driver schedule	23	change_driverschedule
84	Can delete driver schedule	23	delete_driverschedule
85	Can add Vehicle Information	20	add_vehicleproxy
86	Can change Vehicle Information	20	change_vehicleproxy
87	Can delete Vehicle Information	20	delete_vehicleproxy
88	Can add photo	25	add_photo
89	Can change photo	25	change_photo
90	Can delete photo	25	delete_photo
91	Can add poi	26	add_poi
92	Can change poi	26	change_poi
93	Can delete poi	26	delete_poi
94	Can add geo fence	27	add_geofence
95	Can change geo fence	27	change_geofence
96	Can delete geo fence	27	delete_geofence
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	setup	appuser
7	setup	clientgroup
8	setup	emergencycontact
9	setup	package
10	setup	tag
11	setup	client
12	setup	staff
13	inventory	supplier
14	inventory	contactperson
15	inventory	devicetype
16	inventory	sim
17	inventory	device
18	inventory	gpslog
19	asset	vehicletype
20	asset	vehicle
21	asset	devicehistory
22	asset	driver
23	asset	driverschedule
24	asset	vehicleproxy
25	geo	photo
26	geo	poi
27	geo	geofence
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2018-06-12 08:40:58.858925-04
2	contenttypes	0002_remove_content_type_name	2018-06-12 08:41:25.666111-04
3	auth	0001_initial	2018-06-12 08:41:25.705452-04
4	auth	0002_alter_permission_name_max_length	2018-06-12 08:41:25.714626-04
5	auth	0003_alter_user_email_max_length	2018-06-12 08:41:25.724985-04
6	auth	0004_alter_user_username_opts	2018-06-12 08:41:25.733096-04
7	auth	0005_alter_user_last_login_null	2018-06-12 08:41:25.742017-04
8	auth	0006_require_contenttypes_0002	2018-06-12 08:41:25.743996-04
9	auth	0007_alter_validators_add_error_messages	2018-06-12 08:41:25.752094-04
10	auth	0008_alter_user_username_max_length	2018-06-12 08:41:25.76121-04
11	auth	0009_alter_user_last_name_max_length	2018-06-12 08:41:25.769241-04
12	setup	0001_initial	2018-06-12 08:41:26.070966-04
13	admin	0001_initial	2018-06-12 08:41:26.10237-04
14	admin	0002_logentry_remove_auto_add	2018-06-12 08:41:26.123753-04
15	sessions	0001_initial	2018-06-12 08:41:26.13447-04
16	inventory	0001_initial	2018-06-12 08:42:08.02102-04
17	asset	0001_initial	2018-06-12 08:42:08.344434-04
18	geo	0001_initial	2018-06-12 08:42:08.467961-04
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- Data for Name: geo_geofence; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.geo_geofence (id, created_at, updated_at, title, code, remarks, polygon, created_by_id, group_id, updated_by_id) FROM stdin;
\.


--
-- Data for Name: geo_geofence_vehicles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.geo_geofence_vehicles (id, geofence_id, vehicle_id) FROM stdin;
\.


--
-- Data for Name: geo_photo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.geo_photo (id, serial, imei, sequence, size, error, data, "timestamp", image_link) FROM stdin;
\.


--
-- Data for Name: geo_poi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.geo_poi (id, created_at, updated_at, title, code, remarks, location, category, address, owner_only, is_public, created_by_id, group_id, updated_by_id) FROM stdin;
\.


--
-- Data for Name: inventory_contactperson; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inventory_contactperson (id, created_at, updated_at, first_name, last_name, address, site, email, phone, mobile, remarks, is_main_contact, created_by_id, supplier_id, updated_by_id) FROM stdin;
\.


--
-- Data for Name: inventory_device; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inventory_device (id, created_at, updated_at, imei, port, status, purchased_at, purchase_code, is_free, connected_sim_id, created_by_id, device_type_id, updated_by_id) FROM stdin;
\.


--
-- Data for Name: inventory_devicetype; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inventory_devicetype (id, created_at, updated_at, model_name, model_number, message_format, instruction_manual, image, remarks, created_by_id, supplier_id, updated_by_id) FROM stdin;
\.


--
-- Data for Name: inventory_gpslog; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inventory_gpslog (id, "timestamp", is_valid, data, port, imei) FROM stdin;
\.


--
-- Data for Name: inventory_sim; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inventory_sim (id, created_at, updated_at, sim_number, provider, imei, purchased_at, purchase_code, created_by_id, updated_by_id) FROM stdin;
\.


--
-- Data for Name: inventory_supplier; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inventory_supplier (id, created_at, updated_at, name, address, site, email, phone, mobile, country, remarks, created_by_id, updated_by_id) FROM stdin;
\.


--
-- Data for Name: setup_appuser; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.setup_appuser (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined, created_at, updated_at, title, code, remarks, is_client, group_leader, level, designation, phone, mobile, address, country, client_group_id, created_by_id, updated_by_id) FROM stdin;
\.


--
-- Data for Name: setup_appuser_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.setup_appuser_groups (id, appuser_id, group_id) FROM stdin;
\.


--
-- Data for Name: setup_appuser_tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.setup_appuser_tags (id, appuser_id, tag_id) FROM stdin;
\.


--
-- Data for Name: setup_appuser_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.setup_appuser_user_permissions (id, appuser_id, permission_id) FROM stdin;
\.


--
-- Data for Name: setup_clientgroup; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.setup_clientgroup (id, created_at, updated_at, title, code, remarks, name, group_type, date_joined, license_number, document, logo, website, address, phone, mobile, email, country, created_by_id, package_id, updated_by_id) FROM stdin;
\.


--
-- Data for Name: setup_emergencycontact; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.setup_emergencycontact (id, created_at, updated_at, name, phone, address, client_id, created_by_id, updated_by_id) FROM stdin;
\.


--
-- Data for Name: setup_package; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.setup_package (id, created_at, updated_at, title, code, remarks, name, description, created_by_id, updated_by_id) FROM stdin;
\.


--
-- Data for Name: setup_tag; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.setup_tag (id, created_at, updated_at, title, code, remarks, name, description, created_by_id, updated_by_id) FROM stdin;
\.


--
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.


--
-- Name: asset_devicehistory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.asset_devicehistory_id_seq', 1, false);


--
-- Name: asset_driver_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.asset_driver_id_seq', 1, false);


--
-- Name: asset_driverschedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.asset_driverschedule_id_seq', 1, false);


--
-- Name: asset_vehicle_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.asset_vehicle_id_seq', 1, false);


--
-- Name: asset_vehicletype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.asset_vehicletype_id_seq', 1, false);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 96, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 27, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 18, true);


--
-- Name: geo_geofence_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.geo_geofence_id_seq', 1, false);


--
-- Name: geo_geofence_vehicles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.geo_geofence_vehicles_id_seq', 1, false);


--
-- Name: geo_photo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.geo_photo_id_seq', 1, false);


--
-- Name: geo_poi_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.geo_poi_id_seq', 1, false);


--
-- Name: inventory_contactperson_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.inventory_contactperson_id_seq', 1, false);


--
-- Name: inventory_device_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.inventory_device_id_seq', 1, false);


--
-- Name: inventory_devicetype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.inventory_devicetype_id_seq', 1, false);


--
-- Name: inventory_gpslog_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.inventory_gpslog_id_seq', 1, false);


--
-- Name: inventory_sim_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.inventory_sim_id_seq', 1, false);


--
-- Name: inventory_supplier_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.inventory_supplier_id_seq', 1, false);


--
-- Name: setup_appuser_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.setup_appuser_groups_id_seq', 1, false);


--
-- Name: setup_appuser_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.setup_appuser_id_seq', 1, false);


--
-- Name: setup_appuser_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.setup_appuser_tags_id_seq', 1, false);


--
-- Name: setup_appuser_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.setup_appuser_user_permissions_id_seq', 1, false);


--
-- Name: setup_clientgroup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.setup_clientgroup_id_seq', 1, false);


--
-- Name: setup_emergencycontact_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.setup_emergencycontact_id_seq', 1, false);


--
-- Name: setup_package_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.setup_package_id_seq', 1, false);


--
-- Name: setup_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.setup_tag_id_seq', 1, false);


--
-- Name: asset_devicehistory asset_devicehistory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asset_devicehistory
    ADD CONSTRAINT asset_devicehistory_pkey PRIMARY KEY (id);


--
-- Name: asset_driver asset_driver_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asset_driver
    ADD CONSTRAINT asset_driver_code_key UNIQUE (code);


--
-- Name: asset_driver asset_driver_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asset_driver
    ADD CONSTRAINT asset_driver_pkey PRIMARY KEY (id);


--
-- Name: asset_driverschedule asset_driverschedule_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asset_driverschedule
    ADD CONSTRAINT asset_driverschedule_pkey PRIMARY KEY (id);


--
-- Name: asset_vehicle asset_vehicle_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asset_vehicle
    ADD CONSTRAINT asset_vehicle_code_key UNIQUE (code);


--
-- Name: asset_vehicle asset_vehicle_license_plate_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asset_vehicle
    ADD CONSTRAINT asset_vehicle_license_plate_key UNIQUE (license_plate);


--
-- Name: asset_vehicle asset_vehicle_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asset_vehicle
    ADD CONSTRAINT asset_vehicle_pkey PRIMARY KEY (id);


--
-- Name: asset_vehicletype asset_vehicletype_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asset_vehicletype
    ADD CONSTRAINT asset_vehicletype_code_key UNIQUE (code);


--
-- Name: asset_vehicletype asset_vehicletype_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asset_vehicletype
    ADD CONSTRAINT asset_vehicletype_name_key UNIQUE (name);


--
-- Name: asset_vehicletype asset_vehicletype_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asset_vehicletype
    ADD CONSTRAINT asset_vehicletype_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: geo_geofence geo_geofence_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.geo_geofence
    ADD CONSTRAINT geo_geofence_code_key UNIQUE (code);


--
-- Name: geo_geofence geo_geofence_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.geo_geofence
    ADD CONSTRAINT geo_geofence_pkey PRIMARY KEY (id);


--
-- Name: geo_geofence_vehicles geo_geofence_vehicles_geofence_id_vehicle_id_1ad88ec0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.geo_geofence_vehicles
    ADD CONSTRAINT geo_geofence_vehicles_geofence_id_vehicle_id_1ad88ec0_uniq UNIQUE (geofence_id, vehicle_id);


--
-- Name: geo_geofence_vehicles geo_geofence_vehicles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.geo_geofence_vehicles
    ADD CONSTRAINT geo_geofence_vehicles_pkey PRIMARY KEY (id);


--
-- Name: geo_photo geo_photo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.geo_photo
    ADD CONSTRAINT geo_photo_pkey PRIMARY KEY (id);


--
-- Name: geo_poi geo_poi_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.geo_poi
    ADD CONSTRAINT geo_poi_code_key UNIQUE (code);


--
-- Name: geo_poi geo_poi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.geo_poi
    ADD CONSTRAINT geo_poi_pkey PRIMARY KEY (id);


--
-- Name: inventory_contactperson inventory_contactperson_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory_contactperson
    ADD CONSTRAINT inventory_contactperson_pkey PRIMARY KEY (id);


--
-- Name: inventory_device inventory_device_imei_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory_device
    ADD CONSTRAINT inventory_device_imei_key UNIQUE (imei);


--
-- Name: inventory_device inventory_device_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory_device
    ADD CONSTRAINT inventory_device_pkey PRIMARY KEY (id);


--
-- Name: inventory_devicetype inventory_devicetype_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory_devicetype
    ADD CONSTRAINT inventory_devicetype_pkey PRIMARY KEY (id);


--
-- Name: inventory_gpslog inventory_gpslog_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory_gpslog
    ADD CONSTRAINT inventory_gpslog_pkey PRIMARY KEY (id);


--
-- Name: inventory_sim inventory_sim_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory_sim
    ADD CONSTRAINT inventory_sim_pkey PRIMARY KEY (id);


--
-- Name: inventory_sim inventory_sim_sim_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory_sim
    ADD CONSTRAINT inventory_sim_sim_number_key UNIQUE (sim_number);


--
-- Name: inventory_supplier inventory_supplier_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory_supplier
    ADD CONSTRAINT inventory_supplier_pkey PRIMARY KEY (id);


--
-- Name: setup_appuser setup_appuser_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.setup_appuser
    ADD CONSTRAINT setup_appuser_code_key UNIQUE (code);


--
-- Name: setup_appuser_groups setup_appuser_groups_appuser_id_group_id_342abbac_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.setup_appuser_groups
    ADD CONSTRAINT setup_appuser_groups_appuser_id_group_id_342abbac_uniq UNIQUE (appuser_id, group_id);


--
-- Name: setup_appuser_groups setup_appuser_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.setup_appuser_groups
    ADD CONSTRAINT setup_appuser_groups_pkey PRIMARY KEY (id);


--
-- Name: setup_appuser setup_appuser_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.setup_appuser
    ADD CONSTRAINT setup_appuser_pkey PRIMARY KEY (id);


--
-- Name: setup_appuser_tags setup_appuser_tags_appuser_id_tag_id_13c897f4_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.setup_appuser_tags
    ADD CONSTRAINT setup_appuser_tags_appuser_id_tag_id_13c897f4_uniq UNIQUE (appuser_id, tag_id);


--
-- Name: setup_appuser_tags setup_appuser_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.setup_appuser_tags
    ADD CONSTRAINT setup_appuser_tags_pkey PRIMARY KEY (id);


--
-- Name: setup_appuser_user_permissions setup_appuser_user_permi_appuser_id_permission_id_c77afd59_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.setup_appuser_user_permissions
    ADD CONSTRAINT setup_appuser_user_permi_appuser_id_permission_id_c77afd59_uniq UNIQUE (appuser_id, permission_id);


--
-- Name: setup_appuser_user_permissions setup_appuser_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.setup_appuser_user_permissions
    ADD CONSTRAINT setup_appuser_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: setup_appuser setup_appuser_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.setup_appuser
    ADD CONSTRAINT setup_appuser_username_key UNIQUE (username);


--
-- Name: setup_clientgroup setup_clientgroup_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.setup_clientgroup
    ADD CONSTRAINT setup_clientgroup_code_key UNIQUE (code);


--
-- Name: setup_clientgroup setup_clientgroup_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.setup_clientgroup
    ADD CONSTRAINT setup_clientgroup_name_key UNIQUE (name);


--
-- Name: setup_clientgroup setup_clientgroup_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.setup_clientgroup
    ADD CONSTRAINT setup_clientgroup_pkey PRIMARY KEY (id);


--
-- Name: setup_emergencycontact setup_emergencycontact_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.setup_emergencycontact
    ADD CONSTRAINT setup_emergencycontact_pkey PRIMARY KEY (id);


--
-- Name: setup_package setup_package_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.setup_package
    ADD CONSTRAINT setup_package_code_key UNIQUE (code);


--
-- Name: setup_package setup_package_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.setup_package
    ADD CONSTRAINT setup_package_name_key UNIQUE (name);


--
-- Name: setup_package setup_package_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.setup_package
    ADD CONSTRAINT setup_package_pkey PRIMARY KEY (id);


--
-- Name: setup_tag setup_tag_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.setup_tag
    ADD CONSTRAINT setup_tag_code_key UNIQUE (code);


--
-- Name: setup_tag setup_tag_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.setup_tag
    ADD CONSTRAINT setup_tag_name_key UNIQUE (name);


--
-- Name: setup_tag setup_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.setup_tag
    ADD CONSTRAINT setup_tag_pkey PRIMARY KEY (id);


--
-- Name: asset_devicehistory_created_by_id_244e3c01; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX asset_devicehistory_created_by_id_244e3c01 ON public.asset_devicehistory USING btree (created_by_id);


--
-- Name: asset_devicehistory_device_id_4c8c9b5b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX asset_devicehistory_device_id_4c8c9b5b ON public.asset_devicehistory USING btree (device_id);


--
-- Name: asset_devicehistory_updated_by_id_e48018e7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX asset_devicehistory_updated_by_id_e48018e7 ON public.asset_devicehistory USING btree (updated_by_id);


--
-- Name: asset_devicehistory_vehicle_id_8e0763a0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX asset_devicehistory_vehicle_id_8e0763a0 ON public.asset_devicehistory USING btree (vehicle_id);


--
-- Name: asset_driver_code_e9dc4b7d_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX asset_driver_code_e9dc4b7d_like ON public.asset_driver USING btree (code varchar_pattern_ops);


--
-- Name: asset_driver_created_by_id_9eb2a055; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX asset_driver_created_by_id_9eb2a055 ON public.asset_driver USING btree (created_by_id);


--
-- Name: asset_driver_group_id_5a9e14fd; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX asset_driver_group_id_5a9e14fd ON public.asset_driver USING btree (group_id);


--
-- Name: asset_driver_updated_by_id_b9e1d6ab; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX asset_driver_updated_by_id_b9e1d6ab ON public.asset_driver USING btree (updated_by_id);


--
-- Name: asset_driverschedule_created_by_id_e2cde275; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX asset_driverschedule_created_by_id_e2cde275 ON public.asset_driverschedule USING btree (created_by_id);


--
-- Name: asset_driverschedule_driver_id_376cc3ce; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX asset_driverschedule_driver_id_376cc3ce ON public.asset_driverschedule USING btree (driver_id);


--
-- Name: asset_driverschedule_updated_by_id_75770abe; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX asset_driverschedule_updated_by_id_75770abe ON public.asset_driverschedule USING btree (updated_by_id);


--
-- Name: asset_driverschedule_vehicle_id_b6174b13; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX asset_driverschedule_vehicle_id_b6174b13 ON public.asset_driverschedule USING btree (vehicle_id);


--
-- Name: asset_vehicle_code_3c963442_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX asset_vehicle_code_3c963442_like ON public.asset_vehicle USING btree (code varchar_pattern_ops);


--
-- Name: asset_vehicle_connected_device_id_6a2196b4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX asset_vehicle_connected_device_id_6a2196b4 ON public.asset_vehicle USING btree (connected_device_id);


--
-- Name: asset_vehicle_created_by_id_d8d378a9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX asset_vehicle_created_by_id_d8d378a9 ON public.asset_vehicle USING btree (created_by_id);


--
-- Name: asset_vehicle_current_driver_id_d28056f9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX asset_vehicle_current_driver_id_d28056f9 ON public.asset_vehicle USING btree (current_driver_id);


--
-- Name: asset_vehicle_group_id_d3f7c514; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX asset_vehicle_group_id_d3f7c514 ON public.asset_vehicle USING btree (group_id);


--
-- Name: asset_vehicle_license_plate_2f731c66_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX asset_vehicle_license_plate_2f731c66_like ON public.asset_vehicle USING btree (license_plate varchar_pattern_ops);


--
-- Name: asset_vehicle_tag_id_f63eb81d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX asset_vehicle_tag_id_f63eb81d ON public.asset_vehicle USING btree (tag_id);


--
-- Name: asset_vehicle_updated_by_id_dd69b3e0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX asset_vehicle_updated_by_id_dd69b3e0 ON public.asset_vehicle USING btree (updated_by_id);


--
-- Name: asset_vehicle_vehicle_type_id_abbf411b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX asset_vehicle_vehicle_type_id_abbf411b ON public.asset_vehicle USING btree (vehicle_type_id);


--
-- Name: asset_vehicletype_code_da0a97dd_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX asset_vehicletype_code_da0a97dd_like ON public.asset_vehicletype USING btree (code varchar_pattern_ops);


--
-- Name: asset_vehicletype_created_by_id_a6bc2a0a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX asset_vehicletype_created_by_id_a6bc2a0a ON public.asset_vehicletype USING btree (created_by_id);


--
-- Name: asset_vehicletype_name_21b05977_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX asset_vehicletype_name_21b05977_like ON public.asset_vehicletype USING btree (name varchar_pattern_ops);


--
-- Name: asset_vehicletype_updated_by_id_ced4799f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX asset_vehicletype_updated_by_id_ced4799f ON public.asset_vehicletype USING btree (updated_by_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: geo_geofence_code_163a136d_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX geo_geofence_code_163a136d_like ON public.geo_geofence USING btree (code varchar_pattern_ops);


--
-- Name: geo_geofence_created_by_id_7c5f751a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX geo_geofence_created_by_id_7c5f751a ON public.geo_geofence USING btree (created_by_id);


--
-- Name: geo_geofence_group_id_6c32f8bf; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX geo_geofence_group_id_6c32f8bf ON public.geo_geofence USING btree (group_id);


--
-- Name: geo_geofence_polygon_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX geo_geofence_polygon_id ON public.geo_geofence USING gist (polygon);


--
-- Name: geo_geofence_updated_by_id_0e6b06d6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX geo_geofence_updated_by_id_0e6b06d6 ON public.geo_geofence USING btree (updated_by_id);


--
-- Name: geo_geofence_vehicles_geofence_id_c535cfb4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX geo_geofence_vehicles_geofence_id_c535cfb4 ON public.geo_geofence_vehicles USING btree (geofence_id);


--
-- Name: geo_geofence_vehicles_vehicle_id_f1348d6c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX geo_geofence_vehicles_vehicle_id_f1348d6c ON public.geo_geofence_vehicles USING btree (vehicle_id);


--
-- Name: geo_poi_code_fe301a5d_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX geo_poi_code_fe301a5d_like ON public.geo_poi USING btree (code varchar_pattern_ops);


--
-- Name: geo_poi_created_by_id_e376bbd0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX geo_poi_created_by_id_e376bbd0 ON public.geo_poi USING btree (created_by_id);


--
-- Name: geo_poi_group_id_cc3bd877; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX geo_poi_group_id_cc3bd877 ON public.geo_poi USING btree (group_id);


--
-- Name: geo_poi_location_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX geo_poi_location_id ON public.geo_poi USING gist (location);


--
-- Name: geo_poi_updated_by_id_a01677c4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX geo_poi_updated_by_id_a01677c4 ON public.geo_poi USING btree (updated_by_id);


--
-- Name: inventory_contactperson_created_by_id_4b6d9698; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX inventory_contactperson_created_by_id_4b6d9698 ON public.inventory_contactperson USING btree (created_by_id);


--
-- Name: inventory_contactperson_supplier_id_3ff25ed5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX inventory_contactperson_supplier_id_3ff25ed5 ON public.inventory_contactperson USING btree (supplier_id);


--
-- Name: inventory_contactperson_updated_by_id_ab132c08; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX inventory_contactperson_updated_by_id_ab132c08 ON public.inventory_contactperson USING btree (updated_by_id);


--
-- Name: inventory_device_connected_sim_id_2ea9723d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX inventory_device_connected_sim_id_2ea9723d ON public.inventory_device USING btree (connected_sim_id);


--
-- Name: inventory_device_created_by_id_ea1343de; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX inventory_device_created_by_id_ea1343de ON public.inventory_device USING btree (created_by_id);


--
-- Name: inventory_device_device_type_id_ab7bc343; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX inventory_device_device_type_id_ab7bc343 ON public.inventory_device USING btree (device_type_id);


--
-- Name: inventory_device_imei_d2c06f2b_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX inventory_device_imei_d2c06f2b_like ON public.inventory_device USING btree (imei varchar_pattern_ops);


--
-- Name: inventory_device_updated_by_id_31828b82; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX inventory_device_updated_by_id_31828b82 ON public.inventory_device USING btree (updated_by_id);


--
-- Name: inventory_devicetype_created_by_id_6db7a18e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX inventory_devicetype_created_by_id_6db7a18e ON public.inventory_devicetype USING btree (created_by_id);


--
-- Name: inventory_devicetype_supplier_id_cb537594; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX inventory_devicetype_supplier_id_cb537594 ON public.inventory_devicetype USING btree (supplier_id);


--
-- Name: inventory_devicetype_updated_by_id_0df8035a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX inventory_devicetype_updated_by_id_0df8035a ON public.inventory_devicetype USING btree (updated_by_id);


--
-- Name: inventory_sim_created_by_id_013c977a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX inventory_sim_created_by_id_013c977a ON public.inventory_sim USING btree (created_by_id);


--
-- Name: inventory_sim_sim_number_cec9283f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX inventory_sim_sim_number_cec9283f_like ON public.inventory_sim USING btree (sim_number varchar_pattern_ops);


--
-- Name: inventory_sim_updated_by_id_4e868f16; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX inventory_sim_updated_by_id_4e868f16 ON public.inventory_sim USING btree (updated_by_id);


--
-- Name: inventory_supplier_created_by_id_542bf547; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX inventory_supplier_created_by_id_542bf547 ON public.inventory_supplier USING btree (created_by_id);


--
-- Name: inventory_supplier_updated_by_id_c6e01867; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX inventory_supplier_updated_by_id_c6e01867 ON public.inventory_supplier USING btree (updated_by_id);


--
-- Name: setup_appuser_client_group_id_05ce0346; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX setup_appuser_client_group_id_05ce0346 ON public.setup_appuser USING btree (client_group_id);


--
-- Name: setup_appuser_code_d3f8cee6_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX setup_appuser_code_d3f8cee6_like ON public.setup_appuser USING btree (code varchar_pattern_ops);


--
-- Name: setup_appuser_created_by_id_75ff55ee; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX setup_appuser_created_by_id_75ff55ee ON public.setup_appuser USING btree (created_by_id);


--
-- Name: setup_appuser_groups_appuser_id_c0e17699; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX setup_appuser_groups_appuser_id_c0e17699 ON public.setup_appuser_groups USING btree (appuser_id);


--
-- Name: setup_appuser_groups_group_id_d3899340; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX setup_appuser_groups_group_id_d3899340 ON public.setup_appuser_groups USING btree (group_id);


--
-- Name: setup_appuser_tags_appuser_id_0b6c640c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX setup_appuser_tags_appuser_id_0b6c640c ON public.setup_appuser_tags USING btree (appuser_id);


--
-- Name: setup_appuser_tags_tag_id_1491bcda; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX setup_appuser_tags_tag_id_1491bcda ON public.setup_appuser_tags USING btree (tag_id);


--
-- Name: setup_appuser_updated_by_id_d74d8892; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX setup_appuser_updated_by_id_d74d8892 ON public.setup_appuser USING btree (updated_by_id);


--
-- Name: setup_appuser_user_permissions_appuser_id_9590e43c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX setup_appuser_user_permissions_appuser_id_9590e43c ON public.setup_appuser_user_permissions USING btree (appuser_id);


--
-- Name: setup_appuser_user_permissions_permission_id_bc007181; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX setup_appuser_user_permissions_permission_id_bc007181 ON public.setup_appuser_user_permissions USING btree (permission_id);


--
-- Name: setup_appuser_username_e8af5c9d_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX setup_appuser_username_e8af5c9d_like ON public.setup_appuser USING btree (username varchar_pattern_ops);


--
-- Name: setup_clientgroup_code_39a67007_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX setup_clientgroup_code_39a67007_like ON public.setup_clientgroup USING btree (code varchar_pattern_ops);


--
-- Name: setup_clientgroup_created_by_id_17f4854f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX setup_clientgroup_created_by_id_17f4854f ON public.setup_clientgroup USING btree (created_by_id);


--
-- Name: setup_clientgroup_name_75720088_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX setup_clientgroup_name_75720088_like ON public.setup_clientgroup USING btree (name varchar_pattern_ops);


--
-- Name: setup_clientgroup_package_id_e697ce18; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX setup_clientgroup_package_id_e697ce18 ON public.setup_clientgroup USING btree (package_id);


--
-- Name: setup_clientgroup_updated_by_id_7328e162; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX setup_clientgroup_updated_by_id_7328e162 ON public.setup_clientgroup USING btree (updated_by_id);


--
-- Name: setup_emergencycontact_client_id_cd1e4cc9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX setup_emergencycontact_client_id_cd1e4cc9 ON public.setup_emergencycontact USING btree (client_id);


--
-- Name: setup_emergencycontact_created_by_id_bfde713c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX setup_emergencycontact_created_by_id_bfde713c ON public.setup_emergencycontact USING btree (created_by_id);


--
-- Name: setup_emergencycontact_updated_by_id_a2987bde; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX setup_emergencycontact_updated_by_id_a2987bde ON public.setup_emergencycontact USING btree (updated_by_id);


--
-- Name: setup_package_code_776581e2_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX setup_package_code_776581e2_like ON public.setup_package USING btree (code varchar_pattern_ops);


--
-- Name: setup_package_created_by_id_60c11de2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX setup_package_created_by_id_60c11de2 ON public.setup_package USING btree (created_by_id);


--
-- Name: setup_package_name_59bdfb3b_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX setup_package_name_59bdfb3b_like ON public.setup_package USING btree (name varchar_pattern_ops);


--
-- Name: setup_package_updated_by_id_5aad1f6e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX setup_package_updated_by_id_5aad1f6e ON public.setup_package USING btree (updated_by_id);


--
-- Name: setup_tag_code_4f66b6e4_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX setup_tag_code_4f66b6e4_like ON public.setup_tag USING btree (code varchar_pattern_ops);


--
-- Name: setup_tag_created_by_id_44fa09c5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX setup_tag_created_by_id_44fa09c5 ON public.setup_tag USING btree (created_by_id);


--
-- Name: setup_tag_name_5cf22603_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX setup_tag_name_5cf22603_like ON public.setup_tag USING btree (name varchar_pattern_ops);


--
-- Name: setup_tag_updated_by_id_319fd74e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX setup_tag_updated_by_id_319fd74e ON public.setup_tag USING btree (updated_by_id);


--
-- Name: asset_devicehistory asset_devicehistory_created_by_id_244e3c01_fk_setup_appuser_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asset_devicehistory
    ADD CONSTRAINT asset_devicehistory_created_by_id_244e3c01_fk_setup_appuser_id FOREIGN KEY (created_by_id) REFERENCES public.setup_appuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: asset_devicehistory asset_devicehistory_device_id_4c8c9b5b_fk_inventory_device_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asset_devicehistory
    ADD CONSTRAINT asset_devicehistory_device_id_4c8c9b5b_fk_inventory_device_id FOREIGN KEY (device_id) REFERENCES public.inventory_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: asset_devicehistory asset_devicehistory_updated_by_id_e48018e7_fk_setup_appuser_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asset_devicehistory
    ADD CONSTRAINT asset_devicehistory_updated_by_id_e48018e7_fk_setup_appuser_id FOREIGN KEY (updated_by_id) REFERENCES public.setup_appuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: asset_devicehistory asset_devicehistory_vehicle_id_8e0763a0_fk_asset_vehicle_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asset_devicehistory
    ADD CONSTRAINT asset_devicehistory_vehicle_id_8e0763a0_fk_asset_vehicle_id FOREIGN KEY (vehicle_id) REFERENCES public.asset_vehicle(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: asset_driver asset_driver_created_by_id_9eb2a055_fk_setup_appuser_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asset_driver
    ADD CONSTRAINT asset_driver_created_by_id_9eb2a055_fk_setup_appuser_id FOREIGN KEY (created_by_id) REFERENCES public.setup_appuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: asset_driver asset_driver_group_id_5a9e14fd_fk_setup_clientgroup_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asset_driver
    ADD CONSTRAINT asset_driver_group_id_5a9e14fd_fk_setup_clientgroup_id FOREIGN KEY (group_id) REFERENCES public.setup_clientgroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: asset_driver asset_driver_updated_by_id_b9e1d6ab_fk_setup_appuser_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asset_driver
    ADD CONSTRAINT asset_driver_updated_by_id_b9e1d6ab_fk_setup_appuser_id FOREIGN KEY (updated_by_id) REFERENCES public.setup_appuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: asset_driverschedule asset_driverschedule_created_by_id_e2cde275_fk_setup_appuser_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asset_driverschedule
    ADD CONSTRAINT asset_driverschedule_created_by_id_e2cde275_fk_setup_appuser_id FOREIGN KEY (created_by_id) REFERENCES public.setup_appuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: asset_driverschedule asset_driverschedule_driver_id_376cc3ce_fk_asset_driver_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asset_driverschedule
    ADD CONSTRAINT asset_driverschedule_driver_id_376cc3ce_fk_asset_driver_id FOREIGN KEY (driver_id) REFERENCES public.asset_driver(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: asset_driverschedule asset_driverschedule_updated_by_id_75770abe_fk_setup_appuser_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asset_driverschedule
    ADD CONSTRAINT asset_driverschedule_updated_by_id_75770abe_fk_setup_appuser_id FOREIGN KEY (updated_by_id) REFERENCES public.setup_appuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: asset_driverschedule asset_driverschedule_vehicle_id_b6174b13_fk_asset_vehicle_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asset_driverschedule
    ADD CONSTRAINT asset_driverschedule_vehicle_id_b6174b13_fk_asset_vehicle_id FOREIGN KEY (vehicle_id) REFERENCES public.asset_vehicle(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: asset_vehicle asset_vehicle_connected_device_id_6a2196b4_fk_inventory; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asset_vehicle
    ADD CONSTRAINT asset_vehicle_connected_device_id_6a2196b4_fk_inventory FOREIGN KEY (connected_device_id) REFERENCES public.inventory_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: asset_vehicle asset_vehicle_created_by_id_d8d378a9_fk_setup_appuser_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asset_vehicle
    ADD CONSTRAINT asset_vehicle_created_by_id_d8d378a9_fk_setup_appuser_id FOREIGN KEY (created_by_id) REFERENCES public.setup_appuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: asset_vehicle asset_vehicle_current_driver_id_d28056f9_fk_asset_driver_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asset_vehicle
    ADD CONSTRAINT asset_vehicle_current_driver_id_d28056f9_fk_asset_driver_id FOREIGN KEY (current_driver_id) REFERENCES public.asset_driver(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: asset_vehicle asset_vehicle_group_id_d3f7c514_fk_setup_clientgroup_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asset_vehicle
    ADD CONSTRAINT asset_vehicle_group_id_d3f7c514_fk_setup_clientgroup_id FOREIGN KEY (group_id) REFERENCES public.setup_clientgroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: asset_vehicle asset_vehicle_tag_id_f63eb81d_fk_setup_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asset_vehicle
    ADD CONSTRAINT asset_vehicle_tag_id_f63eb81d_fk_setup_tag_id FOREIGN KEY (tag_id) REFERENCES public.setup_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: asset_vehicle asset_vehicle_updated_by_id_dd69b3e0_fk_setup_appuser_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asset_vehicle
    ADD CONSTRAINT asset_vehicle_updated_by_id_dd69b3e0_fk_setup_appuser_id FOREIGN KEY (updated_by_id) REFERENCES public.setup_appuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: asset_vehicle asset_vehicle_vehicle_type_id_abbf411b_fk_asset_vehicletype_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asset_vehicle
    ADD CONSTRAINT asset_vehicle_vehicle_type_id_abbf411b_fk_asset_vehicletype_id FOREIGN KEY (vehicle_type_id) REFERENCES public.asset_vehicletype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: asset_vehicletype asset_vehicletype_created_by_id_a6bc2a0a_fk_setup_appuser_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asset_vehicletype
    ADD CONSTRAINT asset_vehicletype_created_by_id_a6bc2a0a_fk_setup_appuser_id FOREIGN KEY (created_by_id) REFERENCES public.setup_appuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: asset_vehicletype asset_vehicletype_updated_by_id_ced4799f_fk_setup_appuser_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asset_vehicletype
    ADD CONSTRAINT asset_vehicletype_updated_by_id_ced4799f_fk_setup_appuser_id FOREIGN KEY (updated_by_id) REFERENCES public.setup_appuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_setup_appuser_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_setup_appuser_id FOREIGN KEY (user_id) REFERENCES public.setup_appuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: geo_geofence geo_geofence_created_by_id_7c5f751a_fk_setup_appuser_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.geo_geofence
    ADD CONSTRAINT geo_geofence_created_by_id_7c5f751a_fk_setup_appuser_id FOREIGN KEY (created_by_id) REFERENCES public.setup_appuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: geo_geofence geo_geofence_group_id_6c32f8bf_fk_setup_clientgroup_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.geo_geofence
    ADD CONSTRAINT geo_geofence_group_id_6c32f8bf_fk_setup_clientgroup_id FOREIGN KEY (group_id) REFERENCES public.setup_clientgroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: geo_geofence geo_geofence_updated_by_id_0e6b06d6_fk_setup_appuser_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.geo_geofence
    ADD CONSTRAINT geo_geofence_updated_by_id_0e6b06d6_fk_setup_appuser_id FOREIGN KEY (updated_by_id) REFERENCES public.setup_appuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: geo_geofence_vehicles geo_geofence_vehicles_geofence_id_c535cfb4_fk_geo_geofence_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.geo_geofence_vehicles
    ADD CONSTRAINT geo_geofence_vehicles_geofence_id_c535cfb4_fk_geo_geofence_id FOREIGN KEY (geofence_id) REFERENCES public.geo_geofence(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: geo_geofence_vehicles geo_geofence_vehicles_vehicle_id_f1348d6c_fk_asset_vehicle_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.geo_geofence_vehicles
    ADD CONSTRAINT geo_geofence_vehicles_vehicle_id_f1348d6c_fk_asset_vehicle_id FOREIGN KEY (vehicle_id) REFERENCES public.asset_vehicle(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: geo_poi geo_poi_created_by_id_e376bbd0_fk_setup_appuser_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.geo_poi
    ADD CONSTRAINT geo_poi_created_by_id_e376bbd0_fk_setup_appuser_id FOREIGN KEY (created_by_id) REFERENCES public.setup_appuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: geo_poi geo_poi_group_id_cc3bd877_fk_setup_clientgroup_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.geo_poi
    ADD CONSTRAINT geo_poi_group_id_cc3bd877_fk_setup_clientgroup_id FOREIGN KEY (group_id) REFERENCES public.setup_clientgroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: geo_poi geo_poi_updated_by_id_a01677c4_fk_setup_appuser_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.geo_poi
    ADD CONSTRAINT geo_poi_updated_by_id_a01677c4_fk_setup_appuser_id FOREIGN KEY (updated_by_id) REFERENCES public.setup_appuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: inventory_contactperson inventory_contactper_created_by_id_4b6d9698_fk_setup_app; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory_contactperson
    ADD CONSTRAINT inventory_contactper_created_by_id_4b6d9698_fk_setup_app FOREIGN KEY (created_by_id) REFERENCES public.setup_appuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: inventory_contactperson inventory_contactper_supplier_id_3ff25ed5_fk_inventory; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory_contactperson
    ADD CONSTRAINT inventory_contactper_supplier_id_3ff25ed5_fk_inventory FOREIGN KEY (supplier_id) REFERENCES public.inventory_supplier(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: inventory_contactperson inventory_contactper_updated_by_id_ab132c08_fk_setup_app; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory_contactperson
    ADD CONSTRAINT inventory_contactper_updated_by_id_ab132c08_fk_setup_app FOREIGN KEY (updated_by_id) REFERENCES public.setup_appuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: inventory_device inventory_device_connected_sim_id_2ea9723d_fk_inventory_sim_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory_device
    ADD CONSTRAINT inventory_device_connected_sim_id_2ea9723d_fk_inventory_sim_id FOREIGN KEY (connected_sim_id) REFERENCES public.inventory_sim(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: inventory_device inventory_device_created_by_id_ea1343de_fk_setup_appuser_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory_device
    ADD CONSTRAINT inventory_device_created_by_id_ea1343de_fk_setup_appuser_id FOREIGN KEY (created_by_id) REFERENCES public.setup_appuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: inventory_device inventory_device_device_type_id_ab7bc343_fk_inventory; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory_device
    ADD CONSTRAINT inventory_device_device_type_id_ab7bc343_fk_inventory FOREIGN KEY (device_type_id) REFERENCES public.inventory_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: inventory_device inventory_device_updated_by_id_31828b82_fk_setup_appuser_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory_device
    ADD CONSTRAINT inventory_device_updated_by_id_31828b82_fk_setup_appuser_id FOREIGN KEY (updated_by_id) REFERENCES public.setup_appuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: inventory_devicetype inventory_devicetype_created_by_id_6db7a18e_fk_setup_appuser_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory_devicetype
    ADD CONSTRAINT inventory_devicetype_created_by_id_6db7a18e_fk_setup_appuser_id FOREIGN KEY (created_by_id) REFERENCES public.setup_appuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: inventory_devicetype inventory_devicetype_supplier_id_cb537594_fk_inventory; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory_devicetype
    ADD CONSTRAINT inventory_devicetype_supplier_id_cb537594_fk_inventory FOREIGN KEY (supplier_id) REFERENCES public.inventory_supplier(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: inventory_devicetype inventory_devicetype_updated_by_id_0df8035a_fk_setup_appuser_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory_devicetype
    ADD CONSTRAINT inventory_devicetype_updated_by_id_0df8035a_fk_setup_appuser_id FOREIGN KEY (updated_by_id) REFERENCES public.setup_appuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: inventory_sim inventory_sim_created_by_id_013c977a_fk_setup_appuser_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory_sim
    ADD CONSTRAINT inventory_sim_created_by_id_013c977a_fk_setup_appuser_id FOREIGN KEY (created_by_id) REFERENCES public.setup_appuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: inventory_sim inventory_sim_updated_by_id_4e868f16_fk_setup_appuser_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory_sim
    ADD CONSTRAINT inventory_sim_updated_by_id_4e868f16_fk_setup_appuser_id FOREIGN KEY (updated_by_id) REFERENCES public.setup_appuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: inventory_supplier inventory_supplier_created_by_id_542bf547_fk_setup_appuser_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory_supplier
    ADD CONSTRAINT inventory_supplier_created_by_id_542bf547_fk_setup_appuser_id FOREIGN KEY (created_by_id) REFERENCES public.setup_appuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: inventory_supplier inventory_supplier_updated_by_id_c6e01867_fk_setup_appuser_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory_supplier
    ADD CONSTRAINT inventory_supplier_updated_by_id_c6e01867_fk_setup_appuser_id FOREIGN KEY (updated_by_id) REFERENCES public.setup_appuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: setup_appuser setup_appuser_client_group_id_05ce0346_fk_setup_clientgroup_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.setup_appuser
    ADD CONSTRAINT setup_appuser_client_group_id_05ce0346_fk_setup_clientgroup_id FOREIGN KEY (client_group_id) REFERENCES public.setup_clientgroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: setup_appuser setup_appuser_created_by_id_75ff55ee_fk_setup_appuser_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.setup_appuser
    ADD CONSTRAINT setup_appuser_created_by_id_75ff55ee_fk_setup_appuser_id FOREIGN KEY (created_by_id) REFERENCES public.setup_appuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: setup_appuser_groups setup_appuser_groups_appuser_id_c0e17699_fk_setup_appuser_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.setup_appuser_groups
    ADD CONSTRAINT setup_appuser_groups_appuser_id_c0e17699_fk_setup_appuser_id FOREIGN KEY (appuser_id) REFERENCES public.setup_appuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: setup_appuser_groups setup_appuser_groups_group_id_d3899340_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.setup_appuser_groups
    ADD CONSTRAINT setup_appuser_groups_group_id_d3899340_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: setup_appuser_tags setup_appuser_tags_appuser_id_0b6c640c_fk_setup_appuser_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.setup_appuser_tags
    ADD CONSTRAINT setup_appuser_tags_appuser_id_0b6c640c_fk_setup_appuser_id FOREIGN KEY (appuser_id) REFERENCES public.setup_appuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: setup_appuser_tags setup_appuser_tags_tag_id_1491bcda_fk_setup_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.setup_appuser_tags
    ADD CONSTRAINT setup_appuser_tags_tag_id_1491bcda_fk_setup_tag_id FOREIGN KEY (tag_id) REFERENCES public.setup_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: setup_appuser setup_appuser_updated_by_id_d74d8892_fk_setup_appuser_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.setup_appuser
    ADD CONSTRAINT setup_appuser_updated_by_id_d74d8892_fk_setup_appuser_id FOREIGN KEY (updated_by_id) REFERENCES public.setup_appuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: setup_appuser_user_permissions setup_appuser_user_p_appuser_id_9590e43c_fk_setup_app; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.setup_appuser_user_permissions
    ADD CONSTRAINT setup_appuser_user_p_appuser_id_9590e43c_fk_setup_app FOREIGN KEY (appuser_id) REFERENCES public.setup_appuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: setup_appuser_user_permissions setup_appuser_user_p_permission_id_bc007181_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.setup_appuser_user_permissions
    ADD CONSTRAINT setup_appuser_user_p_permission_id_bc007181_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: setup_clientgroup setup_clientgroup_created_by_id_17f4854f_fk_setup_appuser_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.setup_clientgroup
    ADD CONSTRAINT setup_clientgroup_created_by_id_17f4854f_fk_setup_appuser_id FOREIGN KEY (created_by_id) REFERENCES public.setup_appuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: setup_clientgroup setup_clientgroup_package_id_e697ce18_fk_setup_package_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.setup_clientgroup
    ADD CONSTRAINT setup_clientgroup_package_id_e697ce18_fk_setup_package_id FOREIGN KEY (package_id) REFERENCES public.setup_package(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: setup_clientgroup setup_clientgroup_updated_by_id_7328e162_fk_setup_appuser_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.setup_clientgroup
    ADD CONSTRAINT setup_clientgroup_updated_by_id_7328e162_fk_setup_appuser_id FOREIGN KEY (updated_by_id) REFERENCES public.setup_appuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: setup_emergencycontact setup_emergencyconta_created_by_id_bfde713c_fk_setup_app; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.setup_emergencycontact
    ADD CONSTRAINT setup_emergencyconta_created_by_id_bfde713c_fk_setup_app FOREIGN KEY (created_by_id) REFERENCES public.setup_appuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: setup_emergencycontact setup_emergencyconta_updated_by_id_a2987bde_fk_setup_app; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.setup_emergencycontact
    ADD CONSTRAINT setup_emergencyconta_updated_by_id_a2987bde_fk_setup_app FOREIGN KEY (updated_by_id) REFERENCES public.setup_appuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: setup_emergencycontact setup_emergencycontact_client_id_cd1e4cc9_fk_setup_appuser_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.setup_emergencycontact
    ADD CONSTRAINT setup_emergencycontact_client_id_cd1e4cc9_fk_setup_appuser_id FOREIGN KEY (client_id) REFERENCES public.setup_appuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: setup_package setup_package_created_by_id_60c11de2_fk_setup_appuser_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.setup_package
    ADD CONSTRAINT setup_package_created_by_id_60c11de2_fk_setup_appuser_id FOREIGN KEY (created_by_id) REFERENCES public.setup_appuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: setup_package setup_package_updated_by_id_5aad1f6e_fk_setup_appuser_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.setup_package
    ADD CONSTRAINT setup_package_updated_by_id_5aad1f6e_fk_setup_appuser_id FOREIGN KEY (updated_by_id) REFERENCES public.setup_appuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: setup_tag setup_tag_created_by_id_44fa09c5_fk_setup_appuser_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.setup_tag
    ADD CONSTRAINT setup_tag_created_by_id_44fa09c5_fk_setup_appuser_id FOREIGN KEY (created_by_id) REFERENCES public.setup_appuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: setup_tag setup_tag_updated_by_id_319fd74e_fk_setup_appuser_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.setup_tag
    ADD CONSTRAINT setup_tag_updated_by_id_319fd74e_fk_setup_appuser_id FOREIGN KEY (updated_by_id) REFERENCES public.setup_appuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

