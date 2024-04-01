PGDMP  %    7                |            ERP    16.2    16.2 !    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16398    ERP    DATABASE     |   CREATE DATABASE "ERP" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE "ERP";
                postgres    false            �            1259    16439    clientes    TABLE     �  CREATE TABLE public.clientes (
    codigo integer NOT NULL,
    id integer NOT NULL,
    nome character varying(200) NOT NULL,
    apelido character varying(100),
    ativo character varying(1) NOT NULL,
    cep character varying(9),
    logradouro character varying(200),
    numero integer,
    complemento character varying(50),
    bairro character varying(150),
    pais integer NOT NULL,
    estado integer NOT NULL,
    municipio integer NOT NULL,
    email character varying(200),
    telefone character varying(50),
    tipopessoa character varying(2) NOT NULL,
    sexo character varying(100) NOT NULL,
    cpfcnpj character varying(18) NOT NULL,
    inscricaoestadual character varying(30),
    inscricaomunicipal character varying(30)
);
    DROP TABLE public.clientes;
       public         heap    postgres    false            �            1259    16415    estados    TABLE     �   CREATE TABLE public.estados (
    id integer NOT NULL,
    pais integer NOT NULL,
    nome character varying(100) NOT NULL,
    codigo integer NOT NULL,
    sigla character varying(4)
);
    DROP TABLE public.estados;
       public         heap    postgres    false            �            1259    16427 
   municipios    TABLE     �   CREATE TABLE public.municipios (
    id integer NOT NULL,
    estado integer NOT NULL,
    nome character varying(100) NOT NULL,
    codigo character varying(100) NOT NULL
);
    DROP TABLE public.municipios;
       public         heap    postgres    false            �            1259    16410    paises    TABLE        CREATE TABLE public.paises (
    id integer NOT NULL,
    nome character varying(100) NOT NULL,
    codigo integer NOT NULL
);
    DROP TABLE public.paises;
       public         heap    postgres    false            �            1259    16465    seq_clientes_id    SEQUENCE     x   CREATE SEQUENCE public.seq_clientes_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.seq_clientes_id;
       public          postgres    false            �            1259    16469    seq_estados_id    SEQUENCE     w   CREATE SEQUENCE public.seq_estados_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.seq_estados_id;
       public          postgres    false            �            1259    16471    seq_municipios_id    SEQUENCE     z   CREATE SEQUENCE public.seq_municipios_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.seq_municipios_id;
       public          postgres    false            �            1259    16467    seq_paises_id    SEQUENCE     v   CREATE SEQUENCE public.seq_paises_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.seq_paises_id;
       public          postgres    false            �          0    16439    clientes 
   TABLE DATA           �   COPY public.clientes (codigo, id, nome, apelido, ativo, cep, logradouro, numero, complemento, bairro, pais, estado, municipio, email, telefone, tipopessoa, sexo, cpfcnpj, inscricaoestadual, inscricaomunicipal) FROM stdin;
    public          postgres    false    218   '       �          0    16415    estados 
   TABLE DATA           @   COPY public.estados (id, pais, nome, codigo, sigla) FROM stdin;
    public          postgres    false    216   �)       �          0    16427 
   municipios 
   TABLE DATA           >   COPY public.municipios (id, estado, nome, codigo) FROM stdin;
    public          postgres    false    217   J*       �          0    16410    paises 
   TABLE DATA           2   COPY public.paises (id, nome, codigo) FROM stdin;
    public          postgres    false    215   �*       �           0    0    seq_clientes_id    SEQUENCE SET     >   SELECT pg_catalog.setval('public.seq_clientes_id', 19, true);
          public          postgres    false    219            �           0    0    seq_estados_id    SEQUENCE SET     =   SELECT pg_catalog.setval('public.seq_estados_id', 1, false);
          public          postgres    false    221            �           0    0    seq_municipios_id    SEQUENCE SET     @   SELECT pg_catalog.setval('public.seq_municipios_id', 1, false);
          public          postgres    false    222            �           0    0    seq_paises_id    SEQUENCE SET     <   SELECT pg_catalog.setval('public.seq_paises_id', 1, false);
          public          postgres    false    220            4           2606    16445    clientes clientes_pk 
   CONSTRAINT     R   ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pk PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.clientes DROP CONSTRAINT clientes_pk;
       public            postgres    false    218            6           2606    16447    clientes clientes_unique 
   CONSTRAINT     U   ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_unique UNIQUE (codigo);
 B   ALTER TABLE ONLY public.clientes DROP CONSTRAINT clientes_unique;
       public            postgres    false    218            8           2606    16449    clientes clientes_unique_1 
   CONSTRAINT     X   ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_unique_1 UNIQUE (cpfcnpj);
 D   ALTER TABLE ONLY public.clientes DROP CONSTRAINT clientes_unique_1;
       public            postgres    false    218            ,           2606    16419    estados estados_pk 
   CONSTRAINT     P   ALTER TABLE ONLY public.estados
    ADD CONSTRAINT estados_pk PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.estados DROP CONSTRAINT estados_pk;
       public            postgres    false    216            .           2606    16421    estados estados_unique 
   CONSTRAINT     S   ALTER TABLE ONLY public.estados
    ADD CONSTRAINT estados_unique UNIQUE (codigo);
 @   ALTER TABLE ONLY public.estados DROP CONSTRAINT estados_unique;
       public            postgres    false    216            0           2606    16431    municipios municipios_pk 
   CONSTRAINT     V   ALTER TABLE ONLY public.municipios
    ADD CONSTRAINT municipios_pk PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.municipios DROP CONSTRAINT municipios_pk;
       public            postgres    false    217            2           2606    16433    municipios municipios_unique 
   CONSTRAINT     Y   ALTER TABLE ONLY public.municipios
    ADD CONSTRAINT municipios_unique UNIQUE (codigo);
 F   ALTER TABLE ONLY public.municipios DROP CONSTRAINT municipios_unique;
       public            postgres    false    217            *           2606    16414    paises paises_pk 
   CONSTRAINT     N   ALTER TABLE ONLY public.paises
    ADD CONSTRAINT paises_pk PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.paises DROP CONSTRAINT paises_pk;
       public            postgres    false    215            ;           2606    16450    clientes clientes_estados_fk    FK CONSTRAINT     |   ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_estados_fk FOREIGN KEY (estado) REFERENCES public.estados(id);
 F   ALTER TABLE ONLY public.clientes DROP CONSTRAINT clientes_estados_fk;
       public          postgres    false    4652    216    218            <           2606    16455    clientes clientes_municipios_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_municipios_fk FOREIGN KEY (municipio) REFERENCES public.municipios(id);
 I   ALTER TABLE ONLY public.clientes DROP CONSTRAINT clientes_municipios_fk;
       public          postgres    false    217    4656    218            =           2606    16460    clientes clientes_paises_fk    FK CONSTRAINT     x   ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_paises_fk FOREIGN KEY (pais) REFERENCES public.paises(id);
 E   ALTER TABLE ONLY public.clientes DROP CONSTRAINT clientes_paises_fk;
       public          postgres    false    4650    215    218            9           2606    16422    estados estados_paises_fk    FK CONSTRAINT     v   ALTER TABLE ONLY public.estados
    ADD CONSTRAINT estados_paises_fk FOREIGN KEY (pais) REFERENCES public.paises(id);
 C   ALTER TABLE ONLY public.estados DROP CONSTRAINT estados_paises_fk;
       public          postgres    false    4650    215    216            :           2606    16434     municipios municipios_estados_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.municipios
    ADD CONSTRAINT municipios_estados_fk FOREIGN KEY (estado) REFERENCES public.estados(id);
 J   ALTER TABLE ONLY public.municipios DROP CONSTRAINT municipios_estados_fk;
       public          postgres    false    217    216    4652            �   �  x��S�n�0����c<��S�͆Ӡ	��H�L]��	H�+J�7E���	��^J��v� "E�{ι����K����ғʒ�{;��#p!�H�������ٶ���`e�����j�\�7�V�Ά�.^�jZ��i�dAaw��q-�*����`&A�ΙOn&J��#D�X+��W���]����E���-lL(�:�Ӕ2��PE��`� ���{W:OVf8��ʠڷ�"���<�R6�5�@��@259�ſ�ծ5��\��"&\�E�,�#�9-��J�GE��V�'�m۹o�E:]�yr�m{K�!�0�ARy.�H4�HmL����{P٩I��wO���3�F�$"Fb"^�{�7�g���j�ӌ��Kɯ�֐��l�Q k�a\<�d��ґ%/4YhX()$�
C5�����C눳֌��sW*/�<�c^�ֿ�e�S)2*u�0��2�*,۪;� ��8��ښj4j�WNd�r�c����4עe�'�C*E���L�(ǟ��p�j��"�a���B�2'�I���!��r�R}��I�@	�7�4�%兂Y\�~o��"P��oɲvZ���|��$��r��bR2���*��������ը�s�?�z5�IQ���<�z�L5�9U4��������$q����B���a���Lg�a��0�Jg��o��E�      �   h   x�-�;
�0��z�9��Dk�2���f��d��������1���J��n1�d��"�z��H�QĞ�{��|�� z�a�(�n��{��)�E���q��"�+�      �   �   x�=�1
�0��Y:ENPd�n��)��vQ�Cl�߿-}�7<~f٢�`z6D��V�&���ؑC�p�QK^���L=X��%!	XOd���3����L�F���T5彻��;��� ^�F�����![R)!ww�K.�[D4�����y/�      �   9   x�3�t*J,���440��2�t,JO�+��K�43��2�tJ�I�LN�07����� F�E     