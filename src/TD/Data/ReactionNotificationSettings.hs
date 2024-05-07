module TD.Data.ReactionNotificationSettings
  ( ReactionNotificationSettings(..)    
  , defaultReactionNotificationSettings 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ReactionNotificationSource as ReactionNotificationSource

data ReactionNotificationSettings
  = ReactionNotificationSettings -- ^ Contains information about notification settings for reactions
    { message_reaction_source :: Maybe ReactionNotificationSource.ReactionNotificationSource -- ^ Source of message reactions for which notifications are shown
    , story_reaction_source   :: Maybe ReactionNotificationSource.ReactionNotificationSource -- ^ Source of story reactions for which notifications are shown
    , sound_id                :: Maybe Int                                                   -- ^ Identifier of the notification sound to be played; 0 if sound is disabled
    , show_preview            :: Maybe Bool                                                  -- ^ True, if reaction sender and emoji must be displayed in notifications
    }
  deriving (Eq, Show)

instance I.ShortShow ReactionNotificationSettings where
  shortShow ReactionNotificationSettings
    { message_reaction_source = message_reaction_source_
    , story_reaction_source   = story_reaction_source_
    , sound_id                = sound_id_
    , show_preview            = show_preview_
    }
      = "ReactionNotificationSettings"
        ++ I.cc
        [ "message_reaction_source" `I.p` message_reaction_source_
        , "story_reaction_source"   `I.p` story_reaction_source_
        , "sound_id"                `I.p` sound_id_
        , "show_preview"            `I.p` show_preview_
        ]

instance AT.FromJSON ReactionNotificationSettings where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "reactionNotificationSettings" -> parseReactionNotificationSettings v
      _                              -> mempty
    
    where
      parseReactionNotificationSettings :: A.Value -> AT.Parser ReactionNotificationSettings
      parseReactionNotificationSettings = A.withObject "ReactionNotificationSettings" $ \o -> do
        message_reaction_source_ <- o A..:?                       "message_reaction_source"
        story_reaction_source_   <- o A..:?                       "story_reaction_source"
        sound_id_                <- fmap I.readInt64 <$> o A..:?  "sound_id"
        show_preview_            <- o A..:?                       "show_preview"
        pure $ ReactionNotificationSettings
          { message_reaction_source = message_reaction_source_
          , story_reaction_source   = story_reaction_source_
          , sound_id                = sound_id_
          , show_preview            = show_preview_
          }
  parseJSON _ = mempty

instance AT.ToJSON ReactionNotificationSettings where
  toJSON ReactionNotificationSettings
    { message_reaction_source = message_reaction_source_
    , story_reaction_source   = story_reaction_source_
    , sound_id                = sound_id_
    , show_preview            = show_preview_
    }
      = A.object
        [ "@type"                   A..= AT.String "reactionNotificationSettings"
        , "message_reaction_source" A..= message_reaction_source_
        , "story_reaction_source"   A..= story_reaction_source_
        , "sound_id"                A..= fmap I.writeInt64  sound_id_
        , "show_preview"            A..= show_preview_
        ]

defaultReactionNotificationSettings :: ReactionNotificationSettings
defaultReactionNotificationSettings =
  ReactionNotificationSettings
    { message_reaction_source = Nothing
    , story_reaction_source   = Nothing
    , sound_id                = Nothing
    , show_preview            = Nothing
    }

