#!/bin/bash

#introduction

echo "Be welcomed, unkindled one"

sleep 1

echo "Thou must return the old Lords of Cinder to their thrones"

sleep 1

echo "There will be many monsters in thine way, but if thou would slay them, they will each yield great rewards"

sleep 1

#class creation

echo "You will need to select a class to begin:
1 - Swordsman
2 - Thief
3 - Wizard"

read class

case $class in

	1)
		type="Swordsman"
		hp=30
		atk=8
		agi=4
		mag=2
		;;
	2)
		type="Thief"
		hp=6
		atk=6
		agi=8
		mag=6
		;;
	3)
		type="Wizard"
		hp=8
		atk=4
		agi=6
		mag=10
		;;
esac

xp="0"

echo "Thou art of the $type kind, how interesting..."

sleep 1

echo "Since thou had chosen $type, thine
health  = $hp
attack  = $atk
agility = $agi
magic   = $mag"

sleep 1

echo "Thou should go forth now, for it is thine purpose to seek out the Lords"


#monster encounter at bonfire

while (( $xp < 10 ))
do
	sleep 1

	echo "As you make your way through the bellflower plains, a monster appears..."

	enemytype=$(( $RANDOM % 2 ))

	if [[ $enemytype == "0" ]]; then
		enemy="Kobold"
		enemyhp="20"
		enemyatk="3"
		exp="1"

	elif [[ $enemytype == "1" ]]; then
		enemy="Goblin"
		enemyhp="16"
        	enemyatk="4"
		exp="1"
	fi

	sleep 1

	echo "As Thine eyes lay opon thine opponent, thou finds it is a $enemy"

	sleep 1

	echo "Quickly thou get thine weapons out, and get ready to fight..."

	sleep 1

#attacking the monster
	sleep 1
	echo "Thine current hp is $hp"

	while (( $enemyhp > 0 ))
	do

		if (( hp < 1 )); then
			sleep 1
			echo "You have died"
			sleep 1
			exit
		fi

		sleep 1
		echo "The $enemy 's hp is $enemyhp"
		sleep 1
		echo "Thou must choose how to approach thine $enemy..."

		if [[ $type == "Swordsman" ]]; then
			echo "1 - slash
2 - parry"

		else sleep 1 || echo "WIP, this class is not supported yet, please restart the game and pick another class (Swordsman)"

		fi

		read approach

		case $approach in

			1)
				enemyhp=$(( $enemyhp - $atk ))

				echo "You hit the $enemy"
				sleep 1
				echo "You did $atk damage"
				sleep 1
				echo "It's hp is $enemyhp"

				if [[ $enemyhp < 1 ]]; then

					sleep 1
					echo "Thou has slain the $enemy, congratulations!"

				fi
				;;

			2)
				chance=$(( $RANDOM % 4 ))

				if [[ $chance = 0 ]]; then

					sleep 1
					echo "With thine precise timing, thou caught the $enemy off-balance and epically killed it in one swoop"
					enemyhp="-1"

       	                                sleep 1
       	       	                        echo "Thou has slain the $enemy, congratulations!"
				else
					sleep 1
					echo "Thou fucked up thine timing and the $enemy 's attack went trough..."

					hp="$(( $hp - $enemyatk ))"


				fi
				;;


		esac




#dead or not




		if [[ $hp < 1 ]]; then
       			sleep 1
	 		echo "You have died"
			sleep 1
			exit
		else
			sleep 1
			echo "Thine current hp is $hp"
		fi
#niet verwijderen done moet er 2 keer staan (als het terug moet dan iig)

	done


#after encounter (getting loot)

	sleep 1

	echo "Thou has survived the encounter"

	sleep 1

	xp=$(( xp + $exp ))

	echo "Thou has gained $exp xp, thine total xp is $xp"

	if [[ xp == "5" ]]; then

		sleep 1

		echo "Keep up, thou art already halfway there"
	fi

	sleep 3

	echo "After slaying the monster thou continue on thine way"


done

sleep 1

echo "Thou has reached xp-level 10"

sleep 1

echo "Therefore, thou are now in the hackberry forest"





#monster encounter in the forest

sleep 1

encountertype=(( $RANDOM % 2 ))

if [[ $encountertype == 0 ]]; then
        echo "You hear something..."
else
        echo "You see something in front of you..."
fi


enemytype=$(( $RANDOM % 2 ))

if [[ $enemytype == "0" ]]; then
        enemy="Giant spider"
        enemyhp="5"
        enemyatk="3"

elif [[ $enemytype == "1" ]]; then
        enemy="Snek"
        enemyhp="5"
        enemyatk="3"

fi

sleep 1

echo "As Thine eyes lay opon thine opponent, thou finds it is a $enemy"

sleep 1

echo "Quickly thou get thine weapons out, and get ready to fight..."




#einde ding wat hetookis

sleep 1

echo "Thou has slain all the monsters, congratulations"

sleep 1

echo "More monsters may be added in the future"

sleep 1

exit
