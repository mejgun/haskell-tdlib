module TD.Query.GetExternalLink
  (GetExternalLink(..)
  , defaultGetExternalLink
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Returns an HTTP URL which can be used to automatically authorize the current user on a website after clicking an HTTP link. Use the method getExternalLinkInfo to find whether a prior user confirmation is needed. Returns 'TD.Data.HttpUrl.HttpUrl'
data GetExternalLink
  = GetExternalLink
    { link               :: Maybe T.Text -- ^ The HTTP link
    , allow_write_access :: Maybe Bool   -- ^ Pass true if the current user allowed the bot, returned in getExternalLinkInfo, to send them messages
    }
  deriving (Eq, Show)

instance I.ShortShow GetExternalLink where
  shortShow
    GetExternalLink
      { link               = link_
      , allow_write_access = allow_write_access_
      }
        = "GetExternalLink"
          ++ I.cc
          [ "link"               `I.p` link_
          , "allow_write_access" `I.p` allow_write_access_
          ]

instance AT.ToJSON GetExternalLink where
  toJSON
    GetExternalLink
      { link               = link_
      , allow_write_access = allow_write_access_
      }
        = A.object
          [ "@type"              A..= AT.String "getExternalLink"
          , "link"               A..= link_
          , "allow_write_access" A..= allow_write_access_
          ]

defaultGetExternalLink :: GetExternalLink
defaultGetExternalLink =
  GetExternalLink
    { link               = Nothing
    , allow_write_access = Nothing
    }

