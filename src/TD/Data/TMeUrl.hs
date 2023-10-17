module TD.Data.TMeUrl
  (TMeUrl(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.TMeUrlType as TMeUrlType

data TMeUrl
  = TMeUrl -- ^ Represents a URL linking to an internal Telegram entity
    { url   :: Maybe T.Text                -- ^ URL
    , _type :: Maybe TMeUrlType.TMeUrlType -- ^ Type of the URL
    }
  deriving (Eq, Show)

instance I.ShortShow TMeUrl where
  shortShow TMeUrl
    { url   = url_
    , _type = _type_
    }
      = "TMeUrl"
        ++ I.cc
        [ "url"   `I.p` url_
        , "_type" `I.p` _type_
        ]

instance AT.FromJSON TMeUrl where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "tMeUrl" -> parseTMeUrl v
      _        -> mempty
    
    where
      parseTMeUrl :: A.Value -> AT.Parser TMeUrl
      parseTMeUrl = A.withObject "TMeUrl" $ \o -> do
        url_   <- o A..:?  "url"
        _type_ <- o A..:?  "type"
        pure $ TMeUrl
          { url   = url_
          , _type = _type_
          }
  parseJSON _ = mempty

