module TD.Data.ChatBoostFeatures
  (ChatBoostFeatures(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ChatBoostLevelFeatures as ChatBoostLevelFeatures

data ChatBoostFeatures
  = ChatBoostFeatures -- ^ Contains a list of features available on the first chat boost levels
    { features                                        :: Maybe [ChatBoostLevelFeatures.ChatBoostLevelFeatures] -- ^ The list of features
    , min_profile_background_custom_emoji_boost_level :: Maybe Int                                             -- ^ The minimum boost level required to set custom emoji for profile background
    , min_background_custom_emoji_boost_level         :: Maybe Int                                             -- ^ The minimum boost level required to set custom emoji for reply header and link preview background; for channel chats only
    , min_emoji_status_boost_level                    :: Maybe Int                                             -- ^ The minimum boost level required to set emoji status
    , min_chat_theme_background_boost_level           :: Maybe Int                                             -- ^ The minimum boost level required to set a chat theme background as chat background
    , min_custom_background_boost_level               :: Maybe Int                                             -- ^ The minimum boost level required to set custom chat background
    , min_custom_emoji_sticker_set_boost_level        :: Maybe Int                                             -- ^ The minimum boost level required to set custom emoji sticker set for the chat; for supergroup chats only
    , min_speech_recognition_boost_level              :: Maybe Int                                             -- ^ The minimum boost level allowing to recognize speech in video note and voice note messages for non-Premium users; for supergroup chats only
    , min_sponsored_message_disable_boost_level       :: Maybe Int                                             -- ^ The minimum boost level allowing to disable sponsored messages in the chat; for channel chats only
    }
  deriving (Eq, Show)

instance I.ShortShow ChatBoostFeatures where
  shortShow ChatBoostFeatures
    { features                                        = features_
    , min_profile_background_custom_emoji_boost_level = min_profile_background_custom_emoji_boost_level_
    , min_background_custom_emoji_boost_level         = min_background_custom_emoji_boost_level_
    , min_emoji_status_boost_level                    = min_emoji_status_boost_level_
    , min_chat_theme_background_boost_level           = min_chat_theme_background_boost_level_
    , min_custom_background_boost_level               = min_custom_background_boost_level_
    , min_custom_emoji_sticker_set_boost_level        = min_custom_emoji_sticker_set_boost_level_
    , min_speech_recognition_boost_level              = min_speech_recognition_boost_level_
    , min_sponsored_message_disable_boost_level       = min_sponsored_message_disable_boost_level_
    }
      = "ChatBoostFeatures"
        ++ I.cc
        [ "features"                                        `I.p` features_
        , "min_profile_background_custom_emoji_boost_level" `I.p` min_profile_background_custom_emoji_boost_level_
        , "min_background_custom_emoji_boost_level"         `I.p` min_background_custom_emoji_boost_level_
        , "min_emoji_status_boost_level"                    `I.p` min_emoji_status_boost_level_
        , "min_chat_theme_background_boost_level"           `I.p` min_chat_theme_background_boost_level_
        , "min_custom_background_boost_level"               `I.p` min_custom_background_boost_level_
        , "min_custom_emoji_sticker_set_boost_level"        `I.p` min_custom_emoji_sticker_set_boost_level_
        , "min_speech_recognition_boost_level"              `I.p` min_speech_recognition_boost_level_
        , "min_sponsored_message_disable_boost_level"       `I.p` min_sponsored_message_disable_boost_level_
        ]

instance AT.FromJSON ChatBoostFeatures where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "chatBoostFeatures" -> parseChatBoostFeatures v
      _                   -> mempty
    
    where
      parseChatBoostFeatures :: A.Value -> AT.Parser ChatBoostFeatures
      parseChatBoostFeatures = A.withObject "ChatBoostFeatures" $ \o -> do
        features_                                        <- o A..:?  "features"
        min_profile_background_custom_emoji_boost_level_ <- o A..:?  "min_profile_background_custom_emoji_boost_level"
        min_background_custom_emoji_boost_level_         <- o A..:?  "min_background_custom_emoji_boost_level"
        min_emoji_status_boost_level_                    <- o A..:?  "min_emoji_status_boost_level"
        min_chat_theme_background_boost_level_           <- o A..:?  "min_chat_theme_background_boost_level"
        min_custom_background_boost_level_               <- o A..:?  "min_custom_background_boost_level"
        min_custom_emoji_sticker_set_boost_level_        <- o A..:?  "min_custom_emoji_sticker_set_boost_level"
        min_speech_recognition_boost_level_              <- o A..:?  "min_speech_recognition_boost_level"
        min_sponsored_message_disable_boost_level_       <- o A..:?  "min_sponsored_message_disable_boost_level"
        pure $ ChatBoostFeatures
          { features                                        = features_
          , min_profile_background_custom_emoji_boost_level = min_profile_background_custom_emoji_boost_level_
          , min_background_custom_emoji_boost_level         = min_background_custom_emoji_boost_level_
          , min_emoji_status_boost_level                    = min_emoji_status_boost_level_
          , min_chat_theme_background_boost_level           = min_chat_theme_background_boost_level_
          , min_custom_background_boost_level               = min_custom_background_boost_level_
          , min_custom_emoji_sticker_set_boost_level        = min_custom_emoji_sticker_set_boost_level_
          , min_speech_recognition_boost_level              = min_speech_recognition_boost_level_
          , min_sponsored_message_disable_boost_level       = min_sponsored_message_disable_boost_level_
          }
  parseJSON _ = mempty

