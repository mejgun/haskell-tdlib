module TD.Query.GetStarAdAccountUrl
  (GetStarAdAccountUrl(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.MessageSender as MessageSender

-- | Returns a URL for a Telegram Ad platform account that can be used to set up advertisements for the chat paid in the owned Telegram Stars. Returns 'TD.Data.HttpUrl.HttpUrl'
data GetStarAdAccountUrl
  = GetStarAdAccountUrl
    { owner_id :: Maybe MessageSender.MessageSender -- ^ Identifier of the owner of the Telegram Stars; can be identifier of an owned bot, or identifier of an owned channel chat
    }
  deriving (Eq, Show)

instance I.ShortShow GetStarAdAccountUrl where
  shortShow
    GetStarAdAccountUrl
      { owner_id = owner_id_
      }
        = "GetStarAdAccountUrl"
          ++ I.cc
          [ "owner_id" `I.p` owner_id_
          ]

instance AT.ToJSON GetStarAdAccountUrl where
  toJSON
    GetStarAdAccountUrl
      { owner_id = owner_id_
      }
        = A.object
          [ "@type"    A..= AT.String "getStarAdAccountUrl"
          , "owner_id" A..= owner_id_
          ]

