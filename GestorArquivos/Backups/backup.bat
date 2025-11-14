@echo off
setlocal enabledelayedexpansion

:: Caminhos principais
set BASE=C:\GestorArquivos
set DOCS=%BASE%\Documentos
set LOGS=%BASE%\Logs
set BACKUPS=%BASE%\Backups
set LOGFILE=%LOGS%\atividade.log

set PASTAS_CRIADAS=3
set ARQUIVOS_CRIADOS=6

:: Função de LOG
:log
set DATAHORA=%date% %time%
echo [%DATAHORA%] %1 - %2 >> "%LOGFILE%"
goto :eof

echo ========= INICIANDO PROCESSO =========

:: Criar pastas -----------------------------------------------------
for %%P in ("%BASE%" "%DOCS%" "%LOGS%" "%BACKUPS%") do (
    mkdir "%%P" 2>nul
    if !errorlevel!==0 (
        set /a PASTAS_CRIADAS+=1
        call :log "Criar pasta %%P" "Sucesso"
    ) else (
        call :log "Criar pasta %%P" "Falha"
    )
)

:: Criar arquivos ---------------------------------------------------

:: relatorio.txt
(
echo Relatório do sistema
echo Registro gerado automaticamente.
echo Fim do relatório.
) > "%DOCS%\relatorio.txt" 2>nul

if %errorlevel%==0 (
    set /a ARQUIVOS_CRIADOS+=1
    call :log "Criar arquivo relatorio.txt" "Sucesso"
) else (
    call :log "Criar arquivo relatorio.txt" "Falha"
)

:: dados.csv
(
echo id,nome,valor
echo 1,ItemA,100
echo 2,ItemB,200
) > "%DOCS%\dados.csv" 2>nul

if %errorlevel%==0 (
    set /a ARQUIVOS_CRIADOS+=1
    call :log "Criar arquivo dados.csv" "Sucesso"
) else (
    call :log "Criar arquivo dados.csv" "Falha"
)

:: config.ini
(
echo [GERAL]
echo versao=1.0
echo modo=padrao
) > "%DOCS%\config.ini" 2>nul

if %errorlevel%==0 (
    set /a ARQUIVOS_CRIADOS+=1
    call :log "Criar arquivo config.ini" "Sucesso"
) else (
    call :log "Criar arquivo config.ini" "Falha"
)

:: =========================================
:: SIMULAÇÃO DE BACKUP
:: =========================================

echo Iniciando copia dos arquivos para Backups...
xcopy "%DOCS%\*.*" "%BACKUPS%\" /Y >nul

if %errorlevel% LEQ 4 (
    call :log "Backup dos arquivos" "Sucesso"
) else (
    call :log "Backup dos arquivos" "Falha"
)

:: Criar arquivo backup_completo.bak com data/hora
set BACKUPTIME=%date% %time%
echo Backup concluído em: %BACKUPTIME% > "%BACKUPS%\backup_completo.bak"

if %errorlevel%==0 (
    call :log "Criar backup_completo.bak" "Sucesso"
) else (
    call :log "Criar backup_completo.bak" "Falha"
)

:: =========================================
:: RELATÓRIO FINAL
:: =========================================

(
echo RELATÓRIO DE EXECUÇÃO
echo ----------------------
echo Total de arquivos criados: %ARQUIVOS_CRIADOS%
echo Total de pastas criadas: %PASTAS_CRIADAS%
echo Data/Hora do backup: %BACKUPTIME%
) > "%BASE%\resumo_execucao.txt"

call :log "Gerar resumo_execucao.txt" "Sucesso"

echo Processo concluído!
echo Veja o arquivo resumo_execucao.txt para detalhes.
pause

