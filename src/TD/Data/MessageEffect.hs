module TD.Data.MessageEffect
  (MessageEffect(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.Sticker as Sticker
import qualified Data.Text as T
import qualified TD.Data.MessageEffectType as MessageEffectType

data MessageEffect
  = MessageEffect -- ^ Contains information about an effect added to a message
    { _id         :: Maybe Int                                 -- ^ Unique identifier of the effect
    , static_icon :: Maybe Sticker.Sticker                     -- ^ Static icon for the effect in WEBP format; may be null if none
    , emoji       :: Maybe T.Text                              -- ^ Emoji corresponding to the effect that can be used if static icon isn't available
    , is_premium  :: Maybe Bool                                -- ^ True, if Telegram Premium subscription is required to use the effect
    , _type       :: Maybe MessageEffectType.MessageEffectType -- ^ Type of the effect
    }
  deriving (Eq, Show)

instance I.ShortShow MessageEffect where
  shortShow MessageEffect
    { _id         = _id_
    , static_icon = static_icon_
    , emoji       = emoji_
    , is_premium  = is_premium_
    , _type       = _type_
    }
      = "MessageEffect"
        ++ I.cc
        [ "_id"         `I.p` _id_
        , "static_icon" `I.p` static_icon_
        , "emoji"       `I.p` emoji_
        , "is_premium"  `I.p` is_premium_
        , "_type"       `I.p` _type_
        ]

instance AT.FromJSON MessageEffect where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "messageEffect" -> parseMessageEffect v
      _               -> mempty
    
    where
      parseMessageEffect :: A.Value -> AT.Parser MessageEffect
      parseMessageEffect = A.withObject "MessageEffect" $ \o -> do
        _id_         <- fmap I.readInt64 <$> o A..:?  "id"
        static_icon_ <- o A..:?                       "static_icon"
        emoji_       <- o A..:?                       "emoji"
        is_premium_  <- o A..:?                       "is_premium"
        _type_       <- o A..:?                       "type"
        pure $ MessageEffect
          { _id         = _id_
          , static_icon = static_icon_
          , emoji       = emoji_
          , is_premium  = is_premium_
          , _type       = _type_
          }
  parseJSON _ = mempty

