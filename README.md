# timetable

question 3 :



question 4 :

        CREATE VIEW vue AS 
        SELECT DISTINCT C.codeCours, T.jourCoursDate 
        FROM Cours C
              JOIN Typehoraire T
                  ON C.codeCours= T.crsCodeCours
              JOIN Jourcours J
                  ON J.dateJourCours=T.jourCoursDate
              JOIN Coursdeclasse cls
                  ON  T.crsCodeCours=cls.crsCodeCours
              JOIN Classe Cl
                  ON cl.specialiteNomSpec=cls.classSpecialiteNomspec
        WHERE T.jourCoursDate 
                  IN ('lundi','mardi','mercredi','jeudi','vendredi','samedi');

question 5 :

    SET SQLPROMPT '#TIPAM2021_SQL04>' 
    SET MARKUP HTML ON SPOOL ON PREFORMAT OFF 
    ENTMAP ON - HEAD "<TITLE>Emploie de temps</TITLE> -
    <STYLE type='text/css'> - - </STYLE>" -
    BODY "TEXT='#FF00Ff'" - TABLE "WIDTH='90%' BORDER='2'"

    SPOOL emploitemps.HTML 
    SELECT DISTINCT T.jourCoursDate as jours , 
           C.intituleCourt ||'('||C.codeCours||')' as cours ,
           C.credits as credits_cours,
           'trimestre'|| C.periodeAcademiqueIdTrim as periode_trimestrielle,
           ce.specialiteNomSpec || cd.classNiveauidNiveau as specialite, 
           T.tranche ||'heures' as tranche_horaire 
    FROM Cours C 
            JOIN Typehoraire T 
                ON C.codeCours= T.crsCodeCours 
            JOIN Jourcours j 
                ON J.dateJourCours=T.jourCoursDate 
            JOIN Coursdeclasse cd 
                ON T.crsCodeCours=cd.crsCodeCours 
            JOIN Classe ce 
                ON ce.specialiteNomSpec=cd.classSpecialiteNomspec 
            INNER JOIN ClassePeriodeacademique ca
                ON C.periodeAcademiqueIdTrim=ca.PERIODEACADEMIQUEIDTRIM 
    WHERE ce.specialiteNomSpec='TIPAM' 
          AND cd.classNiveauidNiveau=002 
          ORDER BY CASE T.jourCoursDate WHEN 'lundi' THEN T.jourCoursDate END ASC, 
                   CASE T.jourCoursDate WHEN 'mardi' THEN T.jourCoursDate END ASC, 
                   CASE T.jourCoursDate WHEN 'mercredi' THEN T.jourCoursDate END ASC, 
                   CASE T.jourCoursDate WHEN 'jeudi' THEN T.jourCoursDate END ASC, 
                   CASE T.jourCoursDate WHEN 'vendredi' THEN T.jourCoursDate END ASC, 
                   CASE T.jourCoursDate WHEN 'samedi' THEN T.jourCoursDate END ASC;

    SPOOL OFF SET MARKUP HTML OFF SET ECHO ON
