<?xml version="1.0"?>
<recipe>

    <#if appCompat?has_content>
      <dependency mavenUrl="com.android.support:appcompat-v7:25.3.1"/>
    </#if>

    <dependency mavenUrl="com.android.support:recyclerview-v7:25.3.1"/>

    <dependency mavenUrl="com.jakewharton:butterknife:8.5.1"/>

    <dependency mavenUrl="com.jakewharton:butterknife-compiler:8.5.1"/>


    <merge from="AndroidManifest.xml.ftl"
             to="${escapeXmlAttribute(manifestOut)}/AndroidManifest.xml" />

    <merge from="res/values/strings.xml.ftl"
             to="${escapeXmlAttribute(resOut)}/values/strings.xml" />

    <!-- Decide what kind of layout(s) to add -->
    <instantiate from="res/layout/activity_recycler_view.xml.ftl"
              to="${escapeXmlAttribute(resOut)}/layout/${layoutActivityName}.xml" />


      <instantiate from="res/layout/item_recycler_list.xml.ftl"
                        to="${escapeXmlAttribute(resOut)}/layout/${layoutName}.xml" />


    <!-- Decide which activity code to add -->
    <instantiate from="src/app_package/RecyclerActivity.java.ftl"
                       to="${escapeXmlAttribute(srcOut)}/${activityClass}.java" />

    <instantiate from="src/app_package/RecyclerAdapter.java.ftl"
                       to="${escapeXmlAttribute(srcOut)}/${adapterClass}.java" />

    <open file="${escapeXmlAttribute(srcOut)}/${adapterClass}.java" />

    <open file="${escapeXmlAttribute(srcOut)}/${activityClass}.java" />

</recipe>
