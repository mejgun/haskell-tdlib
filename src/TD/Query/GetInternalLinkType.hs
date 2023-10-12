module TD.Query.GetInternalLinkType where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data GetInternalLinkType -- ^ Returns information about the type of an internal link. Returns a 404 error if the link is not internal. Can be called before authorization
  = GetInternalLinkType
    { link :: Maybe T.Text -- ^ The link
    }
  deriving (Eq)

instance Show GetInternalLinkType where
  show
    GetInternalLinkType
      { link = link_
      }
        = "GetInternalLinkType"
          ++ I.cc
          [ "link" `I.p` link_
          ]

instance AT.ToJSON GetInternalLinkType where
  toJSON
    GetInternalLinkType
      { link = link_
      }
        = A.object
          [ "@type" A..= AT.String "getInternalLinkType"
          , "link"  A..= link_
          ]
