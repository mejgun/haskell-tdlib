module TD.Data.StoryPrivacySettings where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data StoryPrivacySettings -- ^ Describes privacy settings of a story
  = StoryPrivacySettingsEveryone -- ^ The story can be viewed by everyone
  | StoryPrivacySettingsContacts -- ^ The story can be viewed by all contacts except chosen users
    { except_user_ids :: Maybe [Int] -- ^ User identifiers of the contacts that can't see the story; always empty for non-owned stories
    }
  | StoryPrivacySettingsCloseFriends -- ^ The story can be viewed by all close friends
  | StoryPrivacySettingsSelectedContacts -- ^ The story can be viewed by certain specified users
    { user_ids :: Maybe [Int] -- ^ Identifiers of the users; always empty for non-owned stories
    }
  deriving (Eq)

instance Show StoryPrivacySettings where
  show StoryPrivacySettingsEveryone
      = "StoryPrivacySettingsEveryone"
  show StoryPrivacySettingsContacts
    { except_user_ids = except_user_ids_
    }
      = "StoryPrivacySettingsContacts"
        ++ I.cc
        [ "except_user_ids" `I.p` except_user_ids_
        ]
  show StoryPrivacySettingsCloseFriends
      = "StoryPrivacySettingsCloseFriends"
  show StoryPrivacySettingsSelectedContacts
    { user_ids = user_ids_
    }
      = "StoryPrivacySettingsSelectedContacts"
        ++ I.cc
        [ "user_ids" `I.p` user_ids_
        ]

instance AT.FromJSON StoryPrivacySettings where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "storyPrivacySettingsEveryone"         -> pure StoryPrivacySettingsEveryone
      "storyPrivacySettingsContacts"         -> parseStoryPrivacySettingsContacts v
      "storyPrivacySettingsCloseFriends"     -> pure StoryPrivacySettingsCloseFriends
      "storyPrivacySettingsSelectedContacts" -> parseStoryPrivacySettingsSelectedContacts v
      _                                      -> mempty
    
    where
      parseStoryPrivacySettingsContacts :: A.Value -> AT.Parser StoryPrivacySettings
      parseStoryPrivacySettingsContacts = A.withObject "StoryPrivacySettingsContacts" $ \o -> do
        except_user_ids_ <- o A..:?  "except_user_ids"
        pure $ StoryPrivacySettingsContacts
          { except_user_ids = except_user_ids_
          }
      parseStoryPrivacySettingsSelectedContacts :: A.Value -> AT.Parser StoryPrivacySettings
      parseStoryPrivacySettingsSelectedContacts = A.withObject "StoryPrivacySettingsSelectedContacts" $ \o -> do
        user_ids_ <- o A..:?  "user_ids"
        pure $ StoryPrivacySettingsSelectedContacts
          { user_ids = user_ids_
          }

instance AT.ToJSON StoryPrivacySettings where
  toJSON StoryPrivacySettingsEveryone
      = A.object
        [ "@type" A..= AT.String "storyPrivacySettingsEveryone"
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
  toJSON StoryPrivacySettingsSelectedContacts
    { user_ids = user_ids_
    }
      = A.object
        [ "@type"    A..= AT.String "storyPrivacySettingsSelectedContacts"
        , "user_ids" A..= user_ids_
        ]
