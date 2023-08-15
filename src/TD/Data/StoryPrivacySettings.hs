{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.StoryPrivacySettings where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- | Describes privacy settings of a story
data StoryPrivacySettings
  = -- | The story can be viewed by everyone
    StoryPrivacySettingsEveryone
  | -- | The story can be viewed by all contacts except chosen users @except_user_ids User identifiers of the contacts that can't see the story; always empty for non-owned stories
    StoryPrivacySettingsContacts
      { -- |
        except_user_ids :: Maybe [Int]
      }
  | -- | The story can be viewed by all close friends
    StoryPrivacySettingsCloseFriends
  | -- | The story can be viewed by certain specified users @user_ids Identifiers of the users; always empty for non-owned stories
    StoryPrivacySettingsSelectedContacts
      { -- |
        user_ids :: Maybe [Int]
      }
  deriving (Eq)

instance Show StoryPrivacySettings where
  show StoryPrivacySettingsEveryone =
    "StoryPrivacySettingsEveryone"
      ++ U.cc
        []
  show
    StoryPrivacySettingsContacts
      { except_user_ids = except_user_ids_
      } =
      "StoryPrivacySettingsContacts"
        ++ U.cc
          [ U.p "except_user_ids" except_user_ids_
          ]
  show StoryPrivacySettingsCloseFriends =
    "StoryPrivacySettingsCloseFriends"
      ++ U.cc
        []
  show
    StoryPrivacySettingsSelectedContacts
      { user_ids = user_ids_
      } =
      "StoryPrivacySettingsSelectedContacts"
        ++ U.cc
          [ U.p "user_ids" user_ids_
          ]

instance T.FromJSON StoryPrivacySettings where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "storyPrivacySettingsEveryone" -> parseStoryPrivacySettingsEveryone v
      "storyPrivacySettingsContacts" -> parseStoryPrivacySettingsContacts v
      "storyPrivacySettingsCloseFriends" -> parseStoryPrivacySettingsCloseFriends v
      "storyPrivacySettingsSelectedContacts" -> parseStoryPrivacySettingsSelectedContacts v
      _ -> mempty
    where
      parseStoryPrivacySettingsEveryone :: A.Value -> T.Parser StoryPrivacySettings
      parseStoryPrivacySettingsEveryone = A.withObject "StoryPrivacySettingsEveryone" $ \_ -> return StoryPrivacySettingsEveryone

      parseStoryPrivacySettingsContacts :: A.Value -> T.Parser StoryPrivacySettings
      parseStoryPrivacySettingsContacts = A.withObject "StoryPrivacySettingsContacts" $ \o -> do
        except_user_ids_ <- o A..:? "except_user_ids"
        return $ StoryPrivacySettingsContacts {except_user_ids = except_user_ids_}

      parseStoryPrivacySettingsCloseFriends :: A.Value -> T.Parser StoryPrivacySettings
      parseStoryPrivacySettingsCloseFriends = A.withObject "StoryPrivacySettingsCloseFriends" $ \_ -> return StoryPrivacySettingsCloseFriends

      parseStoryPrivacySettingsSelectedContacts :: A.Value -> T.Parser StoryPrivacySettings
      parseStoryPrivacySettingsSelectedContacts = A.withObject "StoryPrivacySettingsSelectedContacts" $ \o -> do
        user_ids_ <- o A..:? "user_ids"
        return $ StoryPrivacySettingsSelectedContacts {user_ids = user_ids_}
  parseJSON _ = mempty

instance T.ToJSON StoryPrivacySettings where
  toJSON StoryPrivacySettingsEveryone =
    A.object
      [ "@type" A..= T.String "storyPrivacySettingsEveryone"
      ]
  toJSON
    StoryPrivacySettingsContacts
      { except_user_ids = except_user_ids_
      } =
      A.object
        [ "@type" A..= T.String "storyPrivacySettingsContacts",
          "except_user_ids" A..= except_user_ids_
        ]
  toJSON StoryPrivacySettingsCloseFriends =
    A.object
      [ "@type" A..= T.String "storyPrivacySettingsCloseFriends"
      ]
  toJSON
    StoryPrivacySettingsSelectedContacts
      { user_ids = user_ids_
      } =
      A.object
        [ "@type" A..= T.String "storyPrivacySettingsSelectedContacts",
          "user_ids" A..= user_ids_
        ]