package ${packageName};

import android.content.Context;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import java.util.ArrayList;
import android.support.v7.widget.LinearLayoutManager;
<#if applicationPackage??>
import ${applicationPackage}.R;
</#if>

<#if features == 'radio'>
import android.widget.RadioButton;
</#if>
<#if features == 'checkbox'>
import android.widget.CheckBox;
import java.util.HashSet;
import java.util.Set;
import android.widget.CompoundButton;
</#if>



  <#if features == 'googleplay'>

  <#include "include_recycleview_google_play.java.ftl"/>



<#else>

  <#include "include_recycleview_simple.java.ftl"/>

</#if>
