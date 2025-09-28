module TD.Query.SetGiftCollectionName
  (SetGiftCollectionName(..)
  , defaultSetGiftCollectionName
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.MessageSender as MessageSender
import qualified Data.Text as T

-- | Changes name of a gift collection. If the collection is owned by a channel chat, then requires can_post_messages administrator right in the channel chat. Returns the changed collection. Returns 'TD.Data.GiftCollection.GiftCollection'
data SetGiftCollectionName
  = SetGiftCollectionName
    { owner_id      :: Maybe MessageSender.MessageSender -- ^ Identifier of the user or the channel chat that owns the collection
    , collection_id :: Maybe Int                         -- ^ Identifier of the gift collection
    , name          :: Maybe T.Text                      -- ^ New name of the collection; 1-12 characters
    }
  deriving (Eq, Show)

instance I.ShortShow SetGiftCollectionName where
  shortShow
    SetGiftCollectionName
      { owner_id      = owner_id_
      , collection_id = collection_id_
      , name          = name_
      }
        = "SetGiftCollectionName"
          ++ I.cc
          [ "owner_id"      `I.p` owner_id_
          , "collection_id" `I.p` collection_id_
          , "name"          `I.p` name_
          ]

instance AT.ToJSON SetGiftCollectionName where
  toJSON
    SetGiftCollectionName
      { owner_id      = owner_id_
      , collection_id = collection_id_
      , name          = name_
      }
        = A.object
          [ "@type"         A..= AT.String "setGiftCollectionName"
          , "owner_id"      A..= owner_id_
          , "collection_id" A..= collection_id_
          , "name"          A..= name_
          ]

defaultSetGiftCollectionName :: SetGiftCollectionName
defaultSetGiftCollectionName =
  SetGiftCollectionName
    { owner_id      = Nothing
    , collection_id = Nothing
    , name          = Nothing
    }

