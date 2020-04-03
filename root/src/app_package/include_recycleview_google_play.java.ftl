
/**
 * A custom adapter to use with the RecyclerView widget.
 */
public class ${adapterClass} extends RecyclerView.Adapter<${adapterClass}.${itemClass}> {

    private Context mContext;
    private ArrayList<${adapterModelClass}> modelList;

    private OnItemClickListener mItemClickListener;
    private OnMoreClickListener mMoreClickListener;

    public ${adapterClass}(Context context, ArrayList<${adapterModelClass}> modelList) {
            this.mContext = context;
            this.modelList = modelList;
    }

    public void updateList(ArrayList<${adapterModelClass}> modelList) {
            this.modelList = modelList;
            notifyDataSetChanged();

    }

    @Override
    public ${itemClass} onCreateViewHolder(ViewGroup viewGroup, int viewType) {

        View view = LayoutInflater.from(viewGroup.getContext()).inflate(R.layout.${itemLayoutGooglePlay}, viewGroup, false);

        return new ${itemClass}(view);
    }

    @Override
     public void onBindViewHolder(ViewHolder holder, final int position) {

         //Here you can fill your row view

     final ${adapterModelClass} model = getItem(position);


     ArrayList<${adapterModelClass}> singleSectionItems = model.getSingleItemArrayList();

     holder.itemTxtTitle.setText(model.getTitle());

     ${adapterGooglePlayClass} itemListDataAdapter = new ${adapterGooglePlayClass}(mContext, singleSectionItems);

     holder.recyclerViewHorizontalList.setHasFixedSize(true);
     holder.recyclerViewHorizontalList.setLayoutManager(new LinearLayoutManager(mContext, LinearLayoutManager.HORIZONTAL, false));
     holder.recyclerViewHorizontalList.setAdapter(itemListDataAdapter);


      holder.recyclerViewHorizontalList.setNestedScrollingEnabled(false);


      itemListDataAdapter.SetOnItemClickListener(new SingleItemListAdapter.OnItemClickListener() {
                 @Override
                 public void onItemClick(View view, int itemPosition, ${adapterModelClass} model) {

                     mItemClickListener.onItemClick(view,position,itemPosition,model );

                 }
             });

     holder.itemTxtMore.setOnClickListener(new View.OnClickListener() {
         @Override
         public void onClick(View view) {

              mMoreClickListener.onMoreClick(view,position,model);


         }
     });






     }

    @Override
    public int getItemCount() {

        return modelList.size();
    }


    private ${adapterModelClass} getItem (int position) {
       return modelList.get (position);
   }


    public class ${itemClass} extends RecyclerView.ViewHolder {

        private TextView itemTxtTitle;
        protected RecyclerView recyclerViewHorizontalList;
        protected TextView itemTxtMore;


        public ${itemClass}(final View itemView) {
            super(itemView);


          this.itemTxtTitle = (TextView) itemView.findViewById(R.id.item_txt_title);
          this.recyclerViewHorizontalList = (RecyclerView) itemView.findViewById(R.id.recycler_view_horizontal_list);
          this.itemTxtMore= (TextView) itemView.findViewById(R.id.item_txt_more);


        }
    }

        public void SetOnItemClickListener(final OnItemClickListener mItemClickListener) {
            this.mItemClickListener = mItemClickListener;
        }

        public interface OnItemClickListener {
            void onItemClick(View view, int absolutePosition, int relativePosition,  ${adapterModelClass} model);
        }


    public void SetOnMoreClickListener(final OnMoreClickListener onMoreClickListener) {
       this.mMoreClickListener = onMoreClickListener;
   }


   public interface OnMoreClickListener {
       void onMoreClick(View view, int position,${adapterModelClass} model);
   }



}
