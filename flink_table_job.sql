
        CREATE TABLE test3_source (`user_id` INT,`item_id` INT,`behavior` STRING) WITH (
		'connector' = 'kafka',
		'topic' = 'test3',
		'properties.bootstrap.servers' = 'pkc-epwny.eastus.azure.confluent.cloud:9092',
		'properties.group.id' = 'flink-group',
		'scan.startup.mode' = 'earliest-offset', 
		'properties.security.protocol' = 'SASL_SSL',
		'properties.sasl.mechanism' = 'PLAIN',
		'format' = 'json',
		'properties.sasl.jaas.config' = 'org.apache.kafka.common.security.scram.ScramLoginModule required username="LUVKLIY66P3IWKIC" password="prqjzQcYXwTMhkynqkl/A6s7uwedClGztBdZs/Xud3xPJv28vMz1rhpSgj01rwqJ";' 
		 );
		
        CREATE TABLE test4_sink (`user_id` INT,`item_id` INT,`behavior` STRING, `headers` MAP<STRING, BYTES> METADATA) WITH (
		'connector' = 'kafka',
		'topic' = 'test4',
		'properties.bootstrap.servers' = 'pkc-epwny.eastus.azure.confluent.cloud:9092',
		'properties.security.protocol' = 'SASL_SSL',
		'properties.sasl.mechanism' = 'PLAIN',
		'format' = 'json',
		'properties.sasl.jaas.config' = 'org.apache.kafka.common.security.scram.ScramLoginModule required username="LUVKLIY66P3IWKIC" password="prqjzQcYXwTMhkynqkl/A6s7uwedClGztBdZs/Xud3xPJv28vMz1rhpSgj01rwqJ";' 
		);
		
        INSERT INTO test4_sink SELECT user_id, item_id, behavior, MAP['ce_type', CAST('bhg.distribution.placements.spv.terminations' AS BYTES)] AS headers FROM test3_source;
