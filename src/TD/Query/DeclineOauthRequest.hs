module TD.Query.DeclineOauthRequest
  (DeclineOauthRequest(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Declines an OAuth authorization request. Returns 'TD.Data.Ok.Ok'
data DeclineOauthRequest
  = DeclineOauthRequest
    { url :: Maybe T.Text -- ^ URL of the OAuth deep link
    }
  deriving (Eq, Show)

instance I.ShortShow DeclineOauthRequest where
  shortShow
    DeclineOauthRequest
      { url = url_
      }
        = "DeclineOauthRequest"
          ++ I.cc
          [ "url" `I.p` url_
          ]

instance AT.ToJSON DeclineOauthRequest where
  toJSON
    DeclineOauthRequest
      { url = url_
      }
        = A.object
          [ "@type" A..= AT.String "declineOauthRequest"
          , "url"   A..= url_
          ]

