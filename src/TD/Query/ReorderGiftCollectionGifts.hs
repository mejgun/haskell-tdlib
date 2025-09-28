module TD.Query.ReorderGiftCollectionGifts
  (ReorderGiftCollectionGifts(..)
  , defaultReorderGiftCollectionGifts
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.MessageSender as MessageSender
import qualified Data.Text as T

-- | Changes order of gifts in a collection. If the collection is owned by a channel chat, then requires can_post_messages administrator right in the channel chat. Returns the changed collection. Returns 'TD.Data.GiftCollection.GiftCollection'
data ReorderGiftCollectionGifts
  = ReorderGiftCollectionGifts
    { owner_id          :: Maybe MessageSender.MessageSender -- ^ Identifier of the user or the channel chat that owns the collection
    , collection_id     :: Maybe Int                         -- ^ Identifier of the gift collection
    , received_gift_ids :: Maybe [T.Text]                    -- ^ Identifier of the gifts to move to the beginning of the collection. All other gifts are placed in the current order after the specified gifts
    }
  deriving (Eq, Show)

instance I.ShortShow ReorderGiftCollectionGifts where
  shortShow
    ReorderGiftCollectionGifts
      { owner_id          = owner_id_
      , collection_id     = collection_id_
      , received_gift_ids = received_gift_ids_
      }
        = "ReorderGiftCollectionGifts"
          ++ I.cc
          [ "owner_id"          `I.p` owner_id_
          , "collection_id"     `I.p` collection_id_
          , "received_gift_ids" `I.p` received_gift_ids_
          ]

instance AT.ToJSON ReorderGiftCollectionGifts where
  toJSON
    ReorderGiftCollectionGifts
      { owner_id          = owner_id_
      , collection_id     = collection_id_
      , received_gift_ids = received_gift_ids_
      }
        = A.object
          [ "@type"             A..= AT.String "reorderGiftCollectionGifts"
          , "owner_id"          A..= owner_id_
          , "collection_id"     A..= collection_id_
          , "received_gift_ids" A..= received_gift_ids_
          ]

defaultReorderGiftCollectionGifts :: ReorderGiftCollectionGifts
defaultReorderGiftCollectionGifts =
  ReorderGiftCollectionGifts
    { owner_id          = Nothing
    , collection_id     = Nothing
    , received_gift_ids = Nothing
    }

