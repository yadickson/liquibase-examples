create or replace PACKAGE PKG_CONSTANTES
IS

    -- Codigos asociados a respuetas de procedimientos

    CODIGO_OK CONSTANT NUMBER := 0;
    CODIGO_ERROR CONSTANT NUMBER := 100;

    -- Codigos asociados a la bitacora

    CODIGO_REGISTRO_USUARIO CONSTANT NUMBER := 0;   -- Usado para guardar usuarios que intentan guardar sin privilegios
    CODIGO_REGISTRO_SWITCH CONSTANT NUMBER := 1;
    CODIGO_REGISTRO_CUENTA CONSTANT NUMBER := 2;
    CODIGO_REGISTRO_FORMULA CONSTANT NUMBER := 3;
    CODIGO_REGISTRO_RENTA CONSTANT NUMBER := 4;
    CODIGO_REGISTRO_DECLARACION CONSTANT NUMBER := 5;

    -- Codigos asociados a la excepciones

    C_ERROR_GUARDAR_BITACORA CONSTANT NUMBER := -20001;

END PKG_CONSTANTES;