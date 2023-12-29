module TD.Query.GetBackgroundUrl
  (GetBackgroundUrl(..)
  , defaultGetBackgroundUrl
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.BackgroundType as BackgroundType

-- | Constructs a persistent HTTP URL for a background. Returns 'TD.Data.HttpUrl.HttpUrl'
data GetBackgroundUrl
  = GetBackgroundUrl
    { name  :: Maybe T.Text                        -- ^ Background name
    , _type :: Maybe BackgroundType.BackgroundType -- ^ Background type; backgroundTypeChatTheme isn't supported
    }
  deriving (Eq, Show)

instance I.ShortShow GetBackgroundUrl where
  shortShow
    GetBackgroundUrl
      { name  = name_
      , _type = _type_
      }
        = "GetBackgroundUrl"
          ++ I.cc
          [ "name"  `I.p` name_
          , "_type" `I.p` _type_
          ]

instance AT.ToJSON GetBackgroundUrl where
  toJSON
    GetBackgroundUrl
      { name  = name_
      , _type = _type_
      }
        = A.object
          [ "@type" A..= AT.String "getBackgroundUrl"
          , "name"  A..= name_
          , "type"  A..= _type_
          ]

defaultGetBackgroundUrl :: GetBackgroundUrl
defaultGetBackgroundUrl =
  GetBackgroundUrl
    { name  = Nothing
    , _type = Nothing
    }

