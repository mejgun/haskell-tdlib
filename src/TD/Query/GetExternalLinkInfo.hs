module TD.Query.GetExternalLinkInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data GetExternalLinkInfo -- ^ Returns information about an action to be done when the current user clicks an external link. Don't use this method for links from secret chats if web page preview is disabled in secret chats
  = GetExternalLinkInfo
    { link :: Maybe T.Text -- ^ The link
    }
  deriving (Eq)

instance Show GetExternalLinkInfo where
  show
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
