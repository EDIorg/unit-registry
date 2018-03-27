CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `mob`@`128.111.242.165` 
    SQL SECURITY DEFINER
VIEW `vw_stmml_1_2_export` AS
    SELECT 
        (CASE
            WHEN ISNULL(`u`.`quantityId`) THEN NULL
            ELSE `q`.`name`
        END) AS `unitType`,
        `u`.`name` AS `name`,
        `u`.`name` AS `id`,
        (CASE
            WHEN ISNULL(`u`.`deprecatedTo`) THEN NULL
            ELSE `uu`.`name`
        END) AS `deprecatedInFavorOf`,
        `u`.`parentSI` AS `parentSI`,
        `u`.`siConstant` AS `constantToSI`,
        `u`.`siMultiplier` AS `multiplierToSI`,
        `u`.`abbreviation` AS `abbreviation`,
        `u`.`description` AS `description`
    FROM
        (((`unit` `u`
        LEFT JOIN `unit` `uu` ON ((`uu`.`unitId` = `u`.`deprecatedTo`)))
        LEFT JOIN `quantity` `q` ON ((`u`.`quantityId` = `q`.`quantityId`)))
        JOIN `unitScope` `us` ON ((`us`.`unitId` = `u`.`unitId`)))
    WHERE
        (`us`.`scopeId` = 32)
    GROUP BY `u`.`unitId`

