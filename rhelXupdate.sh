#!/bin/bash -
# Author:      Christo Deale                  
# Date  :      2024-09-25               
# rhelXupdate: Utility which does an errata & update excl kernel            
#
echo " :: rhelXupdate :: "
echo "Current Status:"
dnf updateinfo
echo " >>>> Redhat Enterprise Linux Updater >>>>"
echo "       Please choose from the following options:"
echo "       1. Errata/Security & Bugfixes, Enhancements, Recommended, and Important Updates"
echo "       2. Update all but kernel"
echo

# Prompt user for selection
PS3="Please enter your choice: "

select opt in "Errata/Security, Bugfixes, Enhancements, Recommended, and Important Updates" "Update all but kernel"; do
    case $REPLY in
        1)
            echo "Running Errata/Security & Bugfixes, Enhancements, Recommended, and Important Updates..."
            sudo dnf -y update --security --bugfix --enhancement --recommended --important
            break
            ;;
        2)
            echo "Updating all packages except the kernel..."
            sudo dnf -y --exclude=kernel* update
            break
            ;;
        *)
            echo "Invalid option. Please select 1 or 2."
            ;;
    esac
done

echo "Update process completed."
