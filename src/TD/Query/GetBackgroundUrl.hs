module TD.Query.GetBackgroundUrl where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I
import qualified TD.Data.BackgroundType as BackgroundType

data GetBackgroundUrl -- ^ Constructs a persistent HTTP URL for a background
  = GetBackgroundUrl
    { name  :: Maybe T.Text                        -- ^ Background name
    , _type :: Maybe BackgroundType.BackgroundType -- ^ Background type
    }
  deriving (Eq)

instance Show GetBackgroundUrl where
  show
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
