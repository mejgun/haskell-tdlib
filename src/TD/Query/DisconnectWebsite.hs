module TD.Query.DisconnectWebsite
  (DisconnectWebsite(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Disconnects website from the current user's Telegram account. Returns 'TD.Data.Ok.Ok'
data DisconnectWebsite
  = DisconnectWebsite
    { website_id :: Maybe Int -- ^ Website identifier
    }
  deriving (Eq, Show)

instance I.ShortShow DisconnectWebsite where
  shortShow
    DisconnectWebsite
      { website_id = website_id_
      }
        = "DisconnectWebsite"
          ++ I.cc
          [ "website_id" `I.p` website_id_
          ]

instance AT.ToJSON DisconnectWebsite where
  toJSON
    DisconnectWebsite
      { website_id = website_id_
      }
        = A.object
          [ "@type"      A..= AT.String "disconnectWebsite"
          , "website_id" A..= fmap I.writeInt64  website_id_
          ]

