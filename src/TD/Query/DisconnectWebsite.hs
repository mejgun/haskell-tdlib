module TD.Query.DisconnectWebsite
  (DisconnectWebsite(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data DisconnectWebsite -- ^ Disconnects website from the current user's Telegram account
  = DisconnectWebsite
    { website_id :: Maybe Int -- ^ Website identifier
    }
  deriving (Eq)

instance Show DisconnectWebsite where
  show
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

