


#!/bin/bash
awk '{print $1,$2,$5,$6}'  *Dealer_schedule* | grep -i 05:00:00\ am
awk '{print $1,$2,$5,$6}'  *Dealer_schedule* | grep -i 08:00:00\ am
awk '{print $1,$2,$5,$6}'  *Dealer_schedule* | grep -i 02:00:00\ pm
awk '{print $1,$2,$5,$6}'  *Dealer_schedule* | grep -i 08:00:00\ pm
awk '{print $1,$2,$5,$6}'  *Dealer_schedule* | grep -i 11:00:00\ pm
 
