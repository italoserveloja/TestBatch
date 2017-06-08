echo off

setlocal EnableDelayedExpansion
set /a n=1
set /a current = 1
set /P user_input=Escolha o numero de arquivos em cada commit:
set /a module=!user_input!
for /r %%i in (*) do (  
	git add %%i && set /a n=!n!+1 & set /a modulado=!n!%%!module!
	if !modulado! == 0 git commit -m ^"Commit de !current! a !n!^" & set /a current=!n!+1 & git push origin master
)
git commit -m ^"Commit de !current! a !n!^" & set /a current=!n!+1 & git push origin master
endlocal