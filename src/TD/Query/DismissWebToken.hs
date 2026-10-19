module TD.Query.DismissWebToken
  (DismissWebToken(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Dismisses a received web token without consumption; for official Telegram apps only. Returns 'TD.Data.Ok.Ok'
data DismissWebToken
  = DismissWebToken
    { token :: Maybe T.Text -- ^ The token to dismiss
    }
  deriving (Eq, Show)

instance I.ShortShow DismissWebToken where
  shortShow
    DismissWebToken
      { token = token_
      }
        = "DismissWebToken"
          ++ I.cc
          [ "token" `I.p` token_
          ]

instance AT.ToJSON DismissWebToken where
  toJSON
    DismissWebToken
      { token = token_
      }
        = A.object
          [ "@type" A..= AT.String "dismissWebToken"
          , "token" A..= token_
          ]

