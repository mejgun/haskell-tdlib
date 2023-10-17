module TD.Data.StoryPrivacySettings
  (StoryPrivacySettings(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Describes privacy settings of a story
data StoryPrivacySettings
  = StoryPrivacySettingsEveryone -- ^ The story can be viewed by everyone
    { except_user_ids :: Maybe [Int] -- ^ Identifiers of the users that can't see the story; always unknown and empty for non-owned stories
    }
  | StoryPrivacySettingsContacts -- ^ The story can be viewed by all contacts except chosen users
    { except_user_ids :: Maybe [Int] -- ^ User identifiers of the contacts that can't see the story; always unknown and empty for non-owned stories
    }
  | StoryPrivacySettingsCloseFriends -- ^ The story can be viewed by all close friends
  | StoryPrivacySettingsSelectedUsers -- ^ The story can be viewed by certain specified users
    { user_ids :: Maybe [Int] -- ^ Identifiers of the users; always unknown and empty for non-owned stories
    }
  deriving (Eq, Show)

instance I.ShortShow StoryPrivacySettings where
  shortShow StoryPrivacySettingsEveryone
    { except_user_ids = except_user_ids_
    }
      = "StoryPrivacySettingsEveryone"
        ++ I.cc
        [ "except_user_ids" `I.p` except_user_ids_
        ]
  shortShow StoryPrivacySettingsContacts
    { except_user_ids = except_user_ids_
    }
      = "StoryPrivacySettingsContacts"
        ++ I.cc
        [ "except_user_ids" `I.p` except_user_ids_
        ]
  shortShow StoryPrivacySettingsCloseFriends
      = "StoryPrivacySettingsCloseFriends"
  shortShow StoryPrivacySettingsSelectedUsers
    { user_ids = user_ids_
    }
      = "StoryPrivacySettingsSelectedUsers"
        ++ I.cc
        [ "user_ids" `I.p` user_ids_
        ]

instance AT.FromJSON StoryPrivacySettings where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "storyPrivacySettingsEveryone"      -> parseStoryPrivacySettingsEveryone v
      "storyPrivacySettingsContacts"      -> parseStoryPrivacySettingsContacts v
      "storyPrivacySettingsCloseFriends"  -> pure StoryPrivacySettingsCloseFriends
      "storyPrivacySettingsSelectedUsers" -> parseStoryPrivacySettingsSelectedUsers v
      _                                   -> mempty
    
    where
      parseStoryPrivacySettingsEveryone :: A.Value -> AT.Parser StoryPrivacySettings
      parseStoryPrivacySettingsEveryone = A.withObject "StoryPrivacySettingsEveryone" $ \o -> do
        except_user_ids_ <- o A..:?  "except_user_ids"
        pure $ StoryPrivacySettingsEveryone
          { except_user_ids = except_user_ids_
          }
      parseStoryPrivacySettingsContacts :: A.Value -> AT.Parser StoryPrivacySettings
      parseStoryPrivacySettingsContacts = A.withObject "StoryPrivacySettingsContacts" $ \o -> do
        except_user_ids_ <- o A..:?  "except_user_ids"
        pure $ StoryPrivacySettingsContacts
          { except_user_ids = except_user_ids_
          }
      parseStoryPrivacySettingsSelectedUsers :: A.Value -> AT.Parser StoryPrivacySettings
      parseStoryPrivacySettingsSelectedUsers = A.withObject "StoryPrivacySettingsSelectedUsers" $ \o -> do
        user_ids_ <- o A..:?  "user_ids"
        pure $ StoryPrivacySettingsSelectedUsers
          { user_ids = user_ids_
          }
  parseJSON _ = mempty

instance AT.ToJSON StoryPrivacySettings where
  toJSON StoryPrivacySettingsEveryone
    { except_user_ids = except_user_ids_
    }
      = A.object
        [ "@type"           A..= AT.String "storyPrivacySettingsEveryone"
        , "except_user_ids" A..= except_user_ids_
        ]
  toJSON StoryPrivacySettingsContacts
    { except_user_ids = except_user_ids_
    }
      = A.object
        [ "@type"           A..= AT.String "storyPrivacySettingsContacts"
        , "except_user_ids" A..= except_user_ids_
        ]
  toJSON StoryPrivacySettingsCloseFriends
      = A.object
        [ "@type" A..= AT.String "storyPrivacySettingsCloseFriends"
        ]
  toJSON StoryPrivacySettingsSelectedUsers
    { user_ids = user_ids_
    }
      = A.object
        [ "@type"    A..= AT.String "storyPrivacySettingsSelectedUsers"
        , "user_ids" A..= user_ids_
        ]

