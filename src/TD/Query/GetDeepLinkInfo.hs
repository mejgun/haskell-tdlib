module TD.Query.GetDeepLinkInfo
  (GetDeepLinkInfo(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data GetDeepLinkInfo -- ^ Returns information about a tg:// deep link. Use "tg://need_update_for_some_feature" or "tg:some_unsupported_feature" for testing. Returns a 404 error for unknown links. Can be called before authorization
  = GetDeepLinkInfo
    { link :: Maybe T.Text -- ^ The link
    }
  deriving (Eq)

instance Show GetDeepLinkInfo where
  show
    GetDeepLinkInfo
      { link = link_
      }
        = "GetDeepLinkInfo"
          ++ I.cc
          [ "link" `I.p` link_
          ]

instance AT.ToJSON GetDeepLinkInfo where
  toJSON
    GetDeepLinkInfo
      { link = link_
      }
        = A.object
          [ "@type" A..= AT.String "getDeepLinkInfo"
          , "link"  A..= link_
          ]

