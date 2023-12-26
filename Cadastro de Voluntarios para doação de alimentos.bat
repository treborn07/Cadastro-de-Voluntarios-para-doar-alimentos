@echo off
setlocal enabledelayedexpansion
echo.
echo.
echo.
echo.                 ----UNIVALI----
echo.     --Analise e Desenvolvimento de Sitemas--
echo.
echo.
echo.

timeout 4
cls
REM Definir o arquivo de voluntários
REM Definir o arquivo de alimentos 
REM Definir o arquivo de recptores
REM Definir a data de doaçao
REM Definir senha de adm
set "senha_admin=admin"
set "voluntarios_file=voluntarios.txt"
set "alimentos_file=alimentos.txt"
set "receptores_file=receptores.txt"
set "encarregado_file=encarregado.txt"

:login
cls
echo Sistema de Login
echo.

set /p "insira_senha=Senha de Administrador: "

if "%insira_senha%"=="%senha_admin%" (
    echo Login bem-sucedido.
    goto :menu
) else (
    echo Senha incorreta. Acesso negado.
    pause >nul
    exit /b
)

REM Menu principal
:menu
cls
echo.
echo.
echo    Sistema de Cadastro de Voluntarios para Doacao de Alimentos
echo.
echo.
echo                 1. Cadastrar voluntarios
echo                 2. Listar voluntarios
echo                 3. Cadastrar alimentos
echo                 4. Alimentos disponiveis
echo                 5. Cadastrar receptores
echo                 6. Listar receptores
echo                 7. Ir para menu2
echo.

set /p choice=Escolha uma opcao: 

if "%choice%"== "1" (
    call :cadastrar_voluntario
) else if "%choice%"== "2" (
    call :listar_voluntarios
) else if "%choice%"== "3" (
    call :cadastrar_alimentos
) else if "%choice%"== "4" (
	call :alimentos_disponiveis
) else if "%choice%"== "5" (
	call :cadastrar_recptores
) else if "%choice%"== "6" (
	call :listar_recptores	
) else if "%choice%"== "7" (
	goto :menu2
) else (
    echo Opção invalida. Pressione qualquer tecla para continuar.
    pause >nul
    goto :menu
)

exit /b

:cadastrar_voluntario
cls
echo Cadastro de Voluntario
echo.

set /p nome=Nome: 
set /p email=Email: 
set /p telefone=Telefone: 
set /p endereço=Endereco:
set /p tipo=Tipo:

REM Grava as informações no arquivo de voluntários
echo Nome: !nome! >> %voluntarios_file%
echo Email: !email! >> %voluntarios_file%
echo Telefone: !telefone! >> %voluntarios_file%
echo Tipo: !tipo! >> %voluntarios_file%
echo Endereco: !endereço! >> %voluntarios_file%
echo. >> %voluntarios_file%

echo Voluntario cadastrado com sucesso.
pause >nul
goto :menu

:listar_voluntarios
cls
echo Lista de Voluntarios Cadastrados
echo.

if not exist %voluntarios_file% (
    echo Nenhum voluntario cadastrado.
) else (
    type %voluntarios_file%
)

pause >nul
goto :menu

:cadastrar_alimentos
cls
echo Cadastro de Alimentos
echo.

set /p nome=Alimento: 
set /p data=Validade: 
set /p quantidade=Kg: 
set /p local=Local:

REM Grava as informações no arquivo de Alimentos
echo Alimento: !nome! >> %alimentos_file%
echo Validade: !data! >> %alimentos_file%
echo Kg: !quantidade! >> %alimentos_file%
echo Local: !local! >> %alimentos_file%
echo. >> %alimentos_file%

echo Alimento cadastrado com sucesso.
pause >nul
goto :menu

:alimentos_disponiveis
cls
echo.

if not exist %alimentos_file% (
    echo Nenhum alimento cadastrado.
) else (
    type %alimentos_file%
)

pause >nul
goto :menu

:cadastrar_recptores
cls
echo Cadastro de Receptores
echo.

set /p nome=Nome: 
set /p email=Email: 
set /p telefone=Telefone: 
set /p endereço=Endereço:
set /p prioridade=Prioridade:
set /p tipo=Tipo:

REM Grava as informações no arquivo de receptores
echo Nome: !nome! >> %receptores_file%
echo Email: !email! >> %receptores_file%
echo Telefone: !telefone! >> %receptores_file%
echo Endereço: !endereço! >> %receptores_file%
echo Prioridade:  !prioridade! >> %receptores_file%
echo Tipo: !tipo! >> %receptores_file%
echo. >> %receptores_file%

echo Receptor cadastrado com sucesso.
pause >nul
goto :menu

:listar_recptores
cls
echo.

if not exist %receptores_file% (
    echo Nenhum Receptor cadastrado.
) else (
    type %receptores_file%%
)

pause >nul
goto :menu

:menu2
echo.
echo.             Menu destinado a doacao para os receptores
echo.
echo.                1. Encarregado de doacao
echo.                2. Data da doacao e Receptor
echo.                3. Regras/seguranca/meios
echo.                4. ficha de conclusao de Doacao
echo.                5. Voltar ao menu 1

set /p choice1=Escolha uma opcao do menu2:

if "%choice1%"== "1" (
	call :encarregado_doar
)	else if "%choice1%"== "2" (
	call :data_doar 
)	else if "%choice1%"== "3" (
	call :regras_security
)	else if "%choice1%"== "4" (
	call ficha_concluse
)	else if "%choice1%"== "5" (
	call :menu_0
) else (
    echo Opção invalida. Pressione qualquer tecla para continuar.
    pause >nul
    goto :menu2
)


:encarregado_doar
cls
echo.
echo Dados do encarregado de doacao!
echo.

set /p nome=Nome: 
set /p email=Email: 
set /p telefone=Telefone: 
set /p tipo=Tipo:
set /p endereco=Endereco:


REM Grava as informações no arquivo de encarregado
echo Nome: !nome! >> %encarregado_file%
echo Email: !email! >> %encarregado_file%
echo Telefone: !telefone! >> %encarregado_file%
echo Tipo: !tipo! >> %encarregado_file%
echo Endereco: !endereço! >> %encarregado_file%
echo. >> %encarregado_file%

echo Encarregado cadastrado com sucesso.
pause >nul
goto :menu2

:data_doar
cls
echo.
echo. Dada definida para doacao
echo.

set /p data=Data:
set /p encarregado=Encarregado:
set /p alimento=Alimento:
set /p receptor=Receptor:

:menu_0
goto :menu
