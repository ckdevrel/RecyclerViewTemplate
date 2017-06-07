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


    <#if isFAB && !(hasDependency('com.android.support:design'))>

        <dependency mavenUrl="com.android.support:design:${buildApi}.+"/>
    </#if>

    <!-- <dependency mavenUrl="com.jakewharton:butterknife:8.5.1"/> -->

    <!-- <dependency mavenUrl="com.jakewharton:butterknife-compiler:8.5.1"/> -->


    <#if !isFragment>
    <merge from="AndroidManifest.xml.ftl"
             to="${escapeXmlAttribute(manifestOut)}/AndroidManifest.xml" />
    </#if>

    <merge from="res/values/strings.xml.ftl"
             to="${escapeXmlAttribute(resOut)}/values/strings.xml" />

    <#if !isFragment>
    <#if isToolbar || isSearch>
    <merge from="res/values/styles.xml.ftl"
            to="${escapeXmlAttribute(resOut)}/values/styles.xml" />
    </#if>
    </#if>

    <!-- Decide what kind of layout(s) to add -->

    <#if isFragment>

    <instantiate from="res/layout/fragment_recycler_view.xml.ftl"
            to="${escapeXmlAttribute(resOut)}/layout/${fragmentName}.xml" />

    <#else>
    <instantiate from="res/layout/activity_recycler_view.xml.ftl"
              to="${escapeXmlAttribute(resOut)}/layout/${layoutActivityName}.xml" />

    </#if>
    <#if features != 'googleplay'>

    <instantiate from="res/layout/item_recycler_list.xml.ftl"
                      to="${escapeXmlAttribute(resOut)}/layout/${itemLayoutName}.xml" />

    </#if>

    <#if isHeader>

    <instantiate from="res/layout/item_recycler_header.xml.ftl"
                      to="${escapeXmlAttribute(resOut)}/layout/${itemLayoutHeaderName}.xml" />

    </#if>

    <#if isFooter>

    <instantiate from="res/layout/item_recycler_footer.xml.ftl"
                      to="${escapeXmlAttribute(resOut)}/layout/${itemLayoutFooterName}.xml" />

    </#if>


    <#if isHeader && isFooter>

      <instantiate from="res/layout/item_recycler_header.xml.ftl"
                        to="${escapeXmlAttribute(resOut)}/layout/${itemLayoutHeaderName}.xml" />


    <instantiate from="res/layout/item_recycler_footer.xml.ftl"
                      to="${escapeXmlAttribute(resOut)}/layout/${itemLayoutFooterName}.xml" />

    </#if>

    <!-- Decide which activity code to add -->

    <#if isFragment>

    <instantiate from="src/app_package/RecyclerFragment.java.ftl"
                           to="${escapeXmlAttribute(srcOut)}/${className}.java" />

    <#else>
    <instantiate from="src/app_package/RecyclerActivity.java.ftl"
                       to="${escapeXmlAttribute(srcOut)}/${activityClass}.java" />

    </#if>

    <instantiate from="src/app_package/RecyclerAdapter.java.ftl"
                       to="${escapeXmlAttribute(srcOut)}/${adapterClass}.java" />

  <#if features == 'googleplay'>

   <instantiate from="src/app_package/SingleItemListAdapter.java.ftl"
                      to="${escapeXmlAttribute(srcOut)}/${adapterGooglePlayClass}.java" />


  <instantiate from="res/layout/item_recycler_item_google_play.xml.ftl"
                    to="${escapeXmlAttribute(resOut)}/layout/${itemLayoutItemGooglePlay}.xml" />

  <instantiate from="res/layout/item_recycler_google_play.xml.ftl"
                    to="${escapeXmlAttribute(resOut)}/layout/${itemLayoutGooglePlay}.xml" />

  </#if>


    <instantiate from="src/app_package/AbstractModel.java.ftl"
                       to="${escapeXmlAttribute(srcOut)}/${adapterModelClass}.java" />

  <#if features == 'banner' && layoutmanager == 'grid'>
  <#if features != 'googleplay'>

   <instantiate from="src/app_package/GridMarginDecoration.java.ftl"
           to="${escapeXmlAttribute(srcOut)}/GridMarginDecoration.java" />
  </#if>
  </#if>

  <!-- <#if features == 'multiselect'>

   <instantiate from="src/app_package/SelectableAdapter.java.ftl"
           to="${escapeXmlAttribute(srcOut)}/SelectableAdapter.java" />
  </#if> -->

  <#if isFAB>
   <instantiate from="src/app_package/FABScrollBehaviour.java.ftl"
           to="${escapeXmlAttribute(srcOut)}/FABScrollBehaviour.java" />
  </#if>

  <#if isPagination>

   <instantiate from="src/app_package/RecyclerViewScrollListener.java.ftl"
           to="${escapeXmlAttribute(srcOut)}/RecyclerViewScrollListener.java" />
  </#if>

    <open file="${escapeXmlAttribute(srcOut)}/${adapterClass}.java" />

    <open file="${escapeXmlAttribute(srcOut)}/${adapterGooglePlayClass}.java" />

    <#if isFragment>

    <open file="${escapeXmlAttribute(srcOut)}/${className}.java" />

    <#else>
    <open file="${escapeXmlAttribute(srcOut)}/${activityClass}.java" />

    </#if>
    <open file="${escapeXmlAttribute(srcOut)}/${adapterModelClass}.java" />


    <#if isDivider>

    <copy from="res/drawable"
            to="${escapeXmlAttribute(resOut)}/drawable" />
    </#if>

    <#if isSearch>

    <copy from="res/menu"
            to="${escapeXmlAttribute(resOut)}/menu" />
    </#if>

</recipe>
