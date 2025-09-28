module TD.Query.RemoveGiftCollectionGifts
  (RemoveGiftCollectionGifts(..)
  , defaultRemoveGiftCollectionGifts
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.MessageSender as MessageSender
import qualified Data.Text as T

-- | Removes gifts from a collection. If the collection is owned by a channel chat, then requires can_post_messages administrator right in the channel chat. Returns the changed collection. Returns 'TD.Data.GiftCollection.GiftCollection'
data RemoveGiftCollectionGifts
  = RemoveGiftCollectionGifts
    { owner_id          :: Maybe MessageSender.MessageSender -- ^ Identifier of the user or the channel chat that owns the collection
    , collection_id     :: Maybe Int                         -- ^ Identifier of the gift collection
    , received_gift_ids :: Maybe [T.Text]                    -- ^ Identifier of the gifts to remove from the collection
    }
  deriving (Eq, Show)

instance I.ShortShow RemoveGiftCollectionGifts where
  shortShow
    RemoveGiftCollectionGifts
      { owner_id          = owner_id_
      , collection_id     = collection_id_
      , received_gift_ids = received_gift_ids_
      }
        = "RemoveGiftCollectionGifts"
          ++ I.cc
          [ "owner_id"          `I.p` owner_id_
          , "collection_id"     `I.p` collection_id_
          , "received_gift_ids" `I.p` received_gift_ids_
          ]

instance AT.ToJSON RemoveGiftCollectionGifts where
  toJSON
    RemoveGiftCollectionGifts
      { owner_id          = owner_id_
      , collection_id     = collection_id_
      , received_gift_ids = received_gift_ids_
      }
        = A.object
          [ "@type"             A..= AT.String "removeGiftCollectionGifts"
          , "owner_id"          A..= owner_id_
          , "collection_id"     A..= collection_id_
          , "received_gift_ids" A..= received_gift_ids_
          ]

defaultRemoveGiftCollectionGifts :: RemoveGiftCollectionGifts
defaultRemoveGiftCollectionGifts =
  RemoveGiftCollectionGifts
    { owner_id          = Nothing
    , collection_id     = Nothing
    , received_gift_ids = Nothing
    }

