module TD.Query.ReorderGiftCollections
  (ReorderGiftCollections(..)
  , defaultReorderGiftCollections
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.MessageSender as MessageSender

-- | Changes order of gift collections. If the collections are owned by a channel chat, then requires can_post_messages administrator right in the channel chat. Returns 'TD.Data.Ok.Ok'
data ReorderGiftCollections
  = ReorderGiftCollections
    { owner_id       :: Maybe MessageSender.MessageSender -- ^ Identifier of the user or the channel chat that owns the collection
    , collection_ids :: Maybe [Int]                       -- ^ New order of gift collections
    }
  deriving (Eq, Show)

instance I.ShortShow ReorderGiftCollections where
  shortShow
    ReorderGiftCollections
      { owner_id       = owner_id_
      , collection_ids = collection_ids_
      }
        = "ReorderGiftCollections"
          ++ I.cc
          [ "owner_id"       `I.p` owner_id_
          , "collection_ids" `I.p` collection_ids_
          ]

instance AT.ToJSON ReorderGiftCollections where
  toJSON
    ReorderGiftCollections
      { owner_id       = owner_id_
      , collection_ids = collection_ids_
      }
        = A.object
          [ "@type"          A..= AT.String "reorderGiftCollections"
          , "owner_id"       A..= owner_id_
          , "collection_ids" A..= collection_ids_
          ]

defaultReorderGiftCollections :: ReorderGiftCollections
defaultReorderGiftCollections =
  ReorderGiftCollections
    { owner_id       = Nothing
    , collection_ids = Nothing
    }

