module TD.Data.ChatBoostLevelFeatures
  (ChatBoostLevelFeatures(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data ChatBoostLevelFeatures
  = ChatBoostLevelFeatures -- ^ Contains a list of features available on a specific chat boost level
    { level                                   :: Maybe Int  -- ^ Target chat boost level
    , story_per_day_count                     :: Maybe Int  -- ^ Number of stories that the chat can publish daily
    , custom_emoji_reaction_count             :: Maybe Int  -- ^ Number of custom emoji reactions that can be added to the list of available reactions
    , title_color_count                       :: Maybe Int  -- ^ Number of custom colors for chat title
    , profile_accent_color_count              :: Maybe Int  -- ^ Number of custom colors for profile photo background
    , can_set_profile_background_custom_emoji :: Maybe Bool -- ^ True, if custom emoji for profile background can be set
    , accent_color_count                      :: Maybe Int  -- ^ Number of custom colors for background of empty chat photo, replies to messages and link previews
    , can_set_background_custom_emoji         :: Maybe Bool -- ^ True, if custom emoji for reply header and link preview background can be set
    , can_set_emoji_status                    :: Maybe Bool -- ^ True, if emoji status can be set
    , chat_theme_background_count             :: Maybe Int  -- ^ Number of chat theme backgrounds that can be set as chat background
    , can_set_custom_background               :: Maybe Bool -- ^ True, if custom background can be set in the chat for all users
    , can_set_custom_emoji_sticker_set        :: Maybe Bool -- ^ True, if custom emoji sticker set can be set for the chat
    , can_recognize_speech                    :: Maybe Bool -- ^ True, if speech recognition can be used for video note and voice note messages by all users
    , can_disable_sponsored_messages          :: Maybe Bool -- ^ True, if sponsored messages can be disabled in the chat
    }
  deriving (Eq, Show)

instance I.ShortShow ChatBoostLevelFeatures where
  shortShow ChatBoostLevelFeatures
    { level                                   = level_
    , story_per_day_count                     = story_per_day_count_
    , custom_emoji_reaction_count             = custom_emoji_reaction_count_
    , title_color_count                       = title_color_count_
    , profile_accent_color_count              = profile_accent_color_count_
    , can_set_profile_background_custom_emoji = can_set_profile_background_custom_emoji_
    , accent_color_count                      = accent_color_count_
    , can_set_background_custom_emoji         = can_set_background_custom_emoji_
    , can_set_emoji_status                    = can_set_emoji_status_
    , chat_theme_background_count             = chat_theme_background_count_
    , can_set_custom_background               = can_set_custom_background_
    , can_set_custom_emoji_sticker_set        = can_set_custom_emoji_sticker_set_
    , can_recognize_speech                    = can_recognize_speech_
    , can_disable_sponsored_messages          = can_disable_sponsored_messages_
    }
      = "ChatBoostLevelFeatures"
        ++ I.cc
        [ "level"                                   `I.p` level_
        , "story_per_day_count"                     `I.p` story_per_day_count_
        , "custom_emoji_reaction_count"             `I.p` custom_emoji_reaction_count_
        , "title_color_count"                       `I.p` title_color_count_
        , "profile_accent_color_count"              `I.p` profile_accent_color_count_
        , "can_set_profile_background_custom_emoji" `I.p` can_set_profile_background_custom_emoji_
        , "accent_color_count"                      `I.p` accent_color_count_
        , "can_set_background_custom_emoji"         `I.p` can_set_background_custom_emoji_
        , "can_set_emoji_status"                    `I.p` can_set_emoji_status_
        , "chat_theme_background_count"             `I.p` chat_theme_background_count_
        , "can_set_custom_background"               `I.p` can_set_custom_background_
        , "can_set_custom_emoji_sticker_set"        `I.p` can_set_custom_emoji_sticker_set_
        , "can_recognize_speech"                    `I.p` can_recognize_speech_
        , "can_disable_sponsored_messages"          `I.p` can_disable_sponsored_messages_
        ]

instance AT.FromJSON ChatBoostLevelFeatures where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "chatBoostLevelFeatures" -> parseChatBoostLevelFeatures v
      _                        -> mempty
    
    where
      parseChatBoostLevelFeatures :: A.Value -> AT.Parser ChatBoostLevelFeatures
      parseChatBoostLevelFeatures = A.withObject "ChatBoostLevelFeatures" $ \o -> do
        level_                                   <- o A..:?  "level"
        story_per_day_count_                     <- o A..:?  "story_per_day_count"
        custom_emoji_reaction_count_             <- o A..:?  "custom_emoji_reaction_count"
        title_color_count_                       <- o A..:?  "title_color_count"
        profile_accent_color_count_              <- o A..:?  "profile_accent_color_count"
        can_set_profile_background_custom_emoji_ <- o A..:?  "can_set_profile_background_custom_emoji"
        accent_color_count_                      <- o A..:?  "accent_color_count"
        can_set_background_custom_emoji_         <- o A..:?  "can_set_background_custom_emoji"
        can_set_emoji_status_                    <- o A..:?  "can_set_emoji_status"
        chat_theme_background_count_             <- o A..:?  "chat_theme_background_count"
        can_set_custom_background_               <- o A..:?  "can_set_custom_background"
        can_set_custom_emoji_sticker_set_        <- o A..:?  "can_set_custom_emoji_sticker_set"
        can_recognize_speech_                    <- o A..:?  "can_recognize_speech"
        can_disable_sponsored_messages_          <- o A..:?  "can_disable_sponsored_messages"
        pure $ ChatBoostLevelFeatures
          { level                                   = level_
          , story_per_day_count                     = story_per_day_count_
          , custom_emoji_reaction_count             = custom_emoji_reaction_count_
          , title_color_count                       = title_color_count_
          , profile_accent_color_count              = profile_accent_color_count_
          , can_set_profile_background_custom_emoji = can_set_profile_background_custom_emoji_
          , accent_color_count                      = accent_color_count_
          , can_set_background_custom_emoji         = can_set_background_custom_emoji_
          , can_set_emoji_status                    = can_set_emoji_status_
          , chat_theme_background_count             = chat_theme_background_count_
          , can_set_custom_background               = can_set_custom_background_
          , can_set_custom_emoji_sticker_set        = can_set_custom_emoji_sticker_set_
          , can_recognize_speech                    = can_recognize_speech_
          , can_disable_sponsored_messages          = can_disable_sponsored_messages_
          }
  parseJSON _ = mempty

