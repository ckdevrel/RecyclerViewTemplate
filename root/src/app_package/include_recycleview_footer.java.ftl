
/**
 * A custom adapter to use with the RecyclerView widget.
 */
public class ${adapterClass} extends RecyclerView.Adapter<RecyclerView.${itemClass}> {

    private static final int TYPE_ITEM = 1;
    private static final int TYPE_FOOTER = 2;


    private Context mContext;
    private ArrayList<${adapterModelClass}> modelList;
    private String mFooterTitle;

    <#if isItemClick>
    private OnItemClickListener mItemClickListener;
    private OnFooterClickListener mFooterClickListener;
    </#if>

    public ${adapterClass}(Context context, ArrayList<${adapterModelClass}> modelList, String footerTitle) {
            this.mContext = context;
            this.modelList = modelList;
            this.mFooterTitle = footerTitle;
    }

    public void updateList(ArrayList<${adapterModelClass}> modelList) {
            this.modelList = modelList;
    }


    @Override
    public RecyclerView.ViewHolder onCreateViewHolder (ViewGroup parent, int viewType) {
        if(viewType == TYPE_FOOTER) {
            View v = LayoutInflater.from (parent.getContext ()).inflate (R.layout.${itemLayoutFooterName}, parent, false);
            return new FooterViewHolder (v);
        } else if(viewType == TYPE_ITEM) {
            View v = LayoutInflater.from (parent.getContext ()).inflate (R.layout.${itemLayoutName}, parent, false);
            return new ${itemClass} (v);
        }
        return null;
    }

    @Override
    public void onBindViewHolder (RecyclerView.ViewHolder holder, final int position) {
        if(holder instanceof FooterViewHolder) {
            FooterViewHolder footerHolder = (FooterViewHolder) holder;

            footerHolder.txtFooter.setText(mFooterTitle);

        } else if(holder instanceof ${itemClass}) {
            final ${adapterModelClass} model = getItem (position);
            ${itemClass} genericViewHolder = (${itemClass}) holder;
            genericViewHolder.itemTxtTitle.setText (model.getTitle ());
            genericViewHolder.itemTxtMessage.setText (model.getMessage ());



    }
}

            //    need to override this method
        @Override
        public int getItemViewType (int position) {
          if(isPositionFooter(position)) {
              return TYPE_FOOTER;
          }
          return TYPE_ITEM;
      }

      private boolean isPositionFooter (int position) {
            return position == modelList.size ();
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

                   mItemClickListener.onItemClick(itemView, getAdapterPosition(), getItem(getAdapterPosition()));
               }
           });

           </#if>
        }
    }


        class FooterViewHolder extends RecyclerView.ViewHolder {
            TextView txtFooter;

            public FooterViewHolder (final View itemView) {
                super (itemView);
                this.txtFooter = (TextView) itemView.findViewById (R.id.txtFooter);

                <#if isItemClick>

                itemView.setOnClickListener(new View.OnClickListener() {
                   @Override
                   public void onClick(View view) {

                       mFooterClickListener.onFooterClick(itemView,mFooterTitle);
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

        public interface OnFooterClickListener {
                void onFooterClick(View view, String headerTitle);
        }

        public void SetOnFooterClickListener(final OnFooterClickListener footerClickListener) {
                this.mFooterClickListener = footerClickListener;
        }


    </#if>



}
