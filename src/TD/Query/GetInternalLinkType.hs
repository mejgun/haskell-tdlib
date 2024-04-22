module TD.Query.GetInternalLinkType
  (GetInternalLinkType(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Returns information about the type of internal link. Returns a 404 error if the link is not internal. Can be called before authorization. Returns 'TD.Data.InternalLinkType.InternalLinkType'
data GetInternalLinkType
  = GetInternalLinkType
    { link :: Maybe T.Text -- ^ The link
    }
  deriving (Eq, Show)

instance I.ShortShow GetInternalLinkType where
  shortShow
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

