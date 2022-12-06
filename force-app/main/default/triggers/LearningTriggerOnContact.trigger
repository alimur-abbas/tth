trigger LearningTriggerOnContact on Contact (before update) {
List<Contact> conList =[SELECT LastName FROM Contact
                            WHERE id IN :Trigger.new];
System.debug('conList'+conList);

}