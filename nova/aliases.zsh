alias nova_stage='export OS_AUTH_URL=http://stage-openstackapi.ad.prodcc.net:5000/v2.0'
alias nova_prod='export OS_AUTH_URL=http://prod-openstackapi.ad.prodcc.net:5000/v2.0'
alias nova_dr='export OS_AUTH_URL=http://dr-openstackapi.ad.prodcc.net:5000/v2.0'
alias nova_qa='export OS_AUTH_URL=http://qa-openstackapi.ad.prodcc.net:5000/v2.0'
alias nova_password='echo "Enter AD password for nova"; read -rs OS_PASSWORD ; export OS_PASSWORD'
alias nova_env='echo $OS_AUTH_URL'
