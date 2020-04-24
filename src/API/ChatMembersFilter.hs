-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ChatMembersFilter where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data ChatMembersFilter = 
 ChatMembersFilterContacts 
 | ChatMembersFilterAdministrators 
 | ChatMembersFilterMembers 
 | ChatMembersFilterRestricted 
 | ChatMembersFilterBanned 
 | ChatMembersFilterBots deriving (Show, Eq)

instance T.ToJSON ChatMembersFilter where
 toJSON (ChatMembersFilterContacts {  }) =
  A.object [ "@type" A..= T.String "chatMembersFilterContacts" ]

 toJSON (ChatMembersFilterAdministrators {  }) =
  A.object [ "@type" A..= T.String "chatMembersFilterAdministrators" ]

 toJSON (ChatMembersFilterMembers {  }) =
  A.object [ "@type" A..= T.String "chatMembersFilterMembers" ]

 toJSON (ChatMembersFilterRestricted {  }) =
  A.object [ "@type" A..= T.String "chatMembersFilterRestricted" ]

 toJSON (ChatMembersFilterBanned {  }) =
  A.object [ "@type" A..= T.String "chatMembersFilterBanned" ]

 toJSON (ChatMembersFilterBots {  }) =
  A.object [ "@type" A..= T.String "chatMembersFilterBots" ]

instance T.FromJSON ChatMembersFilter where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "chatMembersFilterContacts" -> parseChatMembersFilterContacts v
   "chatMembersFilterAdministrators" -> parseChatMembersFilterAdministrators v
   "chatMembersFilterMembers" -> parseChatMembersFilterMembers v
   "chatMembersFilterRestricted" -> parseChatMembersFilterRestricted v
   "chatMembersFilterBanned" -> parseChatMembersFilterBanned v
   "chatMembersFilterBots" -> parseChatMembersFilterBots v
   _ -> mempty
  where
   parseChatMembersFilterContacts :: A.Value -> T.Parser ChatMembersFilter
   parseChatMembersFilterContacts = A.withObject "ChatMembersFilterContacts" $ \o -> do
    return $ ChatMembersFilterContacts {  }

   parseChatMembersFilterAdministrators :: A.Value -> T.Parser ChatMembersFilter
   parseChatMembersFilterAdministrators = A.withObject "ChatMembersFilterAdministrators" $ \o -> do
    return $ ChatMembersFilterAdministrators {  }

   parseChatMembersFilterMembers :: A.Value -> T.Parser ChatMembersFilter
   parseChatMembersFilterMembers = A.withObject "ChatMembersFilterMembers" $ \o -> do
    return $ ChatMembersFilterMembers {  }

   parseChatMembersFilterRestricted :: A.Value -> T.Parser ChatMembersFilter
   parseChatMembersFilterRestricted = A.withObject "ChatMembersFilterRestricted" $ \o -> do
    return $ ChatMembersFilterRestricted {  }

   parseChatMembersFilterBanned :: A.Value -> T.Parser ChatMembersFilter
   parseChatMembersFilterBanned = A.withObject "ChatMembersFilterBanned" $ \o -> do
    return $ ChatMembersFilterBanned {  }

   parseChatMembersFilterBots :: A.Value -> T.Parser ChatMembersFilter
   parseChatMembersFilterBots = A.withObject "ChatMembersFilterBots" $ \o -> do
    return $ ChatMembersFilterBots {  }