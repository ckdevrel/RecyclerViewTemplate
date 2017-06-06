<?xml version="1.0"?>
<globals>


    <global id="manifestOut" value="${manifestDir}" />
    <!-- e.g. getSupportActionBar vs. getActionBar -->
    <global id="Support" value="${(minApiLevel lt 14)?string('Support','')}" />
    <global id="srcOut" value="${srcDir}/${slashedPackageName(packageName)}" />
    <global id="resOut" value="${resDir}" />
    <global id="menuName" value="${classToResource(activityClass)}" />

    <!-- <global id="isGooglePlay" type="boolean" value="${(features == 'googleplay')?string}" /> -->

</globals>
