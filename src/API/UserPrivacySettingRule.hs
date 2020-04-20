-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.UserPrivacySettingRule where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data UserPrivacySettingRule = 
 UserPrivacySettingRuleAllowAll 
 | UserPrivacySettingRuleAllowContacts 
 | UserPrivacySettingRuleAllowUsers { user_ids :: [Int] }  
 | UserPrivacySettingRuleAllowChatMembers { chat_ids :: [Int] }  
 | UserPrivacySettingRuleRestrictAll 
 | UserPrivacySettingRuleRestrictContacts 
 | UserPrivacySettingRuleRestrictUsers { user_ids :: [Int] }  
 | UserPrivacySettingRuleRestrictChatMembers { chat_ids :: [Int] }  -- deriving (Show)

instance T.ToJSON UserPrivacySettingRule where
 toJSON (UserPrivacySettingRuleAllowAll {  }) =
  A.object [ "@type" A..= T.String "userPrivacySettingRuleAllowAll" ]

 toJSON (UserPrivacySettingRuleAllowContacts {  }) =
  A.object [ "@type" A..= T.String "userPrivacySettingRuleAllowContacts" ]

 toJSON (UserPrivacySettingRuleAllowUsers { user_ids = user_ids }) =
  A.object [ "@type" A..= T.String "userPrivacySettingRuleAllowUsers", "user_ids" A..= user_ids ]

 toJSON (UserPrivacySettingRuleAllowChatMembers { chat_ids = chat_ids }) =
  A.object [ "@type" A..= T.String "userPrivacySettingRuleAllowChatMembers", "chat_ids" A..= chat_ids ]

 toJSON (UserPrivacySettingRuleRestrictAll {  }) =
  A.object [ "@type" A..= T.String "userPrivacySettingRuleRestrictAll" ]

 toJSON (UserPrivacySettingRuleRestrictContacts {  }) =
  A.object [ "@type" A..= T.String "userPrivacySettingRuleRestrictContacts" ]

 toJSON (UserPrivacySettingRuleRestrictUsers { user_ids = user_ids }) =
  A.object [ "@type" A..= T.String "userPrivacySettingRuleRestrictUsers", "user_ids" A..= user_ids ]

 toJSON (UserPrivacySettingRuleRestrictChatMembers { chat_ids = chat_ids }) =
  A.object [ "@type" A..= T.String "userPrivacySettingRuleRestrictChatMembers", "chat_ids" A..= chat_ids ]
-- userPrivacySettingRuleAllowAll UserPrivacySettingRule 

-- userPrivacySettingRuleAllowContacts UserPrivacySettingRule 

-- userPrivacySettingRuleAllowUsers UserPrivacySettingRule  { user_ids :: [Int] } 

-- userPrivacySettingRuleAllowChatMembers UserPrivacySettingRule  { chat_ids :: [Int] } 

-- userPrivacySettingRuleRestrictAll UserPrivacySettingRule 

-- userPrivacySettingRuleRestrictContacts UserPrivacySettingRule 

-- userPrivacySettingRuleRestrictUsers UserPrivacySettingRule  { user_ids :: [Int] } 

-- userPrivacySettingRuleRestrictChatMembers UserPrivacySettingRule  { chat_ids :: [Int] } 

