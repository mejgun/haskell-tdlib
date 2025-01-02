module TD.Query.GetUserGift
  (GetUserGift(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns information about a gift received or sent by the current user. Returns 'TD.Data.UserGift.UserGift'
data GetUserGift
  = GetUserGift
    { message_id :: Maybe Int -- ^ Identifier of the message with the gift
    }
  deriving (Eq, Show)

instance I.ShortShow GetUserGift where
  shortShow
    GetUserGift
      { message_id = message_id_
      }
        = "GetUserGift"
          ++ I.cc
          [ "message_id" `I.p` message_id_
          ]

instance AT.ToJSON GetUserGift where
  toJSON
    GetUserGift
      { message_id = message_id_
      }
        = A.object
          [ "@type"      A..= AT.String "getUserGift"
          , "message_id" A..= message_id_
          ]

