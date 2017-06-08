package ${packageName};

<#if includeCallbacks>import android.content.Context;</#if>
<#if includeCallbacks>import android.net.Uri;</#if>

import android.os.Bundle;

<#if features != 'googleplay'>
<#if layoutmanager == 'grid'>
import android.support.v7.widget.GridLayoutManager;
<#else>
import android.support.v7.widget.LinearLayoutManager;
</#if>
</#if>

<#if features == 'googleplay'>
import android.support.v7.widget.LinearLayoutManager;
</#if>
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.support.v4.content.ContextCompat;
import android.support.v7.widget.DividerItemDecoration;
import android.support.v7.widget.RecyclerView;
import android.view.View;
import java.util.ArrayList;

<#if isSwipeRefreshLayout>
import android.support.v4.widget.SwipeRefreshLayout;
</#if>
<#if applicationPackage??>
import ${applicationPackage}.R;
</#if>

import android.widget.Toast;
import android.os.Handler;

<#if isSearch>
import android.view.Menu;
import android.support.v7.widget.SearchView;
import android.support.v4.view.MenuItemCompat;
import android.app.SearchManager;
import android.widget.EditText;
import android.graphics.Color;
import android.text.InputFilter;
import android.text.Spanned;
</#if>

<#if isFAB>
import android.support.design.widget.FloatingActionButton;
</#if>

import android.view.ViewGroup;
import android.view.MenuInflater;

/**
 * A simple {@link Fragment} subclass.
<#if includeCallbacks>
 * Activities that contain this fragment must implement the
 * {@link ${className}.OnFragmentInteractionListener} interface
 * to handle interaction events.
</#if>
<#if includeFactory>
 * Use the {@link ${className}#newInstance} factory method to
 * create an instance of this fragment.
</#if>
 *
 */



public class ${className} extends Fragment {

  <#if includeFactory>
      // TODO: Rename parameter arguments, choose names that match
      // the fragment initialization parameters, e.g. ARG_ITEM_NUMBER
      private static final String ARG_PARAM1 = "param1";
      private static final String ARG_PARAM2 = "param2";

      // TODO: Rename and change types of parameters
      private String mParam1;
      private String mParam2;
  </#if>

  <#if includeCallbacks>
      private OnFragmentInteractionListener mListener;
  </#if>

  private RecyclerView recyclerView;

  // @BindView(R.id.recycler_view)
  // RecyclerView recyclerView;


  <#if isSwipeRefreshLayout>
  // @BindView(R.id.swipe_refresh_recycler_list)
  // SwipeRefreshLayout swipeRefreshRecyclerList;

  private SwipeRefreshLayout swipeRefreshRecyclerList;
  </#if>
  <#if isFAB>
  //@BindView(R.id.fab)
  //FloatingActionButton fab;
  private FloatingActionButton fab;
  </#if>
  private ${adapterClass} mAdapter;
  <#if isPagination>
  private RecyclerViewScrollListener scrollListener;
  </#if>

  private ArrayList<AbstractModel> modelList = new ArrayList<>();



  <#if includeFactory>
      /**
       * Use this factory method to create a new instance of
       * this fragment using the provided parameters.
       *
       * @param param1 Parameter 1.
       * @param param2 Parameter 2.
       * @return A new instance of fragment ${className}.
       */
      // TODO: Rename and change types and number of parameters
      public static ${className} newInstance(String param1, String param2) {
          ${className} fragment = new ${className}();
          Bundle args = new Bundle();
          args.putString(ARG_PARAM1, param1);
          args.putString(ARG_PARAM2, param2);
          fragment.setArguments(args);
          return fragment;
      }

      public static ${className} newInstance() {
          ${className} fragment = new ${className}();
          return fragment;
      }


  </#if>

  public ${className}() {
      // Required empty public constructor
  }

  <#if includeFactory>
      @Override
      public void onCreate(Bundle savedInstanceState) {
          super.onCreate(savedInstanceState);
          <#if isFragment>
          setHasOptionsMenu(true);
          </#if>

          if (getArguments() != null) {
              mParam1 = getArguments().getString(ARG_PARAM1);
              mParam2 = getArguments().getString(ARG_PARAM2);
          }
      }
  </#if>




  @Override
  public View onCreateView(LayoutInflater inflater, ViewGroup container,
                           Bundle savedInstanceState) {

        View view = inflater.inflate(R.layout.${fragmentName}, container, false);

        // ButterKnife.bind(this);
        findViews(view);

        return view;

    }


    @Override
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);

        setAdapter();

        <#if isSwipeRefreshLayout>
        swipeRefreshRecyclerList.setOnRefreshListener(new SwipeRefreshLayout.OnRefreshListener() {
           @Override
           public void onRefresh() {

              // Do your stuff on refresh
              new Handler().postDelayed(new Runnable() {
               @Override
               public void run() {

                   if(swipeRefreshRecyclerList.isRefreshing())
                       swipeRefreshRecyclerList.setRefreshing(false);
                 }
             },5000);

           }
       });
       </#if>


    }



  private void findViews(View view){

       recyclerView = (RecyclerView) view.findViewById(R.id.recycler_view);
       <#if isSwipeRefreshLayout>
       swipeRefreshRecyclerList = (SwipeRefreshLayout) view.findViewById(R.id.swipe_refresh_recycler_list);
        </#if>
        <#if isFAB>
       fab = (FloatingActionButton) view.findViewById(R.id.fab);;
        </#if>
    }



   <#if includeCallbacks>
       // TODO: Rename method, update argument and hook method into UI event
       public void onButtonPressed(Uri uri) {
           if (mListener != null) {
               mListener.onFragmentInteraction(uri);
           }
       }

       @Override
       public void onAttach(Context context) {
           super.onAttach(context);
           if (context instanceof OnFragmentInteractionListener) {
               mListener = (OnFragmentInteractionListener) context;
           } else {
               throw new RuntimeException(context.toString()
                       + " must implement OnFragmentInteractionListener");
           }
       }

       @Override
       public void onDetach() {
           super.onDetach();
           mListener = null;
       }

       /**
        * This interface must be implemented by activities that contain this
        * fragment to allow an interaction in this fragment to be communicated
        * to the activity and potentially other fragments contained in that
        * activity.
        * <p>
        * See the Android Training lesson <a href=
        * "http://developer.android.com/training/basics/fragments/communicating.html"
        * >Communicating with Other Fragments</a> for more information.
        */
       public interface OnFragmentInteractionListener {
           // TODO: Update argument type and name
           void onFragmentInteraction(Uri uri);
       }
   </#if>

     <#if isSearch>

     <#if isFragment>
     @Override
     public void onCreateOptionsMenu(Menu menu, MenuInflater inflater) {
        super.onCreateOptionsMenu(menu, inflater);
        inflater.inflate(R.menu.menu_search, menu);
     <#else>
     @Override
     public boolean onCreateOptionsMenu(Menu menu) {
         super.onCreateOptionsMenu(menu);
         getMenuInflater().inflate(R.menu.menu_search, menu);
    </#if>

         // Retrieve the SearchView and plug it into SearchManager
         final SearchView searchView = (SearchView) MenuItemCompat
                 .getActionView (menu.findItem (R.id.action_search));

        <#if isFragment>
        SearchManager searchManager = (SearchManager) getActivity().getSystemService (getActivity().SEARCH_SERVICE);
        searchView.setSearchableInfo (searchManager.getSearchableInfo (getActivity().getComponentName ()));
        <#else>

         SearchManager searchManager = (SearchManager) this.getSystemService (this.SEARCH_SERVICE);
         searchView.setSearchableInfo (searchManager.getSearchableInfo (this.getComponentName ()));

         </#if>
         //changing edittext color
         EditText searchEdit = ((EditText)searchView.findViewById(android.support.v7.appcompat.R.id.search_src_text));
         searchEdit.setTextColor(Color.WHITE);
     searchEdit.setHintTextColor (Color.WHITE);
       searchEdit.setBackgroundColor (Color.TRANSPARENT);
         searchEdit.setHint ("Search");

         InputFilter[] fArray = new InputFilter[2];
         fArray[0] = new InputFilter.LengthFilter(40);
         fArray[1] = new InputFilter () {
             @Override
             public CharSequence filter (CharSequence source, int start, int end, Spanned dest, int dstart, int dend) {

                 for (int i = start; i<end ; i++){

                     if(!Character.isLetterOrDigit (source.charAt (i)))
                         return "";
                 }


                 return null;


             }
         };
         searchEdit.setFilters(fArray);
         View v = searchView.findViewById(android.support.v7.appcompat.R.id.search_plate);
         v.setBackgroundColor(Color.TRANSPARENT);

         searchView.setOnQueryTextListener (new SearchView.OnQueryTextListener () {
             @Override
             public boolean onQueryTextSubmit (String s) {
                 return false;
             }

             @Override
             public boolean onQueryTextChange (String s) {
                 ArrayList<AbstractModel> filterList = new ArrayList<AbstractModel> ();
                 if(s.length()>0){
                     for(int i = 0; i < modelList.size();i++){
                         if(modelList.get(i).getTitle ().toLowerCase().contains(s.toString().toLowerCase())){
                             filterList.add(modelList.get(i));
                             mAdapter.updateList(filterList);
                         }
                     }

                 }else{
                     mAdapter.updateList(modelList);
                 }
                 return false;
             }
         });

         <#if !isFragment>
         return true;
         </#if>
     }
     </#if>



    private void setAdapter(){

      <#if features == 'googleplay'>

             ArrayList<${adapterModelClass}> singleItemList = new ArrayList<>();

             singleItemList.add(new AbstractModel("Android", "Hello " + " Android"));
             singleItemList.add(new AbstractModel("Beta", "Hello " + " Beta"));
             singleItemList.add(new AbstractModel("Cupcake", "Hello " + " Cupcake"));
             singleItemList.add(new AbstractModel("Donut", "Hello " + " Donut"));
             singleItemList.add(new AbstractModel("Eclair", "Hello " + " Eclair"));
             singleItemList.add(new AbstractModel("Froyo", "Hello " + " Froyo"));
             singleItemList.add(new AbstractModel("Gingerbread", "Hello " + " Gingerbread"));
             singleItemList.add(new AbstractModel("Honeycomb", "Hello " + " Honeycomb"));
             singleItemList.add(new AbstractModel("Ice Cream Sandwich", "Hello " + " Ice Cream Sandwich"));
             singleItemList.add(new AbstractModel("Jelly Bean", "Hello " + " Jelly Bean"));
             singleItemList.add(new AbstractModel("KitKat", "Hello " + " KitKat"));
             singleItemList.add(new AbstractModel("Lollipop", "Hello " + " Lollipop"));
             singleItemList.add(new AbstractModel("Marshmallow", "Hello " + " Marshmallow"));
             singleItemList.add(new AbstractModel("Nougat", "Hello " + " Nougat"));
             singleItemList.add(new AbstractModel("Android O", "Hello " + " Android O"));


             modelList.add(new AbstractModel("Android", "Hello " + " Android",singleItemList));
             modelList.add(new AbstractModel("Beta", "Hello " + " Beta",singleItemList));
             modelList.add(new AbstractModel("Cupcake", "Hello " + " Cupcake",singleItemList));
             modelList.add(new AbstractModel("Donut", "Hello " + " Donut",singleItemList));
             modelList.add(new AbstractModel("Eclair", "Hello " + " Eclair",singleItemList));
             modelList.add(new AbstractModel("Froyo", "Hello " + " Froyo",singleItemList));
             modelList.add(new AbstractModel("Gingerbread", "Hello " + " Gingerbread",singleItemList));
             modelList.add(new AbstractModel("Honeycomb", "Hello " + " Honeycomb",singleItemList));
             modelList.add(new AbstractModel("Ice Cream Sandwich", "Hello " + " Ice Cream Sandwich",singleItemList));
             modelList.add(new AbstractModel("Jelly Bean", "Hello " + " Jelly Bean",singleItemList));
             modelList.add(new AbstractModel("KitKat", "Hello " + " KitKat",singleItemList));
             modelList.add(new AbstractModel("Lollipop", "Hello " + " Lollipop",singleItemList));
             modelList.add(new AbstractModel("Marshmallow", "Hello " + " Marshmallow",singleItemList));
             modelList.add(new AbstractModel("Nougat", "Hello " + " Nougat",singleItemList));
             modelList.add(new AbstractModel("Android O", "Hello " + " Android O",singleItemList));

        <#else>


         modelList.add(new ${adapterModelClass}("Android", "Hello "+" Android"));
         modelList.add(new ${adapterModelClass}("Beta","Hello "+" Beta"));
         modelList.add(new ${adapterModelClass}("Cupcake","Hello "+" Cupcake"));
         modelList.add(new ${adapterModelClass}("Donut","Hello "+" Donut"));
         modelList.add(new ${adapterModelClass}("Eclair","Hello "+" Eclair"));
         modelList.add(new ${adapterModelClass}("Froyo","Hello "+" Froyo"));
         modelList.add(new ${adapterModelClass}("Gingerbread","Hello "+" Gingerbread"));
         modelList.add(new ${adapterModelClass}("Honeycomb","Hello "+" Honeycomb"));
         modelList.add(new ${adapterModelClass}("Ice Cream Sandwich","Hello "+" Ice Cream Sandwich"));
         modelList.add(new ${adapterModelClass}("Jelly Bean","Hello "+" Jelly Bean"));
         modelList.add(new ${adapterModelClass}("KitKat","Hello "+" KitKat"));
         modelList.add(new ${adapterModelClass}("Lollipop","Hello "+" Lollipop"));
         modelList.add(new ${adapterModelClass}("Marshmallow","Hello "+" Marshmallow"));
         modelList.add(new ${adapterModelClass}("Nougat","Hello "+" Nougat"));
         modelList.add(new ${adapterModelClass}("Android O","Hello "+" Android O"));

         </#if>

         <#if isHeader && isFooter>
         mAdapter = new ${adapterClass}(getActivity(), modelList,"Header","Footer");


         <#elseif isHeader>
         mAdapter = new ${adapterClass}(getActivity(), modelList,"Header");

         <#elseif isFooter>
         mAdapter = new ${adapterClass}(getActivity(), modelList,"Footer");


         <#else>
         mAdapter = new ${adapterClass}(getActivity(), modelList);
        </#if>

          recyclerView.setHasFixedSize(true);

          <#if features == 'googleplay'>
          LinearLayoutManager layoutManager = new LinearLayoutManager(getActivity());
          recyclerView.setLayoutManager(layoutManager);
          <#else>
          <#if layoutmanager == 'grid'>

          final GridLayoutManager layoutManager = new GridLayoutManager(getActivity(), 2);
          <#if features == 'banner'>
          recyclerView.addItemDecoration(new GridMarginDecoration(getActivity(), 2, 2, 2, 2));
          </#if>
          recyclerView.setLayoutManager(layoutManager);

          <#else>
          // use a linear layout manager
          LinearLayoutManager layoutManager = new LinearLayoutManager(getActivity());
          recyclerView.setLayoutManager(layoutManager);
          </#if>
          <#if isDivider>
          DividerItemDecoration dividerItemDecoration = new DividerItemDecoration(recyclerView.getContext(), layoutManager.getOrientation());
          dividerItemDecoration.setDrawable(ContextCompat.getDrawable(getActivity(), R.drawable.divider_recyclerview));
          recyclerView.addItemDecoration(dividerItemDecoration);
          </#if>
          </#if>

          recyclerView.setAdapter(mAdapter);

          <#if isPagination>

          scrollListener = new RecyclerViewScrollListener() {

              public void onEndOfScrollReached(RecyclerView rv) {

                Toast.makeText(getActivity(),"End of the RecyclerView reached. Do your pagination stuff here", Toast.LENGTH_SHORT).show();

                scrollListener.disableScrollListener();
              }
          };
          recyclerView.addOnScrollListener(scrollListener);
          /*
             Note: The below two methods should be used wisely to handle the pagination enable and disable states based on the use case.
                     1. scrollListener.disableScrollListener(); - Should be called to disable the scroll state.
                     2. scrollListener.enableScrollListener(); - Should be called to enable the scroll state.
          */

          </#if>

          <#if isItemClick>
          <#if features != 'googleplay'>
          mAdapter.SetOnItemClickListener(new ${adapterClass}.OnItemClickListener() {
                    @Override
                    public void onItemClick(View view, int position,${adapterModelClass} model) {

                      //handle item click events here
                      Toast.makeText(getActivity(),"Hey "+model.getTitle(), Toast.LENGTH_SHORT).show();


                    }
                });


            <#if features == 'checkbox' || features == 'toggle'>

            mAdapter.SetOnCheckedListener(new ${adapterClass}.OnCheckedListener() {
              @Override
              public void onChecked(View view, boolean isChecked, int position, ${adapterModelClass} model) {

                  Toast.makeText(getActivity(), (isChecked ? "Checked " : "Unchecked ") + model.getTitle(), Toast.LENGTH_SHORT).show();


              }
          });

            </#if>

          </#if>
          </#if>

          <#if isHeader && isFooter>

          mAdapter.SetOnHeaderClickListener(new ${adapterClass}.OnHeaderClickListener() {
                    @Override
                    public void onHeaderClick(View view,String headerTitle) {

                      //handle item click events here
                      Toast.makeText(getActivity(),"Hey I am a header", Toast.LENGTH_SHORT).show();

                    }
                });

          mAdapter.SetOnFooterClickListener(new ${adapterClass}.OnFooterClickListener() {
                    @Override
                    public void onFooterClick(View view,String footerTitle) {

                      //handle item click events here
                      Toast.makeText(getActivity(),"Hey I am a footer", Toast.LENGTH_SHORT).show();

                    }
                });

          <#elseif isHeader>

          mAdapter.SetOnHeaderClickListener(new ${adapterClass}.OnHeaderClickListener() {
                    @Override
                    public void onHeaderClick(View view,String headerTitle) {

                      //handle item click events here
                      Toast.makeText(getActivity(),"Hey I am a header", Toast.LENGTH_SHORT).show();

                    }
                });


          <#elseif isFooter>

          mAdapter.SetOnFooterClickListener(new ${adapterClass}.OnFooterClickListener() {
                    @Override
                    public void onFooterClick(View view,String footerTitle) {

                      //handle item click events here
                      Toast.makeText(getActivity(),"Hey I am a footer", Toast.LENGTH_SHORT).show();

                    }
                });

          </#if>


          <#if features == 'googleplay'>
          mAdapter.SetOnMoreClickListener(new ${adapterClass}.OnMoreClickListener() {
                    @Override
                    public void onMoreClick(View view, int position,${adapterModelClass} model) {
                        Toast.makeText(getActivity(), "See more " + position, Toast.LENGTH_SHORT).show();

                  }
              });

          mAdapter.SetOnItemClickListener(new ${adapterClass}.OnItemClickListener() {
                    @Override
                    public void onItemClick(View view, int absolutePosition, int relativePosition,${adapterModelClass} model) {

                      //handle item click events here
                      Toast.makeText(getActivity(),"Absolute Pos: "+absolutePosition
                                    + " Relative Pos: "+relativePosition, Toast.LENGTH_SHORT).show();

                    }
                });

          </#if>

    }

}
