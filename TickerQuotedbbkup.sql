PGDMP     5    +                x            TickerQuote    10.12    10.12     �
           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �
           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �
           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            �
           1262    83761    TickerQuote    DATABASE     �   CREATE DATABASE "TickerQuote" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_Singapore.1252' LC_CTYPE = 'English_Singapore.1252';
    DROP DATABASE "TickerQuote";
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            �
           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        3079    12924    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            �
           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    83765    quote    TABLE     �   CREATE TABLE public.quote (
    symbol text,
    sharestraded text,
    pricetraded numeric,
    changedirection text,
    changeamount numeric,
    id integer NOT NULL,
    "timestamp" timestamp with time zone
);
    DROP TABLE public.quote;
       public         postgres    false    3            �            1259    83775    quote_id_seq    SEQUENCE     �   CREATE SEQUENCE public.quote_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.quote_id_seq;
       public       postgres    false    3    196            �
           0    0    quote_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.quote_id_seq OWNED BY public.quote.id;
            public       postgres    false    197            o
           2604    83777    quote id    DEFAULT     d   ALTER TABLE ONLY public.quote ALTER COLUMN id SET DEFAULT nextval('public.quote_id_seq'::regclass);
 7   ALTER TABLE public.quote ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    197    196            �
          0    83765    quote 
   TABLE DATA               r   COPY public.quote (symbol, sharestraded, pricetraded, changedirection, changeamount, id, "timestamp") FROM stdin;
    public       postgres    false    196   }       �
           0    0    quote_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.quote_id_seq', 45, true);
            public       postgres    false    197            �
   �   x�m�;n1�Z{
��	~%�ml ��o��M�j�E"ō�<�s��B�B���F���	%����v�1?
,�-X;8���k�W��I{��VP�CN���U�`�{���:u[ur�����_M<�8��پh�@�I�W�PQ��D΢���VZ�f��_g��7剔�@H�>�Ȣ��ʾ������{�;l��u�i�     