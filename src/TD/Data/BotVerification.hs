module TD.Data.BotVerification
  (BotVerification(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.FormattedText as FormattedText

data BotVerification
  = BotVerification -- ^ Describes verification status provided by a bot
    { bot_user_id          :: Maybe Int                         -- ^ Identifier of the bot that provided the verification
    , icon_custom_emoji_id :: Maybe Int                         -- ^ Identifier of the custom emoji that is used as the verification sign
    , custom_description   :: Maybe FormattedText.FormattedText -- ^ Custom description of verification reason set by the bot
    }
  deriving (Eq, Show)

instance I.ShortShow BotVerification where
  shortShow BotVerification
    { bot_user_id          = bot_user_id_
    , icon_custom_emoji_id = icon_custom_emoji_id_
    , custom_description   = custom_description_
    }
      = "BotVerification"
        ++ I.cc
        [ "bot_user_id"          `I.p` bot_user_id_
        , "icon_custom_emoji_id" `I.p` icon_custom_emoji_id_
        , "custom_description"   `I.p` custom_description_
        ]

instance AT.FromJSON BotVerification where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "botVerification" -> parseBotVerification v
      _                 -> mempty
    
    where
      parseBotVerification :: A.Value -> AT.Parser BotVerification
      parseBotVerification = A.withObject "BotVerification" $ \o -> do
        bot_user_id_          <- o A..:?                       "bot_user_id"
        icon_custom_emoji_id_ <- fmap I.readInt64 <$> o A..:?  "icon_custom_emoji_id"
        custom_description_   <- o A..:?                       "custom_description"
        pure $ BotVerification
          { bot_user_id          = bot_user_id_
          , icon_custom_emoji_id = icon_custom_emoji_id_
          , custom_description   = custom_description_
          }
  parseJSON _ = mempty

