TYPE=VIEW
query=select `mt`.`THREAD_ID` AS `thread_id`,if((`t`.`NAME` = \'thread/sql/one_connection\'),concat(`t`.`PROCESSLIST_USER`,\'@\',`t`.`PROCESSLIST_HOST`),replace(`t`.`NAME`,\'thread/\',\'\')) AS `user`,sum(`mt`.`CURRENT_COUNT_USED`) AS `current_count_used`,`sys`.`format_bytes`(sum(`mt`.`CURRENT_NUMBER_OF_BYTES_USED`)) AS `current_allocated`,`sys`.`format_bytes`(ifnull((sum(`mt`.`CURRENT_NUMBER_OF_BYTES_USED`) / nullif(sum(`mt`.`CURRENT_COUNT_USED`),0)),0)) AS `current_avg_alloc`,`sys`.`format_bytes`(max(`mt`.`CURRENT_NUMBER_OF_BYTES_USED`)) AS `current_max_alloc`,`sys`.`format_bytes`(sum(`mt`.`SUM_NUMBER_OF_BYTES_ALLOC`)) AS `total_allocated` from (`performance_schema`.`memory_summary_by_thread_by_event_name` `mt` join `performance_schema`.`threads` `t` on((`mt`.`THREAD_ID` = `t`.`THREAD_ID`))) group by `mt`.`THREAD_ID`,if((`t`.`NAME` = \'thread/sql/one_connection\'),concat(`t`.`PROCESSLIST_USER`,\'@\',`t`.`PROCESSLIST_HOST`),replace(`t`.`NAME`,\'thread/\',\'\')) order by sum(`mt`.`CURRENT_NUMBER_OF_BYTES_USED`) desc
md5=f52d32948adcd2fc220877ecb408580f
updatable=0
algorithm=1
definer_user=mysql.sys
definer_host=localhost
suid=0
with_check_option=0
timestamp=2020-05-27 13:03:34
create-version=1
source=SELECT thread_id, IF(t.name = \'thread/sql/one_connection\',  CONCAT(t.processlist_user, \'@\', t.processlist_host),  REPLACE(t.name, \'thread/\', \'\')) user, SUM(mt.current_count_used) AS current_count_used, sys.format_bytes(SUM(mt.current_number_of_bytes_used)) AS current_allocated, sys.format_bytes(IFNULL(SUM(mt.current_number_of_bytes_used) / NULLIF(SUM(current_count_used), 0), 0)) AS current_avg_alloc, sys.format_bytes(MAX(mt.current_number_of_bytes_used)) AS current_max_alloc, sys.format_bytes(SUM(mt.sum_number_of_bytes_alloc)) AS total_allocated FROM performance_schema.memory_summary_by_thread_by_event_name AS mt JOIN performance_schema.threads AS t USING (thread_id) GROUP BY thread_id, IF(t.name = \'thread/sql/one_connection\',  CONCAT(t.processlist_user, \'@\', t.processlist_host),  REPLACE(t.name, \'thread/\', \'\')) ORDER BY SUM(current_number_of_bytes_used) DESC
client_cs_name=utf8
connection_cl_name=utf8_general_ci
view_body_utf8=select `mt`.`THREAD_ID` AS `thread_id`,if((`t`.`NAME` = \'thread/sql/one_connection\'),concat(`t`.`PROCESSLIST_USER`,\'@\',`t`.`PROCESSLIST_HOST`),replace(`t`.`NAME`,\'thread/\',\'\')) AS `user`,sum(`mt`.`CURRENT_COUNT_USED`) AS `current_count_used`,`sys`.`format_bytes`(sum(`mt`.`CURRENT_NUMBER_OF_BYTES_USED`)) AS `current_allocated`,`sys`.`format_bytes`(ifnull((sum(`mt`.`CURRENT_NUMBER_OF_BYTES_USED`) / nullif(sum(`mt`.`CURRENT_COUNT_USED`),0)),0)) AS `current_avg_alloc`,`sys`.`format_bytes`(max(`mt`.`CURRENT_NUMBER_OF_BYTES_USED`)) AS `current_max_alloc`,`sys`.`format_bytes`(sum(`mt`.`SUM_NUMBER_OF_BYTES_ALLOC`)) AS `total_allocated` from (`performance_schema`.`memory_summary_by_thread_by_event_name` `mt` join `performance_schema`.`threads` `t` on((`mt`.`THREAD_ID` = `t`.`THREAD_ID`))) group by `mt`.`THREAD_ID`,if((`t`.`NAME` = \'thread/sql/one_connection\'),concat(`t`.`PROCESSLIST_USER`,\'@\',`t`.`PROCESSLIST_HOST`),replace(`t`.`NAME`,\'thread/\',\'\')) order by sum(`mt`.`CURRENT_NUMBER_OF_BYTES_USED`) desc
