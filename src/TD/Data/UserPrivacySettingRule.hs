module TD.Data.UserPrivacySettingRule
  ( UserPrivacySettingRule(..)                       
  , defaultUserPrivacySettingRuleAllowUsers          
  , defaultUserPrivacySettingRuleAllowChatMembers    
  , defaultUserPrivacySettingRuleRestrictUsers       
  , defaultUserPrivacySettingRuleRestrictChatMembers 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data UserPrivacySettingRule -- ^ Represents a single rule for managing user privacy settings
  = UserPrivacySettingRuleAllowAll -- ^ A rule to allow all users to do something
  | UserPrivacySettingRuleAllowContacts -- ^ A rule to allow all contacts of the user to do something
  | UserPrivacySettingRuleAllowUsers -- ^ A rule to allow certain specified users to do something
    { user_ids :: Maybe [Int] -- ^ The user identifiers, total number of users in all rules must not exceed 1000
    }
  | UserPrivacySettingRuleAllowChatMembers -- ^ A rule to allow all members of certain specified basic groups and supergroups to doing something
    { chat_ids :: Maybe [Int] -- ^ The chat identifiers, total number of chats in all rules must not exceed 20
    }
  | UserPrivacySettingRuleRestrictAll -- ^ A rule to restrict all users from doing something
  | UserPrivacySettingRuleRestrictContacts -- ^ A rule to restrict all contacts of the user from doing something
  | UserPrivacySettingRuleRestrictUsers -- ^ A rule to restrict all specified users from doing something
    { user_ids :: Maybe [Int] -- ^ The user identifiers, total number of users in all rules must not exceed 1000
    }
  | UserPrivacySettingRuleRestrictChatMembers -- ^ A rule to restrict all members of specified basic groups and supergroups from doing something
    { chat_ids :: Maybe [Int] -- ^ The chat identifiers, total number of chats in all rules must not exceed 20
    }
  deriving (Eq)

instance Show UserPrivacySettingRule where
  show UserPrivacySettingRuleAllowAll
      = "UserPrivacySettingRuleAllowAll"
  show UserPrivacySettingRuleAllowContacts
      = "UserPrivacySettingRuleAllowContacts"
  show UserPrivacySettingRuleAllowUsers
    { user_ids = user_ids_
    }
      = "UserPrivacySettingRuleAllowUsers"
        ++ I.cc
        [ "user_ids" `I.p` user_ids_
        ]
  show UserPrivacySettingRuleAllowChatMembers
    { chat_ids = chat_ids_
    }
      = "UserPrivacySettingRuleAllowChatMembers"
        ++ I.cc
        [ "chat_ids" `I.p` chat_ids_
        ]
  show UserPrivacySettingRuleRestrictAll
      = "UserPrivacySettingRuleRestrictAll"
  show UserPrivacySettingRuleRestrictContacts
      = "UserPrivacySettingRuleRestrictContacts"
  show UserPrivacySettingRuleRestrictUsers
    { user_ids = user_ids_
    }
      = "UserPrivacySettingRuleRestrictUsers"
        ++ I.cc
        [ "user_ids" `I.p` user_ids_
        ]
  show UserPrivacySettingRuleRestrictChatMembers
    { chat_ids = chat_ids_
    }
      = "UserPrivacySettingRuleRestrictChatMembers"
        ++ I.cc
        [ "chat_ids" `I.p` chat_ids_
        ]

instance AT.FromJSON UserPrivacySettingRule where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "userPrivacySettingRuleAllowAll"            -> pure UserPrivacySettingRuleAllowAll
      "userPrivacySettingRuleAllowContacts"       -> pure UserPrivacySettingRuleAllowContacts
      "userPrivacySettingRuleAllowUsers"          -> parseUserPrivacySettingRuleAllowUsers v
      "userPrivacySettingRuleAllowChatMembers"    -> parseUserPrivacySettingRuleAllowChatMembers v
      "userPrivacySettingRuleRestrictAll"         -> pure UserPrivacySettingRuleRestrictAll
      "userPrivacySettingRuleRestrictContacts"    -> pure UserPrivacySettingRuleRestrictContacts
      "userPrivacySettingRuleRestrictUsers"       -> parseUserPrivacySettingRuleRestrictUsers v
      "userPrivacySettingRuleRestrictChatMembers" -> parseUserPrivacySettingRuleRestrictChatMembers v
      _                                           -> mempty
    
    where
      parseUserPrivacySettingRuleAllowUsers :: A.Value -> AT.Parser UserPrivacySettingRule
      parseUserPrivacySettingRuleAllowUsers = A.withObject "UserPrivacySettingRuleAllowUsers" $ \o -> do
        user_ids_ <- o A..:?  "user_ids"
        pure $ UserPrivacySettingRuleAllowUsers
          { user_ids = user_ids_
          }
      parseUserPrivacySettingRuleAllowChatMembers :: A.Value -> AT.Parser UserPrivacySettingRule
      parseUserPrivacySettingRuleAllowChatMembers = A.withObject "UserPrivacySettingRuleAllowChatMembers" $ \o -> do
        chat_ids_ <- o A..:?  "chat_ids"
        pure $ UserPrivacySettingRuleAllowChatMembers
          { chat_ids = chat_ids_
          }
      parseUserPrivacySettingRuleRestrictUsers :: A.Value -> AT.Parser UserPrivacySettingRule
      parseUserPrivacySettingRuleRestrictUsers = A.withObject "UserPrivacySettingRuleRestrictUsers" $ \o -> do
        user_ids_ <- o A..:?  "user_ids"
        pure $ UserPrivacySettingRuleRestrictUsers
          { user_ids = user_ids_
          }
      parseUserPrivacySettingRuleRestrictChatMembers :: A.Value -> AT.Parser UserPrivacySettingRule
      parseUserPrivacySettingRuleRestrictChatMembers = A.withObject "UserPrivacySettingRuleRestrictChatMembers" $ \o -> do
        chat_ids_ <- o A..:?  "chat_ids"
        pure $ UserPrivacySettingRuleRestrictChatMembers
          { chat_ids = chat_ids_
          }
  parseJSON _ = mempty

instance AT.ToJSON UserPrivacySettingRule where
  toJSON UserPrivacySettingRuleAllowAll
      = A.object
        [ "@type" A..= AT.String "userPrivacySettingRuleAllowAll"
        ]
  toJSON UserPrivacySettingRuleAllowContacts
      = A.object
        [ "@type" A..= AT.String "userPrivacySettingRuleAllowContacts"
        ]
  toJSON UserPrivacySettingRuleAllowUsers
    { user_ids = user_ids_
    }
      = A.object
        [ "@type"    A..= AT.String "userPrivacySettingRuleAllowUsers"
        , "user_ids" A..= user_ids_
        ]
  toJSON UserPrivacySettingRuleAllowChatMembers
    { chat_ids = chat_ids_
    }
      = A.object
        [ "@type"    A..= AT.String "userPrivacySettingRuleAllowChatMembers"
        , "chat_ids" A..= chat_ids_
        ]
  toJSON UserPrivacySettingRuleRestrictAll
      = A.object
        [ "@type" A..= AT.String "userPrivacySettingRuleRestrictAll"
        ]
  toJSON UserPrivacySettingRuleRestrictContacts
      = A.object
        [ "@type" A..= AT.String "userPrivacySettingRuleRestrictContacts"
        ]
  toJSON UserPrivacySettingRuleRestrictUsers
    { user_ids = user_ids_
    }
      = A.object
        [ "@type"    A..= AT.String "userPrivacySettingRuleRestrictUsers"
        , "user_ids" A..= user_ids_
        ]
  toJSON UserPrivacySettingRuleRestrictChatMembers
    { chat_ids = chat_ids_
    }
      = A.object
        [ "@type"    A..= AT.String "userPrivacySettingRuleRestrictChatMembers"
        , "chat_ids" A..= chat_ids_
        ]

defaultUserPrivacySettingRuleAllowUsers :: UserPrivacySettingRule
defaultUserPrivacySettingRuleAllowUsers =
  UserPrivacySettingRuleAllowUsers
    { user_ids = Nothing
    }

defaultUserPrivacySettingRuleAllowChatMembers :: UserPrivacySettingRule
defaultUserPrivacySettingRuleAllowChatMembers =
  UserPrivacySettingRuleAllowChatMembers
    { chat_ids = Nothing
    }

defaultUserPrivacySettingRuleRestrictUsers :: UserPrivacySettingRule
defaultUserPrivacySettingRuleRestrictUsers =
  UserPrivacySettingRuleRestrictUsers
    { user_ids = Nothing
    }

defaultUserPrivacySettingRuleRestrictChatMembers :: UserPrivacySettingRule
defaultUserPrivacySettingRuleRestrictChatMembers =
  UserPrivacySettingRuleRestrictChatMembers
    { chat_ids = Nothing
    }

