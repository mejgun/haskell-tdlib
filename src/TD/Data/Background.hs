module TD.Data.Background
  (Background(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.Document as Document
import qualified TD.Data.BackgroundType as BackgroundType

data Background
  = Background -- ^ Describes a chat background
    { _id        :: Maybe Int                           -- ^ Unique background identifier
    , is_default :: Maybe Bool                          -- ^ True, if this is one of default backgrounds
    , is_dark    :: Maybe Bool                          -- ^ True, if the background is dark and is recommended to be used with dark theme
    , name       :: Maybe T.Text                        -- ^ Unique background name
    , document   :: Maybe Document.Document             -- ^ Document with the background; may be null. Null only for filled and chat theme backgrounds
    , _type      :: Maybe BackgroundType.BackgroundType -- ^ Type of the background
    }
  deriving (Eq, Show)

instance I.ShortShow Background where
  shortShow Background
    { _id        = _id_
    , is_default = is_default_
    , is_dark    = is_dark_
    , name       = name_
    , document   = document_
    , _type      = _type_
    }
      = "Background"
        ++ I.cc
        [ "_id"        `I.p` _id_
        , "is_default" `I.p` is_default_
        , "is_dark"    `I.p` is_dark_
        , "name"       `I.p` name_
        , "document"   `I.p` document_
        , "_type"      `I.p` _type_
        ]

instance AT.FromJSON Background where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "background" -> parseBackground v
      _            -> mempty
    
    where
      parseBackground :: A.Value -> AT.Parser Background
      parseBackground = A.withObject "Background" $ \o -> do
        _id_        <- fmap I.readInt64 <$> o A..:?  "id"
        is_default_ <- o A..:?                       "is_default"
        is_dark_    <- o A..:?                       "is_dark"
        name_       <- o A..:?                       "name"
        document_   <- o A..:?                       "document"
        _type_      <- o A..:?                       "type"
        pure $ Background
          { _id        = _id_
          , is_default = is_default_
          , is_dark    = is_dark_
          , name       = name_
          , document   = document_
          , _type      = _type_
          }
  parseJSON _ = mempty

