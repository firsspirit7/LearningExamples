global class scheduledBatchable implements Schedulable {
   global void execute(SchedulableContext sc) {
      Account actobj = new Account();
      actobj.Name = 'Balaji';
      insert actobj;
   }
}