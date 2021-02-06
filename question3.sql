   alter table etudiant add password varchar(50);
    update etudiant set password = ora_hash(matricule) where matricule = valeur;
    alter table enseignants add password varchar(50);
    update enseignants set password = ora_hash(matricule) where matricule = valeur;