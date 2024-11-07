# Wristwatch

Nous allons concevoir une montre-bracelet multifonction qui possède des fonctions d'horloge, d'alarme et de chronomètre. 
La montre-bracelet est équipée de trois boutons (B1, B2 et B3) qui sont utilisés pour changer de mode, régler l'heure, régler l'alarme, démarrer et arrêter le chronomètre, etc.
En appuyant sur le bouton B1, on change de mode : on passe de l'heure à l'alarme, puis au chronomètre et enfin de retour à l'heure.
Les fonctions des boutons B2 et B3 varient en fonction du mode et sont expliquées dans les paragraphes suivants:

![image](https://github.com/user-attachments/assets/7621b692-e809-4ae5-b60e-d25614a36b04)

**Fonctionnement en mode heure :** L'affichage indique l'heure et si c'est A.M. ou P.M. au format hh:mm
(A ou P). En mode heure, l'alarme peut être désactivée manuellement en appuyant sur B3. En appuyant sur B2, on change d'état pour passer à Réglage des heures ou Réglage des minutes, puis de retour au mode heure. Lorsque l'on est dans l'état Réglage des heures ou Réglage des minutes, chaque pression sur B3 avance les heures ou les minutes d'une unité.

**Fonctionnement en mode alarme :** L'affichage indique l'heure de l'alarme et si c'est A.M. ou P.M. au format hh
(A ou P). En appuyant sur B2, on change d'état pour passer à Réglage des heures de l'alarme ou Réglage des minutes de l'alarme, puis de retour à l'alarme. Lorsque l'on est dans l'état Réglage des heures de l'alarme ou Réglage des minutes de l'alarme, chaque pression sur B3 avance les heures ou les minutes de l'alarme d'une unité. En mode Alarme, appuyer sur B3 active ou désactive l'alarme. Une fois l'alarme déclenchée, elle sonnera pendant 50 secondes avant de s'éteindre automatiquement. Elle peut également être désactivée manuellement en appuyant sur B3 en mode heure.

**Fonctionnement en mode chronomètre :** L'affichage indique le temps du chronomètre au format mm
.cc (où cc représente les centièmes de seconde). En appuyant sur B2, on démarre le compteur de temps ; en appuyant à nouveau sur B2, on l'arrête, puis en appuyant à nouveau sur B2, on le redémarre, et ainsi de suite. En appuyant sur B3, on réinitialise le temps. Une fois le chronomètre démarré, il continuera à fonctionner même lorsque la montre-bracelet est en mode heure ou alarme.

Le module de la montre-bracelet contient le contrôle principal de la montre ; le module d'horloge, qui implémente les fonctions d'horloge et d'alarme ; et le module de chronomètre, qui implémente les fonctions du chronomètre. L'horloge de 100 Hz (CLK) synchronise le fonctionnement de l'unité de contrôle et des registres de temps. La figure 11-2 montre le graphique d'états pour le contrôleur. 

**Cette machine à états génère les signaux de contrôle suivants en réponse à la pression des boutons :**

![image](https://github.com/user-attachments/assets/4e4ab3e4-270f-4207-9c08-4e8de46ea91c)

## RESULTATS DE LA SIMMULATION

![image](https://github.com/user-attachments/assets/16922f94-ded2-42bd-a4f4-fc74d30ebb2b)

![image](https://github.com/user-attachments/assets/8fab9ede-e285-48f0-a575-419a2cc773f3)
