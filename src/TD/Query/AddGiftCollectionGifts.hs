module TD.Query.AddGiftCollectionGifts
  (AddGiftCollectionGifts(..)
  , defaultAddGiftCollectionGifts
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.MessageSender as MessageSender
import qualified Data.Text as T

-- | Adds gifts to the beginning of a previously created collection. If the collection is owned by a channel chat, then requires can_post_messages administrator right in the channel chat. Returns the changed collection. Returns 'TD.Data.GiftCollection.GiftCollection'
data AddGiftCollectionGifts
  = AddGiftCollectionGifts
    { owner_id          :: Maybe MessageSender.MessageSender -- ^ Identifier of the user or the channel chat that owns the collection
    , collection_id     :: Maybe Int                         -- ^ Identifier of the gift collection
    , received_gift_ids :: Maybe [T.Text]                    -- ^ Identifier of the gifts to add to the collection; 1-getOption("gift_collection_size_max") identifiers. If after addition the collection has more than getOption("gift_collection_size_max") gifts, then the last one are removed from the collection
    }
  deriving (Eq, Show)

instance I.ShortShow AddGiftCollectionGifts where
  shortShow
    AddGiftCollectionGifts
      { owner_id          = owner_id_
      , collection_id     = collection_id_
      , received_gift_ids = received_gift_ids_
      }
        = "AddGiftCollectionGifts"
          ++ I.cc
          [ "owner_id"          `I.p` owner_id_
          , "collection_id"     `I.p` collection_id_
          , "received_gift_ids" `I.p` received_gift_ids_
          ]

instance AT.ToJSON AddGiftCollectionGifts where
  toJSON
    AddGiftCollectionGifts
      { owner_id          = owner_id_
      , collection_id     = collection_id_
      , received_gift_ids = received_gift_ids_
      }
        = A.object
          [ "@type"             A..= AT.String "addGiftCollectionGifts"
          , "owner_id"          A..= owner_id_
          , "collection_id"     A..= collection_id_
          , "received_gift_ids" A..= received_gift_ids_
          ]

defaultAddGiftCollectionGifts :: AddGiftCollectionGifts
defaultAddGiftCollectionGifts =
  AddGiftCollectionGifts
    { owner_id          = Nothing
    , collection_id     = Nothing
    , received_gift_ids = Nothing
    }

