module TD.Query.GetExternalLinkInfo
  (GetExternalLinkInfo(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Returns information about an action to be done when the current user clicks an external link. Don't use this method for links from secret chats if link preview is disabled in secret chats. Returns 'TD.Data.LoginUrlInfo.LoginUrlInfo'
data GetExternalLinkInfo
  = GetExternalLinkInfo
    { link :: Maybe T.Text -- ^ The link
    }
  deriving (Eq, Show)

instance I.ShortShow GetExternalLinkInfo where
  shortShow
    GetExternalLinkInfo
      { link = link_
      }
        = "GetExternalLinkInfo"
          ++ I.cc
          [ "link" `I.p` link_
          ]

instance AT.ToJSON GetExternalLinkInfo where
  toJSON
    GetExternalLinkInfo
      { link = link_
      }
        = A.object
          [ "@type" A..= AT.String "getExternalLinkInfo"
          , "link"  A..= link_
          ]

