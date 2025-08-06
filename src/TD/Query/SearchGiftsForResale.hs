module TD.Query.SearchGiftsForResale
  (SearchGiftsForResale(..)
  , defaultSearchGiftsForResale
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.GiftForResaleOrder as GiftForResaleOrder
import qualified TD.Data.UpgradedGiftAttributeId as UpgradedGiftAttributeId
import qualified Data.Text as T

-- | Returns upgraded gifts that can be bought from other owners using sendResoldGift. Returns 'TD.Data.GiftsForResale.GiftsForResale'
data SearchGiftsForResale
  = SearchGiftsForResale
    { gift_id    :: Maybe Int                                               -- ^ Identifier of the regular gift that was upgraded to a unique gift
    , order      :: Maybe GiftForResaleOrder.GiftForResaleOrder             -- ^ Order in which the results will be sorted
    , attributes :: Maybe [UpgradedGiftAttributeId.UpgradedGiftAttributeId] -- ^ Attributes used to filter received gifts. If multiple attributes of the same type are specified, then all of them are allowed. If none attributes of specific type are specified, then all values for this attribute type are allowed
    , offset     :: Maybe T.Text                                            -- ^ Offset of the first entry to return as received from the previous request with the same order and attributes; use empty string to get the first chunk of results
    , limit      :: Maybe Int                                               -- ^ The maximum number of gifts to return
    }
  deriving (Eq, Show)

instance I.ShortShow SearchGiftsForResale where
  shortShow
    SearchGiftsForResale
      { gift_id    = gift_id_
      , order      = order_
      , attributes = attributes_
      , offset     = offset_
      , limit      = limit_
      }
        = "SearchGiftsForResale"
          ++ I.cc
          [ "gift_id"    `I.p` gift_id_
          , "order"      `I.p` order_
          , "attributes" `I.p` attributes_
          , "offset"     `I.p` offset_
          , "limit"      `I.p` limit_
          ]

instance AT.ToJSON SearchGiftsForResale where
  toJSON
    SearchGiftsForResale
      { gift_id    = gift_id_
      , order      = order_
      , attributes = attributes_
      , offset     = offset_
      , limit      = limit_
      }
        = A.object
          [ "@type"      A..= AT.String "searchGiftsForResale"
          , "gift_id"    A..= fmap I.writeInt64  gift_id_
          , "order"      A..= order_
          , "attributes" A..= attributes_
          , "offset"     A..= offset_
          , "limit"      A..= limit_
          ]

defaultSearchGiftsForResale :: SearchGiftsForResale
defaultSearchGiftsForResale =
  SearchGiftsForResale
    { gift_id    = Nothing
    , order      = Nothing
    , attributes = Nothing
    , offset     = Nothing
    , limit      = Nothing
    }

