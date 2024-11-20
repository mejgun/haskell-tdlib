module TD.Data.UserPrivacySettingRule
  (UserPrivacySettingRule(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Represents a single rule for managing user privacy settings
data UserPrivacySettingRule
  = UserPrivacySettingRuleAllowAll -- ^ A rule to allow all users to do something
  | UserPrivacySettingRuleAllowContacts -- ^ A rule to allow all contacts of the user to do something
  | UserPrivacySettingRuleAllowBots -- ^ A rule to allow all bots to do something
  | UserPrivacySettingRuleAllowPremiumUsers -- ^ A rule to allow all Premium Users to do something; currently, allowed only for userPrivacySettingAllowChatInvites
  | UserPrivacySettingRuleAllowUsers -- ^ A rule to allow certain specified users to do something
    { user_ids :: Maybe [Int] -- ^ The user identifiers, total number of users in all rules must not exceed 1000
    }
  | UserPrivacySettingRuleAllowChatMembers -- ^ A rule to allow all members of certain specified basic groups and supergroups to doing something
    { chat_ids :: Maybe [Int] -- ^ The chat identifiers, total number of chats in all rules must not exceed 20
    }
  | UserPrivacySettingRuleRestrictAll -- ^ A rule to restrict all users from doing something
  | UserPrivacySettingRuleRestrictContacts -- ^ A rule to restrict all contacts of the user from doing something
  | UserPrivacySettingRuleRestrictBots -- ^ A rule to restrict all bots from doing something
  | UserPrivacySettingRuleRestrictUsers -- ^ A rule to restrict all specified users from doing something
    { user_ids :: Maybe [Int] -- ^ The user identifiers, total number of users in all rules must not exceed 1000
    }
  | UserPrivacySettingRuleRestrictChatMembers -- ^ A rule to restrict all members of specified basic groups and supergroups from doing something
    { chat_ids :: Maybe [Int] -- ^ The chat identifiers, total number of chats in all rules must not exceed 20
    }
  deriving (Eq, Show)

instance I.ShortShow UserPrivacySettingRule where
  shortShow UserPrivacySettingRuleAllowAll
      = "UserPrivacySettingRuleAllowAll"
  shortShow UserPrivacySettingRuleAllowContacts
      = "UserPrivacySettingRuleAllowContacts"
  shortShow UserPrivacySettingRuleAllowBots
      = "UserPrivacySettingRuleAllowBots"
  shortShow UserPrivacySettingRuleAllowPremiumUsers
      = "UserPrivacySettingRuleAllowPremiumUsers"
  shortShow UserPrivacySettingRuleAllowUsers
    { user_ids = user_ids_
    }
      = "UserPrivacySettingRuleAllowUsers"
        ++ I.cc
        [ "user_ids" `I.p` user_ids_
        ]
  shortShow UserPrivacySettingRuleAllowChatMembers
    { chat_ids = chat_ids_
    }
      = "UserPrivacySettingRuleAllowChatMembers"
        ++ I.cc
        [ "chat_ids" `I.p` chat_ids_
        ]
  shortShow UserPrivacySettingRuleRestrictAll
      = "UserPrivacySettingRuleRestrictAll"
  shortShow UserPrivacySettingRuleRestrictContacts
      = "UserPrivacySettingRuleRestrictContacts"
  shortShow UserPrivacySettingRuleRestrictBots
      = "UserPrivacySettingRuleRestrictBots"
  shortShow UserPrivacySettingRuleRestrictUsers
    { user_ids = user_ids_
    }
      = "UserPrivacySettingRuleRestrictUsers"
        ++ I.cc
        [ "user_ids" `I.p` user_ids_
        ]
  shortShow UserPrivacySettingRuleRestrictChatMembers
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
      "userPrivacySettingRuleAllowBots"           -> pure UserPrivacySettingRuleAllowBots
      "userPrivacySettingRuleAllowPremiumUsers"   -> pure UserPrivacySettingRuleAllowPremiumUsers
      "userPrivacySettingRuleAllowUsers"          -> parseUserPrivacySettingRuleAllowUsers v
      "userPrivacySettingRuleAllowChatMembers"    -> parseUserPrivacySettingRuleAllowChatMembers v
      "userPrivacySettingRuleRestrictAll"         -> pure UserPrivacySettingRuleRestrictAll
      "userPrivacySettingRuleRestrictContacts"    -> pure UserPrivacySettingRuleRestrictContacts
      "userPrivacySettingRuleRestrictBots"        -> pure UserPrivacySettingRuleRestrictBots
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
  toJSON UserPrivacySettingRuleAllowBots
      = A.object
        [ "@type" A..= AT.String "userPrivacySettingRuleAllowBots"
        ]
  toJSON UserPrivacySettingRuleAllowPremiumUsers
      = A.object
        [ "@type" A..= AT.String "userPrivacySettingRuleAllowPremiumUsers"
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
  toJSON UserPrivacySettingRuleRestrictBots
      = A.object
        [ "@type" A..= AT.String "userPrivacySettingRuleRestrictBots"
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

