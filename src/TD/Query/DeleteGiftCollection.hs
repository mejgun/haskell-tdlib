module TD.Query.DeleteGiftCollection
  (DeleteGiftCollection(..)
  , defaultDeleteGiftCollection
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.MessageSender as MessageSender

-- | Deletes a gift collection. If the collection is owned by a channel chat, then requires can_post_messages administrator right in the channel chat. Returns 'TD.Data.Ok.Ok'
data DeleteGiftCollection
  = DeleteGiftCollection
    { owner_id      :: Maybe MessageSender.MessageSender -- ^ Identifier of the user or the channel chat that owns the collection
    , collection_id :: Maybe Int                         -- ^ Identifier of the gift collection
    }
  deriving (Eq, Show)

instance I.ShortShow DeleteGiftCollection where
  shortShow
    DeleteGiftCollection
      { owner_id      = owner_id_
      , collection_id = collection_id_
      }
        = "DeleteGiftCollection"
          ++ I.cc
          [ "owner_id"      `I.p` owner_id_
          , "collection_id" `I.p` collection_id_
          ]

instance AT.ToJSON DeleteGiftCollection where
  toJSON
    DeleteGiftCollection
      { owner_id      = owner_id_
      , collection_id = collection_id_
      }
        = A.object
          [ "@type"         A..= AT.String "deleteGiftCollection"
          , "owner_id"      A..= owner_id_
          , "collection_id" A..= collection_id_
          ]

defaultDeleteGiftCollection :: DeleteGiftCollection
defaultDeleteGiftCollection =
  DeleteGiftCollection
    { owner_id      = Nothing
    , collection_id = Nothing
    }

