<#if isSwipeRefreshLayout>

      <#if isFAB>
      <#include "include_swiperefresh_recycler_fab_list.xml.ftl"/>
      <#else>
      <#include "include_swiperefresh_recycler_list.xml.ftl"/>
      </#if>

<#else>

      <#if isFAB>
      <#include "include_recycler_fab_list.xml.ftl"/>
      <#else>
      <#include "include_recycler_list.xml.ftl"/>
      </#if>

</#if>
