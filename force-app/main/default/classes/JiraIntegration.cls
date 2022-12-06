/**
 * @description       : 
 * @author            : Mr Md Alimur Rehman Abbas
 * @group             : 
 * @last modified on  : 11-22-2022
 * @last modified by  : Mr Md Alimur Rehman Abbas
**/
public with sharing class JiraIntegration {
    @future(callout=true)
    static void createIssue(){
        // Create a new issue
        String issueType = 'Bug';
        String summary = 'This is a test issue';
        String description = 'This is a test issue description';
        String priority = 'High';
        String projectKey = 'TEST';
        String assignee = 'testuser';
        String reporter = 'testuser';
    }
    
}
