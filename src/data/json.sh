#!/bin/bash
#LISTA DE COMANDOS INDIVIDUAIS.
cm1=$(lscpu | grep 'Modo(s)' | awk '{print $5$6}')
cm2=$(lscpu | grep 'modelo' | awk '{print $4" "$5" "$6" "$7" "$8" "$9}')
cm3=$(lsb_release -d | awk '{print $2" "$3" "$4}')
cm4=$(uname -n)
cm5=$(uname -r)
cm6=$(uptime -p)
cm7=$(uptime -s)
cm8=$(awk '{u=$2+$4; t=$2+$4+$5; if (NR==1){u1=u; t1=t;} else print ($2+$4-u1) * 100 / (t-t1); }' <(grep 'cpu ' /proc/stat) <(sleep 1;grep 'cpu ' /proc/stat) | cut -c 1-2)
cm9=$(free --mega | awk 'NR==2 {print $3 * 100/ $2}'| cut -c 1-2)
cm10=$(free --mega | awk 'NR==3 {print $3 * 100/ $2}'| cut -c 1-2)

#LISTA DE ARRAY DE COMANDOS
arr1=($(ip -br link | awk '{print $1}'))
arr2=($(ip -br link | awk '{print $2}'))
arr3=($(ip -br link | awk '{print $3}'))

#INICIO DO JSON
echo -e "{\n"

#RETORN INFORMAÇÕES DO SISTEMA OPERACIONAL
echo -e "\t \"informacoes\": {"
		echo -e "\t\t\"Arquitetura\": \"${cm1}\","
		echo -e "\t\t\"Modelo da Cpu\": \"${cm2}\","
		echo -e "\t\t\"Sistema Operacional\": \"${cm3}\","
		echo -e "\t\t\"Hostname\": \"${cm4}\","
		echo -e "\t\t\"Versão do Kernel\": \"${cm5}\","
		echo -e "\t\t\"Tempo de Atividade\": \"${cm6}\","
		echo -e "\t\t\"Sistema Ativo Desde\": \"${cm7}\""
echo -e "\t},"
#PORCETAGEM DE CPU
echo -e "\t \"uso_cpu\": {"
		echo -e "\t\t\"cpu\": \"${cm8}\""
echo -e "\t},"
#PORCETAGEM DE RAM
echo -e "\t \"uso_ram\": {"
		echo -e "\t\t\"ram\": \"${cm9}\""
echo -e "\t},"
#PORCETAGEM DE swap
echo -e "\t \"uso_swap\": {"
		echo -e "\t\t\"swap\": \"${cm10}\""
echo -e "\t},"
#RETORNA AS INTERFACES DE REDES

echo -e "\t \"interfaces\": {"

for i in $(seq 0 ${#arr1[@]}); do
	if [ "${arr1[$i]}" = "" ]; then
		break
	elif [ $i -eq $((${#arr1[@]}-1)) ]; then
		echo -e "\t\t\t\"${arr1[$i]}\": \"${arr2[$i]}\""
	else
		echo -e "\t\t\t\"${arr1[$i]}\": \"${arr2[$i]}\","
	fi
done
echo -e "\t}"

#FIM DO JSON
echo -e "}"
