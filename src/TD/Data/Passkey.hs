module TD.Data.Passkey
  (Passkey(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data Passkey
  = Passkey -- ^ Describes a passkey
    { _id                           :: Maybe T.Text -- ^ Unique identifier of the passkey
    , name                          :: Maybe T.Text -- ^ Name of the passkey
    , addition_date                 :: Maybe Int    -- ^ Point in time (Unix timestamp) when the passkey was added
    , last_usage_date               :: Maybe Int    -- ^ Point in time (Unix timestamp) when the passkey was used last time; 0 if never
    , software_icon_custom_emoji_id :: Maybe Int    -- ^ Identifier of the custom emoji that is used as the icon of the software, which created the passkey; 0 if unknown
    }
  deriving (Eq, Show)

instance I.ShortShow Passkey where
  shortShow Passkey
    { _id                           = _id_
    , name                          = name_
    , addition_date                 = addition_date_
    , last_usage_date               = last_usage_date_
    , software_icon_custom_emoji_id = software_icon_custom_emoji_id_
    }
      = "Passkey"
        ++ I.cc
        [ "_id"                           `I.p` _id_
        , "name"                          `I.p` name_
        , "addition_date"                 `I.p` addition_date_
        , "last_usage_date"               `I.p` last_usage_date_
        , "software_icon_custom_emoji_id" `I.p` software_icon_custom_emoji_id_
        ]

instance AT.FromJSON Passkey where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "passkey" -> parsePasskey v
      _         -> mempty
    
    where
      parsePasskey :: A.Value -> AT.Parser Passkey
      parsePasskey = A.withObject "Passkey" $ \o -> do
        _id_                           <- o A..:?                       "id"
        name_                          <- o A..:?                       "name"
        addition_date_                 <- o A..:?                       "addition_date"
        last_usage_date_               <- o A..:?                       "last_usage_date"
        software_icon_custom_emoji_id_ <- fmap I.readInt64 <$> o A..:?  "software_icon_custom_emoji_id"
        pure $ Passkey
          { _id                           = _id_
          , name                          = name_
          , addition_date                 = addition_date_
          , last_usage_date               = last_usage_date_
          , software_icon_custom_emoji_id = software_icon_custom_emoji_id_
          }
  parseJSON _ = mempty

