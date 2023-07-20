{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.UserPrivacySettingRule where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- | Represents a single rule for managing user privacy settings
data UserPrivacySettingRule
  = -- | A rule to allow all users to do something
    UserPrivacySettingRuleAllowAll
  | -- | A rule to allow all contacts of the user to do something
    UserPrivacySettingRuleAllowContacts
  | -- | A rule to allow certain specified users to do something @user_ids The user identifiers, total number of users in all rules must not exceed 1000
    UserPrivacySettingRuleAllowUsers
      { -- |
        user_ids :: Maybe [Int]
      }
  | -- | A rule to allow all members of certain specified basic groups and supergroups to doing something @chat_ids The chat identifiers, total number of chats in all rules must not exceed 20
    UserPrivacySettingRuleAllowChatMembers
      { -- |
        chat_ids :: Maybe [Int]
      }
  | -- | A rule to restrict all users from doing something
    UserPrivacySettingRuleRestrictAll
  | -- | A rule to restrict all contacts of the user from doing something
    UserPrivacySettingRuleRestrictContacts
  | -- | A rule to restrict all specified users from doing something @user_ids The user identifiers, total number of users in all rules must not exceed 1000
    UserPrivacySettingRuleRestrictUsers
      { -- |
        user_ids :: Maybe [Int]
      }
  | -- | A rule to restrict all members of specified basic groups and supergroups from doing something @chat_ids The chat identifiers, total number of chats in all rules must not exceed 20
    UserPrivacySettingRuleRestrictChatMembers
      { -- |
        chat_ids :: Maybe [Int]
      }
  deriving (Eq)

instance Show UserPrivacySettingRule where
  show UserPrivacySettingRuleAllowAll =
    "UserPrivacySettingRuleAllowAll"
      ++ U.cc
        []
  show UserPrivacySettingRuleAllowContacts =
    "UserPrivacySettingRuleAllowContacts"
      ++ U.cc
        []
  show
    UserPrivacySettingRuleAllowUsers
      { user_ids = user_ids_
      } =
      "UserPrivacySettingRuleAllowUsers"
        ++ U.cc
          [ U.p "user_ids" user_ids_
          ]
  show
    UserPrivacySettingRuleAllowChatMembers
      { chat_ids = chat_ids_
      } =
      "UserPrivacySettingRuleAllowChatMembers"
        ++ U.cc
          [ U.p "chat_ids" chat_ids_
          ]
  show UserPrivacySettingRuleRestrictAll =
    "UserPrivacySettingRuleRestrictAll"
      ++ U.cc
        []
  show UserPrivacySettingRuleRestrictContacts =
    "UserPrivacySettingRuleRestrictContacts"
      ++ U.cc
        []
  show
    UserPrivacySettingRuleRestrictUsers
      { user_ids = user_ids_
      } =
      "UserPrivacySettingRuleRestrictUsers"
        ++ U.cc
          [ U.p "user_ids" user_ids_
          ]
  show
    UserPrivacySettingRuleRestrictChatMembers
      { chat_ids = chat_ids_
      } =
      "UserPrivacySettingRuleRestrictChatMembers"
        ++ U.cc
          [ U.p "chat_ids" chat_ids_
          ]

instance T.FromJSON UserPrivacySettingRule where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "userPrivacySettingRuleAllowAll" -> parseUserPrivacySettingRuleAllowAll v
      "userPrivacySettingRuleAllowContacts" -> parseUserPrivacySettingRuleAllowContacts v
      "userPrivacySettingRuleAllowUsers" -> parseUserPrivacySettingRuleAllowUsers v
      "userPrivacySettingRuleAllowChatMembers" -> parseUserPrivacySettingRuleAllowChatMembers v
      "userPrivacySettingRuleRestrictAll" -> parseUserPrivacySettingRuleRestrictAll v
      "userPrivacySettingRuleRestrictContacts" -> parseUserPrivacySettingRuleRestrictContacts v
      "userPrivacySettingRuleRestrictUsers" -> parseUserPrivacySettingRuleRestrictUsers v
      "userPrivacySettingRuleRestrictChatMembers" -> parseUserPrivacySettingRuleRestrictChatMembers v
      _ -> mempty
    where
      parseUserPrivacySettingRuleAllowAll :: A.Value -> T.Parser UserPrivacySettingRule
      parseUserPrivacySettingRuleAllowAll = A.withObject "UserPrivacySettingRuleAllowAll" $ \_ -> return UserPrivacySettingRuleAllowAll

      parseUserPrivacySettingRuleAllowContacts :: A.Value -> T.Parser UserPrivacySettingRule
      parseUserPrivacySettingRuleAllowContacts = A.withObject "UserPrivacySettingRuleAllowContacts" $ \_ -> return UserPrivacySettingRuleAllowContacts

      parseUserPrivacySettingRuleAllowUsers :: A.Value -> T.Parser UserPrivacySettingRule
      parseUserPrivacySettingRuleAllowUsers = A.withObject "UserPrivacySettingRuleAllowUsers" $ \o -> do
        user_ids_ <- o A..:? "user_ids"
        return $ UserPrivacySettingRuleAllowUsers {user_ids = user_ids_}

      parseUserPrivacySettingRuleAllowChatMembers :: A.Value -> T.Parser UserPrivacySettingRule
      parseUserPrivacySettingRuleAllowChatMembers = A.withObject "UserPrivacySettingRuleAllowChatMembers" $ \o -> do
        chat_ids_ <- o A..:? "chat_ids"
        return $ UserPrivacySettingRuleAllowChatMembers {chat_ids = chat_ids_}

      parseUserPrivacySettingRuleRestrictAll :: A.Value -> T.Parser UserPrivacySettingRule
      parseUserPrivacySettingRuleRestrictAll = A.withObject "UserPrivacySettingRuleRestrictAll" $ \_ -> return UserPrivacySettingRuleRestrictAll

      parseUserPrivacySettingRuleRestrictContacts :: A.Value -> T.Parser UserPrivacySettingRule
      parseUserPrivacySettingRuleRestrictContacts = A.withObject "UserPrivacySettingRuleRestrictContacts" $ \_ -> return UserPrivacySettingRuleRestrictContacts

      parseUserPrivacySettingRuleRestrictUsers :: A.Value -> T.Parser UserPrivacySettingRule
      parseUserPrivacySettingRuleRestrictUsers = A.withObject "UserPrivacySettingRuleRestrictUsers" $ \o -> do
        user_ids_ <- o A..:? "user_ids"
        return $ UserPrivacySettingRuleRestrictUsers {user_ids = user_ids_}

      parseUserPrivacySettingRuleRestrictChatMembers :: A.Value -> T.Parser UserPrivacySettingRule
      parseUserPrivacySettingRuleRestrictChatMembers = A.withObject "UserPrivacySettingRuleRestrictChatMembers" $ \o -> do
        chat_ids_ <- o A..:? "chat_ids"
        return $ UserPrivacySettingRuleRestrictChatMembers {chat_ids = chat_ids_}
  parseJSON _ = mempty

instance T.ToJSON UserPrivacySettingRule where
  toJSON UserPrivacySettingRuleAllowAll =
    A.object
      [ "@type" A..= T.String "userPrivacySettingRuleAllowAll"
      ]
  toJSON UserPrivacySettingRuleAllowContacts =
    A.object
      [ "@type" A..= T.String "userPrivacySettingRuleAllowContacts"
      ]
  toJSON
    UserPrivacySettingRuleAllowUsers
      { user_ids = user_ids_
      } =
      A.object
        [ "@type" A..= T.String "userPrivacySettingRuleAllowUsers",
          "user_ids" A..= user_ids_
        ]
  toJSON
    UserPrivacySettingRuleAllowChatMembers
      { chat_ids = chat_ids_
      } =
      A.object
        [ "@type" A..= T.String "userPrivacySettingRuleAllowChatMembers",
          "chat_ids" A..= chat_ids_
        ]
  toJSON UserPrivacySettingRuleRestrictAll =
    A.object
      [ "@type" A..= T.String "userPrivacySettingRuleRestrictAll"
      ]
  toJSON UserPrivacySettingRuleRestrictContacts =
    A.object
      [ "@type" A..= T.String "userPrivacySettingRuleRestrictContacts"
      ]
  toJSON
    UserPrivacySettingRuleRestrictUsers
      { user_ids = user_ids_
      } =
      A.object
        [ "@type" A..= T.String "userPrivacySettingRuleRestrictUsers",
          "user_ids" A..= user_ids_
        ]
  toJSON
    UserPrivacySettingRuleRestrictChatMembers
      { chat_ids = chat_ids_
      } =
      A.object
        [ "@type" A..= T.String "userPrivacySettingRuleRestrictChatMembers",
          "chat_ids" A..= chat_ids_
        ]
