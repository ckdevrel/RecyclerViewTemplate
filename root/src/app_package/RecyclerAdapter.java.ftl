package ${packageName}.adapters;

import android.content.Context;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import java.util.ArrayList;
import android.support.v7.widget.LinearLayoutManager;
import ${packageName}.R;
import ${packageName}.models.${adapterModelClass};


<#if features == 'header'>

  <#include "include_recycleview_header.java.ftl"/>

  <#elseif features == 'googleplay'>

  <#include "include_recycleview_google_play.java.ftl"/>


<#elseif features == 'footer'>

<#include "include_recycleview_footer.java.ftl"/>


<#elseif features == 'headerandfooter'>


<#else>

  <#include "include_recycleview_simple.java.ftl"/>

</#if>
