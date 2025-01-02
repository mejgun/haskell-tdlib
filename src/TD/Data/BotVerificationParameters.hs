module TD.Data.BotVerificationParameters
  (BotVerificationParameters(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.FormattedText as FormattedText

data BotVerificationParameters
  = BotVerificationParameters -- ^ Describes parameters of verification that is provided by a bot
    { icon_custom_emoji_id       :: Maybe Int                         -- ^ Identifier of the custom emoji that is used as the verification sign
    , organization_name          :: Maybe T.Text                      -- ^ Name of the organization that provides verification
    , default_custom_description :: Maybe FormattedText.FormattedText -- ^ Default custom description of verification reason to be used as placeholder in setMessageSenderBotVerification; may be null if none
    , can_set_custom_description :: Maybe Bool                        -- ^ True, if the bot is allowed to provide custom description for verified entities
    }
  deriving (Eq, Show)

instance I.ShortShow BotVerificationParameters where
  shortShow BotVerificationParameters
    { icon_custom_emoji_id       = icon_custom_emoji_id_
    , organization_name          = organization_name_
    , default_custom_description = default_custom_description_
    , can_set_custom_description = can_set_custom_description_
    }
      = "BotVerificationParameters"
        ++ I.cc
        [ "icon_custom_emoji_id"       `I.p` icon_custom_emoji_id_
        , "organization_name"          `I.p` organization_name_
        , "default_custom_description" `I.p` default_custom_description_
        , "can_set_custom_description" `I.p` can_set_custom_description_
        ]

instance AT.FromJSON BotVerificationParameters where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "botVerificationParameters" -> parseBotVerificationParameters v
      _                           -> mempty
    
    where
      parseBotVerificationParameters :: A.Value -> AT.Parser BotVerificationParameters
      parseBotVerificationParameters = A.withObject "BotVerificationParameters" $ \o -> do
        icon_custom_emoji_id_       <- fmap I.readInt64 <$> o A..:?  "icon_custom_emoji_id"
        organization_name_          <- o A..:?                       "organization_name"
        default_custom_description_ <- o A..:?                       "default_custom_description"
        can_set_custom_description_ <- o A..:?                       "can_set_custom_description"
        pure $ BotVerificationParameters
          { icon_custom_emoji_id       = icon_custom_emoji_id_
          , organization_name          = organization_name_
          , default_custom_description = default_custom_description_
          , can_set_custom_description = can_set_custom_description_
          }
  parseJSON _ = mempty

