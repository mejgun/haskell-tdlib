module TD.Query.ViewSponsoredChat
  (ViewSponsoredChat(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Informs TDLib that the user fully viewed a sponsored chat. Returns 'TD.Data.Ok.Ok'
data ViewSponsoredChat
  = ViewSponsoredChat
    { sponsored_chat_unique_id :: Maybe Int -- ^ Unique identifier of the sponsored chat
    }
  deriving (Eq, Show)

instance I.ShortShow ViewSponsoredChat where
  shortShow
    ViewSponsoredChat
      { sponsored_chat_unique_id = sponsored_chat_unique_id_
      }
        = "ViewSponsoredChat"
          ++ I.cc
          [ "sponsored_chat_unique_id" `I.p` sponsored_chat_unique_id_
          ]

instance AT.ToJSON ViewSponsoredChat where
  toJSON
    ViewSponsoredChat
      { sponsored_chat_unique_id = sponsored_chat_unique_id_
      }
        = A.object
          [ "@type"                    A..= AT.String "viewSponsoredChat"
          , "sponsored_chat_unique_id" A..= sponsored_chat_unique_id_
          ]

