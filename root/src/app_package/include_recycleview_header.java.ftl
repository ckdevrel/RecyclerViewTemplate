
/**
 * A custom adapter to use with the RecyclerView widget.
 */
public class ${adapterClass} extends RecyclerView.Adapter<RecyclerView.${itemClass}> {

    private static final int TYPE_HEADER = 0;
    private static final int TYPE_ITEM = 1;

    private Context mContext;
    private ArrayList<${adapterModelClass}> modelList;
    private String mHeaderTitle;

    <#if isItemClick>
    private OnItemClickListener mItemClickListener;
    private OnHeaderClickListener mHeaderClickListener;
    </#if>

    public ${adapterClass}(Context context, ArrayList<${adapterModelClass}> modelList, String headerTitle) {
            this.mContext = context;
            this.modelList = modelList;
            this.mHeaderTitle = headerTitle;
    }

    public void updateList(ArrayList<${adapterModelClass}> modelList) {
            this.modelList = modelList;
            notifyDataSetChanged();

    }


    @Override
    public RecyclerView.ViewHolder onCreateViewHolder (ViewGroup parent, int viewType) {
        if(viewType == TYPE_HEADER) {
            View v = LayoutInflater.from (parent.getContext ()).inflate (R.layout.${itemLayoutHeaderName}, parent, false);
            return new HeaderViewHolder (v);
        } else if(viewType == TYPE_ITEM) {
            View v = LayoutInflater.from (parent.getContext ()).inflate (R.layout.${itemLayoutName}, parent, false);
            return new ${itemClass} (v);
        }
        return null;
    }

    @Override
    public void onBindViewHolder (RecyclerView.ViewHolder holder, final int position) {
        if(holder instanceof HeaderViewHolder) {
            HeaderViewHolder headerHolder = (HeaderViewHolder) holder;

            headerHolder.txtTitleHeader.setText(mHeaderTitle);

        } else if(holder instanceof ${itemClass}) {
            final ${adapterModelClass} model = getItem (position - 1);
            ${itemClass} genericViewHolder = (${itemClass}) holder;
            genericViewHolder.itemTxtTitle.setText (model.getTitle ());
            genericViewHolder.itemTxtMessage.setText (model.getMessage ());



    }
}

            //    need to override this method
                @Override
        public int getItemViewType (int position) {
            if(isPositionHeader (position)) {
                return TYPE_HEADER;
            }
            return TYPE_ITEM;
        }

        private boolean isPositionHeader (int position) {
            return position == 0;
        }


    @Override
    public int getItemCount() {

        return modelList.size() + 1;
    }


    private ${adapterModelClass} getItem (int position) {
       return modelList.get (position);
   }


    public class ${itemClass} extends RecyclerView.ViewHolder {

        private ImageView imgUser;
        private TextView itemTxtTitle;
        private TextView itemTxtMessage;

        // @BindView(R.id.img_user)
        // ImageView imgUser;
        // @BindView(R.id.item_txt_title)
        // TextView itemTxtTitle;
        // @BindView(R.id.item_txt_message)
        // TextView itemTxtMessage;

        public ${itemClass}(final View itemView) {
            super(itemView);

            // ButterKnife.bind(this, itemView);


            this.imgUser = (ImageView) itemView.findViewById(R.id.img_user);
            this.itemTxtTitle = (TextView) itemView.findViewById(R.id.item_txt_title);
            this.itemTxtMessage = (TextView) itemView.findViewById(R.id.item_txt_message);

            <#if isItemClick>

            itemView.setOnClickListener(new View.OnClickListener() {
               @Override
               public void onClick(View view) {

                   mItemClickListener.onItemClick(itemView, getAdapterPosition() - 1, getItem(getAdapterPosition()-1));
               }
           });

           </#if>
        }
    }


        class HeaderViewHolder extends RecyclerView.ViewHolder {
            TextView txtTitleHeader;

            public HeaderViewHolder (final View itemView) {
                super (itemView);
                this.txtTitleHeader = (TextView) itemView.findViewById (R.id.txtHeader);

                <#if isItemClick>

                itemView.setOnClickListener(new View.OnClickListener() {
                   @Override
                   public void onClick(View view) {

                       mHeaderClickListener.onHeaderClick(itemView,mHeaderTitle);
                   }
               });

               </#if>
            }
        }

    <#if isItemClick>

        public interface OnItemClickListener {
                void onItemClick(View view, int position,${adapterModelClass} model);
        }

        public void SetOnItemClickListener(final OnItemClickListener mItemClickListener) {
                this.mItemClickListener = mItemClickListener;
        }

        public interface OnHeaderClickListener {
                void onHeaderClick(View view, String headerTitle);
        }

        public void SetOnHeaderClickListener(final OnHeaderClickListener headerClickListener) {
                this.mHeaderClickListener = headerClickListener;
        }


    </#if>



}
