select
ss.server_id serverId,
server_name as serverName,
task_name as taskName,
final_status as taskStatus,
timestampdiff(second,start_time,now()) as latency
from
(
   select
   server_name,task_name,max(task_run_id) run_id
   from vdp_monitor.clvrep_status
   group by server_name,task_name
)
tr
join cloveretl.run_record rr on rr.id = tr.run_id
join vdp_monitor.src_server ss on tr.server_name = ss.server_nm
where ss.enabled_ind = true
union
select
tr.server_id serverId,
server_nm as serverName,
name as taskName,
state as taskStatus,
ifnull(overall_latency,999999) as latency
from vdp_monitor.attrep_task_status tr
join vdp_monitor.src_server ss on tr.server_id = ss.server_id
where ss.enabled_ind=true