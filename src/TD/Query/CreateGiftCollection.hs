module TD.Query.CreateGiftCollection
  (CreateGiftCollection(..)
  , defaultCreateGiftCollection
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.MessageSender as MessageSender
import qualified Data.Text as T

-- | Creates a collection from gifts on the current user's or a channel's profile page; requires can_post_messages administrator right in the channel chat. An owner can have up to getOption("gift_collection_count_max") gift collections. The new collection will be added to the end of the gift collection list of the owner. Returns the created collection. Returns 'TD.Data.GiftCollection.GiftCollection'
data CreateGiftCollection
  = CreateGiftCollection
    { owner_id          :: Maybe MessageSender.MessageSender -- ^ Identifier of the user or the channel chat that received the gifts
    , name              :: Maybe T.Text                      -- ^ Name of the collection; 1-12 characters
    , received_gift_ids :: Maybe [T.Text]                    -- ^ Identifier of the gifts to add to the collection; 0-getOption("gift_collection_gift_count_max") identifiers
    }
  deriving (Eq, Show)

instance I.ShortShow CreateGiftCollection where
  shortShow
    CreateGiftCollection
      { owner_id          = owner_id_
      , name              = name_
      , received_gift_ids = received_gift_ids_
      }
        = "CreateGiftCollection"
          ++ I.cc
          [ "owner_id"          `I.p` owner_id_
          , "name"              `I.p` name_
          , "received_gift_ids" `I.p` received_gift_ids_
          ]

instance AT.ToJSON CreateGiftCollection where
  toJSON
    CreateGiftCollection
      { owner_id          = owner_id_
      , name              = name_
      , received_gift_ids = received_gift_ids_
      }
        = A.object
          [ "@type"             A..= AT.String "createGiftCollection"
          , "owner_id"          A..= owner_id_
          , "name"              A..= name_
          , "received_gift_ids" A..= received_gift_ids_
          ]

defaultCreateGiftCollection :: CreateGiftCollection
defaultCreateGiftCollection =
  CreateGiftCollection
    { owner_id          = Nothing
    , name              = Nothing
    , received_gift_ids = Nothing
    }

