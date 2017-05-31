<?xml version="1.0"?>
<recipe>

    <!-- <#if appCompat?has_content>
      <dependency mavenUrl="com.android.support:appcompat-v7:${buildApi}.+"/>
    </#if> -->

    <#if !(hasDependency('com.android.support:appcompat-v7'))>
        <dependency mavenUrl="com.android.support:appcompat-v7:${buildApi}.+"/>
    </#if>
    <#if !(hasDependency('com.android.support:recyclerview-v7'))>

        <dependency mavenUrl="com.android.support:recyclerview-v7:${buildApi}.+"/>
    </#if>

    <#if !(hasDependency('com.android.support:cardview-v7'))>

        <dependency mavenUrl="com.android.support:cardview-v7:${buildApi}.+"/>
    </#if>

    <!-- <dependency mavenUrl="com.jakewharton:butterknife:8.5.1"/> -->

    <!-- <dependency mavenUrl="com.jakewharton:butterknife-compiler:8.5.1"/> -->


    <merge from="AndroidManifest.xml.ftl"
             to="${escapeXmlAttribute(manifestOut)}/AndroidManifest.xml" />

    <merge from="res/values/strings.xml.ftl"
             to="${escapeXmlAttribute(resOut)}/values/strings.xml" />

    <!-- Decide what kind of layout(s) to add -->
    <instantiate from="res/layout/activity_recycler_view.xml.ftl"
              to="${escapeXmlAttribute(resOut)}/layout/${layoutActivityName}.xml" />


    <#if features != 'googleplay'>

    <instantiate from="res/layout/item_recycler_list.xml.ftl"
                      to="${escapeXmlAttribute(resOut)}/layout/${itemLayoutName}.xml" />

    </#if>

    <#if features == 'header'>

    <instantiate from="res/layout/item_recycler_header.xml.ftl"
                      to="${escapeXmlAttribute(resOut)}/layout/${itemLayoutHeaderName}.xml" />

    </#if>

    <#if features == 'footer'>

    <instantiate from="res/layout/item_recycler_list.xml.ftl"
                      to="${escapeXmlAttribute(resOut)}/layout/${itemLayoutFooterName}.xml" />

    </#if>

    <!-- Decide which activity code to add -->
    <instantiate from="src/app_package/RecyclerActivity.java.ftl"
                       to="${escapeXmlAttribute(srcOut)}/activities/${activityClass}.java" />

    <instantiate from="src/app_package/RecyclerAdapter.java.ftl"
                       to="${escapeXmlAttribute(srcOut)}/adapters/${adapterClass}.java" />

  <#if features == 'googleplay'>

   <instantiate from="src/app_package/SingleItemListAdapter.java.ftl"
                      to="${escapeXmlAttribute(srcOut)}/adapters/${adapterGooglePlayClass}.java" />


  <instantiate from="res/layout/item_recycler_item_google_play.xml.ftl"
                    to="${escapeXmlAttribute(resOut)}/layout/${itemLayoutItemGooglePlay}.xml" />

  <instantiate from="res/layout/item_recycler_google_play.xml.ftl"
                    to="${escapeXmlAttribute(resOut)}/layout/${itemLayoutGooglePlay}.xml" />

  </#if>


    <instantiate from="src/app_package/AbstractModel.java.ftl"
                       to="${escapeXmlAttribute(srcOut)}/models/${adapterModelClass}.java" />



    <open file="${escapeXmlAttribute(srcOut)}/${adapterClass}.java" />

    <open file="${escapeXmlAttribute(srcOut)}/${adapterGooglePlayClass}.java" />

    <open file="${escapeXmlAttribute(srcOut)}/${activityClass}.java" />

    <open file="${escapeXmlAttribute(srcOut)}/${adapterModelClass}.java" />

</recipe>
