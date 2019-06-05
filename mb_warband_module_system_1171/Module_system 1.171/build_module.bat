@echo off
REM  注释一行一个注释，获取命令的参数"/?"， 最好不要用中文 这些内容最好备份到github上  
cacls.exe "%SystemDrive%\System Volume Information" >nul 2>nul
if %errorlevel%==0 goto Admin
if exist "%temp%\getadmin.vbs" del /f /q "%temp%\getadmin.vbs"
echo Set RequestUAC = CreateObject^("Shell.Application"^)>"%temp%\getadmin.vbs"
echo RequestUAC.ShellExecute "%~s0","","","runas",1 >>"%temp%\getadmin.vbs"
echo WScript.Quit >>"%temp%\getadmin.vbs"
"%temp%\getadmin.vbs" /f
if exist "%temp%\getadmin.vbs" del /f /q "%temp%\getadmin.vbs"
exit

:Admin
echo "get Administartor"

cd "C:\Users\xiaxu\Desktop\modDev\mb_warband_module_system_1171\Module_system 1.171"
@del ProcessLog.txt
echo Getting Header Files .........
copy ".\header files\*.*" ".\" >>ProcessLog.txt
echo Getting ID Files .........
copy ".\ID files\*.*" ".\" >>ProcessLog.txt
echo Getting Process Files .........
copy ".\process files\*.*" ".\" >>ProcessLog.txt
echo Start Processing...
echo ______________________________
echo.

python process_init.py
python process_global_variables.py
python process_strings.py
python process_skills.py
python process_music.py
python process_animations.py
python process_meshes.py
python process_sounds.py
python process_skins.py
python process_map_icons.py
python process_factions.py
python process_items.py
python process_scenes.py
python process_troops.py
python process_particle_sys.py
python process_scene_props.py
python process_tableau_materials.py
python process_presentations.py
python process_party_tmps.py
python process_parties.py
python process_quests.py
python process_info_pages.py
python process_scripts.py
python process_mission_tmps.py
python process_game_menus.py
python process_simple_triggers.py
python process_dialogs.py
python process_global_variables_unused.py
python process_postfx.py
@del *.pyc
REM 删除头
@del header_*.py      
REM 移动 id           
copy ".\ID_*.py" ".\ID files\" >>ProcessLog.txt 
REM  删除id
@del ID_*.py     
rem 删除process     
@del process_*.py                
echo.
echo ______________________________
echo.
echo Script processing has ended.
echo Press any key to exit. . .
pause>nul