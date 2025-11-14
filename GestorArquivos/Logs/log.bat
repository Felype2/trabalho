C:\GestorArquivos\Logs\atividade.log

@echo off
setlocal enabledelayedexpansion

:: Caminho do log
set LOGFILE=C:\GestorArquivos\Logs\atividade.log

:: Função para registrar atividade
:log
set DATAHORA=%date% %time%
echo [%DATAHORA%] %1 - %2 >> "%LOGFILE%"
goto :eof

echo Criando pastas...

:: Criar pasta principal
mkdir "C:\GestorArquivos" 2>nul
if %errorlevel%==0 (
    call :log "Criar pasta C:\GestorArquivos" "Sucesso"
) else (
    call :log "Criar pasta C:\GestorArquivos" "Falha"
)

:: Criar Documentos
mkdir "C:\GestorArquivos\Documentos" 2>nul
if %errorlevel%==0 (
    call :log "Criar pasta Documentos" "Sucesso"
) else (
    call :log "Criar pasta Documentos" "Falha"
)

:: Criar Logs
mkdir "C:\GestorArquivos\Logs" 2>nul
if %errorlevel%==0 (
    call :log "Criar pasta Logs" "Sucesso"
) else (
    call :log "Criar pasta Logs" "Falha"
)

:: Criar Backups
mkdir "C:\GestorArquivos\Backups" 2>nul
if %errorlevel%==0 (
    call :log "Criar pasta Backups" "Sucesso"
) else (
    call :log "Criar pasta Backups" "Falha"
)

echo Criando arquivos dentro de Documentos...

:: Criar relatorio.txt
(
echo Relatório do sistema
echo Registro gerado automaticamente.
echo Fim do relatório.
) > "C:\GestorArquivos\Documentos\relatorio.txt" 2>nul

if %errorlevel%==0 (
    call :log "Criar arquivo relatorio.txt" "Sucesso"
) else (
    call :log "Criar arquivo relatorio.txt" "Falha"
)

:: Criar dados.csv
(
echo id,nome,valor
echo 1,ItemA,100
echo 2,ItemB,200
) > "C:\GestorArquivos\Documentos\dados.csv" 2>nul

if %errorlevel%==0 (
    call :log "Criar arquivo dados.csv" "Sucesso"
) else (
    call :log "Criar arquivo dados.csv" "Falha"
)

:: Criar config.ini
(
echo [GERAL]
echo versao=1.0
echo modo=padrao
) > "C:\GestorArquivos\Documentos\config.ini" 2>nul

if %errorlevel%==0 (
    call :log "Criar arquivo config.ini" "Sucesso"
) else (
    call :log "Criar arquivo config.ini" "Falha"
)

echo Processo concluído!
pause

