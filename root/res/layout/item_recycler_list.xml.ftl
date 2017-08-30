<#if features == 'googleplay'>

      <#include "item_recycler_google_play.xml.ftl"/>


<#elseif features == 'section'>
      <#include "item_recycler_section_content_list.xml.ftl"/>


<#elseif features == 'banner'>

<#if layoutmanager == 'grid'>
      <#include "item_recycler_banner_grid.xml.ftl"/>

<#else>
      <#include "item_recycler_banner_list.xml.ftl"/>
</#if>


<#else>

<#if layoutmanager == 'grid'>
      <#include "item_recycler_simple_grid.xml.ftl"/>
<#else>
      <#include "item_recycler_simple_list.xml.ftl"/>
</#if>

</#if>
