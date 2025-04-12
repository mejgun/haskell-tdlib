module TD.Query.OpenSponsoredChat
  (OpenSponsoredChat(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Informs TDLib that the user opened a sponsored chat. Returns 'TD.Data.Ok.Ok'
data OpenSponsoredChat
  = OpenSponsoredChat
    { sponsored_chat_unique_id :: Maybe Int -- ^ Unique identifier of the sponsored chat
    }
  deriving (Eq, Show)

instance I.ShortShow OpenSponsoredChat where
  shortShow
    OpenSponsoredChat
      { sponsored_chat_unique_id = sponsored_chat_unique_id_
      }
        = "OpenSponsoredChat"
          ++ I.cc
          [ "sponsored_chat_unique_id" `I.p` sponsored_chat_unique_id_
          ]

instance AT.ToJSON OpenSponsoredChat where
  toJSON
    OpenSponsoredChat
      { sponsored_chat_unique_id = sponsored_chat_unique_id_
      }
        = A.object
          [ "@type"                    A..= AT.String "openSponsoredChat"
          , "sponsored_chat_unique_id" A..= sponsored_chat_unique_id_
          ]

