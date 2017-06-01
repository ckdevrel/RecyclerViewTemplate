<#if features == 'googleplay'>

      <#include "item_recycler_google_play.xml.ftl"/>

<#else>

<#if layoutmanager == 'grid'>
      <#include "item_recycler_simple_grid.xml.ftl"/>

<#else>
      <#include "item_recycler_simple_list.xml.ftl"/>
</#if>

</#if>
