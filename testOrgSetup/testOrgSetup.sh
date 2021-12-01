#!/bin/bash

# deploy slack org permission set
sfdx force:source:deploy -p force-app/main/default/permissionsets/slack_user.permissionset-meta.xml -u notifTestOrg --apiversion=54.0

# deploy db-based slack app
sfdx force:source:deploy -p force-app/main/default/slackapps/A02KDL0LDBN.slackapp-meta.xml -u notifTestOrg --apiversion=54.0

# deploy custom notification "testCustomNotif"
sfdx force:source:deploy -p force-app/main/default/notificationtypes/testCustomNotif.notiftype-meta.xml -u notifTestOrg --apiversion=54.0

# deploy flow for custom notification "testCustomNotif"
sfdx force:source:deploy -p force-app/main/default/flows/Account_Notification.flow-meta.xml -u notifTestOrg --apiversion=54.0

# import data for CollaborationRoom "notifications-test"
sfdx force:data:tree:import --sobjecttreefiles data/CollaborationRoom.json -u notifTestOrg --apiversion=54.0

# import data for NotificationUserOptOut
sfdx force:data:tree:import --sobjecttreefiles data/NotificationUserOptOut.json -u notifTestOrg --apiversion=54.0