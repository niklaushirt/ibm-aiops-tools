#!/bin/bash
echo "   ------------------------------------------------------------------------------------------------------------------------------"
echo "   🔐  Encryption Key"
echo "        $ENCRYPTION_KEY"
echo ""


echo "   ------------------------------------------------------------------------------------------------------------------------------"
echo "   🔎  Available Scripts"
ls -al scripts| sed 's/^/         /'
echo ""

rm -f /tmp/script.sh
echo $ENCRYPTION_KEY > /tmp/pwd.yaml

echo "🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽"
echo ""
echo "🚀  Launching Scripts"
echo ""

shopt -s nullglob
for file in ./scripts/*
do
    echo ""
    echo " *****************************************************************************************************************************"
    echo " *****************************************************************************************************************************"
    echo " *****************************************************************************************************************************"
    echo " 🚀  Launching $file"
    export is_encrypted=$(cat $file | grep -c '$ANSIBLE_VAULT')
    if [[ $is_encrypted > 0 ]]; then
        echo "     🔐  Decrypting $file"
        ansible-vault decrypt --vault-password-file /tmp/pwd.yaml --output /tmp/script.sh "$file"| sed 's/^/         /'
    else
        cp $file /tmp/script.sh
    fi
    chmod +x /tmp/script.sh
    /tmp/script.sh

    echo ""
    echo ""
    echo " *****************************************************************************************************************************"
    echo "  ✅ DONE $file"
    echo " *****************************************************************************************************************************"
    echo " *****************************************************************************************************************************"
    echo " *****************************************************************************************************************************"
    echo " *****************************************************************************************************************************"
    echo ""
    echo ""
    echo ""
    echo ""
    echo ""
    echo ""
    echo ""
    echo ""

done
shopt -u nullglob #revert nullglob back



echo "*****************************************************************************************************************************"
echo " ✅ DONE"
echo "🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼"

while true
do
    sleep 60000                           
done
 
