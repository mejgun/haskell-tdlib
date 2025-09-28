module TD.Query.GetGiftCollections
  (GetGiftCollections(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.MessageSender as MessageSender

-- | Returns collections of gifts owned by the given user or chat. Returns 'TD.Data.GiftCollections.GiftCollections'
data GetGiftCollections
  = GetGiftCollections
    { owner_id :: Maybe MessageSender.MessageSender -- ^ Identifier of the user or the channel chat that received the gifts
    }
  deriving (Eq, Show)

instance I.ShortShow GetGiftCollections where
  shortShow
    GetGiftCollections
      { owner_id = owner_id_
      }
        = "GetGiftCollections"
          ++ I.cc
          [ "owner_id" `I.p` owner_id_
          ]

instance AT.ToJSON GetGiftCollections where
  toJSON
    GetGiftCollections
      { owner_id = owner_id_
      }
        = A.object
          [ "@type"    A..= AT.String "getGiftCollections"
          , "owner_id" A..= owner_id_
          ]

