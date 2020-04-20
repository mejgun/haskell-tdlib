-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ChatMembersFilter where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data ChatMembersFilter = 
 ChatMembersFilterContacts 
 | ChatMembersFilterAdministrators 
 | ChatMembersFilterMembers 
 | ChatMembersFilterRestricted 
 | ChatMembersFilterBanned 
 | ChatMembersFilterBots -- deriving (Show)

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
-- chatMembersFilterContacts ChatMembersFilter 

-- chatMembersFilterAdministrators ChatMembersFilter 

-- chatMembersFilterMembers ChatMembersFilter 

-- chatMembersFilterRestricted ChatMembersFilter 

-- chatMembersFilterBanned ChatMembersFilter 

-- chatMembersFilterBots ChatMembersFilter 

