module TD.Query.GetInternalLink
  (GetInternalLink(..)
  , defaultGetInternalLink
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.InternalLinkType as InternalLinkType

-- | Returns an HTTPS or a tg: link with the given type. Can be called before authorization. Returns 'TD.Data.HttpUrl.HttpUrl'
data GetInternalLink
  = GetInternalLink
    { _type   :: Maybe InternalLinkType.InternalLinkType -- ^ Expected type of the link
    , is_http :: Maybe Bool                              -- ^ Pass true to create an HTTPS link (only available for some link types); pass false to create a tg: link
    }
  deriving (Eq, Show)

instance I.ShortShow GetInternalLink where
  shortShow
    GetInternalLink
      { _type   = _type_
      , is_http = is_http_
      }
        = "GetInternalLink"
          ++ I.cc
          [ "_type"   `I.p` _type_
          , "is_http" `I.p` is_http_
          ]

instance AT.ToJSON GetInternalLink where
  toJSON
    GetInternalLink
      { _type   = _type_
      , is_http = is_http_
      }
        = A.object
          [ "@type"   A..= AT.String "getInternalLink"
          , "type"    A..= _type_
          , "is_http" A..= is_http_
          ]

defaultGetInternalLink :: GetInternalLink
defaultGetInternalLink =
  GetInternalLink
    { _type   = Nothing
    , is_http = Nothing
    }

